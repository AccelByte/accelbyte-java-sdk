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
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * DeleteUserFromSessionInChannel
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [Delete]
 *
 * <p>Required Scope: social
 *
 * <p>Delete a user from a session in the channel.
 */
@Getter
@Setter
public class DeleteUserFromSessionInChannel extends Operation {
  /** generated field's value */
  private String path =
      "/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/sessions/{matchID}/users/{userID}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String channelName;

  private String matchID;
  private String namespace;
  private String userID;

  /**
   * @param channelName required
   * @param matchID required
   * @param namespace required
   * @param userID required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteUserFromSessionInChannel(
      String channelName, String matchID, String namespace, String userID) {
    this.channelName = channelName;
    this.matchID = matchID;
    this.namespace = namespace;
    this.userID = userID;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.channelName != null) {
      pathParams.put("channelName", this.channelName);
    }
    if (this.matchID != null) {
      pathParams.put("matchID", this.matchID);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userID != null) {
      pathParams.put("userID", this.userID);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.channelName == null) {
      return false;
    }
    if (this.matchID == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    if (this.userID == null) {
      return false;
    }
    return true;
  }

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
