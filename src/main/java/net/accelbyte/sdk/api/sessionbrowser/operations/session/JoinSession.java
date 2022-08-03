/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.operations.session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * JoinSession
 *
 * <p>Required permission: NAMESPACE:{namespace}:SESSIONBROWSER:SESSION [READ]
 *
 * <p>Required scope: social
 *
 * <p>Join the specified session by session ID. Possible the game required a password to join
 */
@Getter
@Setter
public class JoinSession extends Operation {
  /** generated field's value */
  private String path = "/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/join";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String sessionID;
  private ModelsJoinGameSessionRequest body;

  /**
   * @param namespace required
   * @param sessionID required
   * @param body required
   */
  @Builder
  public JoinSession(String namespace, String sessionID, ModelsJoinGameSessionRequest body) {
    this.namespace = namespace;
    this.sessionID = sessionID;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.sessionID != null) {
      pathParams.put("sessionID", this.sessionID);
    }
    return pathParams;
  }

  @Override
  public ModelsJoinGameSessionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.sessionID == null) {
      return false;
    }
    return true;
  }

  public ModelsSessionResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsSessionResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
