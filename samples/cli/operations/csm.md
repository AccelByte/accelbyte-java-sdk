## Java Extend SDK CLI Sample App Operation Index for Csm service

### Operation GetAppReleaseV1

```sh
$ build/install/cli/bin/cli csm getAppReleaseV1 \
    --app <app value> \
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

### Operation GetResourcesLimits

```sh
$ build/install/cli/bin/cli csm getResourcesLimits \
    --namespace <namespace value>
```

