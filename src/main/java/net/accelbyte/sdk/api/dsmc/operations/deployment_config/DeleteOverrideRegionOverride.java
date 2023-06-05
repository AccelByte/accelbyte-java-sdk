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
 * DeleteOverrideRegionOverride
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [DELETE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint delete a dedicated server deployment override in a namespace in a region for
 * deployment overrides
 */
@Getter
@Setter
public class DeleteOverrideRegionOverride extends Operation {
  /** generated field's value */
  private String path =
      "/dsmcontroller/admin/namespaces/{namespace}/configs/deployments/{deployment}/overrides/versions/{version}/regions/{region}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String deployment;

  private String namespace;
  private String region;
  private String version;

  /**
   * @param deployment required
   * @param namespace required
   * @param region required
   * @param version required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteOverrideRegionOverride(
      String deployment, String namespace, String region, String version) {
    this.deployment = deployment;
    this.namespace = namespace;
    this.region = region;
    this.version = version;

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
    if (this.region != null) {
      pathParams.put("region", this.region);
    }
    if (this.version != null) {
      pathParams.put("version", this.version);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.deployment == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.region == null) {
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
