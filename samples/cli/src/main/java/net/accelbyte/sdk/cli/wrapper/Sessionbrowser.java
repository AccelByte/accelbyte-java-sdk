/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.sessionbrowser.session.*;
import picocli.CommandLine.Command;

@Command(
    name = "sessionbrowser",
    mixinStandardHelpOptions = true,
    subcommands = {
      AdminQuerySession.class,
      GetTotalActiveSession.class,
      GetActiveCustomGameSessions.class,
      GetActiveMatchmakingGameSessions.class,
      AdminGetSession.class,
      AdminDeleteSession.class,
      AdminSearchSessionsV2.class,
      GetSessionHistoryDetailed.class,
      UserQuerySession.class,
      CreateSession.class,
      GetSessionByUserIDs.class,
      GetSession.class,
      UpdateSession.class,
      DeleteSession.class,
      JoinSession.class,
      DeleteSessionLocalDS.class,
      AddPlayerToSession.class,
      RemovePlayerFromSession.class,
      UpdateSettings.class,
      GetRecentPlayer.class,
    })
public class Sessionbrowser implements Runnable {

  @Override
  public void run() {}
}
