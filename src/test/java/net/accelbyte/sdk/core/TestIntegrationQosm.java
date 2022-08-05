/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;
import net.accelbyte.sdk.api.qosm.models.ModelsListServerResponse;
import net.accelbyte.sdk.api.qosm.models.ModelsHeartbeatRequest;
import net.accelbyte.sdk.api.qosm.models.ModelsServer;
import net.accelbyte.sdk.api.qosm.operations.public_.ListServer;
import net.accelbyte.sdk.api.qosm.operations.server.Heartbeat;
import net.accelbyte.sdk.api.qosm.wrappers.Public;
import net.accelbyte.sdk.api.qosm.wrappers.Server;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegrationQosm {
  private AccelByteSDK sdk;

  @BeforeAll
  public void setup() throws Exception {
    final HttpClient<?> httpClient = new OkhttpClient();
    final TokenRepository tokenRepo = DefaultTokenRepository.getInstance();
    final ConfigRepository configRepo = new DefaultConfigRepository();
    final AccelByteConfig sdkConfig = new AccelByteConfig(httpClient, tokenRepo, configRepo);

    final String baseUrl = configRepo.getBaseURL();
    final String clientId = configRepo.getClientId();
    final String clientSecret = configRepo.getClientSecret();
    final String username = System.getenv("AB_USERNAME");
    final String password = System.getenv("AB_PASSWORD");
    final String namespace = System.getenv("AB_NAMESPACE");

    assertTrue(baseUrl != null && !baseUrl.isEmpty());
    assertTrue(clientId != null && !clientId.isEmpty());
    assertTrue(clientSecret != null && !clientSecret.isEmpty());
    assertTrue(username != null && !username.isEmpty());
    assertTrue(password != null && !password.isEmpty());
    assertTrue(namespace != null && !namespace.isEmpty());

    this.sdk = new AccelByteSDK(sdkConfig);

    final boolean isLoginUserOk = sdk.loginUser(username, password);
    final String token = tokenRepo.getToken();

    assertTrue(isLoginUserOk);
    assertTrue(token != null && !token.isEmpty());
  }

  @Test
  @Order(1)
  public void testQosm() throws Exception {

    final Public qosmPublicWrapper = new Public(sdk);
    final Server qosmServerWrapper = new Server(sdk);

    final ModelsListServerResponse serverList =
        qosmPublicWrapper.listServer(
            ListServer.builder().build());
    assertNotNull(serverList);

    List<ModelsServer> servers = serverList.getServers();
    if (servers.size() > 0) {
        final ModelsServer server = servers.get(0);

        final ModelsHeartbeatRequest createHbRequest =
            ModelsHeartbeatRequest.builder()
                .ip(server.getIp())
                .port(server.getPort())
                .region(server.getRegion())
                .build();

        qosmServerWrapper.heartbeat(
            Heartbeat.builder()
                .body(createHbRequest)
                .build());        
    }
  }

  @AfterAll
  public void tear() throws Exception {
    final boolean isLogoutOk = sdk.logout();
    final String token = sdk.getSdkConfiguration().getTokenRepository().getToken();

    assertTrue(isLogoutOk);
    assertTrue(token == null || token.isEmpty());
  }
}