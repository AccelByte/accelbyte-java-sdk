package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

@Setter
@Getter
public class AccelByteConfig {

    //TODO: make builder pattern for this
    private HttpClient httpClient;
    private TokenRepository tokenRepository;
    private ConfigRepository configRepository;

    public AccelByteConfig(HttpClient httpClient, TokenRepository tokenRepository, ConfigRepository configRepository) {
        this.httpClient = httpClient;
        this.tokenRepository = tokenRepository;
        this.configRepository = configRepository;
    }
}
