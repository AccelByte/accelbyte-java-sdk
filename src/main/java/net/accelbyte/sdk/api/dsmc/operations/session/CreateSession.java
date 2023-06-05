/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.session;

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
 * CreateSession
 *
 * <p>Required permission: NAMESPACE:{namespace}:DSM:SESSION [CREATE]
 *
 * <p>Required scope: social
 *
 * <p>This endpoint is intended to be called by game session manager (matchmaker, lobby, etc.) to
 * get a dedicated server for a game session.
 *
 * <p>If a dedicated server is available, it will respond with a dedicated server details ready to
 * be used.
 *
 * <p>Otherwise it will trigger new dedicated server creation and respond with a server status
 * CREATING. The game session manager then expected to wait and query the server readiness with GET
 * /namespaces/{namespace}/sessions/{sessionID} endpoint until the serverstatus is READY
 *
 * <p>Specify pod_name with name of local DS in the request to create a session using the registered
 * local DS
 */
@Getter
@Setter
public class CreateSession extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/namespaces/{namespace}/sessions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ModelsCreateSessionRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateSession(String namespace, ModelsCreateSessionRequest body) {
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
  public ModelsCreateSessionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsSessionResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsSessionResponse().createFromJson(json);
  }
}
