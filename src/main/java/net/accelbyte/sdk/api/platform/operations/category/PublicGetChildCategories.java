/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.category;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * publicGetChildCategories
 *
 * <p>This API is used to get child categories by category path.
 *
 * <p>Other detail info:
 *
 * <p>* Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can
 * view draft store category) * Optional permission : resource="SANDBOX", action=1(CREATE) (user
 * with this permission can view draft store category) * Returns : list of child categories data
 */
@Getter
@Setter
public class PublicGetChildCategories extends Operation {
  /** generated field's value */
  private String path =
      "/platform/public/namespaces/{namespace}/categories/{categoryPath}/children";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String categoryPath;

  private String namespace;
  private String language;
  private String storeId;

  /**
   * @param categoryPath required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicGetChildCategories(
      String categoryPath, String namespace, String language, String storeId) {
    this.categoryPath = categoryPath;
    this.namespace = namespace;
    this.language = language;
    this.storeId = storeId;
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
    queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.categoryPath == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<CategoryInfo> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<CategoryInfo>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("language", "None");
    result.put("storeId", "None");
    return result;
  }
}
