/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

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
 * defeatureItem
 *
 * <p>Remove a feature from an item. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=4 (UPDATE) *
 * Returns : updated item
 */
@Getter
@Setter
public class DefeatureItem extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items/{itemId}/features/{feature}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String feature;

  private String itemId;
  private String namespace;
  private String storeId;

  /**
   * @param feature required
   * @param itemId required
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DefeatureItem(String feature, String itemId, String namespace, String storeId) {
    this.feature = feature;
    this.itemId = itemId;
    this.namespace = namespace;
    this.storeId = storeId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.feature != null) {
      pathParams.put("feature", this.feature);
    }
    if (this.itemId != null) {
      pathParams.put("itemId", this.itemId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.feature == null) {
      return false;
    }
    if (this.itemId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
      return false;
    }
    return true;
  }

  public FullItemInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FullItemInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("storeId", "None");
    return result;
  }
}
