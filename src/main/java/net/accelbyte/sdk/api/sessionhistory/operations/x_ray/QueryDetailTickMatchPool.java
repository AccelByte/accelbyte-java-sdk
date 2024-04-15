/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionhistory.operations.x_ray;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * queryDetailTickMatchPool
 *
 * <p>Query xray match pool ticks.
 */
@Getter
@Setter
public class QueryDetailTickMatchPool extends Operation {
  /** generated field's value */
  private String path =
      "/sessionhistory/v2/admin/namespaces/{namespace}/xray/match-pools/{poolName}/pods/{podName}/ticks";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String podName;
  private String poolName;
  private Boolean all;
  private Integer limit;
  private Integer offset;
  private String endDate;
  private String startDate;

  /**
   * @param namespace required
   * @param podName required
   * @param poolName required
   * @param endDate required
   * @param startDate required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryDetailTickMatchPool(
      String namespace,
      String podName,
      String poolName,
      Boolean all,
      Integer limit,
      Integer offset,
      String endDate,
      String startDate) {
    this.namespace = namespace;
    this.podName = podName;
    this.poolName = poolName;
    this.all = all;
    this.limit = limit;
    this.offset = offset;
    this.endDate = endDate;
    this.startDate = startDate;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.podName != null) {
      pathParams.put("podName", this.podName);
    }
    if (this.poolName != null) {
      pathParams.put("poolName", this.poolName);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("all", this.all == null ? null : Arrays.asList(String.valueOf(this.all)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.podName == null) {
      return false;
    }
    if (this.poolName == null) {
      return false;
    }
    if (this.endDate == null) {
      return false;
    }
    if (this.startDate == null) {
      return false;
    }
    return true;
  }

  public ApimodelsXRayMatchPoolPodTickQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsXRayMatchPoolPodTickQueryResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("all", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("endDate", "None");
    result.put("startDate", "None");
    return result;
  }
}
