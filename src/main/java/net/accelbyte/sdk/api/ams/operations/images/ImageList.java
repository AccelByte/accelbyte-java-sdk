/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.operations.images;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * ImageList
 *
 * <p>Returns images which exist (uploaded, uploading, or building) in the linked account. This
 * route fails if no account is linked
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:AMS:IMAGE [READ]
 */
@Getter
@Setter
public class ImageList extends Operation {
  /** generated field's value */
  private String path = "/ams/v1/admin/namespaces/{namespace}/images";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Integer count;
  private String inUse;
  private Boolean isProtected;
  private String name;
  private Integer offset;
  private String sortBy;
  private String sortDirection;
  private String status;
  private String tag;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ImageList(
      String namespace,
      Integer count,
      String inUse,
      Boolean isProtected,
      String name,
      Integer offset,
      String sortBy,
      String sortDirection,
      String status,
      String tag) {
    this.namespace = namespace;
    this.count = count;
    this.inUse = inUse;
    this.isProtected = isProtected;
    this.name = name;
    this.offset = offset;
    this.sortBy = sortBy;
    this.sortDirection = sortDirection;
    this.status = status;
    this.tag = tag;

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
    queryParams.put("count", this.count == null ? null : Arrays.asList(String.valueOf(this.count)));
    queryParams.put("inUse", this.inUse == null ? null : Arrays.asList(this.inUse));
    queryParams.put(
        "isProtected",
        this.isProtected == null ? null : Arrays.asList(String.valueOf(this.isProtected)));
    queryParams.put("name", this.name == null ? null : Arrays.asList(this.name));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put(
        "sortDirection", this.sortDirection == null ? null : Arrays.asList(this.sortDirection));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put("tag", this.tag == null ? null : Arrays.asList(this.tag));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApiImageList parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApiImageList().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("count", "None");
    result.put("inUse", "None");
    result.put("isProtected", "None");
    result.put("name", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    result.put("sortDirection", "None");
    result.put("status", "None");
    result.put("tag", "None");
    return result;
  }
}
