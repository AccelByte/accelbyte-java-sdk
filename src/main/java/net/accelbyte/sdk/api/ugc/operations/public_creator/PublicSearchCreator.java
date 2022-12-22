/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.operations.public_creator;

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
 * PublicSearchCreator
 *
 * <p>Public user can access without token or if token specified, requires valid user token
 */
@Getter
@Setter
public class PublicSearchCreator extends Operation {
  /** generated field's value */
  private String path = "/ugc/v1/public/namespaces/{namespace}/users";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json", "application/octet-stream");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private Integer limit;
  private Integer offset;
  private String orderby;
  private String sortby;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicSearchCreator(
      String namespace, Integer limit, Integer offset, String orderby, String sortby) {
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.orderby = orderby;
    this.sortby = sortby;

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
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("orderby", this.orderby == null ? null : Arrays.asList(this.orderby));
    queryParams.put("sortby", this.sortby == null ? null : Arrays.asList(this.sortby));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsPaginatedCreatorOverviewResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPaginatedCreatorOverviewResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("orderby", "None");
    result.put("sortby", "None");
    return result;
  }
}
