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
 * GetNoSQLDatabaseV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:NOSQL:DATABASES [READ]`
 *
 * <p>Get a NoSQL database information returns the NoSQL database related information by given game
 * namespace and app name.
 *
 * <p>`resourceStatus` field - indicates the NoSQL cluster status: - `available` : The cluster is
 * accessible. - `updating` : The cluster is being modified and is not yet accessible (e.g.,
 * updating min/max DCU). - `deleting` : The cluster is in the process of being deleted and is not
 * accessible. - `failed` : The cluster failed to provision or is in an error state and not
 * accessible. - `stopped` : The cluster is stopped and not accessible. - `maintenance` : The
 * cluster is undergoing maintenance operations and is not accessible. - `unknown` : The cluster
 * status is not recognized - `creating` : The cluster or instance is being created and is not yet
 * accessible. - `stopping` : The cluster is in the process of stopping and will soon become
 * inaccessible. - `starting` : The cluster is transitioning from stopped to running, or is
 * rebooting.
 */
@Getter
@Setter
public class GetNoSQLDatabaseV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/apps/{app}/nosql/databases";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String app;

  private String namespace;

  /**
   * @param app required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetNoSQLDatabaseV2(String app, String namespace) {
    this.app = app;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.app != null) {
      pathParams.put("app", this.app);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.app == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelNoSQLDatabaseResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelNoSQLDatabaseResponse().createFromJson(json);
  }
}
