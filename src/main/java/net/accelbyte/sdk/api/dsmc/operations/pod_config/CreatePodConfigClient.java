/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.pod_config;

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
 * CreatePodConfigClient
 *
 * <p>Required permission: NAMESPACE:{namespace}:DSM:CONFIG [CREATE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint create a dedicated servers pod config in a namespace.
 */
@Getter
@Setter
public class CreatePodConfigClient extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/namespaces/{namespace}/configs/pods/{name}";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String name;

  private String namespace;
  private ModelsCreatePodConfigRequest body;

  /**
   * @param name required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreatePodConfigClient(String name, String namespace, ModelsCreatePodConfigRequest body) {
    this.name = name;
    this.namespace = namespace;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.name != null) {
      pathParams.put("name", this.name);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public ModelsCreatePodConfigRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.name == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.body == null) {
      return false;
    }
    return true;
  }

  public ModelsPodConfigRecord parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPodConfigRecord().createFromJson(json);
  }
}
