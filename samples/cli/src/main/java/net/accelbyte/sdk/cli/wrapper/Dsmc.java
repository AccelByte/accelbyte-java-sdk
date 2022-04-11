/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.dsmc.config.*;
import net.accelbyte.sdk.cli.api.dsmc.image_config.*;
import net.accelbyte.sdk.cli.api.dsmc.deployment_config.*;
import net.accelbyte.sdk.cli.api.dsmc.pod_config.*;
import net.accelbyte.sdk.cli.api.dsmc.admin.*;
import net.accelbyte.sdk.cli.api.dsmc.server.*;
import net.accelbyte.sdk.cli.api.dsmc.session.*;
import net.accelbyte.sdk.cli.api.dsmc.public_.*;
import net.accelbyte.sdk.cli.api.dsmc.dsmc_operations.*;

import picocli.CommandLine.Command;

@Command(name = "dsmc",
        mixinStandardHelpOptions = true,
        subcommands = {
                ListConfig.class,
                SaveConfig.class,
                UpdateImage.class,
                CreateImage.class,
                ImportImages.class,
                CreateImagePatch.class,
                GetConfig.class,
                CreateConfig.class,
                DeleteConfig.class,
                UpdateConfig.class,
                ClearCache.class,
                GetAllDeployment.class,
                GetDeployment.class,
                CreateDeployment.class,
                DeleteDeployment.class,
                UpdateDeployment.class,
                CreateRootRegionOverride.class,
                DeleteRootRegionOverride.class,
                UpdateRootRegionOverride.class,
                CreateDeploymentOverride.class,
                DeleteDeploymentOverride.class,
                UpdateDeploymentOverride.class,
                CreateOverrideRegionOverride.class,
                DeleteOverrideRegionOverride.class,
                UpdateOverrideRegionOverride.class,
                GetAllPodConfig.class,
                GetPodConfig.class,
                CreatePodConfig.class,
                DeletePodConfig.class,
                UpdatePodConfig.class,
                AddPort.class,
                DeletePort.class,
                UpdatePort.class,
                ListImages.class,
                DeleteImage.class,
                ExportImages.class,
                GetImageLimit.class,
                DeleteImagePatch.class,
                GetImageDetail.class,
                GetImagePatches.class,
                GetImagePatchDetail.class,
                ListServer.class,
                CountServer.class,
                CountServerDetailed.class,
                ListLocalServer.class,
                DeleteLocalServer.class,
                GetServer.class,
                DeleteServer.class,
                GetServerLogs.class,
                ListSession.class,
                CountSession.class,
                DeleteSession.class,
                ExportConfigV1.class,
                ImportConfigV1.class,
                ImageDetailClient.class,
                DeregisterLocalServer.class,
                RegisterLocalServer.class,
                RegisterServer.class,
                ShutdownServer.class,
                GetServerSession.class,
                CreateSession.class,
                ClaimServer.class,
                GetSession.class,
                GetDefaultProvider.class,
                ListProviders.class,
                ListProvidersByRegion.class,
                PublicGetMessages.class,
        }
)
public class Dsmc implements Runnable {

    @Override
    public void run() {

    }
}