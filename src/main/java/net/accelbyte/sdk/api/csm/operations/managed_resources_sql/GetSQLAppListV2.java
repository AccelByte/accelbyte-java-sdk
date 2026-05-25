/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.managed_resources_sql;

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
 * GetSQLAppListV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:SQL:CLUSTERS [READ]`
 *
 * <p>Get List of Extend App using SQL database by given studio/publisher namespace and the SQL
 * cluster resourceId. - `available` : The cluster is accessible. - `updating` : The cluster is
 * being modified and is not yet accessible (e.g., updating min/max ACU). - `creating` : The cluster
 * or instance is being created and is not yet accessible. - `maintenance` : The cluster is
 * undergoing maintenance operations and is not accessible. - `unknown` : The cluster status is not
 * recognized - `configuring-replica` : The cluster is configuring replica instances for multi-AZ
 * deployment. - `deleting` : The cluster is in the process of being deleted and is not accessible.
 * - `failed` : The cluster failed to provision or is in an error state and not accessible. -
 * `stopping` : The cluster is in the process of stopping and will soon become inaccessible. -
 * `stopped` : The cluster is stopped and not accessible. - `starting` : The cluster is
 * transitioning from stopped to running, or is rebooting.
 */
@Getter
@Setter
public class GetSQLAppListV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/sql/{resourceId}/apps";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String resourceId;
  private String appName;
  private String gameNamespace;
  private Integer limit;
  private Integer offset;

  /**
   * @param namespace required
   * @param resourceId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSQLAppListV2(
      String namespace,
      String resourceId,
      String appName,
      String gameNamespace,
      Integer limit,
      Integer offset) {
    this.namespace = namespace;
    this.resourceId = resourceId;
    this.appName = appName;
    this.gameNamespace = gameNamespace;
    this.limit = limit;
    this.offset = offset;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.resourceId != null) {
      pathParams.put("resourceId", this.resourceId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("appName", this.appName == null ? null : Arrays.asList(this.appName));
    queryParams.put(
        "gameNamespace", this.gameNamespace == null ? null : Arrays.asList(this.gameNamespace));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.resourceId == null) {
      return false;
    }
    return true;
  }

  public ApimodelSQLAppListResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelSQLAppListResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("appName", "None");
    result.put("gameNamespace", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    return result;
  }
}
