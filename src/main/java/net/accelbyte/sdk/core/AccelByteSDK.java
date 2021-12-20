package net.accelbyte.sdk.core;

import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

import java.io.IOException;

public class AccelByteSDK {
    AccelByteConfig sdkConfiguration;

    public AccelByteSDK(AccelByteConfig sdkConfiguration) {
        this.sdkConfiguration = sdkConfiguration;
    }

    public AccelByteSDK(HttpClient httpClient, TokenRepository tokenRepository, ConfigRepository configRepository) {
        this.sdkConfiguration = new AccelByteConfig(httpClient, tokenRepository, configRepository) {};
    }

    public HttpResponse runRequest(Operation operation) throws IOException {
        // TODO : cek header either basic or bearer
        sdkConfiguration.getTokenRepository().storeToken(sdkConfiguration.getTokenRepository().getToken());
        String baseUrl = sdkConfiguration.getConfigRepository().getBaseURL();
        Header header = new Header();
        if (operation.getHeaderParams() != null) {
            header.setHeaderData(operation.getHeaderParams());
        }
        String token = sdkConfiguration.getTokenRepository().getToken();
        header.setBearerAuthorization(token);
        return sdkConfiguration.getHttpClient().sendRequest(operation, baseUrl, header);
    }
}
