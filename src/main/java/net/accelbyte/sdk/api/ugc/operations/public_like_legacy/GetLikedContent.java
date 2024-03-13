/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_like_legacy;

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
 * GetLikedContent
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
public class GetLikedContent extends Operation {
  /** generated field's value */
  private String path = "/ugc/v1/public/namespaces/{namespace}/contents/liked";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean isofficial;
  private Integer limit;
  private String name;
  private Integer offset;
  private String orderby;
  private String sortby;
  private String subtype;
  private List<String> tags;
  private String type;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetLikedContent(
      String namespace,
      Boolean isofficial,
      Integer limit,
      String name,
      Integer offset,
      String orderby,
      String sortby,
      String subtype,
      List<String> tags,
      String type) {
    this.namespace = namespace;
    this.isofficial = isofficial;
    this.limit = limit;
    this.name = name;
    this.offset = offset;
    this.orderby = orderby;
    this.sortby = sortby;
    this.subtype = subtype;
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
        "isofficial",
        this.isofficial == null ? null : Arrays.asList(String.valueOf(this.isofficial)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("name", this.name == null ? null : Arrays.asList(this.name));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("orderby", this.orderby == null ? null : Arrays.asList(this.orderby));
    queryParams.put("sortby", this.sortby == null ? null : Arrays.asList(this.sortby));
    queryParams.put("subtype", this.subtype == null ? null : Arrays.asList(this.subtype));
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

  public ModelsPaginatedContentDownloadResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPaginatedContentDownloadResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("isofficial", "None");
    result.put("limit", "None");
    result.put("name", "None");
    result.put("offset", "None");
    result.put("orderby", "None");
    result.put("sortby", "None");
    result.put("subtype", "None");
    result.put("tags", "csv");
    result.put("type", "None");
    return result;
  }
}
