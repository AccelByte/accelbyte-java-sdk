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
 * getLocaleItemBySku
 *
 * <p>This API is used to get an item by sku in specific locale. If item not exist in specific
 * region, default region item will return.
 *
 * <p>Other detail info:
 *
 * <p>* Returns : item data
 */
@Getter
@Setter
public class GetLocaleItemBySku extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items/bySku/locale";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean activeOnly;
  private String language;
  private Boolean populateBundle;
  private String region;
  private String storeId;
  private String sku;

  /**
   * @param namespace required
   * @param sku required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetLocaleItemBySku(
      String namespace,
      Boolean activeOnly,
      String language,
      Boolean populateBundle,
      String region,
      String storeId,
      String sku) {
    this.namespace = namespace;
    this.activeOnly = activeOnly;
    this.language = language;
    this.populateBundle = populateBundle;
    this.region = region;
    this.storeId = storeId;
    this.sku = sku;

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
    queryParams.put(
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
    queryParams.put(
        "populateBundle",
        this.populateBundle == null ? null : Arrays.asList(String.valueOf(this.populateBundle)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    queryParams.put("sku", this.sku == null ? null : Arrays.asList(this.sku));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.sku == null) {
      return false;
    }
    return true;
  }

  public PopulatedItemInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PopulatedItemInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("activeOnly", "None");
    result.put("language", "None");
    result.put("populateBundle", "None");
    result.put("region", "None");
    result.put("storeId", "None");
    result.put("sku", "None");
    return result;
  }
}
