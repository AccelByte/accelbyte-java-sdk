/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.operations.event_v2;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * QueryEventStreamHandler
 *
 * <p>This endpoint is using POST which is somewhat unfamiliar, but it's logical that we have to
 * send/post a filter (search term) in order to get the data. This endpoint will not return anything
 * if you give it an empty filters in the request body.
 */
@Getter
@Setter
public class QueryEventStreamHandler extends Operation {
  /** generated field's value */
  private String path = "/event/v2/admin/namespaces/{namespace}/query";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endDate;
  private Integer offset;
  private Integer pageSize;
  private String startDate;
  private ModelsGenericQueryPayload body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryEventStreamHandler(
      String namespace,
      String endDate,
      Integer offset,
      Integer pageSize,
      String startDate,
      ModelsGenericQueryPayload body) {
    this.namespace = namespace;
    this.endDate = endDate;
    this.offset = offset;
    this.pageSize = pageSize;
    this.startDate = startDate;
    this.body = body;

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
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "pageSize", this.pageSize == null ? null : Arrays.asList(String.valueOf(this.pageSize)));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    return queryParams;
  }

  @Override
  public ModelsGenericQueryPayload getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsEventResponseV2 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsEventResponseV2().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endDate", "None");
    result.put("offset", "None");
    result.put("pageSize", "None");
    result.put("startDate", "None");
    return result;
  }
}
