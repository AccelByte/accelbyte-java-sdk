/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operations.admin_items;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * AdminBulkSaveItem
 *
 * <p>This endpoint will be used by client to save the purchased item to user's inventory, since
 * want to integrate the inventory service to e-commerce, source field will be mandatory to
 * determine the item, supported field âOTHERâ and âECOMMERCEâ
 *
 * <p>Notes : source ECOMMERCE, the quantity of ecommerce items saved is dynamically adjusted based
 * on an item's useCount configured in Store. When saving items, the quantity specified for each
 * item will be multiplied by the useCount i.e. If the store item is configured with a useCount of 5
 * and the quantity of a particular item is set to 2 during saving, it will be stored as 10
 *
 * <p>Target inventory will be based on the specified inventoryConfigurationCode. If the inventory
 * exist then will put to the existing one, if not exist at all then will create at least one
 * inventory, if full then will return failed at the response. We implement the logic as
 * proportional to store the item to inventory, will loop from createdAt until find the available
 * slots at inventory.
 *
 * <p>Type: - ingame - app - coin etc..
 *
 * <p>Max length of the payload is 10 items
 *
 * <p>Permission: ADMIN:NAMESPACE:{namespace}:USER:{userId}:INVENTORY:ITEM [CREATE]
 */
@Getter
@Setter
public class AdminBulkSaveItem extends Operation {
  /** generated field's value */
  private String path = "/inventory/v1/admin/namespaces/{namespace}/users/{userId}/items/bulk";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private List<ApimodelsSaveItemReq> body;

  /**
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminBulkSaveItem(String namespace, String userId, List<ApimodelsSaveItemReq> body) {
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
  public List<ApimodelsSaveItemReq> getBodyParams() {
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
    return true;
  }

  public List<ApimodelsBulkSaveItemResp> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ApimodelsBulkSaveItemResp>>() {});
  }
}
