/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.server;

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
 * ServerHeartbeat
 *
 * <p>``` Required permission: NAMESPACE:{namespace}:DSM:SERVER [UPDATE] Required scope: social
 *
 * <p>This endpoint is intended to be called by dedicated server which already has claimed to extend
 * its lifetime. DS should call this periodically after it claimed. The timeframe between 2
 * heartbeat call should be smaller than the session timout in the deployment configuration. If the
 * last heartbeat is longer than the session timout, the server. will be considered as expired and
 * will be terminated by DSMC.```
 */
@Getter
@Setter
public class ServerHeartbeat extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/namespaces/{namespace}/servers/heartbeat";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelsDSHeartbeatRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public ServerHeartbeat(String namespace, ModelsDSHeartbeatRequest body) {
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
  public ModelsDSHeartbeatRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 202) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
