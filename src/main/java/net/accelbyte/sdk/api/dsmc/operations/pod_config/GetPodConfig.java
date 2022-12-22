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
 * GetPodConfig
 *
 * <p>Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [READ]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint get a dedicated server pod config in a namespace
 */
@Getter
@Setter
public class GetPodConfig extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/namespaces/{namespace}/configs/pods/{name}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String name;

  private String namespace;

  /**
   * @param name required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetPodConfig(String name, String namespace) {
    this.name = name;
    this.namespace = namespace;

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
  public boolean isValid() {
    if (this.name == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsPodConfigRecord parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsPodConfigRecord().createFromJson(json);
  }
}
