# Csm Service Index

&nbsp;  

## Operations

### App Wrapper:  [App](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/App.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps` | POST | GetAppListV1 | [GetAppListV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/GetAppListV1.java) | [GetAppListV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/GetAppListV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}` | GET | GetAppV1 | [GetAppV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/GetAppV1.java) | [GetAppV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/GetAppV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}` | PUT | CreateAppV1 | [CreateAppV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/CreateAppV1.java) | [CreateAppV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/CreateAppV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}` | DELETE | DeleteAppV1 | [DeleteAppV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/DeleteAppV1.java) | [DeleteAppV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/DeleteAppV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}` | PATCH | UpdateAppV1 | [UpdateAppV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/UpdateAppV1.java) | [UpdateAppV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/UpdateAppV1.java) |
| `/csm/v1/admin/namespaces/{namespace}/apps/{app}/release` | GET | GetAppReleaseV1 | [GetAppReleaseV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/GetAppReleaseV1.java) | [GetAppReleaseV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/GetAppReleaseV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/start` | PUT | StartAppV1 | [StartAppV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/StartAppV1.java) | [StartAppV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/StartAppV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/stop` | PUT | StopAppV1 | [StopAppV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app/StopAppV1.java) | [StopAppV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app/StopAppV1.java) |

### Deployment Wrapper:  [Deployment](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/Deployment.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/deployments` | POST | CreateDeploymentV1 | [CreateDeploymentV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment/CreateDeploymentV1.java) | [CreateDeploymentV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment/CreateDeploymentV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/deployments` | POST | GetListOfDeploymentV1 | [GetListOfDeploymentV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment/GetListOfDeploymentV1.java) | [GetListOfDeploymentV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment/GetListOfDeploymentV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/deployments/{deploymentId}` | GET | GetDeploymentV1 | [GetDeploymentV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment/GetDeploymentV1.java) | [GetDeploymentV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment/GetDeploymentV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/deployments/{deploymentId}` | DELETE | DeleteDeploymentV1 | [DeleteDeploymentV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment/DeleteDeploymentV1.java) | [DeleteDeploymentV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment/DeleteDeploymentV1.java) |

### Image Wrapper:  [Image](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/Image.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/images` | GET | GetAppImageListV1 | [GetAppImageListV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/image/GetAppImageListV1.java) | [GetAppImageListV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/image/GetAppImageListV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/images` | DELETE | DeleteAppImagesV1 | [DeleteAppImagesV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/image/DeleteAppImagesV1.java) | [DeleteAppImagesV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/image/DeleteAppImagesV1.java) |

### Configuration Wrapper:  [Configuration](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/Configuration.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/secrets` | GET | GetListOfSecretsV1 | [GetListOfSecretsV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/GetListOfSecretsV1.java) | [GetListOfSecretsV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/GetListOfSecretsV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/secrets` | POST | SaveSecretV1 | [SaveSecretV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/SaveSecretV1.java) | [SaveSecretV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/SaveSecretV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/secrets/{configId}` | PUT | UpdateSecretV1 | [UpdateSecretV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/UpdateSecretV1.java) | [UpdateSecretV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/UpdateSecretV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/secrets/{configId}` | DELETE | DeleteSecretV1 | [DeleteSecretV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/DeleteSecretV1.java) | [DeleteSecretV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/DeleteSecretV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/variables` | GET | GetListOfVariablesV1 | [GetListOfVariablesV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/GetListOfVariablesV1.java) | [GetListOfVariablesV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/GetListOfVariablesV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/variables` | POST | SaveVariableV1 | [SaveVariableV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/SaveVariableV1.java) | [SaveVariableV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/SaveVariableV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/variables/{configId}` | PUT | UpdateVariableV1 | [UpdateVariableV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/UpdateVariableV1.java) | [UpdateVariableV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/UpdateVariableV1.java) |
| [DEPRECATED] `/csm/v1/admin/namespaces/{namespace}/apps/{app}/variables/{configId}` | DELETE | DeleteVariableV1 | [DeleteVariableV1](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration/DeleteVariableV1.java) | [DeleteVariableV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration/DeleteVariableV1.java) |

### Messages Wrapper:  [Messages](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/Messages.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../src/main/java/net/accelbyte/sdk/api/csm/operations/messages/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/messages/PublicGetMessages.java) |

### App V2 Wrapper:  [AppV2](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/AppV2.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v2/admin/namespaces/{namespace}/apps` | POST | GetAppListV2 | [GetAppListV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/GetAppListV2.java) | [GetAppListV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/GetAppListV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}` | GET | GetAppV2 | [GetAppV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/GetAppV2.java) | [GetAppV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/GetAppV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}` | POST | CreateAppV2 | [CreateAppV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/CreateAppV2.java) | [CreateAppV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/CreateAppV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}` | DELETE | DeleteAppV2 | [DeleteAppV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/DeleteAppV2.java) | [DeleteAppV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/DeleteAppV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}` | PATCH | UpdateAppV2 | [UpdateAppV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/UpdateAppV2.java) | [UpdateAppV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/UpdateAppV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/resources` | PATCH | UpdateAppResourcesV2 | [UpdateAppResourcesV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/UpdateAppResourcesV2.java) | [UpdateAppResourcesV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/UpdateAppResourcesV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/resources/form` | POST | UpdateAppResourcesResourceLimitFormV2 | [UpdateAppResourcesResourceLimitFormV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/UpdateAppResourcesResourceLimitFormV2.java) | [UpdateAppResourcesResourceLimitFormV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/UpdateAppResourcesResourceLimitFormV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/start` | PUT | StartAppV2 | [StartAppV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/StartAppV2.java) | [StartAppV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/StartAppV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/stop` | PUT | StopAppV2 | [StopAppV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/app_v2/StopAppV2.java) | [StopAppV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/app_v2/StopAppV2.java) |

### Deployment V2 Wrapper:  [DeploymentV2](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/DeploymentV2.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/deployments` | POST | CreateDeploymentV2 | [CreateDeploymentV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment_v2/CreateDeploymentV2.java) | [CreateDeploymentV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment_v2/CreateDeploymentV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/deployments` | POST | GetListOfDeploymentV2 | [GetListOfDeploymentV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment_v2/GetListOfDeploymentV2.java) | [GetListOfDeploymentV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment_v2/GetListOfDeploymentV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/deployments/{deploymentId}` | GET | GetDeploymentV2 | [GetDeploymentV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment_v2/GetDeploymentV2.java) | [GetDeploymentV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment_v2/GetDeploymentV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/deployments/{deploymentId}` | DELETE | DeleteDeploymentV2 | [DeleteDeploymentV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/deployment_v2/DeleteDeploymentV2.java) | [DeleteDeploymentV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/deployment_v2/DeleteDeploymentV2.java) |

### Image V2 Wrapper:  [ImageV2](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/ImageV2.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/images` | GET | GetAppImageListV2 | [GetAppImageListV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/image_v2/GetAppImageListV2.java) | [GetAppImageListV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/image_v2/GetAppImageListV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/images` | DELETE | DeleteAppImagesV2 | [DeleteAppImagesV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/image_v2/DeleteAppImagesV2.java) | [DeleteAppImagesV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/image_v2/DeleteAppImagesV2.java) |

### Managed Resources Wrapper:  [ManagedResources](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/ManagedResources.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/nosql/crendentials` | POST | CreateNoSQLDatabaseCredentialV2 | [CreateNoSQLDatabaseCredentialV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/CreateNoSQLDatabaseCredentialV2.java) | [CreateNoSQLDatabaseCredentialV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/CreateNoSQLDatabaseCredentialV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/nosql/databases` | GET | GetNoSQLDatabaseV2 | [GetNoSQLDatabaseV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/GetNoSQLDatabaseV2.java) | [GetNoSQLDatabaseV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/GetNoSQLDatabaseV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/nosql/databases` | POST | CreateNoSQLDatabaseV2 | [CreateNoSQLDatabaseV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/CreateNoSQLDatabaseV2.java) | [CreateNoSQLDatabaseV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/CreateNoSQLDatabaseV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/nosql/databases` | DELETE | DeleteNoSQLDatabaseV2 | [DeleteNoSQLDatabaseV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/DeleteNoSQLDatabaseV2.java) | [DeleteNoSQLDatabaseV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/DeleteNoSQLDatabaseV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/nosql/clusters` | GET | GetNoSQLClusterV2 | [GetNoSQLClusterV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/GetNoSQLClusterV2.java) | [GetNoSQLClusterV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/GetNoSQLClusterV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/nosql/clusters` | PUT | UpdateNoSQLClusterV2 | [UpdateNoSQLClusterV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/UpdateNoSQLClusterV2.java) | [UpdateNoSQLClusterV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/UpdateNoSQLClusterV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/nosql/clusters` | POST | CreateNoSQLClusterV2 | [CreateNoSQLClusterV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/CreateNoSQLClusterV2.java) | [CreateNoSQLClusterV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/CreateNoSQLClusterV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/nosql/clusters` | DELETE | DeleteNoSQLClusterV2 | [DeleteNoSQLClusterV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/DeleteNoSQLClusterV2.java) | [DeleteNoSQLClusterV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/DeleteNoSQLClusterV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/nosql/tunnels` | GET | GetNoSQLAccessTunnelV2 | [GetNoSQLAccessTunnelV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/managed_resources/GetNoSQLAccessTunnelV2.java) | [GetNoSQLAccessTunnelV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/managed_resources/GetNoSQLAccessTunnelV2.java) |

### Configuration V2 Wrapper:  [ConfigurationV2](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/ConfigurationV2.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/secrets` | GET | GetListOfSecretsV2 | [GetListOfSecretsV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/GetListOfSecretsV2.java) | [GetListOfSecretsV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/GetListOfSecretsV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/secrets` | POST | SaveSecretV2 | [SaveSecretV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/SaveSecretV2.java) | [SaveSecretV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/SaveSecretV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/secrets/{configId}` | PUT | UpdateSecretV2 | [UpdateSecretV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/UpdateSecretV2.java) | [UpdateSecretV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/UpdateSecretV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/secrets/{configId}` | DELETE | DeleteSecretV2 | [DeleteSecretV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/DeleteSecretV2.java) | [DeleteSecretV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/DeleteSecretV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/variables` | GET | GetListOfVariablesV2 | [GetListOfVariablesV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/GetListOfVariablesV2.java) | [GetListOfVariablesV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/GetListOfVariablesV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/variables` | POST | SaveVariableV2 | [SaveVariableV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/SaveVariableV2.java) | [SaveVariableV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/SaveVariableV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/variables/{configId}` | PUT | UpdateVariableV2 | [UpdateVariableV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/UpdateVariableV2.java) | [UpdateVariableV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/UpdateVariableV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/variables/{configId}` | DELETE | DeleteVariableV2 | [DeleteVariableV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/configuration_v2/DeleteVariableV2.java) | [DeleteVariableV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/configuration_v2/DeleteVariableV2.java) |

### Notification Subscription Wrapper:  [NotificationSubscription](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/NotificationSubscription.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions` | GET | GetNotificationSubscriberListV2 | [GetNotificationSubscriberListV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/GetNotificationSubscriberListV2.java) | [GetNotificationSubscriberListV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/GetNotificationSubscriberListV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions` | PUT | BulkSaveSubscriptionAppNotificationV2 | [BulkSaveSubscriptionAppNotificationV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/BulkSaveSubscriptionAppNotificationV2.java) | [BulkSaveSubscriptionAppNotificationV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/BulkSaveSubscriptionAppNotificationV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions` | POST | SubscribeAppNotificationV2 | [SubscribeAppNotificationV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/SubscribeAppNotificationV2.java) | [SubscribeAppNotificationV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/SubscribeAppNotificationV2.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions/me` | GET | GetSubscriptionV2Handler | [GetSubscriptionV2Handler](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/GetSubscriptionV2Handler.java) | [GetSubscriptionV2Handler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/GetSubscriptionV2Handler.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions/me` | POST | SubscribeV2Handler | [SubscribeV2Handler](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/SubscribeV2Handler.java) | [SubscribeV2Handler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/SubscribeV2Handler.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions/me` | DELETE | UnsubscribeV2Handler | [UnsubscribeV2Handler](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/UnsubscribeV2Handler.java) | [UnsubscribeV2Handler](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/UnsubscribeV2Handler.java) |
| `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions/users/{userId}` | DELETE | DeleteSubscriptionAppNotificationByUserIDV2 | [DeleteSubscriptionAppNotificationByUserIDV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/DeleteSubscriptionAppNotificationByUserIDV2.java) | [DeleteSubscriptionAppNotificationByUserIDV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/DeleteSubscriptionAppNotificationByUserIDV2.java) |
| [DEPRECATED] `/csm/v2/admin/namespaces/{namespace}/apps/{app}/subscriptions/{subscriptionId}` | DELETE | DeleteSubscriptionAppNotificationV2 | [DeleteSubscriptionAppNotificationV2](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription/DeleteSubscriptionAppNotificationV2.java) | [DeleteSubscriptionAppNotificationV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription/DeleteSubscriptionAppNotificationV2.java) |

### Resources Limits Wrapper:  [ResourcesLimits](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/ResourcesLimits.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v2/admin/namespaces/{namespace}/resources/limits` | GET | GetResourcesLimits | [GetResourcesLimits](../../src/main/java/net/accelbyte/sdk/api/csm/operations/resources_limits/GetResourcesLimits.java) | [GetResourcesLimits](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/resources_limits/GetResourcesLimits.java) |

### Notification Subscription V3 Wrapper:  [NotificationSubscriptionV3](../../src/main/java/net/accelbyte/sdk/api/csm/wrappers/NotificationSubscriptionV3.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/csm/v3/admin/namespaces/{namespace}/apps/{app}/subscriptions` | GET | GetNotificationSubscriberListV3 | [GetNotificationSubscriberListV3](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription_v3/GetNotificationSubscriberListV3.java) | [GetNotificationSubscriberListV3](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription_v3/GetNotificationSubscriberListV3.java) |
| `/csm/v3/admin/namespaces/{namespace}/apps/{app}/subscriptions` | DELETE | DeleteSubscriptionAppNotificationV3 | [DeleteSubscriptionAppNotificationV3](../../src/main/java/net/accelbyte/sdk/api/csm/operations/notification_subscription_v3/DeleteSubscriptionAppNotificationV3.java) | [DeleteSubscriptionAppNotificationV3](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/csm/notification_subscription_v3/DeleteSubscriptionAppNotificationV3.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `apimodel.AppItem` | [ApimodelAppItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelAppItem.java) |
| `apimodel.AutoscalingRequest` | [ApimodelAutoscalingRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelAutoscalingRequest.java) |
| `apimodel.AutoscalingResponse` | [ApimodelAutoscalingResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelAutoscalingResponse.java) |
| `apimodel.BulkSubscribeItem` | [ApimodelBulkSubscribeItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelBulkSubscribeItem.java) |
| `apimodel.BulkSubscribeRequest` | [ApimodelBulkSubscribeRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelBulkSubscribeRequest.java) |
| `apimodel.CPURequest` | [ApimodelCPURequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCPURequest.java) |
| `apimodel.CPUResponse` | [ApimodelCPUResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCPUResponse.java) |
| `apimodel.CSMAppLimitsResponse` | [ApimodelCSMAppLimitsResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCSMAppLimitsResponse.java) |
| `apimodel.CreateAppV2Request` | [ApimodelCreateAppV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCreateAppV2Request.java) |
| `apimodel.CreateDeploymentV2Request` | [ApimodelCreateDeploymentV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCreateDeploymentV2Request.java) |
| `apimodel.CreateDeploymentV2Response` | [ApimodelCreateDeploymentV2Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCreateDeploymentV2Response.java) |
| `apimodel.CreateNoSQLAppDatabaseRequest` | [ApimodelCreateNoSQLAppDatabaseRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCreateNoSQLAppDatabaseRequest.java) |
| `apimodel.CreateNoSQLDatabaseCredentialRequest` | [ApimodelCreateNoSQLDatabaseCredentialRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelCreateNoSQLDatabaseCredentialRequest.java) |
| `apimodel.DeleteNoSQLResourceResponse` | [ApimodelDeleteNoSQLResourceResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelDeleteNoSQLResourceResponse.java) |
| `apimodel.GetAppImageListV2DataItem` | [ApimodelGetAppImageListV2DataItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetAppImageListV2DataItem.java) |
| `apimodel.GetAppImageListV2DataItemImageScanResult` | [ApimodelGetAppImageListV2DataItemImageScanResult](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetAppImageListV2DataItemImageScanResult.java) |
| `apimodel.GetAppImageListV2DataItemImageScanStatus` | [ApimodelGetAppImageListV2DataItemImageScanStatus](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetAppImageListV2DataItemImageScanStatus.java) |
| `apimodel.GetAppImageListV2Response` | [ApimodelGetAppImageListV2Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetAppImageListV2Response.java) |
| `apimodel.GetAppListV2Request` | [ApimodelGetAppListV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetAppListV2Request.java) |
| `apimodel.GetAppListV2Response` | [ApimodelGetAppListV2Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetAppListV2Response.java) |
| `apimodel.GetDeploymentListV2DataItem` | [ApimodelGetDeploymentListV2DataItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetDeploymentListV2DataItem.java) |
| `apimodel.GetDeploymentListV2Request` | [ApimodelGetDeploymentListV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetDeploymentListV2Request.java) |
| `apimodel.GetDeploymentListV2Response` | [ApimodelGetDeploymentListV2Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetDeploymentListV2Response.java) |
| `apimodel.GetListOfConfigurationsV2DataItem` | [ApimodelGetListOfConfigurationsV2DataItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetListOfConfigurationsV2DataItem.java) |
| `apimodel.GetListOfConfigurationsV2Response` | [ApimodelGetListOfConfigurationsV2Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetListOfConfigurationsV2Response.java) |
| `apimodel.GetNotificationSubscriberItem` | [ApimodelGetNotificationSubscriberItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetNotificationSubscriberItem.java) |
| `apimodel.GetNotificationSubscriberItemV2` | [ApimodelGetNotificationSubscriberItemV2](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetNotificationSubscriberItemV2.java) |
| `apimodel.GetNotificationSubscriberListResponse` | [ApimodelGetNotificationSubscriberListResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetNotificationSubscriberListResponse.java) |
| `apimodel.GetNotificationSubscriberListResponseV2` | [ApimodelGetNotificationSubscriberListResponseV2](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetNotificationSubscriberListResponseV2.java) |
| `apimodel.GetNotificationSubscriberStatusResponse` | [ApimodelGetNotificationSubscriberStatusResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelGetNotificationSubscriberStatusResponse.java) |
| `apimodel.IncreaseLimitFormRequest` | [ApimodelIncreaseLimitFormRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelIncreaseLimitFormRequest.java) |
| `apimodel.MemoryRequest` | [ApimodelMemoryRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelMemoryRequest.java) |
| `apimodel.MemoryResponse` | [ApimodelMemoryResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelMemoryResponse.java) |
| `apimodel.NoSQLDatabaseCredentialResponse` | [ApimodelNoSQLDatabaseCredentialResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelNoSQLDatabaseCredentialResponse.java) |
| `apimodel.NoSQLDatabaseDeleteResponse` | [ApimodelNoSQLDatabaseDeleteResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelNoSQLDatabaseDeleteResponse.java) |
| `apimodel.NoSQLDatabaseResponse` | [ApimodelNoSQLDatabaseResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelNoSQLDatabaseResponse.java) |
| `apimodel.NoSQLResourceResponse` | [ApimodelNoSQLResourceResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelNoSQLResourceResponse.java) |
| `apimodel.NotificationType` | [ApimodelNotificationType](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelNotificationType.java) |
| `apimodel.ReplicaRequest` | [ApimodelReplicaRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelReplicaRequest.java) |
| `apimodel.ReplicaResponse` | [ApimodelReplicaResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelReplicaResponse.java) |
| `apimodel.SaveConfigurationV2Request` | [ApimodelSaveConfigurationV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSaveConfigurationV2Request.java) |
| `apimodel.SaveConfigurationV2Response` | [ApimodelSaveConfigurationV2Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSaveConfigurationV2Response.java) |
| `apimodel.SaveSecretConfigurationV2Request` | [ApimodelSaveSecretConfigurationV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSaveSecretConfigurationV2Request.java) |
| `apimodel.SelfSubscribeNotificationRequest` | [ApimodelSelfSubscribeNotificationRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSelfSubscribeNotificationRequest.java) |
| `apimodel.SubscribeNotificationRequest` | [ApimodelSubscribeNotificationRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSubscribeNotificationRequest.java) |
| `apimodel.SubscribeNotificationResponse` | [ApimodelSubscribeNotificationResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSubscribeNotificationResponse.java) |
| `apimodel.SubscriberItemRequest` | [ApimodelSubscriberItemRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSubscriberItemRequest.java) |
| `apimodel.SubscriberItemResponse` | [ApimodelSubscriberItemResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelSubscriberItemResponse.java) |
| `apimodel.TunnelInfoResponse` | [ApimodelTunnelInfoResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelTunnelInfoResponse.java) |
| `apimodel.UpdateAppResourceRequest` | [ApimodelUpdateAppResourceRequest](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelUpdateAppResourceRequest.java) |
| `apimodel.UpdateAppV2Request` | [ApimodelUpdateAppV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelUpdateAppV2Request.java) |
| `apimodel.UpdateConfigurationV2Request` | [ApimodelUpdateConfigurationV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelUpdateConfigurationV2Request.java) |
| `apimodel.UpdateConfigurationV2Response` | [ApimodelUpdateConfigurationV2Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelUpdateConfigurationV2Response.java) |
| `apimodel.UpdateSecretConfigurationV2Request` | [ApimodelUpdateSecretConfigurationV2Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/ApimodelUpdateSecretConfigurationV2Request.java) |
| `generated.CreateAppV1Request` | [GeneratedCreateAppV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedCreateAppV1Request.java) |
| `generated.CreateAppV1Response` | [GeneratedCreateAppV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedCreateAppV1Response.java) |
| `generated.CreateDeploymentV1Request` | [GeneratedCreateDeploymentV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedCreateDeploymentV1Request.java) |
| `generated.CreateDeploymentV1Response` | [GeneratedCreateDeploymentV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedCreateDeploymentV1Response.java) |
| `generated.DeleteAppImagesV1Request` | [GeneratedDeleteAppImagesV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedDeleteAppImagesV1Request.java) |
| `generated.GetAppImageListV1DataItem` | [GeneratedGetAppImageListV1DataItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppImageListV1DataItem.java) |
| `generated.GetAppImageListV1DataItemImageScanStatus` | [GeneratedGetAppImageListV1DataItemImageScanStatus](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppImageListV1DataItemImageScanStatus.java) |
| `generated.GetAppImageListV1Response` | [GeneratedGetAppImageListV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppImageListV1Response.java) |
| `generated.GetAppListV1DataItem` | [GeneratedGetAppListV1DataItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppListV1DataItem.java) |
| `generated.GetAppListV1Request` | [GeneratedGetAppListV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppListV1Request.java) |
| `generated.GetAppListV1Response` | [GeneratedGetAppListV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppListV1Response.java) |
| `generated.GetAppReleaseV1Response` | [GeneratedGetAppReleaseV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppReleaseV1Response.java) |
| `generated.GetAppV1Response` | [GeneratedGetAppV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetAppV1Response.java) |
| `generated.GetDeploymentListV1DataItem` | [GeneratedGetDeploymentListV1DataItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetDeploymentListV1DataItem.java) |
| `generated.GetDeploymentListV1Request` | [GeneratedGetDeploymentListV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetDeploymentListV1Request.java) |
| `generated.GetDeploymentListV1Response` | [GeneratedGetDeploymentListV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetDeploymentListV1Response.java) |
| `generated.GetDeploymentV1Response` | [GeneratedGetDeploymentV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetDeploymentV1Response.java) |
| `generated.GetListOfConfigurationsV1DataItem` | [GeneratedGetListOfConfigurationsV1DataItem](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetListOfConfigurationsV1DataItem.java) |
| `generated.GetListOfConfigurationsV1Response` | [GeneratedGetListOfConfigurationsV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedGetListOfConfigurationsV1Response.java) |
| `generated.Pagination` | [GeneratedPagination](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedPagination.java) |
| `generated.SaveConfigurationV1Request` | [GeneratedSaveConfigurationV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedSaveConfigurationV1Request.java) |
| `generated.SaveConfigurationV1Response` | [GeneratedSaveConfigurationV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedSaveConfigurationV1Response.java) |
| `generated.StartAppV1Request` | [GeneratedStartAppV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedStartAppV1Request.java) |
| `generated.StartAppV1Response` | [GeneratedStartAppV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedStartAppV1Response.java) |
| `generated.StopAppV1Request` | [GeneratedStopAppV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedStopAppV1Request.java) |
| `generated.StopAppV1Response` | [GeneratedStopAppV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedStopAppV1Response.java) |
| `generated.UpdateAppV1Request` | [GeneratedUpdateAppV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedUpdateAppV1Request.java) |
| `generated.UpdateAppV1Response` | [GeneratedUpdateAppV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedUpdateAppV1Response.java) |
| `generated.UpdateConfigurationV1Request` | [GeneratedUpdateConfigurationV1Request](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedUpdateConfigurationV1Request.java) |
| `generated.UpdateConfigurationV1Response` | [GeneratedUpdateConfigurationV1Response](../../src/main/java/net/accelbyte/sdk/api/csm/models/GeneratedUpdateConfigurationV1Response.java) |
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../src/main/java/net/accelbyte/sdk/api/csm/models/LogAppMessageDeclaration.java) |
| `model.CSMAutoscalingDefaults` | [ModelCSMAutoscalingDefaults](../../src/main/java/net/accelbyte/sdk/api/csm/models/ModelCSMAutoscalingDefaults.java) |
| `model.ImageScanFinding` | [ModelImageScanFinding](../../src/main/java/net/accelbyte/sdk/api/csm/models/ModelImageScanFinding.java) |
| `nosqlresource.NoSQLResourceConfiguration` | [NosqlresourceNoSQLResourceConfiguration](../../src/main/java/net/accelbyte/sdk/api/csm/models/NosqlresourceNoSQLResourceConfiguration.java) |
| `resourceaccesstunnel.TunnelInfo` | [ResourceaccesstunnelTunnelInfo](../../src/main/java/net/accelbyte/sdk/api/csm/models/ResourceaccesstunnelTunnelInfo.java) |
| `response.ErrorResponse` | [ResponseErrorResponse](../../src/main/java/net/accelbyte/sdk/api/csm/models/ResponseErrorResponse.java) |
