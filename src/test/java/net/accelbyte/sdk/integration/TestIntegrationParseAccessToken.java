package net.accelbyte.sdk.integration;

import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.AccessTokenPayload;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;

import static org.junit.jupiter.api.Assertions.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)

public class TestIntegrationParseAccessToken extends TestIntegration {

    @BeforeAll
    public void setup() throws Exception {
        super.setup(false);
    }

    @ParameterizedTest
    @ValueSource(booleans = {false, true})
    @Order(1)
    public void testParseAccessToken(boolean validateFirst) throws Exception {

        final DefaultConfigRepository configRepo1 = new DefaultConfigRepository();

        configRepo1.setLocalTokenValidationEnabled(true);
        configRepo1.setJwksRefreshInterval(3); // 3 seconds for testing purpose only
        configRepo1.setRevocationListRefreshInterval(3); // 3 seconds for testing purpose only

        final AccelByteSDK sdk1 =
                new AccelByteSDK(
                        new AccelByteConfig(new OkhttpClient(), new DefaultTokenRepository(), configRepo1));

        sdk1.loginClient();
        final String token = sdk1.getSdkConfiguration().getTokenRepository().getToken();

        final AccessTokenPayload payload = sdk1.parseAccessToken(token, validateFirst);
        assertNotNull(payload);

        assertEquals(namespace, payload.getNamespace());
        assertEquals(configRepo1.getClientId(), payload.getClientId());
    }

    @AfterAll
    public void tear() throws Exception {
        super.tear();
    }
}
