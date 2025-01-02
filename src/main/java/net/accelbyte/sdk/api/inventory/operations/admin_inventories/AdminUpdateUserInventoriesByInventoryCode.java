/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.inventory.operations.admin_inventories;

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
 * AdminUpdateUserInventoriesByInventoryCode
 *
 * <p>Updating user inventories. Positive value will increase MaxSlots from existing value Negative
 * value will decrease MaxSlots from existing value Limited slots can not be changed to unlimited,
 * vice versa
 *
 * <p>Permission: ADMIN:NAMESPACE:{namespace}:USER:{userId}:INVENTORY [UPDATE]
 */
@Getter
@Setter
public class AdminUpdateUserInventoriesByInventoryCode extends Operation {
  /** generated field's value */
  private String path =
      "/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventoryConfigurations/{inventoryConfigurationCode}/inventories";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String inventoryConfigurationCode;

  private String namespace;
  private String userId;
  private ApimodelsUpdateInventoryReq body;

  /**
   * @param inventoryConfigurationCode required
   * @param namespace required
   * @param userId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminUpdateUserInventoriesByInventoryCode(
      String inventoryConfigurationCode,
      String namespace,
      String userId,
      ApimodelsUpdateInventoryReq body) {
    this.inventoryConfigurationCode = inventoryConfigurationCode;
    this.namespace = namespace;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.inventoryConfigurationCode != null) {
      pathParams.put("inventoryConfigurationCode", this.inventoryConfigurationCode);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public ApimodelsUpdateInventoryReq getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.inventoryConfigurationCode == null) {
      return false;
    }
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

  public List<ApimodelsInventoryResp> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<ApimodelsInventoryResp>>() {});
  }
}
