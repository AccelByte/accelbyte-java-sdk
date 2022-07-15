/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.locks.ReentrantLock;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3.CodeChallengeMethod;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UserAuthenticationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRefresh;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.util.Helper;
import okhttp3.Credentials;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

public class AccelByteSDK {
  private static final String COOKIE_KEY_ACCESS_TOKEN = "access_token";
  private static final String LOGIN_USER_SCOPE = "commerce account social publishing analytics";
  private static final float TOKEN_REFRESH_RATIO = 0.8f;

  private AccelByteConfig sdkConfiguration;

  private final Timer refreshTokenTimer = new Timer("RefreshTokenTimer");
  private final Object refreshTokenTaskLock = new Object();
  private TimerTask refreshTokenTask = null;

  private final ReentrantLock refreshTokenMethodLock = new ReentrantLock();

  public AccelByteSDK(AccelByteConfig sdkConfiguration) {
    this.sdkConfiguration = sdkConfiguration;
  }

  public AccelByteSDK(
      HttpClient<?> httpClient,
      TokenRepository tokenRepository,
      ConfigRepository configRepository) {
    this(new AccelByteConfig(httpClient, tokenRepository, configRepository));
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
      final Instant utcNow = Instant.now();
      final TokenGrantV3 tokenGrantV3 =
          TokenGrantV3.builder()
              .clientId(clientId)
              .code(code)
              .codeVerifier(codeVerifier)
              .grantTypeFromEnum(TokenGrantV3.GrantType.AuthorizationCode)
              .build();
      final OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);

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
      e.printStackTrace();
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
      final OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);

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
      e.printStackTrace();
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
      e.printStackTrace();
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
          final OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);

          final long expiresIn = (long) (token.getExpiresIn() * TOKEN_REFRESH_RATIO);
          final long refreshExpiresIn = (long) (token.getRefreshExpiresIn() * TOKEN_REFRESH_RATIO);
          tokenRepository.storeToken(token.getAccessToken());
          tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(expiresIn)));
          tokenRefresh.storeRefreshToken(token.getRefreshToken());
          tokenRefresh.setRefreshTokenExpiresAt(Date.from(utcNow.plusSeconds(refreshExpiresIn)));
          scheduleRefreshTokenTask(expiresIn);

          return true; // Token refresh successful
        } catch (Exception e) {
          e.printStackTrace();
        }

        return false; // Token refresh failed
      } else {
        final boolean isLoginClientOk = this.loginClient();

        return isLoginClientOk; // Token refresh successful or failed
      }
    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      refreshTokenMethodLock.unlock();
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
      e.printStackTrace();
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
}
