/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;

import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsGameSessionDetailQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsMatchmakingDetailQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.AdminQueryGameSessionDetail;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.AdminQueryMatchmakingDetail;
import net.accelbyte.sdk.api.sessionhistory.wrappers.GameSessionDetail;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceSessionHistory extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  public void GameSessionTests() throws Exception {
    final GameSessionDetail gameSessionDetailWrapper = new GameSessionDetail(sdk);

    final AdminQueryGameSessionDetail adminQueryGameSessionDetail =
        AdminQueryGameSessionDetail.builder().namespace(this.namespace).offset(0).limit(20).build();

    // Get all game sessions history
    ApimodelsGameSessionDetailQueryResponse gameSessionHistoryResp =
        gameSessionDetailWrapper.adminQueryGameSessionDetail(adminQueryGameSessionDetail);
    assertNotNull(gameSessionHistoryResp);

    if ((gameSessionHistoryResp != null) && (gameSessionHistoryResp.getData() != null)) {
      assertTrue(gameSessionHistoryResp.getData().size() >= 0);
    }

    // Get all matchmaking history
    final AdminQueryMatchmakingDetail adminQueryMatchmakingDetail =
        AdminQueryMatchmakingDetail.builder().namespace(this.namespace).offset(0).limit(20).build();

    ApimodelsMatchmakingDetailQueryResponse matchMakingHistoryResp =
        gameSessionDetailWrapper.adminQueryMatchmakingDetail(adminQueryMatchmakingDetail);
    assertNotNull(matchMakingHistoryResp);

    if ((matchMakingHistoryResp != null) && (matchMakingHistoryResp.getData() != null)) {
      assertTrue(matchMakingHistoryResp.getData().size() >= 0);
    }
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
