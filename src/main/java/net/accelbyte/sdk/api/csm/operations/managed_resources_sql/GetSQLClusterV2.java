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
 * GetSQLClusterV2
 *
 * <p>Get SQL cluster information returns the SQL cluster related information by given
 * studio/publisher namespace.
 *
 * <p>`status` field - indicates the SQL cluster status: - `starting` : The cluster is transitioning
 * from stopped to running, or is rebooting. - `creating` : The cluster or instance is being created
 * and is not yet accessible. - `deleting` : The cluster is in the process of being deleted and is
 * not accessible. - `maintenance` : The cluster is undergoing maintenance operations and is not
 * accessible. - `unknown` : The cluster status is not recognized - `configuring-replica` : The
 * cluster is configuring replica instances for multi-AZ deployment. - `available` : The cluster is
 * accessible. - `updating` : The cluster is being modified and is not yet accessible (e.g.,
 * updating min/max ACU). - `failed` : The cluster failed to provision or is in an error state and
 * not accessible. - `stopping` : The cluster is in the process of stopping and will soon become
 * inaccessible. - `stopped` : The cluster is stopped and not accessible.
 */
@Getter
@Setter
public class GetSQLClusterV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/sql/clusters";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSQLClusterV2(String namespace) {
    this.namespace = namespace;

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
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelSQLResourceResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelSQLResourceResponse().createFromJson(json);
  }
}
