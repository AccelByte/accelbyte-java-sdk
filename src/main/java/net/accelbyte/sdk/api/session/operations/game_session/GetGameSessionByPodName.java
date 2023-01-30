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
 * getGameSessionByPodName
 *
 * <p>Get game session detail by podname. Session service has several DSInformation status to track
 * DS request to DSMC: - NEED_TO_REQUEST: number of active players hasn't reached session's
 * minPlayers therefore DS has not yet requested. - REQUESTED: DS is being requested to DSMC. -
 * AVAILABLE: DS is ready to use. The DSMC status for this DS is either READY/BUSY. -
 * FAILED_TO_REQUEST: DSMC fails to create the DS.
 */
@Getter
@Setter
public class GetGameSessionByPodName extends Operation {
  /** generated field's value */
  private String path = "/session/v1/public/namespaces/{namespace}/gamesessions/servers/{podName}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String podName;

  /**
   * @param namespace required
   * @param podName required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetGameSessionByPodName(String namespace, String podName) {
    this.namespace = namespace;
    this.podName = podName;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.podName != null) {
      pathParams.put("podName", this.podName);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.podName == null) {
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
