/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponse;
import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3.CodeChallengeMethod;
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

import java.net.URI;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class AccelByteSDK {
    private static final String COOKIE_KEY_ACCESS_TOKEN = "access_token";
    private static final String LOGIN_USER_SCOPE = "commerce account social publishing analytics";
    private static final int REFRESH_TOKEN_EXPIRY_THRESHOLD = 300; // 5 minutes
    private static Object refreshTokenLock = new Object();

    private AccelByteConfig sdkConfiguration;

    public AccelByteSDK(AccelByteConfig sdkConfiguration) {
        this.sdkConfiguration = sdkConfiguration;
    }

    public AccelByteSDK(HttpClient<?> httpClient, TokenRepository tokenRepository,
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

        final ConfigRepository configRepository = sdkConfiguration.getConfigRepository();
        final TokenRepository tokenRepository = sdkConfiguration.getTokenRepository();
        final HttpHeaders headers = new HttpHeaders();
        final Map<String, String> cookies = operation.getCookieParams();
        final String accessToken = tokenRepository.getToken();

        if (Operation.Security.Basic.toString().equals(selectedSecurity)) {
            final String clientId = configRepository
                    .getClientId();
            final String clientSecret = configRepository
                    .getClientSecret();
            headers.put(HttpHeaders.AUTHORIZATION,
                    Credentials.basic(clientId, clientSecret));
        } else if (Operation.Security.Bearer.toString().equals(selectedSecurity)) {
            this.refreshToken();
            if (accessToken != null && !accessToken.equals("")) {
                headers.put(HttpHeaders.AUTHORIZATION,
                        Operation.Security.Bearer.toString() + " " + accessToken);
            }
        } else if (Operation.Security.Cookie.toString().equals(selectedSecurity)) {
            this.refreshToken();
            if (accessToken != null && !accessToken.equals("")) {
                cookies.put(COOKIE_KEY_ACCESS_TOKEN, accessToken);
            }
        }

        if (configRepository.isAmazonTraceId()) {
            final String version = configRepository.getAmazonTraceIdVersion();
            headers.put(HttpHeaders.X_AMZN_TRACE_ID, Helper
                    .generateAmazonTraceId(version));
        }

        if (configRepository.isClientInfoHeader()) {
            final String sdkName = SDKInfo.getInstance().getSdkName();
            final String sdkVersion = SDKInfo.getInstance().getSdkVersion();
            final AppInfo appInfo = configRepository.getAppInfo();
            final String appName = appInfo.getAppName();
            final String appVersion = appInfo.getAppVersion();
            final String userAgent = String.format("%s/%s (%s/%s)", sdkName,
                    sdkVersion, appName, appVersion);
            headers.put(HttpHeaders.USER_AGENT, userAgent);
        }

        if (cookies.size() > 0) {
            final List<String> cookieEntries = new ArrayList<String>();
            for (Map.Entry<String, String> key : cookies.entrySet()) {
                cookieEntries.add(URLEncoder.encode(key.getKey(), StandardCharsets.UTF_8.toString()) +
                        "=" + URLEncoder.encode(key.getValue(), StandardCharsets.UTF_8.toString()));
            }
            headers.put(HttpHeaders.COOKIE, String.join("; ", cookieEntries));
        }

        final String baseUrl = sdkConfiguration.getConfigRepository()
                .getBaseURL();

        return sdkConfiguration.getHttpClient().sendRequest(operation,
                baseUrl, headers);
    }

    public boolean loginUser(String username, String password) {
        final String codeVerifier = Helper.generateCodeVerifier();
        final String codeChallenge = Helper.generateCodeChallenge(codeVerifier);
        final String clientId = this.sdkConfiguration.getConfigRepository()
                .getClientId();

        try {
            final OAuth20 oAuth20 = new OAuth20(this);
            final OAuth20Extension oAuth20Extension = new OAuth20Extension(this);

            final AuthorizeV3 authorizeV3 = AuthorizeV3.builder()
                    .codeChallenge(codeChallenge)
                    .codeChallengeMethodFromEnum(CodeChallengeMethod.S256)
                    .scope(LOGIN_USER_SCOPE)
                    .clientId(clientId)
                    .responseTypeFromEnum(AuthorizeV3.ResponseType.Code)
                    .build();
            final String authorizeResponse = oAuth20.authorizeV3(authorizeV3);

            final List<NameValuePair> authorizeParams = URLEncodedUtils.parse(
                    new URI(authorizeResponse), StandardCharsets.UTF_8);
            final String requestId = authorizeParams.stream()
                    .filter((q) -> {
                        return q.getName().equals(authorizeV3.getLocationQuery());
                    })
                    .findFirst()
                    .map(NameValuePair::getValue)
                    .orElse(null);
            final UserAuthenticationV3 userAuthenticationV3 = UserAuthenticationV3.builder()
                    .clientId(clientId)
                    .userName(username)
                    .password(password)
                    .requestId(requestId)
                    .build();
            final String authenticationResponse = oAuth20Extension
                    .userAuthenticationV3(userAuthenticationV3);

            final List<NameValuePair> authenticationParams = URLEncodedUtils.parse(
                    new URI(authenticationResponse), StandardCharsets.UTF_8);
            final String code = authenticationParams.stream()
                    .filter((q) -> {
                        return q.getName().equals(userAuthenticationV3.getLocationQuery());
                    })
                    .findFirst()
                    .map(NameValuePair::getValue)
                    .orElse(null);
            final Instant utcNow = Instant.now();
            final TokenGrantV3 tokenGrantV3 = TokenGrantV3.builder()
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
                tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(token.getExpiresIn())));
                tokenRefresh.storeRefreshToken(token.getRefreshToken());
                tokenRefresh.setRefreshTokenExpiresAt(Date.from(utcNow.plusSeconds(token.getRefreshExpiresIn())));
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
            final TokenGrantV3 tokenGrantV3 = TokenGrantV3.builder()
                    .grantTypeFromEnum(TokenGrantV3.GrantType.ClientCredentials)
                    .build();
            final OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);

            final TokenRepository tokenRepository = this.sdkConfiguration.getTokenRepository();
            tokenRepository.storeToken(token.getAccessToken());
            if (tokenRepository instanceof TokenRefresh) {
                final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;
                tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(token.getExpiresIn())));
                tokenRefresh.storeRefreshToken(null);
                tokenRefresh.setRefreshTokenExpiresAt(null);
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
            final PlatformTokenGrantV3 tokenGrantV3 = PlatformTokenGrantV3.builder()
                    .platformId(platformId)
                    .platformToken(platformToken)
                    .build();
            final OauthmodelTokenResponse token = oAuth20.platformTokenGrantV3(tokenGrantV3);

            final TokenRepository tokenRepository = this.sdkConfiguration.getTokenRepository();
            tokenRepository.storeToken(token.getAccessToken());
            if (tokenRepository instanceof TokenRefresh) {
                final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;
                tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(token.getExpiresIn())));
                tokenRefresh.storeRefreshToken(token.getRefreshToken());
                tokenRefresh.setRefreshTokenExpiresAt(Date.from(utcNow.plusSeconds(token.getRefreshExpiresIn())));
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean refreshToken() {
        synchronized (refreshTokenLock) {
            try {
                final TokenRepository tokenRepository = sdkConfiguration.getTokenRepository();
                final String accessToken = tokenRepository.getToken();

                if (accessToken == null || "".equals(accessToken)) {
                    return false; // Cannot perform token refresh
                }

                if (!(tokenRepository instanceof TokenRefresh)) {
                    return false; // Cannot perform token refresh
                }

                final TokenRefresh tokenRefresh = (TokenRefresh) tokenRepository;

                final Instant utcNow = Instant.now();
                final boolean isAccessTokenExpired = (tokenRefresh.getTokenExpiresAt().getTime()
                        - Date.from(utcNow).getTime()) / 1000 < REFRESH_TOKEN_EXPIRY_THRESHOLD;

                if (!isAccessTokenExpired) {
                    return true; // Token refresh not required
                }

                final String refreshToken = tokenRefresh.getRefreshToken();
                final boolean isLoginUser = refreshToken != null && !"".equals(refreshToken);

                if (isLoginUser) {
                    final boolean isRefreshTokenExpired = (tokenRefresh.getRefreshTokenExpiresAt().getTime()
                            - Date.from(utcNow).getTime()) / 1000 < REFRESH_TOKEN_EXPIRY_THRESHOLD;

                    if (isRefreshTokenExpired) {
                        return false; // Cannot perform token refresh
                    }

                    final OAuth20 oAuth20 = new OAuth20(this);
                    final TokenGrantV3 tokenGrantV3 = TokenGrantV3.builder()
                            .refreshToken(refreshToken)
                            .grantTypeFromEnum(TokenGrantV3.GrantType.RefreshToken)
                            .build();
                    try {
                        tokenRepository.removeToken();
                        final OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);
                        tokenRepository.storeToken(token.getAccessToken());
                        tokenRefresh.setTokenExpiresAt(Date.from(utcNow.plusSeconds(token.getExpiresIn())));
                        tokenRefresh.storeRefreshToken(token.getRefreshToken());
                        tokenRefresh.setRefreshTokenExpiresAt(
                                Date.from(utcNow.plusSeconds(token.getRefreshExpiresIn())));
                        return true; // Token refresh successful
                    } catch (Exception e) {
                        tokenRepository.storeToken(accessToken); // Put access token back if token refresh failed
                        e.printStackTrace();
                    }
                    return false; // Token refresh failed
                } else {
                    tokenRepository.removeToken();
                    final boolean isLoginClientOk = this.loginClient();
                    if (!isLoginClientOk) {
                        tokenRepository.storeToken(accessToken); // Put access token back if token refresh failed
                    }
                    return isLoginClientOk; // Token refresh successful or failed
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        }
    }

    public boolean logout() {
        final TokenRepository tokenRepository = sdkConfiguration.getTokenRepository();
        try {
            tokenRepository.removeToken();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
