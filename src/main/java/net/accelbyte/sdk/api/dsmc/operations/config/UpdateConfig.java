/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.config;

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
 * UpdateConfig
 *
 * <p>``` Required permission: ADMIN:NAMESPACE:{namespace}:DSM:CONFIG [UPDATE] Required scope:
 * social
 *
 * <p>This endpoint modifies config. When there are ready servers and the server version is updated,
 * those servers will be replaced with newer version.
 *
 * <p>Port is where your game listens for incoming UDP connection, if empty it'll be set to 15000
 *
 * <p>CPU and Memory limit / request are formatted with Kubernetes format, e.g. CPU of 1000m is 1
 * core, and Memory of 512Mi is 512 MB.
 *
 * <p>The creation/claim/session/unreachable/heartbeat timeouts are all in seconds. Creation timeout
 * is time limit for DS to startup until registers itself. Claim timeout is time limit for game
 * session manager to claim its ready DS. Session timeout is time limit for match session before
 * deleted. Unreachable timeout is time limit for DS in UNREACHABLE state before deleted. Heartbeat
 * timeout is time limit for DS to give heartbeat before marked as UNREACHABLE.
 *
 * <p>Sample config: { "namespace": "accelbyte", "providers": [ "aws" ], "port": 7777, "protocol":
 * "udp", "creation_timeout": 120, "claim_timeout": 60, "session_timeout": 1800,
 * "heartbeat_timeout": 30, "unreachable_timeout": 30, } ```
 */
@Getter
@Setter
public class UpdateConfig extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/admin/namespaces/{namespace}/configs";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelsUpdateDSMConfigRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public UpdateConfig(String namespace, ModelsUpdateDSMConfigRequest body) {
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
  public ModelsUpdateDSMConfigRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsDSMConfigRecord parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsDSMConfigRecord().createFromJson(json);
  }
}
