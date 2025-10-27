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
 * UpdateNoSQLClusterV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:NOSQL:CLUSTERS [UPDATE]`
 *
 * <p>Update NoSQL cluster configurations such as min/max DCU (Database Capacity Units) for the
 * NoSQL cluster in the given studio/publisher namespace. The cluster must be in an available state
 * to allow configuration updates.
 *
 * <p>Configuration update process may take some time to complete, you can check the updated status
 * from the `status` field of the resource response.
 */
@Getter
@Setter
public class UpdateNoSQLClusterV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/nosql/clusters";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private NosqlresourceNoSQLResourceConfiguration body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateNoSQLClusterV2(String namespace, NosqlresourceNoSQLResourceConfiguration body) {
    this.namespace = namespace;
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
  public NosqlresourceNoSQLResourceConfiguration getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ApimodelNoSQLResourceResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelNoSQLResourceResponse().createFromJson(json);
  }
}
