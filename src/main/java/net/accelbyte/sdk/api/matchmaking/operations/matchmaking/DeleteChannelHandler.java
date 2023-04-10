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
 * DeleteChannelHandler
 *
 * <p>Required Permission: NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [Delete]
 *
 * <p>Required Scope: social
 *
 * <p>Deletes a matchmaking channel. Matchmaking channels is a list of pool name that is eligible
 * for matchmaking processes. GameMode isolates each matchmaking pools.
 *
 * <p>Trying to delete non-existent channel will result deletion success
 */
@Getter
@Setter
public class DeleteChannelHandler extends Operation {
  /** generated field's value */
  private String path = "/matchmaking/namespaces/{namespace}/channels/{channel}";

  private String method = "DELETE";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String channel;

  private String namespace;

  /**
   * @param channel required
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public DeleteChannelHandler(String channel, String namespace) {
    this.channel = channel;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.channel != null) {
      pathParams.put("channel", this.channel);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.channel == null) {
      return false;
    }
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
