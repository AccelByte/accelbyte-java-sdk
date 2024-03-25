/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import net.accelbyte.sdk.api.dsartifact.models.ModelsListAllQueueResponse;
import net.accelbyte.sdk.api.dsartifact.models.ModelsListTerminatedServersResponse;
import net.accelbyte.sdk.api.dsartifact.wrappers.AllTerminatedServers;
import net.accelbyte.sdk.api.dsartifact.wrappers.ArtifactUploadProcessQueue;
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
class TestIntegrationServiceDsArtifact extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void testListAllQueue() throws Exception {
    final ArtifactUploadProcessQueue wrapper = new ArtifactUploadProcessQueue(sdk);
    final net.accelbyte.sdk.api.dsartifact.operations.artifact_upload_process_queue.ListAllQueue
        operation =
            net.accelbyte.sdk.api.dsartifact.operations.artifact_upload_process_queue.ListAllQueue
                .builder()
                .namespace(namespace)
                .limit(20)
                .build();
    final ModelsListAllQueueResponse response = wrapper.listAllQueue(operation);

    assertNotNull(response);
  }

  @Test
  @Order(1)
  public void testListTerminatedServer() throws Exception {
    final AllTerminatedServers wrapper = new AllTerminatedServers(sdk);
    final net.accelbyte.sdk.api.dsartifact.operations.all_terminated_servers.ListTerminatedServers
        operation =
            net.accelbyte.sdk.api.dsartifact.operations.all_terminated_servers.ListTerminatedServers
                .builder()
                .limit(20)
                .build();
    final ModelsListTerminatedServersResponse response = wrapper.listTerminatedServers(operation);

    assertNotNull(response);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
