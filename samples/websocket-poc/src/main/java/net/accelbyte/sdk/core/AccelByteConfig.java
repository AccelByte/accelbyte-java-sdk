package net.accelbyte.sdk.core;

import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.repository.TokenRepository;
import net.accelbyte.sdk.core.repository.ConfigRepository;

@Setter
@Getter
public class AccelByteConfig {
    private HttpClient httpClient;
    private TokenRepository tokenRepository;
    private ConfigRepository configRepository;

    public AccelByteConfig(HttpClient httpClient, TokenRepository tokenRepository, ConfigRepository configRepository) {
        this.httpClient = httpClient;
        this.tokenRepository = tokenRepository;
        this.configRepository = configRepository;
    }
}
