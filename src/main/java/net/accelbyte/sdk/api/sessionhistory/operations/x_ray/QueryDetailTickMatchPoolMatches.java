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
 * queryDetailTickMatchPoolMatches
 *
 * <p>Query xray match pool tick matches by tick id.
 */
@Getter
@Setter
public class QueryDetailTickMatchPoolMatches extends Operation {
  /** generated field's value */
  private String path =
      "/sessionhistory/v2/admin/namespaces/{namespace}/xray/match-pools/{poolName}/pods/{podName}/ticks/{tickId}/matches";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String podName;
  private String poolName;
  private String tickId;

  /**
   * @param namespace required
   * @param podName required
   * @param poolName required
   * @param tickId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryDetailTickMatchPoolMatches(
      String namespace, String podName, String poolName, String tickId) {
    this.namespace = namespace;
    this.podName = podName;
    this.poolName = poolName;
    this.tickId = tickId;

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
    if (this.tickId != null) {
      pathParams.put("tickId", this.tickId);
    }
    return pathParams;
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
    if (this.tickId == null) {
      return false;
    }
    return true;
  }

  public ApimodelsXRayMatchPoolPodTickMatchResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsXRayMatchPoolPodTickMatchResponse().createFromJson(json);
  }
}
