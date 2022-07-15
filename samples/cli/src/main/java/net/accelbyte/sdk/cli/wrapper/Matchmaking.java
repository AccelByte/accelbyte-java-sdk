/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.matchmaking.matchmaking.*;
import net.accelbyte.sdk.cli.api.matchmaking.matchmaking_operations.*;
import net.accelbyte.sdk.cli.api.matchmaking.social_matchmaking.*;
import picocli.CommandLine.Command;

@Command(
    name = "matchmaking",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetHealthcheckInfo.class,
      HandlerV3Healthz.class,
      GetAllChannelsHandler.class,
      CreateChannelHandler.class,
      DeleteChannelHandler.class,
      StoreMatchResults.class,
      Rebalance.class,
      QueueSessionHandler.class,
      DequeueSessionHandler.class,
      QuerySessionHandler.class,
      UpdatePlayTimeWeight.class,
      GetAllPartyInAllChannel.class,
      BulkGetSessions.class,
      ExportChannels.class,
      ImportChannels.class,
      GetSingleMatchmakingChannel.class,
      UpdateMatchmakingChannel.class,
      GetAllPartyInChannel.class,
      GetAllSessionsInChannel.class,
      AddUserIntoSessionInChannel.class,
      DeleteSessionInChannel.class,
      DeleteUserFromSessionInChannel.class,
      SearchSessions.class,
      GetSessionHistoryDetailed.class,
      PublicGetMessages.class,
      PublicGetAllMatchmakingChannel.class,
      PublicGetSingleMatchmakingChannel.class,
      SearchSessionsV2.class,
      VersionCheckHandler.class,
    })
public class Matchmaking implements Runnable {

  @Override
  public void run() {}
}
