/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_like;

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
 * <p>Requires valid user token
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
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsPaginatedContentDownloadResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
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
