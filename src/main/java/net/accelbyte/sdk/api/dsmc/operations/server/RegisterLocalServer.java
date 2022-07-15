/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.dsmc.operations.server;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.models.ModelsRegisterLocalServerRequest;
import net.accelbyte.sdk.api.dsmc.models.ModelsServer;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * RegisterLocalServer
 *
 * <p>``` Required permission: NAMESPACE:{namespace}:DSM:SERVER [UPDATE] Required scope: social
 *
 * <p>Use the alternative GET of the same endpoint to upgrade DS connection to DSM via websocket.
 *
 * <p>This endpoint is intended to be called by local dedicated server to let DSM know that it is
 * ready for use. Use local DS only for development purposes since DSM wouldn't be able to properly
 * manage local DS in production. This MUST be called by DS after it is ready to accept match data
 * and incoming client connections.
 *
 * <p>Upon successfully calling this endpoint, the dedicated server is listed under READY local
 * servers.```
 */
@Getter
@Setter
public class RegisterLocalServer extends Operation {
  /** generated field's value */
  private String path = "/dsmcontroller/namespaces/{namespace}/servers/local/register";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  @Deprecated private String security = "Bearer";
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelsRegisterLocalServerRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  public RegisterLocalServer(String namespace, ModelsRegisterLocalServerRequest body) {
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
  public ModelsRegisterLocalServerRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsServer parseResponse(int code, String contentTpe, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsServer().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
