package net.accelbyte.sdk.core;

import net.accelbyte.sdk.api.iam.models.OauthmodelTokenResponseV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3;
import net.accelbyte.sdk.api.iam.operations.o_auth2_0.TokenGrantV3;
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
import java.nio.charset.StandardCharsets;
import java.util.List;

public class AccelByteSDK {
    AccelByteConfig sdkConfiguration;

    public AccelByteSDK(AccelByteConfig sdkConfiguration) {
        this.sdkConfiguration = sdkConfiguration;
    }

    public AccelByteSDK(HttpClient httpClient, TokenRepository tokenRepository, ConfigRepository configRepository) {
        this.sdkConfiguration = new AccelByteConfig(httpClient, tokenRepository, configRepository) {
        };
    }

    public AccelByteConfig getSdkConfiguration() {
        return sdkConfiguration;
    }

    public HttpResponse runRequest(Operation operation) throws IOException {
        sdkConfiguration.getTokenRepository().storeToken(sdkConfiguration.getTokenRepository().getToken());
        String baseUrl = sdkConfiguration.getConfigRepository().getBaseURL();
        Header header = new Header();
        if (operation.getHeaderParams() != null) {
            operation.getHeaderParams().forEach(header::addHeaderData);
        }
        String token = sdkConfiguration.getTokenRepository().getToken();
        if (operation.getSecurity() != null) {
            if (operation.getSecurity().equals("Bearer")) {
                if (!sdkConfiguration.getTokenRepository().getToken().equals("")) {
                    header.setBearerAuthorization("Bearer " + token);
                }
            }
            if (operation.getSecurity().equals("Basic")) {
                String clientId = sdkConfiguration.getConfigRepository().getClientId();
                String clientSecret = sdkConfiguration.getConfigRepository().getClientSecret();
                header.setBasicAuthorization(Credentials.basic(clientId, clientSecret));
            }
        }
        return sdkConfiguration.getHttpClient().sendRequest(operation, baseUrl, header);
    }

    public boolean loginUser(String username, String password) {
        String codeVerifier = Helper.generateCodeVerifier();
        String codeChallenge = Helper.generateCodeChallenge(codeVerifier);
        String clientId = this.sdkConfiguration.getConfigRepository().getClientId();
        try {
            OAuth20 oAuth20 = new OAuth20(this);
            AuthorizeV3 authorizeV3 = new AuthorizeV3(
                    codeChallenge,
                    "S256",
                    null,
                    "commerce account social publishing analytics",
                    null,
                    null,
                    clientId,
                    "code");
            String response = oAuth20.authorizeV3(authorizeV3);
            // todo: change this to simple regex
            List<NameValuePair> params = URLEncodedUtils.parse(new URI(response), StandardCharsets.UTF_8);
            String requestId = null;
            for (NameValuePair p : params) {
                if (p.getName().equals(authorizeV3.getLocationQuery())) {
                    requestId = p.getValue();
                    break;
                }
            }
            OAuth20Extension oAuth20Extension = new OAuth20Extension(this);
            UserAuthenticationV3 userAuthenticationV3 = new UserAuthenticationV3(
                    clientId,
                    null,
                    null,
                    password,
                    requestId,
                    username);
            response = oAuth20Extension.userAuthenticationV3(userAuthenticationV3);
            params = URLEncodedUtils.parse(new URI(response), StandardCharsets.UTF_8);
            String code = null;
            for (NameValuePair q : params) {
                if (q.getName().equals(userAuthenticationV3.getLocationQuery())) {
                    code = q.getValue();
                    break;
                }
            }
            TokenGrantV3 tokenGrantV3 = new TokenGrantV3(
                    clientId,
                    code,
                    codeVerifier,
                    null,
                    null,
                    "authorization_code");
            tokenGrantV3.setSecurity(null);
            OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);
            this.sdkConfiguration.getTokenRepository().storeToken(token.getAccessToken());
            return true;
        } catch (ResponseException | IOException | URISyntaxException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean loginClient() {
        try {
            TokenGrantV3 tokenGrantV3 = new TokenGrantV3(
                    null,
                    null,
                    null,
                    null,
                    null,
                    "client_credentials");
            OAuth20 oAuth20 = new OAuth20(this);
            OauthmodelTokenResponseV3 token = oAuth20.tokenGrantV3(tokenGrantV3);
            this.sdkConfiguration.getTokenRepository().storeToken(token.getAccessToken());
            return true;
        } catch (ResponseException | IOException e) {
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