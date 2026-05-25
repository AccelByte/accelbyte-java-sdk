/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.csm.app.*;
import net.accelbyte.sdk.cli.api.csm.app_ui.*;
import net.accelbyte.sdk.cli.api.csm.app_v2.*;
import net.accelbyte.sdk.cli.api.csm.async_messaging.*;
import net.accelbyte.sdk.cli.api.csm.configuration.*;
import net.accelbyte.sdk.cli.api.csm.configuration_v2.*;
import net.accelbyte.sdk.cli.api.csm.deployment.*;
import net.accelbyte.sdk.cli.api.csm.deployment_v2.*;
import net.accelbyte.sdk.cli.api.csm.extend_files.*;
import net.accelbyte.sdk.cli.api.csm.image.*;
import net.accelbyte.sdk.cli.api.csm.image_v2.*;
import net.accelbyte.sdk.cli.api.csm.managed_resources.*;
import net.accelbyte.sdk.cli.api.csm.managed_resources_key_value.*;
import net.accelbyte.sdk.cli.api.csm.managed_resources_sql.*;
import net.accelbyte.sdk.cli.api.csm.messages.*;
import net.accelbyte.sdk.cli.api.csm.notification_subscription.*;
import net.accelbyte.sdk.cli.api.csm.notification_subscription_v3.*;
import net.accelbyte.sdk.cli.api.csm.resources_limits.*;
import picocli.CommandLine.Command;

@Command(
    name = "csm",
    mixinStandardHelpOptions = true,
    subcommands = {
      ListAppUI.class,
      CreateAppUI.class,
      DeleteAppUI.class,
      UploadAppUIFile.class,
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
      GetExtendFile.class,
      PublicGetMessages.class,
      GetAppListV2.class,
      GetAppV2.class,
      CreateAppV2.class,
      DeleteAppV2.class,
      UpdateAppV2.class,
      ApplyAppConfigV2.class,
      CreateSubscriptionHandler.class,
      UnsubscribeTopicHandler.class,
      CreateDeploymentV2.class,
      GetAppImageListV2.class,
      DeleteAppImagesV2.class,
      CreateKeyValueCredentialV2.class,
      GetIntegrationAppKeyValueClusterV2.class,
      IntegrateAppKeyValueClusterV2.class,
      RemoveIntegrationAppKeyValueClusterV2.class,
      CreateNewNoSQLDatabaseCredentialV2.class,
      CreateNoSQLDatabaseCredentialV2.class,
      GetNoSQLDatabaseV2.class,
      CreateNoSQLDatabaseV2.class,
      DeleteNoSQLDatabaseV2.class,
      UpdateAppResourcesV2.class,
      UpdateAppResourcesResourceLimitFormV2.class,
      GetListOfSecretsV2.class,
      SaveSecretV2.class,
      UpdateSecretV2.class,
      DeleteSecretV2.class,
      CreateSQLDatabaseCredentialV2.class,
      GetSQLDatabaseV2.class,
      CreateSQLDatabaseV2.class,
      DeleteSQLDatabaseV2.class,
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
      ListTopicsHandler.class,
      CreateTopicHandler.class,
      DeleteTopicHandler.class,
      GetListOfDeploymentV2.class,
      GetDeploymentV2.class,
      DeleteDeploymentV2.class,
      GetKeyValueClusterV2.class,
      ListKeyValueClusterV2.class,
      CreateKeyValueClusterV2.class,
      GetKeyValueClusterLimitConfigV2.class,
      UpdateKeyValueClusterV2.class,
      DeleteKeyValueClusterV2.class,
      GetListIntegratedAppKeyValueClusterV2.class,
      GetNoSQLClusterV2.class,
      UpdateNoSQLClusterV2.class,
      CreateNoSQLClusterV2.class,
      DeleteNoSQLClusterV2.class,
      StartNoSQLClusterV2.class,
      StopNoSQLClusterV2.class,
      GetNoSQLAccessTunnelV2.class,
      GetResourcesLimits.class,
      GetSQLClusterV2.class,
      UpdateSQLClusterV2.class,
      CreateSQLClusterV2.class,
      DeleteSQLClusterV2.class,
      StartSQLClusterV2.class,
      StopSQLClusterV2.class,
      GetSQLAppListV2.class,
      GetNoSQLAppListV2.class,
      GetNotificationSubscriberListV3.class,
      DeleteSubscriptionAppNotificationV3.class,
    })
public class Csm implements Runnable {

  @Override
  public void run() {}
}
