/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Collections;
import java.util.Map;
import net.accelbyte.sdk.api.session.models.ApimodelsGameSessionQueryResponse;
import net.accelbyte.sdk.api.session.operations.game_session.PublicQueryGameSessions;
import net.accelbyte.sdk.api.session.wrappers.GameSession;
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
public class TestIntegrationServiceSession extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {

    final GameSession gameSessionWrapper = new GameSession(sdk);

    final Map<String, ?> filter = Collections.emptyMap();

    final ApimodelsGameSessionQueryResponse response =
        gameSessionWrapper.publicQueryGameSessions(
            PublicQueryGameSessions.builder().body(filter).namespace(this.namespace).build());

    assertNotNull(response);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
