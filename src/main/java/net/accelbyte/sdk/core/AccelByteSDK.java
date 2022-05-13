/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3.CodeChallengeMethod;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.UserAuthenticationV3;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.util.Helper;
import okhttp3.Credentials;
import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class AccelByteSDK {
    private static final String COOKIE_KEY_ACCESS_TOKEN = "access_token";
    private static final String LOGIN_USER_SCOPE = "commerce account social publishing analytics";

    AccelByteConfig sdkConfiguration;

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

    public HttpResponse runRequest(Operation operation) throws IOException {
        String selectedSecurity = Operation.Security.Basic.toString();
        if (!operation.getPreferredSecurityMethod().isEmpty())
            selectedSecurity = operation.getPreferredSecurityMethod();
        else if (operation.getSecurities().size() > 0) {
            selectedSecurity = operation.getSecurities().get(0);
        }
        final HttpHeaders headers = new HttpHeaders();
        final String token = sdkConfiguration.getTokenRepository().getToken();
        final Map<String, String> cookies = operation.getCookieParams();
        if (Operation.Security.Basic.toString().equals(selectedSecurity)) {
            final String clientId = sdkConfiguration.getConfigRepository()
                    .getClientId();
            final String clientSecret = sdkConfiguration.getConfigRepository()
                    .getClientSecret();
            headers.put(HttpHeaders.AUTHORIZATION,
                    Credentials.basic(clientId, clientSecret));
        } else if (Operation.Security.Bearer.toString().equals(selectedSecurity)) {
            if (token != null && !token.equals("")) {
                headers.put(HttpHeaders.AUTHORIZATION,
                        Operation.Security.Bearer.toString() + " " + token);
            }
        } else if (Operation.Security.Cookie.toString().equals(selectedSecurity)) {
            if (token != null && !token.equals("")) {
                cookies.put(COOKIE_KEY_ACCESS_TOKEN, token);
            }
        }
        if (sdkConfiguration.getConfigRepository().isAmazonTraceId()) {
            final String version = sdkConfiguration.getConfigRepository()
                    .getAmazonTraceIdVersion();
            headers.put(HttpHeaders.X_AMZN_TRACE_ID, Helper
                    .generateAmazonTraceId(version));
        }
        if (sdkConfiguration.getConfigRepository().isClientInfoHeader()) {
            final String sdkName = SDKInfo.getInstance().getSdkName();
            final String sdkVersion = SDKInfo.getInstance().getSdkVersion();
            final AppInfo appInfo = sdkConfiguration.getConfigRepository()
                    .getAppInfo();
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
            final OAuth20Extension oAuth20Extension = new OAuth20Extension(this);
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
            final TokenGrantV3 tokenGrantV3 = TokenGrantV3.builder()
                    .clientId(clientId)
                    .code(code)
                    .codeVerifier(codeVerifier)
                    .grantTypeFromEnum(TokenGrantV3.GrantType.AuthorizationCode)
                    .build();
            final OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);
            this.sdkConfiguration.getTokenRepository().storeToken(token.getAccessToken());
            return true;
        } catch (HttpResponseException | IOException | URISyntaxException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean loginClient() {
        try {
            final TokenGrantV3 tokenGrantV3 = TokenGrantV3.builder()
                    .grantTypeFromEnum(TokenGrantV3.GrantType.ClientCredentials)
                    .build();
            final OAuth20 oAuth20 = new OAuth20(this);
            final OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);
            this.sdkConfiguration.getTokenRepository().storeToken(token.getAccessToken());
            return true;
        } catch (HttpResponseException | IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean logout() {
        try {
            this.sdkConfiguration.getTokenRepository().removeToken();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }
}
