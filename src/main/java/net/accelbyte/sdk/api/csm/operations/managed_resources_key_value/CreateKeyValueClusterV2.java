/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.operations.managed_resources_key_value;

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
 * CreateKeyValueClusterV2
 *
 * <p>Required permission : `ADMIN:NAMESPACE:{namespace}:EXTEND:KEYVALUE:CLUSTERS [CREATE]`
 *
 * <p>Provision Key-Value cluster using AWS Valkey Serverless that can be used by extend apps in
 * game namespace within the studio.
 *
 * <p>Cluster limits: - Private cloud: up to 10 clusters per studio namespace - Shared cloud: 1
 * cluster per studio namespace
 *
 * <p>Provisioning process is done asynchronously, you can check from the `status` field of the
 * resource response.
 */
@Getter
@Setter
public class CreateKeyValueClusterV2 extends Operation {
  /** generated field's value */
  private String path = "/csm/v2/admin/namespaces/{namespace}/keyvalue/clusters";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private DomainKeyValueResourceConfiguration body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateKeyValueClusterV2(String namespace, DomainKeyValueResourceConfiguration body) {
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
  public DomainKeyValueResourceConfiguration getBodyParams() {
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

  public ApimodelKeyValueResourceResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelKeyValueResourceResponse().createFromJson(json);
  }
}
