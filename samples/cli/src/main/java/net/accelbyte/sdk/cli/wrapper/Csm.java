/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.csm.app.*;
import net.accelbyte.sdk.cli.api.csm.app_v2.*;
import net.accelbyte.sdk.cli.api.csm.configuration.*;
import net.accelbyte.sdk.cli.api.csm.configuration_v2.*;
import net.accelbyte.sdk.cli.api.csm.deployment.*;
import net.accelbyte.sdk.cli.api.csm.deployment_v2.*;
import net.accelbyte.sdk.cli.api.csm.image.*;
import net.accelbyte.sdk.cli.api.csm.image_v2.*;
import net.accelbyte.sdk.cli.api.csm.messages.*;
import net.accelbyte.sdk.cli.api.csm.notification_subscription.*;
import net.accelbyte.sdk.cli.api.csm.resources_limits.*;
import picocli.CommandLine.Command;

@Command(
    name = "csm",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetAppListV1.class,
      GetAppV1.class,
      CreateAppV1.class,
      DeleteAppV1.class,
      UpdateAppV1.class,
      CreateDeploymentV1.class,
      GetAppImageListV1.class,
      DeleteAppImagesV1.class,
      GetAppReleaseV1.class,
      GetListOfSecretsV1.class,
      SaveSecretV1.class,
      UpdateSecretV1.class,
      DeleteSecretV1.class,
      StartAppV1.class,
      StopAppV1.class,
      GetListOfVariablesV1.class,
      SaveVariableV1.class,
      UpdateVariableV1.class,
      DeleteVariableV1.class,
      GetListOfDeploymentV1.class,
      GetDeploymentV1.class,
      DeleteDeploymentV1.class,
      PublicGetMessages.class,
      GetAppListV2.class,
      GetAppV2.class,
      CreateAppV2.class,
      DeleteAppV2.class,
      UpdateAppV2.class,
      CreateDeploymentV2.class,
      GetAppImageListV2.class,
      DeleteAppImagesV2.class,
      UpdateAppResourcesV2.class,
      UpdateAppResourcesResourceLimitFormV2.class,
      GetListOfSecretsV2.class,
      SaveSecretV2.class,
      UpdateSecretV2.class,
      DeleteSecretV2.class,
      StartAppV2.class,
      StopAppV2.class,
      GetNotificationSubscriberListV2.class,
      BulkSaveSubscriptionAppNotificationV2.class,
      SubscribeAppNotificationV2.class,
      GetSubscriptionV2Handler.class,
      SubscribeV2Handler.class,
      UnsubscribeV2Handler.class,
      DeleteSubscriptionAppNotificationByUserIDV2.class,
      DeleteSubscriptionAppNotificationV2.class,
      GetListOfVariablesV2.class,
      SaveVariableV2.class,
      UpdateVariableV2.class,
      DeleteVariableV2.class,
      GetListOfDeploymentV2.class,
      GetDeploymentV2.class,
      DeleteDeploymentV2.class,
      GetResourcesLimits.class,
    })
public class Csm implements Runnable {

  @Override
  public void run() {}
}
