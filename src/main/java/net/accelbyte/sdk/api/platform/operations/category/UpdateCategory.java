/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.category;

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
 * updateCategory
 *
 * <p>This API is used to update category.
 *
 * <p>The category update data is a category object, example as:
 *
 * <p>{
 *
 * <p>"storeId": "store-id",
 *
 * <p>"localizationDisplayNames": {"en" : "Games"}
 *
 * <p>}
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:CATEGORY", action=4 (UPDATE) *
 * Returns : the updated category data
 */
@Getter
@Setter
public class UpdateCategory extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/categories/{categoryPath}";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String categoryPath;

  private String namespace;
  private String storeId;
  private CategoryUpdate body;

  /**
   * @param categoryPath required
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateCategory(
      String categoryPath, String namespace, String storeId, CategoryUpdate body) {
    this.categoryPath = categoryPath;
    this.namespace = namespace;
    this.storeId = storeId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.categoryPath != null) {
      pathParams.put("categoryPath", this.categoryPath);
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
  public CategoryUpdate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.categoryPath == null) {
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

  public FullCategoryInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FullCategoryInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("storeId", "None");
    return result;
  }
}
