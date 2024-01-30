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
 * getEstimatedPrice
 *
 * <p>This API is used to get estimated prices of a flexible pricing bundle
 */
@Getter
@Setter
public class GetEstimatedPrice extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items/estimatedPrice";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String platform;
  private String region;
  private String storeId;
  private String itemIds;
  private String userId;

  /**
   * @param namespace required
   * @param itemIds required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetEstimatedPrice(
      String namespace,
      String platform,
      String region,
      String storeId,
      String itemIds,
      String userId) {
    this.namespace = namespace;
    this.platform = platform;
    this.region = region;
    this.storeId = storeId;
    this.itemIds = itemIds;
    this.userId = userId;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("platform", this.platform == null ? null : Arrays.asList(this.platform));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    queryParams.put("itemIds", this.itemIds == null ? null : Arrays.asList(this.itemIds));
    queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.itemIds == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public EstimatedPriceInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new EstimatedPriceInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("platform", "None");
    result.put("region", "None");
    result.put("storeId", "None");
    result.put("itemIds", "None");
    result.put("userId", "None");
    return result;
  }
}
