/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.eventlog.operations.event;

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
 * GetEventByNamespaceHandler
 *
 * <p>Required permission `NAMESPACE:{namespace}:EVENT [UPDATE]` and scope `analytics`
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class GetEventByNamespaceHandler extends Operation {
  /** generated field's value */
  private String path = "/event/namespaces/{namespace}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private Integer offset;
  private String endDate;
  private Integer pageSize;
  private String startDate;

  /**
   * @param namespace required
   * @param endDate required
   * @param pageSize required
   * @param startDate required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetEventByNamespaceHandler(
      String namespace, Integer offset, String endDate, Integer pageSize, String startDate) {
    this.namespace = namespace;
    this.offset = offset;
    this.endDate = endDate;
    this.pageSize = pageSize;
    this.startDate = startDate;

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
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put(
        "pageSize", this.pageSize == null ? null : Arrays.asList(String.valueOf(this.pageSize)));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.endDate == null) {
      return false;
    }
    if (this.pageSize == null) {
      return false;
    }
    if (this.startDate == null) {
      return false;
    }
    return true;
  }

  public ModelsEventResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsEventResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("offset", "None");
    result.put("endDate", "None");
    result.put("pageSize", "None");
    result.put("startDate", "None");
    return result;
  }
}
