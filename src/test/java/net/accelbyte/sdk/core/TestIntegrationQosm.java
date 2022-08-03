/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import okhttp3.FormBody;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;
import org.jetbrains.annotations.NotNull;
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
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy.RetryIntervalType;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.client.OkhttpWebSocketClient;
import net.accelbyte.sdk.core.client.ReliableHttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegrationQosm {
  private AccelByteSDK sdk;
  private String namespace;
  private String username;
  private String password;

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
    this.namespace = namespace;
    this.username = username;
    this.password = password;

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