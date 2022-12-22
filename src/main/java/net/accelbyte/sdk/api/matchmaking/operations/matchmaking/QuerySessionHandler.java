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
 * QuerySessionHandler
 *
 * <p>Required Permission: NAMESPACE:{namespace}:SESSION [READ]
 *
 * <p>Required Scope: social
 *
 * <p>Queries the specified session's status. Game servers are expected to call this periodically as
 * long as it has a session in queue to see if there are new players being matched to the session.
 *
 * <p>Possible session statuses are "sessionInQueue", "sessionFull", and "sessionTimeout".
 *
 * <p>if party_id value empty/null, field will not show in response body.
 */
@Getter
@Setter
public class QuerySessionHandler extends Operation {
  /** generated field's value */
  private String path = "/matchmaking/namespaces/{namespace}/sessions/{matchID}/status";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String matchID;

  private String namespace;

  /**
   * @param matchID required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QuerySessionHandler(String matchID, String namespace) {
    this.matchID = matchID;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.matchID != null) {
      pathParams.put("matchID", this.matchID);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.matchID == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsMatchmakingResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsMatchmakingResult().createFromJson(json);
  }
}
