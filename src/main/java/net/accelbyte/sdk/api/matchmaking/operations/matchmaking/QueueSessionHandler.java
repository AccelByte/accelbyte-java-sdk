/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operations.matchmaking;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.matchmaking.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * QueueSessionHandler
 *
 * <p>Required Permission: NAMESPACE:{namespace}:SESSION [CREATE]
 *
 * <p>Required Scope: social
 *
 * <p>Queues joinable session so that it will be matched with player's match request tickets. The
 * session queued must be in a channel/game mode that is set to have joinable flag. The session will
 * be in queue until it is full or expired. Both the number of players and session queue timeout can
 * be set in the channel's config.
 *
 * <p>This endpoint is intended to be called by game server to let matchmaker know that the game
 * server is ready for receiving more players through matchmaking tickets to its session.
 *
 * <p>If a session is already queued, and game server wants to modify the data or renew the queue
 * timeout (e.g. some player left and more empty slot opened up), simply call this endpoint with the
 * updated session data.
 */
@Getter
@Setter
public class QueueSessionHandler extends Operation {
  /** generated field's value */
  private String path = "/matchmaking/namespaces/{namespace}/sessions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelsMatchmakingResult body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueueSessionHandler(String namespace, ModelsMatchmakingResult body) {
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
  public ModelsMatchmakingResult getBodyParams() {
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
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
