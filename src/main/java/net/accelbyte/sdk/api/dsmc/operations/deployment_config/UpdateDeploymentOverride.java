/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.deployment_config;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * UpdateDeploymentOverride
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint update a dedicated servers deployment override in a namespace.
 */
@Getter
@Setter
public class UpdateDeploymentOverride extends Operation {
  /** generated field's value */
  private String path =
      "/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String deployment;

  private String namespace;
  private String version;
  private ModelsUpdateDeploymentOverrideRequest body;

  /**
   * @param deployment required
   * @param namespace required
   * @param version required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateDeploymentOverride(
      String deployment,
      String namespace,
      String version,
      ModelsUpdateDeploymentOverrideRequest body) {
    this.deployment = deployment;
    this.namespace = namespace;
    this.version = version;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.deployment != null) {
      pathParams.put("deployment", this.deployment);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.version != null) {
      pathParams.put("version", this.version);
    }
    return pathParams;
  }

  @Override
  public ModelsUpdateDeploymentOverrideRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.deployment == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.version == null) {
      return false;
    }
    return true;
  }

  public ModelsDeploymentWithOverride parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsDeploymentWithOverride().createFromJson(json);
  }
}
