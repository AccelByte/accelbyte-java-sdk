# Inventory Service Index

&nbsp;  

## Operations

### Admin Inventories Wrapper:  [AdminInventories](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminInventories.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/inventories` | GET | AdminListInventories | [AdminListInventories](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminListInventories.java) | [AdminListInventories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminListInventories.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories` | POST | AdminCreateInventory | [AdminCreateInventory](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminCreateInventory.java) | [AdminCreateInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminCreateInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}` | GET | AdminGetInventory | [AdminGetInventory](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminGetInventory.java) | [AdminGetInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminGetInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}` | PUT | AdminUpdateInventory | [AdminUpdateInventory](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminUpdateInventory.java) | [AdminUpdateInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminUpdateInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}` | DELETE | DeleteInventory | [DeleteInventory](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/DeleteInventory.java) | [DeleteInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/DeleteInventory.java) |

### Admin Items Wrapper:  [AdminItems](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminItems.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}/items` | GET | AdminListItems | [AdminListItems](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminListItems.java) | [AdminListItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminListItems.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}/slots/{slotId}/sourceItems/{sourceItemId}` | GET | AdminGetInventoryItem | [AdminGetInventoryItem](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminGetInventoryItem.java) | [AdminGetInventoryItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminGetInventoryItem.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/consume` | POST | AdminConsumeUserItem | [AdminConsumeUserItem](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminConsumeUserItem.java) | [AdminConsumeUserItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminConsumeUserItem.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items` | PUT | AdminBulkUpdateMyItems | [AdminBulkUpdateMyItems](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminBulkUpdateMyItems.java) | [AdminBulkUpdateMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminBulkUpdateMyItems.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items` | POST | AdminSaveItemToInventory | [AdminSaveItemToInventory](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminSaveItemToInventory.java) | [AdminSaveItemToInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminSaveItemToInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items` | DELETE | AdminBulkRemoveItems | [AdminBulkRemoveItems](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminBulkRemoveItems.java) | [AdminBulkRemoveItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminBulkRemoveItems.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/items` | POST | AdminSaveItem | [AdminSaveItem](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminSaveItem.java) | [AdminSaveItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminSaveItem.java) |

### Admin Inventory Configurations Wrapper:  [AdminInventoryConfigurations](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminInventoryConfigurations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations` | GET | AdminListInventoryConfigurations | [AdminListInventoryConfigurations](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminListInventoryConfigurations.java) | [AdminListInventoryConfigurations](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminListInventoryConfigurations.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations` | POST | AdminCreateInventoryConfiguration | [AdminCreateInventoryConfiguration](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminCreateInventoryConfiguration.java) | [AdminCreateInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminCreateInventoryConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations/{inventoryConfigurationId}` | GET | AdminGetInventoryConfiguration | [AdminGetInventoryConfiguration](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminGetInventoryConfiguration.java) | [AdminGetInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminGetInventoryConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations/{inventoryConfigurationId}` | PUT | AdminUpdateInventoryConfiguration | [AdminUpdateInventoryConfiguration](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminUpdateInventoryConfiguration.java) | [AdminUpdateInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminUpdateInventoryConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations/{inventoryConfigurationId}` | DELETE | AdminDeleteInventoryConfiguration | [AdminDeleteInventoryConfiguration](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminDeleteInventoryConfiguration.java) | [AdminDeleteInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminDeleteInventoryConfiguration.java) |

### Admin Item Types Wrapper:  [AdminItemTypes](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminItemTypes.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/itemtypes` | GET | AdminListItemTypes | [AdminListItemTypes](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_item_types/AdminListItemTypes.java) | [AdminListItemTypes](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_item_types/AdminListItemTypes.java) |
| `/inventory/v1/admin/namespaces/{namespace}/itemtypes` | POST | AdminCreateItemType | [AdminCreateItemType](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_item_types/AdminCreateItemType.java) | [AdminCreateItemType](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_item_types/AdminCreateItemType.java) |
| `/inventory/v1/admin/namespaces/{namespace}/itemtypes/{itemTypeName}` | DELETE | AdminDeleteItemType | [AdminDeleteItemType](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_item_types/AdminDeleteItemType.java) | [AdminDeleteItemType](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_item_types/AdminDeleteItemType.java) |

### Admin Tags Wrapper:  [AdminTags](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminTags.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/tags` | GET | AdminListTags | [AdminListTags](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_tags/AdminListTags.java) | [AdminListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_tags/AdminListTags.java) |
| `/inventory/v1/admin/namespaces/{namespace}/tags` | POST | AdminCreateTag | [AdminCreateTag](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_tags/AdminCreateTag.java) | [AdminCreateTag](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_tags/AdminCreateTag.java) |
| `/inventory/v1/admin/namespaces/{namespace}/tags/{tagName}` | DELETE | AdminDeleteTag | [AdminDeleteTag](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_tags/AdminDeleteTag.java) | [AdminDeleteTag](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_tags/AdminDeleteTag.java) |

### Public Inventory Configurations Wrapper:  [PublicInventoryConfigurations](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicInventoryConfigurations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/inventoryConfigurations` | GET | PublicListInventoryConfigurations | [PublicListInventoryConfigurations](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_inventory_configurations/PublicListInventoryConfigurations.java) | [PublicListInventoryConfigurations](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_inventory_configurations/PublicListInventoryConfigurations.java) |

### Public Item Types Wrapper:  [PublicItemTypes](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicItemTypes.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/itemtypes` | GET | PublicListItemTypes | [PublicListItemTypes](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_item_types/PublicListItemTypes.java) | [PublicListItemTypes](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_item_types/PublicListItemTypes.java) |

### Public Tags Wrapper:  [PublicTags](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicTags.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/tags` | GET | PublicListTags | [PublicListTags](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_tags/PublicListTags.java) | [PublicListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_tags/PublicListTags.java) |

### Public Inventories Wrapper:  [PublicInventories](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicInventories.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories` | GET | PublicListInventories | [PublicListInventories](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_inventories/PublicListInventories.java) | [PublicListInventories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_inventories/PublicListInventories.java) |

### Public Items Wrapper:  [PublicItems](../../src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicItems.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/consume` | POST | PublicConsumeMyItem | [PublicConsumeMyItem](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicConsumeMyItem.java) | [PublicConsumeMyItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicConsumeMyItem.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items` | GET | PublicListItems | [PublicListItems](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicListItems.java) | [PublicListItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicListItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items` | PUT | PublicBulkUpdateMyItems | [PublicBulkUpdateMyItems](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicBulkUpdateMyItems.java) | [PublicBulkUpdateMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicBulkUpdateMyItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items` | DELETE | PublicBulkRemoveMyItems | [PublicBulkRemoveMyItems](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicBulkRemoveMyItems.java) | [PublicBulkRemoveMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicBulkRemoveMyItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items/movement` | POST | PublicMoveMyItems | [PublicMoveMyItems](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicMoveMyItems.java) | [PublicMoveMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicMoveMyItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/slots/{slotId}/sourceItems/{sourceItemId}` | GET | PublicGetItem | [PublicGetItem](../../src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicGetItem.java) | [PublicGetItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicGetItem.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `apimodels.AdminUpdateItemReq` | [ApimodelsAdminUpdateItemReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsAdminUpdateItemReq.java) |
| `apimodels.ConsumeItemReq` | [ApimodelsConsumeItemReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsConsumeItemReq.java) |
| `apimodels.CreateInventoryConfigurationReq` | [ApimodelsCreateInventoryConfigurationReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateInventoryConfigurationReq.java) |
| `apimodels.CreateInventoryReq` | [ApimodelsCreateInventoryReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateInventoryReq.java) |
| `apimodels.CreateItemTypeReq` | [ApimodelsCreateItemTypeReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateItemTypeReq.java) |
| `apimodels.CreateItemTypeResp` | [ApimodelsCreateItemTypeResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateItemTypeResp.java) |
| `apimodels.CreateTagReq` | [ApimodelsCreateTagReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateTagReq.java) |
| `apimodels.CreateTagResp` | [ApimodelsCreateTagResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateTagResp.java) |
| `apimodels.DeleteInventoryReq` | [ApimodelsDeleteInventoryReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsDeleteInventoryReq.java) |
| `apimodels.ErrorResponse` | [ApimodelsErrorResponse](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsErrorResponse.java) |
| `apimodels.InventoryConfigurationReq` | [ApimodelsInventoryConfigurationReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsInventoryConfigurationReq.java) |
| `apimodels.InventoryConfigurationResp` | [ApimodelsInventoryConfigurationResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsInventoryConfigurationResp.java) |
| `apimodels.InventoryResp` | [ApimodelsInventoryResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsInventoryResp.java) |
| `apimodels.ItemResp` | [ApimodelsItemResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsItemResp.java) |
| `apimodels.ListInventoryConfigurationsResp` | [ApimodelsListInventoryConfigurationsResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListInventoryConfigurationsResp.java) |
| `apimodels.ListInventoryResp` | [ApimodelsListInventoryResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListInventoryResp.java) |
| `apimodels.ListItemResp` | [ApimodelsListItemResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListItemResp.java) |
| `apimodels.ListItemTypesResp` | [ApimodelsListItemTypesResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListItemTypesResp.java) |
| `apimodels.ListTagsResp` | [ApimodelsListTagsResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListTagsResp.java) |
| `apimodels.MoveItemsReq` | [ApimodelsMoveItemsReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsMoveItemsReq.java) |
| `apimodels.MoveItemsResp` | [ApimodelsMoveItemsResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsMoveItemsResp.java) |
| `apimodels.Paging` | [ApimodelsPaging](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsPaging.java) |
| `apimodels.RemoveInventoryItemReq` | [ApimodelsRemoveInventoryItemReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsRemoveInventoryItemReq.java) |
| `apimodels.SaveItemReq` | [ApimodelsSaveItemReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsSaveItemReq.java) |
| `apimodels.SaveItemToInventoryReq` | [ApimodelsSaveItemToInventoryReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsSaveItemToInventoryReq.java) |
| `apimodels.TradeItem` | [ApimodelsTradeItem](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsTradeItem.java) |
| `apimodels.TradeItemResp` | [ApimodelsTradeItemResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsTradeItemResp.java) |
| `apimodels.UpdateInventoryReq` | [ApimodelsUpdateInventoryReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateInventoryReq.java) |
| `apimodels.UpdateItemReq` | [ApimodelsUpdateItemReq](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateItemReq.java) |
| `apimodels.UpdateItemResp` | [ApimodelsUpdateItemResp](../../src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateItemResp.java) |
