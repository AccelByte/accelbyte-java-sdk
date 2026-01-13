/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.managed_resources;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * GetNoSQLAppListV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:NOSQL:CLUSTERS [READ]`
 *
 * <p>Get List of Extend App using NoSQL database by given studio/publisher namespace and the NoSQL
 * cluster resourceId. - `available` : The cluster is accessible. - `creating` : The cluster or
 * instance is being created and is not yet accessible. - `deleting` : The cluster is in the process
 * of being deleted and is not accessible. - `stopped` : The cluster is stopped and not accessible.
 * - `updating` : The cluster is being modified and is not yet accessible (e.g., updating min/max
 * DCU). - `failed` : The cluster failed to provision or is in an error state and not accessible. -
 * `stopping` : The cluster is in the process of stopping and will soon become inaccessible. -
 * `starting` : The cluster is transitioning from stopped to running, or is rebooting. -
 * `maintenance` : The cluster is undergoing maintenance operations and is not accessible. -
 * `unknown` : The cluster status is not recognized
 */
@Getter
@Setter
public class GetNoSQLAppListV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{studioName}/nosql/{resourceId}/apps";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String resourceId;

  private String studioName;
  private String appName;
  private Integer limit;
  private String namespace;
  private Integer offset;

  /**
   * @param resourceId required
   * @param studioName required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetNoSQLAppListV2(
      String resourceId,
      String studioName,
      String appName,
      Integer limit,
      String namespace,
      Integer offset) {
    this.resourceId = resourceId;
    this.studioName = studioName;
    this.appName = appName;
    this.limit = limit;
    this.namespace = namespace;
    this.offset = offset;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.resourceId != null) {
      pathParams.put("resourceId", this.resourceId);
    }
    if (this.studioName != null) {
      pathParams.put("studioName", this.studioName);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("appName", this.appName == null ? null : Arrays.asList(this.appName));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("namespace", this.namespace == null ? null : Arrays.asList(this.namespace));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.resourceId == null) {
      return false;
    }
    if (this.studioName == null) {
      return false;
    }
    return true;
  }

  public ApimodelNoSQLAppListResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelNoSQLAppListResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("appName", "None");
    result.put("limit", "None");
    result.put("namespace", "None");
    result.put("offset", "None");
    return result;
  }
}
