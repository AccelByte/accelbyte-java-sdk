/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operations.admin_items;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminSaveItem
 *
 * <p>**This endpoint is used to save items to the playerâs inventory based on the
 * inventoryConfigurationCode with the following conditions:** - If the player doesn't have the
 * inventory for the specified inventoryConfigurationCode, a new inventory will be created. - If the
 * user already has one, it will be added to the existing inventory. - If the same item exists
 * within the inventory, the quantity (qty) will be increased. - If the inventory is full, the item
 * cannot be added and the request will return the âFailedâ response. - If a player has more
 * than one inventory and the initial inventory is full, the service will check the available slot
 * in the other inventory following the order of their creation date and time (createdAt). - For
 * Ecommerce items: >- Attributes such as slotUsed, serverCustomAttributes, customAttributes, and
 * type will be overridden by the attributes configured in the AccelByte Gaming Services (AGS)
 * Store. >- Storing E-commerce items in a particular slot will follow its entitlement and item
 * configuration, such as durable, consumable, stackable and non-stackable. >- The quantity is
 * dynamically set based on an itemâs useCount configured in Store. When saving an item, the
 * specified quantity will be multiplied by configured useCount for that particular item. For
 * example, if an Item is configured with a useCount of 5 in the AGS Store and it is saved with a
 * qty of 2, the itemâs quantity will be stored as 10 in the playerâs inventory.
 *
 * <p>You must have this permission to access this endpoint:
 * **Permission:ADMIN:NAMESPACE:{namespace}:USER:{userId}:INVENTORY:ITEM [CREATE]**
 */
@Getter
@Setter
public class AdminSaveItem extends Operation {
  /** generated field's value */
  private String path = "/inventory/v1/admin/namespaces/{namespace}/users/{userId}/items";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private ApimodelsSaveItemReq body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminSaveItem(String namespace, String userId, ApimodelsSaveItemReq body) {
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ApimodelsSaveItemReq getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ApimodelsItemResp parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsItemResp().createFromJson(json);
  }
}
