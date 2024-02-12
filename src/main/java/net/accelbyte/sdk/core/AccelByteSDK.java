/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import static net.accelbyte.sdk.core.AccessTokenPayload.Types.*;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.base.Strings;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.RSASSAVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import java.math.BigInteger;
import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.KeyFactory;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.time.Instant;
import java.util.*;
import java.util.Base64.Decoder;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import lombok.SneakyThrows;
import lombok.extern.java.Log;
import net.accelbyte.sdk.api.basic.models.NamespaceContext;
import net.accelbyte.sdk.api.basic.operations.namespace.GetNamespaceContext;
import net.accelbyte.sdk.api.basic.wrappers.Namespace;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3.CodeChallengeMethod;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.GetJWKSV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.GetRevocationListV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.VerifyTokenV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UserAuthenticationV3;
import net.accelbyte.sdk.api.iam.operations.roles.AdminGetRoleV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.api.iam.wrappers.Roles;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.*;
import net.accelbyte.sdk.core.util.BloomFilter;
import net.accelbyte.sdk.core.util.Helper;
import net.accelbyte.sdk.core.validator.RoleCacheKey;
import net.accelbyte.sdk.core.validator.UserAuthContext;
import okhttp3.Credentials;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

@Log
public class AccelByteSDK {
  private static final String COOKIE_KEY_ACCESS_TOKEN = "access_token";
  private static final String DEFAULT_LOGIN_USER_SCOPE =
      "commerce account social publishing analytics";
  private static final String DEFAULT_CACHE_KEY = "default";
  private static final String CLAIM_PERMISSIONS = "permissions";
  private static final String CLAIM_SUB = "sub";
  private static final String PERMISSION_RESOURCE = "Resource";
  private static final String PERMISSION_ACTION = "Action";

  private AccelByteConfig sdkConfiguration;

  private final Timer refreshTokenTimer = new Timer("RefreshTokenTimer", true);
  private final Object refreshTokenTaskLock = new Object();
  private TimerTask refreshTokenTask = null;

  private final ReentrantLock refreshTokenMethodLock = new ReentrantLock();

  private LoadingCache<String, Map<String, RSAPublicKey>> jwksCache;
  private LoadingCache<String, OauthapiRevocationList> revocationListCache;
  private LoadingCache<String, NamespaceContext> namespaceContextCache;

  private LoadingCache<RoleCacheKey, List<Permission>> rolePermissionsCache;
  private static final BloomFilter bloomFilter = new BloomFilter();

  // TODO: make this configurable
  private float tokenRefreshRatio = 0.8f;

  private ObjectMapper objectMapper = new ObjectMapper();

  protected boolean internalValidateToken(
      SignedJWT signedJWT, String token, String resource, int action) {
    final UserAuthContext authContext = UserAuthContext.builder().token(token).build();
    final Permission permission = Permission.builder().resource(resource).action(action).build();
    return internalValidateToken(signedJWT, authContext, permission);
  }

  protected boolean internalValidateToken(
      SignedJWT signedJWT, UserAuthContext authContext, Permission permission) {
    try {
      final JWTClaimsSet jwtClaimsSet = signedJWT.getJWTClaimsSet();

      final boolean isLocalTokenValidationEnabled =
          jwksCache != null && revocationListCache != null;

      if (isLocalTokenValidationEnabled) {
        final String kid = signedJWT.getHeader().getKeyID();
        final RSAPublicKey pubKey = jwksCache.get(DEFAULT_CACHE_KEY).get(kid);

        if (pubKey == null) {
          return false; // Matching JWK key not found
        }

        final JWSVerifier verifier = new RSASSAVerifier(pubKey);

        if (!signedJWT.verify(verifier)) {
          return false; // JWT signature verification failed
        }

        if (jwtClaimsSet.getExpirationTime() == null
            || jwtClaimsSet.getExpirationTime().before(new Date())) {
          return false; // JWT expired
        }

        final OauthapiRevocationList revocationList = revocationListCache.get(DEFAULT_CACHE_KEY);

        final BloomFilterJSON revokedTokens = revocationList.getRevokedTokens();
        final long[] bits =
            revokedTokens.getBits().stream().mapToLong(BigInteger::longValue).toArray();
        final int k = revokedTokens.getK();
        final int m = revokedTokens.getM();

        final boolean isTokenRevoked =
            bloomFilter.mightContain(authContext.getToken(), k, BitSet.valueOf(bits), m);

        if (isTokenRevoked) {
          return false;
        }

        final String tokenUserId = (String) jwtClaimsSet.getClaim(CLAIM_SUB);

        if (tokenUserId != null && !tokenUserId.equals("")) {
          final boolean isUserRevoked =
              revocationList.getRevokedUsers().stream()
                  .anyMatch(ruid -> tokenUserId.equals(ruid.getId()));
          if (isUserRevoked) {
            return false;
          }
        }
      } else {
        final OAuth20 oAuth20 = new OAuth20(this);

        oAuth20.verifyTokenV3(VerifyTokenV3.builder().token(authContext.getToken()).build());
      }

      if (Strings.isNullOrEmpty(permission.getResource())) {
        return true; // Check token only without checking resource
      }

      final AccessTokenPayload accessTokenPayload =
          objectMapper.convertValue(jwtClaimsSet.toJSONObject(), AccessTokenPayload.class);

      return hasValidPermission(accessTokenPayload, authContext, permission);
    } catch (Exception e) {
      log.warning(e.getMessage());
    }

    return false;
  }

  private boolean hasValidPermission(
      AccessTokenPayload tokenPayload, UserAuthContext authContext, Permission permission) {
    if (permission == null) {
      return true;
    }

    if (Strings.isNullOrEmpty(tokenPayload.getNamespace())) {
      return false;
    }
    String tokenNamespace = tokenPayload.getNamespace();
    String expandedResource =
        expandResource(
            permission.getResource(), authContext.getNamespace(), authContext.getUserId());

    List<Permission> originPermissions = tokenPayload.getPermissions();

    if (validatePermission(originPermissions, expandedResource, permission.getAction())) {
      return true;
    }

    String claimsUserId = tokenPayload.getSub();
    List<Role> namespaceRoles = tokenPayload.getNamespaceRoles();

    if (!Strings.isNullOrEmpty(claimsUserId) && !namespaceRoles.isEmpty()) {
      List<Permission> allRoleNamespacePermissions =
          namespaceRoles.stream()
              .map(
                  it -> {
                    try {
                      RoleCacheKey key = RoleCacheKey.of(it, claimsUserId);
                      return rolePermissionsCache.get(key);
                    } catch (ExecutionException e) {
                      log.warning(e.getMessage());
                      return null;
                    }
                  })
              .filter(Objects::nonNull)
              .flatMap(List::stream)
              .collect(Collectors.toList());
      return !allRoleNamespacePermissions.isEmpty()
          && validatePermission(
              allRoleNamespacePermissions, expandedResource, permission.getAction());
    }

    List<String> claimRoles = tokenPayload.getRoles();
    if (claimRoles != null && !claimRoles.isEmpty()) {
      List<Permission> allRolePermissions =
          claimRoles.stream()
              .map(
                  it -> {
                    try {
                      RoleCacheKey key =
                          RoleCacheKey.of(it, tokenNamespace, authContext.getUserId());
                      return rolePermissionsCache.get(key);
                    } catch (ExecutionException e) {
                      log.warning(e.getMessage());
                      return null;
                    }
                  })
              .filter(Objects::nonNull)
              .flatMap(List::stream)
              .collect(Collectors.toList());
      return !allRolePermissions.isEmpty()
          && validatePermission(allRolePermissions, expandedResource, permission.getAction());
    }
    return false;
  }

  private boolean validatePermission(
      List<Permission> ownedPermissions, String requestedResource, int requestedAction) {
    if (ownedPermissions == null) {
      return false;
    }

    if (ownedPermissions.isEmpty()) {
      return false;
    }

    String[] requestedResourceElem = requestedResource.trim().split(":");
    for (Permission ownedPermission : ownedPermissions) {
      String[] ownedResourceElem = ownedPermission.getResource().split(":");
      if (ownedResourceElem.length == 0) {
        continue;
      }

      int minResLen = Math.min(ownedResourceElem.length, requestedResourceElem.length);
      boolean isResMatches =
          IntStream.range(0, minResLen)
              .allMatch(
                  i -> isResourceElementMatch(i, ownedResourceElem, requestedResourceElem));

      if (!isResMatches) {
        continue;
      }

      if (isResourceMatch(
          ownedResourceElem, requestedResourceElem, ownedPermission.getAction(), requestedAction)) {
        return true;
      }
    }
    return false;
  }

  private boolean isResourceMatch(
      String[] ownedResourceElem,
      String[] requestedResourceElem,
      int ownedAction,
      int requestedAction) {
    int ownedLen = ownedResourceElem.length;
    int requestedLen = requestedResourceElem.length;
    boolean matches = true;

    if (ownedLen < requestedLen) {
      matches = handleShorterRequestedResource(ownedResourceElem, ownedLen);
    } else {
      matches = handleLongerRequestedResource(ownedResourceElem, ownedLen, requestedLen);
    }

    if (!matches) {
      return false;
    }

    return (ownedAction & requestedAction) > 0;
  }

  private boolean handleLongerRequestedResource(String[] ownedResourceElem, int start, int end) {
    for (int i = start; i < end; i++) {
      if (!ownedResourceElem[i].equals("*")) {
        return false;
      }
    }

    return true;
  }

  private boolean handleShorterRequestedResource(String[] ownedResourceElem, int ownedLen) {
    if (ownedResourceElem[ownedLen - 1].equals("*")) {
      if (ownedLen < 2) {
        return true;
      }

      String segment = ownedResourceElem[ownedLen - 2];
      return !segment.equals("NAMESPACE") && !segment.equals("USER");
    }

    return false;
  }
  private boolean isResourceElementMatch(int index, String[] ownedResourceElem, String[] requestedResourceElem) {
    String ownElem = ownedResourceElem[index];
    String reqElem = requestedResourceElem[index];

    if (!ownElem.equals(reqElem) && !ownElem.equals("*")) {
      if (index > 0 && ownElem.endsWith("-")) {
        String prevOwnElem = ownedResourceElem[index - 1];
        if (prevOwnElem.endsWith("NAMESPACE") ) {
          if (reqElem.contains("-") && reqElem.split("-").length == 2 && reqElem.startsWith(ownElem)) {
              return true;
          }

          if (reqElem.equals(ownElem + "-")) {
              return true;
          }

          NamespaceContext namespaceContext = null;
          try {
            if (namespaceContextCache != null) {
              namespaceContext = namespaceContextCache.get(reqElem);
            }
          } catch (ExecutionException e) {
            throw new RuntimeException(e);
          }
          if (namespaceContext != null
                  && namespaceContext.getType().equals("Game")
                  && reqElem.startsWith(namespaceContext.getStudioNamespace())) {
            return true;
          }

        }
      }
      return false;
    }
    return true;
  }

  private String expandResource(String resource, String namespace, String userId) {
    String expandedResource = resource;

    if (!Strings.isNullOrEmpty(namespace)) {
      expandedResource = expandedResource.replace("{namespace}", namespace);
    }

    if (!Strings.isNullOrEmpty(userId)) {
      expandedResource = expandedResource.replace("{userId}", userId);
    }

    return expandedResource;
  }

  public AccelByteSDK(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository) {
    this(httpClient, tokenRepository, configRepository, FlightIdRepository.getInstance());
  }

  AccelByteSDK(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository,
      FlightIdRepository flightIdRepository) {
    this(new AccelByteConfig(httpClient, tokenRepository, configRepository, flightIdRepository));
  }

  public AccelByteSDK(AccelByteConfig sdkConfiguration) {
    this.sdkConfiguration = sdkConfiguration;

    if (this.sdkConfiguration.getConfigRepository() instanceof TokenValidation) {
      final TokenValidation tokenValidation =
          (TokenValidation) this.sdkConfiguration.getConfigRepository();
      this.namespaceContextCache = buildNamespaceContextCache(this, tokenValidation.getJwksRefreshInterval());
      if (tokenValidation.getLocalTokenValidationEnabled()) {
        this.jwksCache = buildJWKSLoadingCache(this, tokenValidation.getJwksRefreshInterval());
        this.revocationListCache =
            buildRevocationListLoadingCache(
                this, tokenValidation.getRevocationListRefreshInterval());
        try {
          // ensure the cache is ready, to prevent concurrent request being blocked when cache not
          // yet initialized
          this.jwksCache.get(DEFAULT_CACHE_KEY);
          this.revocationListCache.get(DEFAULT_CACHE_KEY);
        } catch (ExecutionException e) {
          throw new RuntimeException(e);
        }
      }
      this.rolePermissionsCache = buildRolePermissionLoadingCache(this);
    }
  }

  public AccelByteConfig getSdkConfiguration() {
    return sdkConfiguration;
  }

  public HttpResponse runRequest(Operation operation) throws Exception {
    String selectedSecurity = Operation.Security.Basic.toString();

    if (!operation.getPreferredSecurityMethod().isEmpty())
      selectedSecurity = operation.getPreferredSecurityMethod();
    else if (operation.getSecurities().size() > 0) {
      selectedSecurity = operation.getSecurities().get(0);
    }

    final HttpHeaders headers = new HttpHeaders();
    final Map<String, String> cookies = operation.getCookieParams();
    final ConfigRepository configRepository = sdkConfiguration.getConfigRepository();

    final String accessToken = sdkConfiguration.getTokenRepository().getToken();

    if (Operation.Security.Basic.toString().equals(selectedSecurity)) {
      final String clientId = configRepository.getClientId();
      final String clientSecret = configRepository.getClientSecret();
      headers.put(HttpHeaders.AUTHORIZATION, Credentials.basic(clientId, clientSecret));
    } else if (Operation.Security.Bearer.toString().equals(selectedSecurity)) {
      if (accessToken != null && !accessToken.isEmpty()) {
        headers.put(
            HttpHeaders.AUTHORIZATION, Operation.Security.Bearer.toString() + " " + accessToken);
      }
    } else if (Operation.Security.Cookie.toString().equals(selectedSecurity)) {
      if (accessToken != null && !accessToken.isEmpty()) {
        cookies.put(COOKIE_KEY_ACCESS_TOKEN, accessToken);
      }
    }

    if (configRepository.isAmazonTraceId()) {
      final String version = configRepository.getAmazonTraceIdVersion();
      headers.put(HttpHeaders.X_AMZN_TRACE_ID, Helper.generateAmazonTraceId(version));
    }

    final FlightIdRepository flightIdRepository = sdkConfiguration.getFlightIdRepository();
    if (configRepository.isFlightIdEnabled()) {
      if (operation.hasXFlightId()) {
        headers.put(HttpHeaders.X_FLIGHT_ID, operation.getXFlightId());
      } else {
        headers.put(HttpHeaders.X_FLIGHT_ID, flightIdRepository.getFlightId());
      }
    }

    if (configRepository.isClientInfoHeader()) {
      final String sdkName = SDKInfo.getInstance().getSdkName();
      final String sdkVersion = SDKInfo.getInstance().getSdkVersion();
      final AppInfo appInfo = configRepository.getAppInfo();
      final String appName = appInfo.getAppName();
      final String appVersion = appInfo.getAppVersion();
      final String userAgent =
          String.format("%s/%s (%s/%s)", sdkName, sdkVersion, appName, appVersion);
      headers.put(HttpHeaders.USER_AGENT, userAgent);
    }

    if (cookies.size() > 0) {
      final List<String> cookieEntries = new ArrayList<String>();
      for (Map.Entry<String, String> key : cookies.entrySet()) {
        cookieEntries.add(
            URLEncoder.encode(key.getKey(), StandardCharsets.UTF_8.toString())
                + "="
                + URLEncoder.encode(key.getValue(), StandardCharsets.UTF_8.toString()));
      }
      headers.put(HttpHeaders.COOKIE, String.join("; ", cookieEntries));
    }

    final String baseUrl = sdkConfiguration.getConfigRepository().getBaseURL();

    return sdkConfiguration.getHttpClient().sendRequest(operation, baseUrl, headers);
  }

  public boolean loginUser(String username, String password) {
    return loginUser(username, password, DEFAULT_LOGIN_USER_SCOPE);
  }

  public boolean loginUser(String username, String password, String scope) {
    final String codeVerifier = Helper.generateCodeVerifier();
    final String codeChallenge = Helper.generateCodeChallenge(codeVerifier);
    final String clientId = this.sdkConfiguration.getConfigRepository().getClientId();

    try {
      final OAuth20 oAuth20 = new OAuth20(this);
      final OAuth20Extension oAuth20Extension = new OAuth20Extension(this);

      final AuthorizeV3 authorizeV3 =
          AuthorizeV3.builder()
              .codeChallenge(codeChallenge)
              .codeChallengeMethodFromEnum(CodeChallengeMethod.S256)
              .scope(scope)
              .clientId(clientId)
              .responseTypeFromEnum(AuthorizeV3.ResponseType.Code)
              .build();
      final String authorizeResponse = oAuth20.authorizeV3(authorizeV3);

      final List<NameValuePair> authorizeParams =
          URLEncodedUtils.parse(new URI(authorizeResponse), StandardCharsets.UTF_8);
      final String requestId =
          authorizeParams.stream()
              .filter(
                  (q) -> {
                    return q.getName().equals(authorizeV3.getLocationQuery());
                  })
              .findFirst()
              .map(NameValuePair::getValue)
              .orElse(null);
      final UserAuthenticationV3 userAuthenticationV3 =
          UserAuthenticationV3.builder()
              .clientId(clientId)
              .userName(username)
              .password(password)
              .requestId(requestId)
              .build();
      final String authenticationResponse =
          oAuth20Extension.userAuthenticationV3(userAuthenticationV3);

      final List<NameValuePair> authenticationParams =
          URLEncodedUtils.parse(new URI(authenticationResponse), StandardCharsets.UTF_8);
      final String code =
          authenticationParams.stream()
              .filter(
                  (q) -> {
                    return q.getName().equals(userAuthenticationV3.getLocationQuery());
                  })
              .findFirst()
              .map(NameValuePair::getValue)
              .orElse(null);
      if (code == null) {
        return false; // Invalid username or password?
      }
      final Instant utcNow = Instant.now();
      final TokenGrantV3 tokenGrantV3 =
          TokenGrantV3.builder()
              .clientId(clientId)
              .code(code)
              .codeVerifier(codeVerifier)
              .grantTypeFromEnum(TokenGrantV3.GrantType.AuthorizationCode)
              .build();
      final OauthmodelTokenWithDeviceCookieResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);

      final TokenRepository tokenRepository = this.sdkConfiguration.getTokenRepository();
      tokenRepository.storeToken(token.getAccessToken());
      if (tokenRepository instanceof TokenRefresh) {
        final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;
        final long expiresIn = (long) (token.getExpiresIn() * tokenRefreshRatio);
        final long refreshExpiresIn = (long) (token.getRefreshExpiresIn() * tokenRefreshRatio);
        tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(expiresIn)));
        tokenRefresh.storeRefreshToken(token.getRefreshToken());
        tokenRefresh.setRefreshTokenExpiresAt(Date.from(utcNow.plusSeconds(refreshExpiresIn)));
        scheduleRefreshTokenTask(expiresIn);
      }

      return true;
    } catch (Exception e) {
      log.warning(e.getMessage());
    }
    return false;
  }

  public boolean loginClient() {
    try {
      final OAuth20 oAuth20 = new OAuth20(this);

      final Instant utcNow = Instant.now();
      final TokenGrantV3 tokenGrantV3 =
          TokenGrantV3.builder()
              .grantTypeFromEnum(TokenGrantV3.GrantType.ClientCredentials)
              .build();
      final OauthmodelTokenWithDeviceCookieResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);

      final TokenRepository tokenRepository = this.sdkConfiguration.getTokenRepository();
      tokenRepository.storeToken(token.getAccessToken());
      if (tokenRepository instanceof TokenRefresh) {
        final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;
        final long expiresIn = (long) (token.getExpiresIn() * tokenRefreshRatio);
        tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(expiresIn)));
        tokenRefresh.storeRefreshToken(null);
        tokenRefresh.setRefreshTokenExpiresAt(null);
        scheduleRefreshTokenTask(expiresIn);
      }

      return true;
    } catch (Exception e) {
      log.warning(e.getMessage());
    }
    return false;
  }

  @SneakyThrows // TODO: remove unused exception from getToken, getTokenExpiredAt
  public boolean loginOrRefreshClient() {
    TokenRepository tokenRepo = sdkConfiguration.getTokenRepository();
    TokenRefresh refreshRepo;
    if (tokenRepo instanceof TokenRefresh) {
      refreshRepo = (TokenRefresh) tokenRepo;
    } else {
      throw new IllegalArgumentException(
          "Token repository is not a Refresh Repository"); // TODO: restructure the inheritance
    }

    if (Strings.isNullOrEmpty(tokenRepo.getToken())) {
      return loginClient();
    }

    boolean isAccessTokenExpired = isExpired(refreshRepo.getTokenExpiresAt());
    if (!isAccessTokenExpired) {
      return true; // do nothing, since accessToken still valid
    }

    return loginClient();
  }

  @SneakyThrows // TODO: remove unused exception from getToken, getTokenExpiredAt
  public boolean loginOrRefreshUser(String username, String password) {
    TokenRepository tokenRepo = sdkConfiguration.getTokenRepository();
    TokenRefresh refreshRepo;
    if (tokenRepo instanceof TokenRefresh) {
      refreshRepo = (TokenRefresh) tokenRepo;
    } else {
      throw new IllegalArgumentException(
          "Token repository is not a Refresh Repository"); // TODO: restructure the inheritance
    }

    if (Strings.isNullOrEmpty(tokenRepo.getToken())) {
      return loginUser(username, password);
    }

    boolean isAccessTokenExpired = isExpired(refreshRepo.getTokenExpiresAt());
    boolean isRefreshTokenExpired = isExpired(refreshRepo.getRefreshTokenExpiresAt());

    if (!isAccessTokenExpired) {
      return true; // do nothing, since accessToken still valid
    }

    if (!isRefreshTokenExpired) {
      return refreshToken();
    }

    return loginUser(username, password);
  }

  public boolean loginPlatform(String platformId, String platformToken) {
    try {
      final OAuth20 oAuth20 = new OAuth20(this);

      final Instant utcNow = Instant.now();
      final PlatformTokenGrantV3 tokenGrantV3 =
          PlatformTokenGrantV3.builder()
              .platformId(platformId)
              .platformToken(platformToken)
              .build();
      final OauthmodelTokenResponse token = oAuth20.platformTokenGrantV3(tokenGrantV3);

      final TokenRepository tokenRepository = this.sdkConfiguration.getTokenRepository();
      tokenRepository.storeToken(token.getAccessToken());
      if (tokenRepository instanceof TokenRefresh) {
        final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;
        final long expiresIn = (long) (token.getExpiresIn() * tokenRefreshRatio);
        final long refreshExpiresIn = (long) (token.getRefreshExpiresIn() * tokenRefreshRatio);
        tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(expiresIn)));
        tokenRefresh.storeRefreshToken(token.getRefreshToken());
        tokenRefresh.setRefreshTokenExpiresAt(Date.from(utcNow.plusSeconds(refreshExpiresIn)));
        scheduleRefreshTokenTask(expiresIn);
      }

      return true;
    } catch (Exception e) {
      log.warning(e.getMessage());
    }
    return false;
  }

  /**
   * Attempts to perform the refresh token operation with a default wait time of 500 milliseconds to
   * acquire the necessary lock. Will return false if 500 milliseconds of waiting passed. Refer to
   * {@link #refreshToken(long, TimeUnit)} for customized timeout. <br>
   * <b>WARNING:</b> Please don't use this method if you use TokenRepository class with
   * TokenRefreshRepository interface a.k.a. automatic refresh token enabled.
   *
   * @return {@code true} if operation was successful, {@code false} otherwise.
   */
  public boolean refreshToken() {
    return refreshToken(500, TimeUnit.MILLISECONDS);
  }

  public boolean refreshToken(long timeout, TimeUnit unit) {
    boolean acquiredLock = false;
    try {
      acquiredLock = refreshTokenMethodLock.tryLock(timeout, unit);
      if (!acquiredLock) {
        log.warning(String.format("unable to acquire lock after (%s)%s", timeout, unit));
        return false; // Refresh token in-progress
      }

      final TokenRepository tokenRepository = sdkConfiguration.getTokenRepository();
      final String accessToken = tokenRepository.getToken();

      if (accessToken == null || accessToken.isEmpty()) {
        return false; // Cannot perform token refresh
      }

      if (!(tokenRepository instanceof TokenRefresh)) {
        return false; // Cannot perform token refresh
      }

      final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;

      final Date accessTokenExpiresAt = tokenRefresh.getTokenExpiresAt();
      final String refreshToken = tokenRefresh.getRefreshToken();

      final boolean isLoginUserOrLoginPlatform = refreshToken != null && !refreshToken.isEmpty();

      final Date refreshTokenExpiresAt =
          isLoginUserOrLoginPlatform ? tokenRefresh.getRefreshTokenExpiresAt() : null;

      if (accessTokenExpiresAt == null) {
        return false; // Cannot perform token refresh
      }

      if (isLoginUserOrLoginPlatform) {
        final boolean isRefreshTokenExpired = isExpired(refreshTokenExpiresAt);

        if (isRefreshTokenExpired) {
          return false; // Cannot perform token refresh
        }

        try {
          final Instant utcNow = Instant.now();
          final OAuth20 oAuth20 = new OAuth20(this);
          final TokenGrantV3 tokenGrantV3 =
              TokenGrantV3.builder()
                  .refreshToken(refreshToken)
                  .grantTypeFromEnum(TokenGrantV3.GrantType.RefreshToken)
                  .build();
          final OauthmodelTokenWithDeviceCookieResponseV3 token =
              oAuth20.tokenGrantV3(tokenGrantV3);

          final long expiresIn = (long) (token.getExpiresIn() * tokenRefreshRatio);
          final long refreshExpiresIn = (long) (token.getRefreshExpiresIn() * tokenRefreshRatio);
          tokenRepository.storeToken(token.getAccessToken());
          tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(expiresIn)));
          tokenRefresh.storeRefreshToken(token.getRefreshToken());
          tokenRefresh.setRefreshTokenExpiresAt(Date.from(utcNow.plusSeconds(refreshExpiresIn)));
          scheduleRefreshTokenTask(expiresIn);

          return true; // Token refresh successful
        } catch (Exception e) {
          log.warning(e.getMessage());
        }

        return false; // Token refresh failed
      } else {
        final boolean isLoginClientOk = this.loginClient();

        return isLoginClientOk; // Token refresh successful or failed
      }
    } catch (Exception e) {
      log.warning(e.getMessage());
    } finally {
      // to ensure, when in a race condition (i.e. this method called by multiple thread at the same
      // time)
      // and lock haven't been acquired by any thread yet.
      // adding this will ensure only the owner can unlock, to prevent error IllegalMonitoringState
      if (acquiredLock) {
        refreshTokenMethodLock.unlock();
      }
    }

    return false;
  }

  public boolean validateToken(String token) {
    return validateToken(token, null, 0);
  }

  public boolean validateToken(String token, String resource, int action) {
    try {
      final SignedJWT signedJWT = SignedJWT.parse(token);
      return internalValidateToken(signedJWT, token, resource, action);
    } catch (Exception e) {
      log.warning(e.getMessage());
    }

    return false;
  }

  /** Validating user token in authContext against the required permission */
  public boolean validateToken(UserAuthContext authContext, Permission permission) {
    try {
      final SignedJWT signedJWT = SignedJWT.parse(authContext.getToken());
      return internalValidateToken(signedJWT, authContext, permission);
    } catch (Exception e) {
      log.warning(e.getMessage());
    }

    return false;
  }

  public AccessTokenPayload parseAccessToken(String token, Boolean validateFirst) {
    try {
      final SignedJWT signedJWT = SignedJWT.parse(token);
      if (validateFirst) {
        final boolean isValid = internalValidateToken(signedJWT, token, null, 0);
        if (!isValid) return null;
      }

      final String payloadStr = signedJWT.getPayload().toString();
      return new AccessTokenPayload().createFromJson(payloadStr);

    } catch (Exception e) {
      log.warning(e.getMessage());
    }

    return null;
  }

  public boolean logout() {
    try {
      final TokenRepository tokenRepository = this.sdkConfiguration.getTokenRepository();
      tokenRepository.removeToken();
      if (tokenRepository instanceof TokenRefresh) {
        final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;
        tokenRefresh.setTokenExpiresAt(null);
        tokenRefresh.removeRefreshToken();
        tokenRefresh.setRefreshTokenExpiresAt(null);
        cancelRefreshTokenTask();
      }

      return true;
    } catch (Exception e) {
      log.warning(e.getMessage());
    }

    return false;
  }

  private void scheduleRefreshTokenTask(long delaySeconds) {
    synchronized (refreshTokenTaskLock) {
      if (refreshTokenTask != null) {
        refreshTokenTask.cancel();
      }

      refreshTokenTask =
          new TimerTask() {
            public void run() {
              final boolean isRefreshTokenOk = refreshToken();

              if (!isRefreshTokenOk) {
                scheduleRefreshTokenTask(10);
              }
            }
          };

      refreshTokenTimer.schedule(refreshTokenTask, delaySeconds * 1000);
    }
  }

  private void cancelRefreshTokenTask() {
    synchronized (refreshTokenTaskLock) {
      if (refreshTokenTask != null) {
        refreshTokenTask.cancel();
      }
    }
  }

  private static boolean isExpired(Date expiresAt) {
    final long tokenExpiresAtEpoch = expiresAt.getTime();
    final long utcNowEpoch = Date.from(Instant.now()).getTime();

    final boolean isExpired = (tokenExpiresAtEpoch - utcNowEpoch) <= 0;

    return isExpired;
  }

  private LoadingCache<RoleCacheKey, List<Permission>> buildRolePermissionLoadingCache(
      AccelByteSDK sdk) {
    final CacheLoader<RoleCacheKey, List<Permission>> rolePermissionLoader =
        new CacheLoader<RoleCacheKey, List<Permission>>() {
          @Override
          public List<Permission> load(RoleCacheKey key) throws Exception {
            final Roles rolesWrapper = new Roles(sdk);
            final AdminGetRoleV3 param = AdminGetRoleV3.builder().roleId(key.getRoleId()).build();
            final ModelRoleResponseV3 getRoleV3Result = rolesWrapper.adminGetRoleV3(param);

            // go ref: getRolePermission
            List<Permission> permissions =
                getRoleV3Result.getPermissions().stream()
                    .map(Permission::of)
                    .collect(Collectors.toList());

            // go ref: getRolePermission2
            permissions =
                permissions.stream()
                    .peek(
                        it -> {
                          String expandedPermission =
                              expandResource(it.getResource(), key.getNamespace(), key.getUserId());
                          it.setResource(expandedPermission);
                        })
                    .collect(Collectors.toList());

            return permissions;
          }
        };

    // TODO: make this configurable if needed, currently the cache will have 5min TTL
    int rolePermissionRefreshIntervalSeconds = 300;
    return CacheBuilder.newBuilder()
        .refreshAfterWrite(rolePermissionRefreshIntervalSeconds, TimeUnit.SECONDS)
        .build(rolePermissionLoader);
  }

  private LoadingCache<String, Map<String, RSAPublicKey>> buildJWKSLoadingCache(
      AccelByteSDK sdk, int refreshIntervalSeconds) {
    final CacheLoader<String, Map<String, RSAPublicKey>> jwksLoader =
        new CacheLoader<String, Map<String, RSAPublicKey>>() {
          @Override
          public Map<String, RSAPublicKey> load(String key) throws Exception {
            final OAuth20 oauthWrapper = new OAuth20(sdk);
            final OauthcommonJWKSet getJwksV3Result =
                oauthWrapper.getJWKSV3(GetJWKSV3.builder().build());

            final Decoder urlDecoder = Base64.getUrlDecoder();
            final KeyFactory rsaKeyFactory = KeyFactory.getInstance("RSA");

            final Map<String, RSAPublicKey> result =
                getJwksV3Result.getKeys().stream()
                    .collect(
                        Collectors.toMap(
                            OauthcommonJWKKey::getKid,
                            jwkKey -> {
                              try {
                                final BigInteger modulus =
                                    new BigInteger(1, urlDecoder.decode(jwkKey.getN()));
                                final BigInteger exponent =
                                    new BigInteger(1, urlDecoder.decode(jwkKey.getE()));
                                final RSAPublicKeySpec rsaPubKeySpec =
                                    new RSAPublicKeySpec(modulus, exponent);
                                final RSAPublicKey pubKey =
                                    (RSAPublicKey) rsaKeyFactory.generatePublic(rsaPubKeySpec);
                                return pubKey;
                              } catch (InvalidKeySpecException e) {
                                log.warning(e.getMessage());
                                return null;
                              }
                            }));

            return result;
          }
        };

    return CacheBuilder.newBuilder()
        .refreshAfterWrite(refreshIntervalSeconds, TimeUnit.SECONDS)
        .build(jwksLoader);
  }

  private LoadingCache<String, OauthapiRevocationList> buildRevocationListLoadingCache(
      AccelByteSDK sdk, int refreshIntervalSeconds) {
    final CacheLoader<String, OauthapiRevocationList> revocationLoader =
        new CacheLoader<String, OauthapiRevocationList>() {
          @Override
          public OauthapiRevocationList load(String key) throws Exception {
            final OAuth20 oauthWrapper = new OAuth20(sdk);
            final OauthapiRevocationList getRevocationListV3Result =
                oauthWrapper.getRevocationListV3(GetRevocationListV3.builder().build());

            return getRevocationListV3Result;
          }
        };

    return CacheBuilder.newBuilder()
        .refreshAfterWrite(refreshIntervalSeconds, TimeUnit.SECONDS)
        .build(revocationLoader);
  }

  // TODO figure out how to decouple IAM + basic
  // because now IAM depends on module basic
  private LoadingCache<String, NamespaceContext> buildNamespaceContextCache(
          AccelByteSDK sdk, int refreshIntervalSeconds) {
    final CacheLoader<String, NamespaceContext> revocationLoader =
            new CacheLoader<String, NamespaceContext>() {
              @Override
              public NamespaceContext load(String key) throws Exception {
                final Namespace namespaceWrapper = new Namespace(sdk);
                final NamespaceContext namespaceContext =
                        namespaceWrapper.getNamespaceContext(GetNamespaceContext.builder().namespace(key).build());

                return namespaceContext;
              }
            };

    return CacheBuilder.newBuilder()
            .refreshAfterWrite(refreshIntervalSeconds, TimeUnit.SECONDS)
            .build(revocationLoader);
  }
}
