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
 * publicGetItemDynamicData
 *
 * <p>Get item dynamic data for a published item. Other detail info:
 *
 * <p>* Returns : item dynamic data
 */
@Getter
@Setter
public class PublicGetItemDynamicData extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/items/{itemId}/dynamic";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String itemId;

  private String namespace;

  /**
   * @param itemId required
   * @param namespace required
   */
  @Builder
  public PublicGetItemDynamicData(String itemId, String namespace) {
    this.itemId = itemId;
    this.namespace = namespace;
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.itemId != null) {
      pathParams.put("itemId", this.itemId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.itemId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ItemDynamicDataInfo parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ItemDynamicDataInfo().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
