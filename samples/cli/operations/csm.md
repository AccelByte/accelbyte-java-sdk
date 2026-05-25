## Java Extend SDK CLI Sample App Operation Index for Csm service

### Operation ListAppUI

```sh
$ build/install/cli/bin/cli csm listAppUI \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --name <name value - optional> \
    --offset <offset value - optional>
```

### Operation CreateAppUI

```sh
$ build/install/cli/bin/cli csm createAppUI \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteAppUI

```sh
$ build/install/cli/bin/cli csm deleteAppUI \
    --appUiName <appUiName value> \
    --namespace <namespace value>
```

### Operation UploadAppUIFile

```sh
$ build/install/cli/bin/cli csm uploadAppUIFile \
    --appUiName <appUiName value> \
    --namespace <namespace value> \
    --version <version value - optional> \
    --file <file value>
```

### Operation GetAppReleaseV1

```sh
$ build/install/cli/bin/cli csm getAppReleaseV1 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation GetExtendFile

```sh
$ build/install/cli/bin/cli csm getExtendFile \
    --filePath <filePath value> \
    --namespace <namespace value>
```

### Operation PublicGetMessages

```sh
$ build/install/cli/bin/cli csm publicGetMessages
```

### Operation GetAppListV2

```sh
$ build/install/cli/bin/cli csm getAppListV2 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --body <json string for request body>
```

### Operation GetAppV2

```sh
$ build/install/cli/bin/cli csm getAppV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation CreateAppV2

```sh
$ build/install/cli/bin/cli csm createAppV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteAppV2

```sh
$ build/install/cli/bin/cli csm deleteAppV2 \
    --app <app value> \
    --namespace <namespace value> \
    --forced <forced value - optional>
```

### Operation UpdateAppV2

```sh
$ build/install/cli/bin/cli csm updateAppV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ApplyAppConfigV2

```sh
$ build/install/cli/bin/cli csm applyAppConfigV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateSubscriptionHandler

```sh
$ build/install/cli/bin/cli csm createSubscriptionHandler \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UnsubscribeTopicHandler

```sh
$ build/install/cli/bin/cli csm unsubscribeTopicHandler \
    --app <app value> \
    --namespace <namespace value> \
    --topicName <topicName value>
```

### Operation CreateDeploymentV2

```sh
$ build/install/cli/bin/cli csm createDeploymentV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetAppImageListV2

```sh
$ build/install/cli/bin/cli csm getAppImageListV2 \
    --app <app value> \
    --namespace <namespace value> \
    --cached <cached value - optional>
```

### Operation DeleteAppImagesV2

```sh
$ build/install/cli/bin/cli csm deleteAppImagesV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateKeyValueCredentialV2

```sh
$ build/install/cli/bin/cli csm createKeyValueCredentialV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetIntegrationAppKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm getIntegrationAppKeyValueClusterV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation IntegrateAppKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm integrateAppKeyValueClusterV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RemoveIntegrationAppKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm removeIntegrationAppKeyValueClusterV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation CreateNewNoSQLDatabaseCredentialV2

```sh
$ build/install/cli/bin/cli csm createNewNoSQLDatabaseCredentialV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetNoSQLDatabaseV2

```sh
$ build/install/cli/bin/cli csm getNoSQLDatabaseV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation CreateNoSQLDatabaseV2

```sh
$ build/install/cli/bin/cli csm createNoSQLDatabaseV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteNoSQLDatabaseV2

```sh
$ build/install/cli/bin/cli csm deleteNoSQLDatabaseV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation UpdateAppResourcesV2

```sh
$ build/install/cli/bin/cli csm updateAppResourcesV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateAppResourcesResourceLimitFormV2

```sh
$ build/install/cli/bin/cli csm updateAppResourcesResourceLimitFormV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetListOfSecretsV2

```sh
$ build/install/cli/bin/cli csm getListOfSecretsV2 \
    --app <app value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation SaveSecretV2

```sh
$ build/install/cli/bin/cli csm saveSecretV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateSecretV2

```sh
$ build/install/cli/bin/cli csm updateSecretV2 \
    --app <app value> \
    --configId <configId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteSecretV2

```sh
$ build/install/cli/bin/cli csm deleteSecretV2 \
    --app <app value> \
    --configId <configId value> \
    --namespace <namespace value>
```

### Operation CreateSQLDatabaseCredentialV2

```sh
$ build/install/cli/bin/cli csm createSQLDatabaseCredentialV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetSQLDatabaseV2

```sh
$ build/install/cli/bin/cli csm getSQLDatabaseV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation CreateSQLDatabaseV2

```sh
$ build/install/cli/bin/cli csm createSQLDatabaseV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteSQLDatabaseV2

```sh
$ build/install/cli/bin/cli csm deleteSQLDatabaseV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation StartAppV2

```sh
$ build/install/cli/bin/cli csm startAppV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation StopAppV2

```sh
$ build/install/cli/bin/cli csm stopAppV2 \
    --app <app value> \
    --namespace <namespace value>
```

### Operation GetNotificationSubscriberListV2

```sh
$ build/install/cli/bin/cli csm getNotificationSubscriberListV2 \
    --app <app value> \
    --namespace <namespace value> \
    --notificationType <notificationType value>
```

### Operation BulkSaveSubscriptionAppNotificationV2

```sh
$ build/install/cli/bin/cli csm bulkSaveSubscriptionAppNotificationV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SubscribeAppNotificationV2

```sh
$ build/install/cli/bin/cli csm subscribeAppNotificationV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetSubscriptionV2Handler

```sh
$ build/install/cli/bin/cli csm getSubscriptionV2Handler \
    --app <app value> \
    --namespace <namespace value>
```

### Operation SubscribeV2Handler

```sh
$ build/install/cli/bin/cli csm subscribeV2Handler \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UnsubscribeV2Handler

```sh
$ build/install/cli/bin/cli csm unsubscribeV2Handler \
    --app <app value> \
    --namespace <namespace value>
```

### Operation DeleteSubscriptionAppNotificationByUserIDV2

```sh
$ build/install/cli/bin/cli csm deleteSubscriptionAppNotificationByUserIDV2 \
    --app <app value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetListOfVariablesV2

```sh
$ build/install/cli/bin/cli csm getListOfVariablesV2 \
    --app <app value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation SaveVariableV2

```sh
$ build/install/cli/bin/cli csm saveVariableV2 \
    --app <app value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateVariableV2

```sh
$ build/install/cli/bin/cli csm updateVariableV2 \
    --app <app value> \
    --configId <configId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteVariableV2

```sh
$ build/install/cli/bin/cli csm deleteVariableV2 \
    --app <app value> \
    --configId <configId value> \
    --namespace <namespace value>
```

### Operation ListTopicsHandler

```sh
$ build/install/cli/bin/cli csm listTopicsHandler \
    --namespace <namespace value> \
    --fuzzyTopicName <fuzzyTopicName value - optional> \
    --isSubscribedByAppName <isSubscribedByAppName value - optional> \
    --isUnsubscribedByAppName <isUnsubscribedByAppName value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateTopicHandler

```sh
$ build/install/cli/bin/cli csm createTopicHandler \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteTopicHandler

```sh
$ build/install/cli/bin/cli csm deleteTopicHandler \
    --namespace <namespace value> \
    --topicName <topicName value>
```

### Operation GetListOfDeploymentV2

```sh
$ build/install/cli/bin/cli csm getListOfDeploymentV2 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --body <json string for request body>
```

### Operation GetDeploymentV2

```sh
$ build/install/cli/bin/cli csm getDeploymentV2 \
    --deploymentId <deploymentId value> \
    --namespace <namespace value>
```

### Operation DeleteDeploymentV2

```sh
$ build/install/cli/bin/cli csm deleteDeploymentV2 \
    --deploymentId <deploymentId value> \
    --namespace <namespace value>
```

### Operation GetKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm getKeyValueClusterV2 \
    --namespace <namespace value> \
    --resourceId <resourceId value>
```

### Operation ListKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm listKeyValueClusterV2 \
    --namespace <namespace value> \
    --refresh <refresh value - optional>
```

### Operation CreateKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm createKeyValueClusterV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetKeyValueClusterLimitConfigV2

```sh
$ build/install/cli/bin/cli csm getKeyValueClusterLimitConfigV2 \
    --namespace <namespace value>
```

### Operation UpdateKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm updateKeyValueClusterV2 \
    --namespace <namespace value> \
    --resourceId <resourceId value> \
    --body <json string for request body>
```

### Operation DeleteKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm deleteKeyValueClusterV2 \
    --namespace <namespace value> \
    --resourceId <resourceId value>
```

### Operation GetListIntegratedAppKeyValueClusterV2

```sh
$ build/install/cli/bin/cli csm getListIntegratedAppKeyValueClusterV2 \
    --namespace <namespace value> \
    --resourceId <resourceId value>
```

### Operation GetNoSQLClusterV2

```sh
$ build/install/cli/bin/cli csm getNoSQLClusterV2 \
    --namespace <namespace value>
```

### Operation UpdateNoSQLClusterV2

```sh
$ build/install/cli/bin/cli csm updateNoSQLClusterV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateNoSQLClusterV2

```sh
$ build/install/cli/bin/cli csm createNoSQLClusterV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteNoSQLClusterV2

```sh
$ build/install/cli/bin/cli csm deleteNoSQLClusterV2 \
    --namespace <namespace value>
```

### Operation StartNoSQLClusterV2

```sh
$ build/install/cli/bin/cli csm startNoSQLClusterV2 \
    --namespace <namespace value>
```

### Operation StopNoSQLClusterV2

```sh
$ build/install/cli/bin/cli csm stopNoSQLClusterV2 \
    --namespace <namespace value>
```

### Operation GetNoSQLAccessTunnelV2

```sh
$ build/install/cli/bin/cli csm getNoSQLAccessTunnelV2 \
    --namespace <namespace value>
```

### Operation GetResourcesLimits

```sh
$ build/install/cli/bin/cli csm getResourcesLimits \
    --namespace <namespace value>
```

### Operation GetSQLClusterV2

```sh
$ build/install/cli/bin/cli csm getSQLClusterV2 \
    --namespace <namespace value>
```

### Operation UpdateSQLClusterV2

```sh
$ build/install/cli/bin/cli csm updateSQLClusterV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateSQLClusterV2

```sh
$ build/install/cli/bin/cli csm createSQLClusterV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteSQLClusterV2

```sh
$ build/install/cli/bin/cli csm deleteSQLClusterV2 \
    --namespace <namespace value>
```

### Operation StartSQLClusterV2

```sh
$ build/install/cli/bin/cli csm startSQLClusterV2 \
    --namespace <namespace value>
```

### Operation StopSQLClusterV2

```sh
$ build/install/cli/bin/cli csm stopSQLClusterV2 \
    --namespace <namespace value>
```

### Operation GetSQLAppListV2

```sh
$ build/install/cli/bin/cli csm getSQLAppListV2 \
    --namespace <namespace value> \
    --resourceId <resourceId value> \
    --appName <appName value - optional> \
    --gameNamespace <gameNamespace value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetNoSQLAppListV2

```sh
$ build/install/cli/bin/cli csm getNoSQLAppListV2 \
    --resourceId <resourceId value> \
    --studioName <studioName value> \
    --appName <appName value - optional> \
    --limit <limit value - optional> \
    --namespace <namespace value - optional> \
    --offset <offset value - optional>
```

### Operation GetNotificationSubscriberListV3

```sh
$ build/install/cli/bin/cli csm getNotificationSubscriberListV3 \
    --app <app value> \
    --namespace <namespace value> \
    --notificationType <notificationType value>
```

### Operation DeleteSubscriptionAppNotificationV3

```sh
$ build/install/cli/bin/cli csm deleteSubscriptionAppNotificationV3 \
    --app <app value> \
    --namespace <namespace value> \
    --emailAddress <emailAddress value - optional> \
    --userId <userId value - optional>
```

