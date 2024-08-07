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
 * adminQueryGameSessionsByAttributes
 *
 * <p>Query game sessions by admin.
 *
 * <p>By default, API will return a list of available game sessions (joinability: open). Session
 * service has several DSInformation status to track DS request to DS providers: - NEED_TO_REQUEST:
 * number of active players hasn't reached session's minPlayers therefore DS has not yet requested.
 * - REQUESTED: DS is being requested to DSMC. - PREPARING: DS needs to call manual set ready for
 * the game session - AVAILABLE: DS is ready to use. The DSMC status for this DS is either
 * READY/BUSY. - FAILED_TO_REQUEST: DSMC fails to spin up a DS for session. - DS_ERROR: DS provider
 * fails to spin up the DS or the DS itself becomes unreachable - DS_CANCELLED: when DSMC is
 * preparing the DS, DSMC will give a temporary DS. In this phase, if you delete the game session,
 * the DS request will be canceled. - ENDED: when a game session (match) has finished and DS has
 * done its job, it will terminate itself. - UNKNOWN: if any unknown DS status is detected.
 * DSInformation has 2 fields for DS status: "status" and "statusV2". The "status" is there for
 * backward-compatibility, therefore we encourage to just rely on "statusV2" for the more updated
 * statuses. DS Source can be DSMC, AMS or custom. In DSMC, a DS request will be put in queue if
 * they dont have available buffers, and DSMC will let the service knows when they finished spinning
 * it up. While AMS doesn't have a concept of queue. Therefore some "DSInformation.statusV2" only
 * applicable for DSMC.
 *
 * <p>query parameter "availability" to filter sessions' availability: all: return all sessions
 * regardless it's full full: only return active sessions default behavior (unset or else): return
 * only available sessions (not full)
 */
@Getter
@Setter
public class AdminQueryGameSessionsByAttributes extends Operation {
  /** generated field's value */
  private String path = "/session/v1/admin/namespaces/{namespace}/gamesessions";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Map<String, ?> body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryGameSessionsByAttributes(String namespace, Map<String, ?> body) {
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
  public Map<String, ?> getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ApimodelsGameSessionQueryResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ApimodelsGameSessionQueryResponse().createFromJson(json);
  }
}
