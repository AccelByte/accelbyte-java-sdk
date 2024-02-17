/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.dsartifact.all_terminated_servers.*;
import net.accelbyte.sdk.cli.api.dsartifact.artifact_upload_process_queue.*;
import net.accelbyte.sdk.cli.api.dsartifact.download_server_artifact.*;
import net.accelbyte.sdk.cli.api.dsartifact.operations.*;
import net.accelbyte.sdk.cli.api.dsartifact.terminated_servers.*;
import picocli.CommandLine.Command;

@Command(
    name = "dsartifact",
    mixinStandardHelpOptions = true,
    subcommands = {
      ListNodesIPAddress.class,
      DeleteNodeByID.class,
      ListQueue.class,
      GetActiveQueue.class,
      SetActiveQueue.class,
      DeleteActiveQueue.class,
      ReportFailedUpload.class,
      DeleteQueue.class,
      ListAllActiveQueue.class,
      ListAllQueue.class,
      ListTerminatedServersWithNamespace.class,
      DownloadServerArtifacts.class,
      CheckServerArtifact.class,
      ListTerminatedServers.class,
      PublicGetMessages.class,
    })
public class Dsartifact implements Runnable {

  @Override
  public void run() {}
}
