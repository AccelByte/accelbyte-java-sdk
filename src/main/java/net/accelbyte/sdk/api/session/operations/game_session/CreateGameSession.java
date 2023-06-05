/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.operations.game_session;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * createGameSession
 *
 * <p>Create a game session. Session configuration name is mandatory, this API will refer following
 * values from the session template if they're not provided in the request: - type - joinability -
 * minPlayers - maxPlayers - inviteTimeout - inactiveTimeout - dsSource
 *
 * <p>When the session type is a DS, a DS creation request will be sent if number of active players
 * reaches session's minPlayers.
 *
 * <p>Active user is a user who present within the session, has status CONNECTED/JOINED.
 *
 * <p>Session service has several DSInformation status to track DS request to DSMC: -
 * NEED_TO_REQUEST: number of active players hasn't reached session's minPlayers therefore DS has
 * not yet requested. - REQUESTED: DS is being requested to DSMC. - AVAILABLE: DS is ready to use.
 * The DSMC status for this DS is either READY/BUSY. - FAILED_TO_REQUEST: DSMC fails to create the
 * DS.
 *
 * <p>By default, DS requests are sent to DSMC, but if dsSource is set to "AMS": - A DS will be
 * requested from AMS instead of DSMC. - The server will be chosen based on a set of claim keys, in
 * order of preference, to match with fleets. - The claim key list is built build from the
 * preferredClaimKeys, fallbackClaimKeys, and clientVersion as follows: [preferredClaimKeys..,
 * clientVersion, fallbackClaimKeys...]
 */
@Getter
@Setter
public class CreateGameSession extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/gamesession";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private ApimodelsCreateGameSessionRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateGameSession(String namespace, ApimodelsCreateGameSessionRequest body) {
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
  public ApimodelsCreateGameSessionRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsGameSessionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsGameSessionResponse().createFromJson(json);
  }
}
