/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operations.social_matchmaking;

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
 * UpdatePlayTimeWeight
 *
 * <p>Required Permission: NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [UPDATE]
 *
 * <p>Required Scope: social
 *
 * <p>Update a connection weight between player and playtime.
 *
 * <p>This endpoint is intended to be called by admin for debugging purpose on social matchmaking
 * rule.
 */
@Getter
@Setter
public class UpdatePlayTimeWeight extends Operation {
  /** generated field's value */
  private String path = "/matchmaking/social/playtime/namespaces/{namespace}/weight";

  private String method = "PATCH";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ModelsUpdatePlayTimeWeightRequest body;

  /**
   * @param namespace required
   * @param body required
   */
  @Builder
  public UpdatePlayTimeWeight(String namespace, ModelsUpdatePlayTimeWeightRequest body) {
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
  public ModelsUpdatePlayTimeWeightRequest getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsUpdatePlayerPlaytimeWeightResponse parseResponse(
      int code, String contentTpe, InputStream payload) throws HttpResponseException, IOException {
    String json = Helper.convertInputStreamToString(payload);
    if (code == 200) {
      return new ModelsUpdatePlayerPlaytimeWeightResponse().createFromJson(json);
    }
    throw new HttpResponseException(code, json);
  }
}
