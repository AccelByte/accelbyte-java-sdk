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
 * AddPlayerToSession
 *
 * <p>Required permission: NAMESPACE:{namespace}:SESSIONBROWSER:SESSION [UPDATE]
 *
 * <p>Required scope: social
 *
 * <p>Add player to game session
 */
@Getter
@Setter
public class AddPlayerToSession extends Operation {
  /** generated field's value */
  private String path = "/sessionbrowser/namespaces/{namespace}/gamesession/{sessionID}/player";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String sessionID;
  private ModelsAddPlayerRequest body;

  /**
   * @param namespace required
   * @param sessionID required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AddPlayerToSession(String namespace, String sessionID, ModelsAddPlayerRequest body) {
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
  public ModelsAddPlayerRequest getBodyParams() {
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

  public ModelsAddPlayerResponse parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsAddPlayerResponse().createFromJson(json);
  }
}
