/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

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
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.BitSet;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
import java.util.stream.Collectors;
import lombok.extern.java.Log;
import net.accelbyte.sdk.api.iam.models.BloomFilterJSON;
import net.accelbyte.sdk.api.iam.models.OauthapiRevocationList;
import net.accelbyte.sdk.api.iam.models.OauthcommonJWKKey;
import net.accelbyte.sdk.api.iam.models.OauthcommonJWKSet;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenWithDeviceCookieResponseV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3.CodeChallengeMethod;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.GetJWKSV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.GetRevocationListV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.VerifyTokenV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UserAuthenticationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRefresh;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.repository.TokenValidation;
import net.accelbyte.sdk.core.util.BloomFilter;
import net.accelbyte.sdk.core.util.Helper;
import okhttp3.Credentials;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

@Log
public class AccelByteSDK {
  private static final String COOKIE_KEY_ACCESS_TOKEN = "access_token";
  private static final String LOGIN_USER_SCOPE = "commerce account social publishing analytics";
  private static final float TOKEN_REFRESH_RATIO = 0.8f;

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
  private static final BloomFilter bloomFilter = new BloomFilter();

  public AccelByteSDK(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository) {
    this(new AccelByteConfig(httpClient, tokenRepository, configRepository));
  }

  public AccelByteSDK(AccelByteConfig sdkConfiguration) {
    this.sdkConfiguration = sdkConfiguration;

    if (this.sdkConfiguration.getConfigRepository() instanceof TokenValidation) {
      final TokenValidation tokenValidation =
          (TokenValidation) this.sdkConfiguration.getConfigRepository();
      if (tokenValidation.getLocalTokenValidationEnabled()) {
        this.jwksCache = buildJWKSLoadingCache(this, tokenValidation.getJwksRefreshInterval());
        this.revocationListCache =
            buildRevocationListLoadingCache(
                this, tokenValidation.getRevocationListRefreshInterval());
      }
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
              .scope(LOGIN_USER_SCOPE)
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
        final long expiresIn = (long) (token.getExpiresIn() * TOKEN_REFRESH_RATIO);
        final long refreshExpiresIn = (long) (token.getRefreshExpiresIn() * TOKEN_REFRESH_RATIO);
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
        final long expiresIn = (long) (token.getExpiresIn() * TOKEN_REFRESH_RATIO);
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
        final long expiresIn = (long) (token.getExpiresIn() * TOKEN_REFRESH_RATIO);
        final long refreshExpiresIn = (long) (token.getRefreshExpiresIn() * TOKEN_REFRESH_RATIO);
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

  public boolean refreshToken() {
    try {
      if (!refreshTokenMethodLock.tryLock()) {
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

          final long expiresIn = (long) (token.getExpiresIn() * TOKEN_REFRESH_RATIO);
          final long refreshExpiresIn = (long) (token.getRefreshExpiresIn() * TOKEN_REFRESH_RATIO);
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
      refreshTokenMethodLock.unlock();
    }

    return false;
  }

  public boolean validateToken(String token) {
    return validateToken(token, null, 0);
  }

  public boolean validateToken(String token, String resource, int action) {
    try {
      final SignedJWT signedJWT = SignedJWT.parse(token);
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
            revokedTokens.getBits().stream()
                .mapToLong(value -> Long.parseUnsignedLong(value.toString()))
                .toArray();
        final int k = revokedTokens.getK();
        final int m = revokedTokens.getM();

        final boolean isTokenRevoked = bloomFilter.mightContain(token, k, BitSet.valueOf(bits), m);

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

        oAuth20.verifyTokenV3(VerifyTokenV3.builder().token(token).build());
      }

      if (resource == null) {
        return true; // Check token only without checking resource
      }

      final List<Map<String, Object>> tokenPermissions =
          (List<Map<String, Object>>) jwtClaimsSet.getClaim(CLAIM_PERMISSIONS);

      for (Map<String, Object> p : tokenPermissions) {
        final String tokenPermissionResource = p.get(PERMISSION_RESOURCE).toString();
        final int tokenPermissionAction = ((Long) p.get(PERMISSION_ACTION)).intValue();
        if (IsResourceAllowed(tokenPermissionResource, resource)) {
          if (IsActionAllowed(tokenPermissionAction, action)) {
            return true;
          }
        }
      }

      return false;
    } catch (Exception e) {
      log.warning(e.getMessage());
    }

    return false;
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

  private boolean IsResourceAllowed(String permissionResource, String requiredResource) {
    final String[] tokenResourceParts = permissionResource.split(":");
    final String[] requiredResourceParts = requiredResource.toString().split(":");

    final int minResourcePartsLength =
        tokenResourceParts.length < requiredResourceParts.length
            ? tokenResourceParts.length
            : requiredResourceParts.length;

    for (int i = 0; i < minResourcePartsLength; i++) {
      if (!tokenResourceParts[i].equals(requiredResourceParts[i])
          && !tokenResourceParts[i].equals("*")) {
        return false;
      }
    }

    if (tokenResourceParts.length == requiredResourceParts.length) {
      return true;
    }

    if (tokenResourceParts.length < requiredResourceParts.length) {
      final String lastTokenResourcePart = tokenResourceParts[tokenResourceParts.length - 1];
      if (lastTokenResourcePart.equals("*")) {
        if (tokenResourceParts.length < 2) {
          return true;
        }
        final String secondLastTokenResourcePart =
            tokenResourceParts[tokenResourceParts.length - 2];
        if (secondLastTokenResourcePart.equals("NAMESPACE")) {
          return false;
        }
        if (secondLastTokenResourcePart.equals("USER")) {
          return false;
        }
        return true;
      }
      return false;
    }

    for (int i = requiredResourceParts.length; i < tokenResourceParts.length; i++) {
      if (tokenResourceParts[i] != "*") {
        return false;
      }
    }

    return true;
  }

  private boolean IsActionAllowed(int permissionAction, int requiredAction) {
    return (permissionAction & requiredAction) == requiredAction;
  }
}
