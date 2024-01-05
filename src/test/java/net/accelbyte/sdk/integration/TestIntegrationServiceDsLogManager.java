/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import net.accelbyte.sdk.api.dslogmanager.models.ModelsListTerminatedServersResponse;
import net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers.ListTerminatedServers;
import net.accelbyte.sdk.api.dslogmanager.wrappers.TerminatedServers;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
@Disabled
public class TestIntegrationServiceDsLogManager extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final TerminatedServers terminatedServersWrapper = new TerminatedServers(sdk);

    final ModelsListTerminatedServersResponse terminatedServersResult =
        terminatedServersWrapper.listTerminatedServers(
            ListTerminatedServers.builder().namespace(this.namespace).limit(10).build());

    assertNotNull(terminatedServersResult);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
