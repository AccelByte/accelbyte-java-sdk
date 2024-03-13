/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.admin_content_v2;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * AdminListContentV2
 *
 * <p>For advance tag filtering supports & as AND operator and | as OR operator and parentheses ( )
 * for priority. e.g:
 *
 * <p>*tags=red* *tags=red&animal;* *tags=red|animal* *tags=red&animal;|wild*
 * *tags=red&(animal|wild)*
 *
 * <p>The precedence of logical operator is AND > OR, so if no parentheses, AND logical operator
 * will be executed first.
 *
 * <p>Allowed character for operand: alphanumeric, underscore _ and dash -
 *
 * <p>Allowed character for operator: & | ( )
 *
 * <p>**Please note that value of tags query param should be URL encoded**
 */
@Getter
@Setter
public class AdminListContentV2 extends Operation {
  /** generated field's value */
  private String path = "/ugc/v2/admin/namespaces/{namespace}/contents";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean isOfficial;
  private Integer limit;
  private String name;
  private Integer offset;
  private String sortBy;
  private String subType;
  private List<String> tags;
  private String type;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminListContentV2(
      String namespace,
      Boolean isOfficial,
      Integer limit,
      String name,
      Integer offset,
      String sortBy,
      String subType,
      List<String> tags,
      String type) {
    this.namespace = namespace;
    this.isOfficial = isOfficial;
    this.limit = limit;
    this.name = name;
    this.offset = offset;
    this.sortBy = sortBy;
    this.subType = subType;
    this.tags = tags;
    this.type = type;

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
        "isOfficial",
        this.isOfficial == null ? null : Arrays.asList(String.valueOf(this.isOfficial)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("name", this.name == null ? null : Arrays.asList(this.name));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put("subType", this.subType == null ? null : Arrays.asList(this.subType));
    queryParams.put("tags", this.tags == null ? null : this.tags);
    queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsPaginatedContentDownloadResponseV2 parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPaginatedContentDownloadResponseV2().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("isOfficial", "None");
    result.put("limit", "None");
    result.put("name", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    result.put("subType", "None");
    result.put("tags", "csv");
    result.put("type", "None");
    return result;
  }
}
