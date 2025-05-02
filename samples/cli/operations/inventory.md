## Java Extend SDK CLI Sample App Operation Index for Inventory service

### Operation AdminCreateChainingOperations

```sh
$ build/install/cli/bin/cli inventory adminCreateChainingOperations \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminListIntegrationConfigurations

```sh
$ build/install/cli/bin/cli inventory adminListIntegrationConfigurations \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminCreateIntegrationConfiguration

```sh
$ build/install/cli/bin/cli inventory adminCreateIntegrationConfiguration \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateIntegrationConfiguration

```sh
$ build/install/cli/bin/cli inventory adminUpdateIntegrationConfiguration \
    --integrationConfigurationId <integrationConfigurationId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateStatusIntegrationConfiguration

```sh
$ build/install/cli/bin/cli inventory adminUpdateStatusIntegrationConfiguration \
    --integrationConfigurationId <integrationConfigurationId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminListInventories

```sh
$ build/install/cli/bin/cli inventory adminListInventories \
    --namespace <namespace value> \
    --inventoryConfigurationCode <inventoryConfigurationCode value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --userId <userId value - optional>
```

### Operation AdminCreateInventory

```sh
$ build/install/cli/bin/cli inventory adminCreateInventory \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetInventory

```sh
$ build/install/cli/bin/cli inventory adminGetInventory \
    --inventoryId <inventoryId value> \
    --namespace <namespace value>
```

### Operation AdminUpdateInventory

```sh
$ build/install/cli/bin/cli inventory adminUpdateInventory \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteInventory

```sh
$ build/install/cli/bin/cli inventory deleteInventory \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminListItems

```sh
$ build/install/cli/bin/cli inventory adminListItems \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --sourceItemId <sourceItemId value - optional> \
    --tags <tags value - optional>
```

### Operation AdminGetInventoryItem

```sh
$ build/install/cli/bin/cli inventory adminGetInventoryItem \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --slotId <slotId value> \
    --sourceItemId <sourceItemId value>
```

### Operation AdminListInventoryConfigurations

```sh
$ build/install/cli/bin/cli inventory adminListInventoryConfigurations \
    --namespace <namespace value> \
    --code <code value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminCreateInventoryConfiguration

```sh
$ build/install/cli/bin/cli inventory adminCreateInventoryConfiguration \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetInventoryConfiguration

```sh
$ build/install/cli/bin/cli inventory adminGetInventoryConfiguration \
    --inventoryConfigurationId <inventoryConfigurationId value> \
    --namespace <namespace value>
```

### Operation AdminUpdateInventoryConfiguration

```sh
$ build/install/cli/bin/cli inventory adminUpdateInventoryConfiguration \
    --inventoryConfigurationId <inventoryConfigurationId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteInventoryConfiguration

```sh
$ build/install/cli/bin/cli inventory adminDeleteInventoryConfiguration \
    --inventoryConfigurationId <inventoryConfigurationId value> \
    --namespace <namespace value>
```

### Operation AdminListItemTypes

```sh
$ build/install/cli/bin/cli inventory adminListItemTypes \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminCreateItemType

```sh
$ build/install/cli/bin/cli inventory adminCreateItemType \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteItemType

```sh
$ build/install/cli/bin/cli inventory adminDeleteItemType \
    --itemTypeName <itemTypeName value> \
    --namespace <namespace value>
```

### Operation AdminListTags

```sh
$ build/install/cli/bin/cli inventory adminListTags \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --owner <owner value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation AdminCreateTag

```sh
$ build/install/cli/bin/cli inventory adminCreateTag \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteTag

```sh
$ build/install/cli/bin/cli inventory adminDeleteTag \
    --namespace <namespace value> \
    --tagName <tagName value>
```

### Operation AdminConsumeUserItem

```sh
$ build/install/cli/bin/cli inventory adminConsumeUserItem \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --dateRangeValidation <dateRangeValidation value - optional> \
    --body <json string for request body>
```

### Operation AdminBulkUpdateMyItems

```sh
$ build/install/cli/bin/cli inventory adminBulkUpdateMyItems \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminSaveItemToInventory

```sh
$ build/install/cli/bin/cli inventory adminSaveItemToInventory \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminBulkRemoveItems

```sh
$ build/install/cli/bin/cli inventory adminBulkRemoveItems \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminBulkSaveItemToInventory

```sh
$ build/install/cli/bin/cli inventory adminBulkSaveItemToInventory \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminUpdateUserInventoriesByInventoryCode

```sh
$ build/install/cli/bin/cli inventory adminUpdateUserInventoriesByInventoryCode \
    --inventoryConfigurationCode <inventoryConfigurationCode value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminSaveItem

```sh
$ build/install/cli/bin/cli inventory adminSaveItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminBulkSaveItem

```sh
$ build/install/cli/bin/cli inventory adminBulkSaveItem \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminSyncUserEntitlements

```sh
$ build/install/cli/bin/cli inventory adminSyncUserEntitlements \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminPurchasable

```sh
$ build/install/cli/bin/cli inventory adminPurchasable \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicListInventoryConfigurations

```sh
$ build/install/cli/bin/cli inventory publicListInventoryConfigurations \
    --namespace <namespace value> \
    --code <code value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation PublicListItemTypes

```sh
$ build/install/cli/bin/cli inventory publicListItemTypes \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation PublicListTags

```sh
$ build/install/cli/bin/cli inventory publicListTags \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation PublicListInventories

```sh
$ build/install/cli/bin/cli inventory publicListInventories \
    --namespace <namespace value> \
    --inventoryConfigurationCode <inventoryConfigurationCode value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional>
```

### Operation PublicConsumeMyItem

```sh
$ build/install/cli/bin/cli inventory publicConsumeMyItem \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicListItems

```sh
$ build/install/cli/bin/cli inventory publicListItems \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --sortBy <sortBy value - optional> \
    --sourceItemId <sourceItemId value - optional> \
    --tags <tags value - optional>
```

### Operation PublicBulkUpdateMyItems

```sh
$ build/install/cli/bin/cli inventory publicBulkUpdateMyItems \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicBulkRemoveMyItems

```sh
$ build/install/cli/bin/cli inventory publicBulkRemoveMyItems \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicMoveMyItems

```sh
$ build/install/cli/bin/cli inventory publicMoveMyItems \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetItem

```sh
$ build/install/cli/bin/cli inventory publicGetItem \
    --inventoryId <inventoryId value> \
    --namespace <namespace value> \
    --slotId <slotId value> \
    --sourceItemId <sourceItemId value>
```

