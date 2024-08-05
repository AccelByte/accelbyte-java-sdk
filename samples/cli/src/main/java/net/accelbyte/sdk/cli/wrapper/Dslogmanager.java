/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.dslogmanager.admin.*;
import net.accelbyte.sdk.cli.api.dslogmanager.all_terminated_servers.*;
import net.accelbyte.sdk.cli.api.dslogmanager.dslogmanager_operations.*;
import net.accelbyte.sdk.cli.api.dslogmanager.terminated_servers.*;
import picocli.CommandLine.Command;

@Command(
    name = "dslogmanager",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetServerLogs.class,
      ListTerminatedServers.class,
      DownloadServerLogs.class,
      CheckServerLogs.class,
      BatchDownloadServerLogs.class,
      ListMetadataServers.class,
      ListAllTerminatedServers.class,
      PublicGetMessages.class,
    })
public class Dslogmanager implements Runnable {

  @Override
  public void run() {}
}
