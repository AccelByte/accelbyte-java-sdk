/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.order;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * countOfPurchasedItem
 *
 * <p>This API is used to get the count of purchased item which is the order target. Other detail
 * info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:ORDER", action=2
 * (READ) * Returns : Item purchased count
 */
@Getter
@Setter
public class CountOfPurchasedItem extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/users/{userId}/orders/countOfItem";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String userId;
  private String itemId;

  /**
   * @param namespace required
   * @param userId required
   * @param itemId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CountOfPurchasedItem(String namespace, String userId, String itemId) {
    this.namespace = namespace;
    this.userId = userId;
    this.itemId = itemId;

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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("itemId", this.itemId == null ? null : Arrays.asList(this.itemId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    if (this.itemId == null) {
      return false;
    }
    return true;
  }

  public PurchasedItemCount parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PurchasedItemCount().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("itemId", "None");
    return result;
  }
}
