/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static java.time.temporal.ChronoUnit.DAYS;
import static org.junit.jupiter.api.Assertions.*;

import java.time.Instant;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsGameSessionDetailQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsMatchmakingDetailQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.models.ApimodelsXRayMatchMatchmakingQueryResponse;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.AdminQueryGameSessionDetail;
import net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail.AdminQueryMatchmakingDetail;
import net.accelbyte.sdk.api.sessionhistory.operations.x_ray.QueryTotalMatchmakingMatch;
import net.accelbyte.sdk.api.sessionhistory.wrappers.GameSessionDetail;
import net.accelbyte.sdk.api.sessionhistory.wrappers.XRay;
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
  @Order(1)
  @Disabled
  public void TotalMatchmakingMatchTests() throws Exception {
    if (isUsingAGSStarter()) {
      // Temporarily disabled in AGS Starter due to issue in session service.
      return;
    }

    final XRay xRayWrapper = new XRay(sdk);

    // Format: 2024-04-05T03:42:49Z
    // https://development.accelbyte.io/sessionhistory/apidocs/#/XRay/queryTotalMatchmakingMatch
    DateTimeFormatter formatter =
        DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss'Z'").withZone(ZoneOffset.UTC);

    Instant now = Instant.now();
    final String endDate = formatter.format(now);
    final String startDate = formatter.format(now.minus(10, DAYS));

    final QueryTotalMatchmakingMatch queryTotalMatchmakingMatchModel =
        QueryTotalMatchmakingMatch.builder()
            .namespace(this.namespace)
            .endDate(endDate)
            .startDate(startDate)
            .build();

    // Get total matchmaking match
    ApimodelsXRayMatchMatchmakingQueryResponse response =
        xRayWrapper.queryTotalMatchmakingMatch(queryTotalMatchmakingMatchModel);
    assertNotNull(response);

    if ((response != null) && (response.getData() != null)) {
      assertTrue(response.getData().size() >= 0);
    }
  }

  @Test
  @Order(2)
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
