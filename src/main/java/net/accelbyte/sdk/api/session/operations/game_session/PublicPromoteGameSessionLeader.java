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
 * publicPromoteGameSessionLeader
 *
 * <p>Promote game session member to become the new game session leader.
 *
 * <p>This API requires the NAMESPACE:{namespace}:SESSION:GAME [UPDATE] permission.
 *
 * <p>This API can be operated by: - User (game session member) who is the current leader of the
 * game session - Game Client - Dedicated Server (DS)
 *
 * <p>This API will promote game session leader candidate with the following criteria: - Leader
 * candidate is a member of the game session - Leader candidate has a "CONNECTED" or "JOINED" status
 * - If the leader candidate is the current leader, then no promotion process is carried out
 */
@Getter
@Setter
public class PublicPromoteGameSessionLeader extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/gamesessions/{sessionId}/leader";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String sessionId;
  private ApimodelsPromoteLeaderRequest body;

  /**
   * @param namespace required
   * @param sessionId required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicPromoteGameSessionLeader(
      String namespace, String sessionId, ApimodelsPromoteLeaderRequest body) {
    this.namespace = namespace;
    this.sessionId = sessionId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.sessionId != null) {
      pathParams.put("sessionId", this.sessionId);
    }
    return pathParams;
  }

  @Override
  public ApimodelsPromoteLeaderRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.sessionId == null) {
      return false;
    }
    return true;
  }

  public ApimodelsGameSessionResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsGameSessionResponse().createFromJson(json);
  }
}
