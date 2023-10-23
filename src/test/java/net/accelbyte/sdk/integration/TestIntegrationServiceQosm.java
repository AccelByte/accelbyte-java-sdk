/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import net.accelbyte.sdk.api.qosm.models.ModelsHeartbeatRequest;
import net.accelbyte.sdk.api.qosm.models.ModelsListServerResponse;
import net.accelbyte.sdk.api.qosm.models.ModelsServer;
import net.accelbyte.sdk.api.qosm.operations.public_.ListServer;
import net.accelbyte.sdk.api.qosm.operations.server.Heartbeat;
import net.accelbyte.sdk.api.qosm.wrappers.Public;
import net.accelbyte.sdk.api.qosm.wrappers.Server;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegrationServiceQosm extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {

    final Public qosmPublicWrapper = new Public(sdk);
    final Server qosmServerWrapper = new Server(sdk);

    // CASE List servers

    final ModelsListServerResponse serverList =
        qosmPublicWrapper.listServer(ListServer.builder().build());

    // ESAC

    assertNotNull(serverList);

    List<ModelsServer> servers = serverList.getServers();
    if (servers.size() > 0) {
      final ModelsServer server = servers.get(0);

      // CASE Heartbeat

      final ModelsHeartbeatRequest heartbeatRequestBody =
          ModelsHeartbeatRequest.builder()
              .ip(server.getIp())
              .port(server.getPort())
              .region(server.getRegion())
              .build();

      qosmServerWrapper.heartbeat(Heartbeat.builder().body(heartbeatRequestBody).build());

      // ESAC
    }
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
