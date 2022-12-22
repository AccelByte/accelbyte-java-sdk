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
 * CreateChannelHandler
 *
 * <p>Required Permission: NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [CREATE]
 *
 * <p>Required Scope: social
 *
 * <p>Creates a new matchmaking channel.
 *
 * <p>Matchmaking channels is a list of pool name that is eligible for matchmaking processes.
 * GameMode isolates each matchmaking pools.
 *
 * <p>If match timeout is set to 0, by default, incoming matchmaking requests will be timed out
 * after 1 hour.
 *
 * <p>If max worker delay is set to 0, by default, it will wait for at max ~8 seconds during low
 * volume.
 *
 * <p>Rule Set
 *
 * <p>Matching Rule used to classify the player. Player that has matched criteria will be grouped
 * together within an ally.
 *
 * <p>Valid value for criteria is "distance"
 */
@Getter
@Setter
public class CreateChannelHandler extends Operation {
  /** generated field's value */
  private String path = "/matchmaking/namespaces/{namespace}/channels";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelsChannelRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreateChannelHandler(String namespace, ModelsChannelRequest body) {
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
  public ModelsChannelRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsCreateChannelResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsCreateChannelResponse().createFromJson(json);
  }
}
