/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.sessionhistory.config.*;
import net.accelbyte.sdk.cli.api.sessionhistory.game_session_detail.*;
import net.accelbyte.sdk.cli.api.sessionhistory.operations.*;
import net.accelbyte.sdk.cli.api.sessionhistory.x_ray.*;
import picocli.CommandLine.Command;

@Command(
    name = "sessionhistory",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetHealthcheckInfo.class,
      GetHealthcheckInfoV1.class,
      AdminGetLogConfig.class,
      AdminPatchUpdateLogConfig.class,
      AdminQueryGameSessionDetail.class,
      GetGameSessionDetail.class,
      AdminQueryMatchmakingDetail.class,
      AdminGetMatchmakingDetailBySessionID.class,
      AdminGetMatchmakingDetailByTicketID.class,
      AdminQueryPartyDetail.class,
      GetPartyDetail.class,
      AdminQueryTicketDetail.class,
      AdminTicketDetailGetByTicketID.class,
      QueryXrayMatchPool.class,
      QueryDetailTickMatchPool.class,
      QueryDetailTickMatchPoolMatches.class,
      QueryDetailTickMatchPoolTicket.class,
      QueryMatchHistories.class,
      QueryMatchTicketHistories.class,
      QueryXrayMatch.class,
      QueryAcquiringDS.class,
      QueryAcquiringDSWaitTimeAvg.class,
      QueryMatchLengthDurationpAvg.class,
      QueryMatchLengthDurationp99.class,
      QueryTotalActiveSession.class,
      QueryTotalMatchmakingMatch.class,
      QueryTotalPlayerPersession.class,
      QueryTotalMatchmakingCanceled.class,
      QueryTotalMatchmakingCreated.class,
      QueryTotalMatchmakingExpired.class,
      QueryTotalMatchmakingMatchTicket.class,
      QueryXrayTimelineByTicketID.class,
      QueryXrayTimelineByUserID.class,
    })
public class Sessionhistory implements Runnable {

  @Override
  public void run() {}
}
