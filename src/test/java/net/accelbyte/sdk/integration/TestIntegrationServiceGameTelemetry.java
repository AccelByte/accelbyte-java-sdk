/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import java.util.Arrays;
import java.util.Collections;
import java.util.Map;
import net.accelbyte.sdk.api.gametelemetry.models.TelemetryBody;
import net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations.ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost;
import net.accelbyte.sdk.api.gametelemetry.wrappers.GametelemetryOperations;
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
public class TestIntegrationServiceGameTelemetry extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    final String eventName = "javaserversdkevent";
    final Map<String, ?> eventPayload = Collections.singletonMap("foo", "bar");

    final GametelemetryOperations gameTelemetryWrapper = new GametelemetryOperations(sdk);

    // CASE Save game telemetry

    final TelemetryBody saveTelemetryBody =
        TelemetryBody.builder()
            .eventName(eventName)
            .eventNamespace(eventName)
            .payload(eventPayload)
            .build();

    gameTelemetryWrapper.protectedSaveEventsGameTelemetryV1ProtectedEventsPost(
        ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.builder()
            .body(Arrays.asList(saveTelemetryBody))
            .build());

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
