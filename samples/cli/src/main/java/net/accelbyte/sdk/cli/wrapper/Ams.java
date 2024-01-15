/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.ams.account.*;
import net.accelbyte.sdk.cli.api.ams.ams_info.*;
import net.accelbyte.sdk.cli.api.ams.ams_qo_s.*;
import net.accelbyte.sdk.cli.api.ams.artifacts.*;
import net.accelbyte.sdk.cli.api.ams.auth.*;
import net.accelbyte.sdk.cli.api.ams.fleet_commander.*;
import net.accelbyte.sdk.cli.api.ams.fleets.*;
import net.accelbyte.sdk.cli.api.ams.images.*;
import net.accelbyte.sdk.cli.api.ams.servers.*;
import net.accelbyte.sdk.cli.api.ams.watchdogs.*;
import picocli.CommandLine.Command;

@Command(
    name = "ams",
    mixinStandardHelpOptions = true,
    subcommands = {
      AuthCheck.class,
      PortalHealthCheck.class,
      AdminAccountGet.class,
      AdminAccountCreate.class,
      AdminAccountLinkTokenGet.class,
      AdminAccountLinkTokenPost.class,
      ArtifactGet.class,
      ArtifactUsageGet.class,
      ArtifactDelete.class,
      ArtifactGetURL.class,
      FleetList.class,
      FleetCreate.class,
      FleetGet.class,
      FleetUpdate.class,
      FleetDelete.class,
      FleetArtifactSamplingRulesGet.class,
      FleetArtifactSamplingRulesSet.class,
      FleetServers.class,
      FleetServerHistory.class,
      ImageList.class,
      ImageGet.class,
      ImagePatch.class,
      QoSRegionsGet.class,
      QoSRegionsUpdate.class,
      InfoRegions.class,
      FleetServerInfo.class,
      ServerHistory.class,
      InfoSupportedInstances.class,
      AccountGet.class,
      FleetClaimByID.class,
      LocalWatchdogConnect.class,
      FleetClaimByKeys.class,
      WatchdogConnect.class,
      UploadURLGet.class,
      Func1.class,
      BasicHealthCheck.class,
    })
public class Ams implements Runnable {

  @Override
  public void run() {}
}
