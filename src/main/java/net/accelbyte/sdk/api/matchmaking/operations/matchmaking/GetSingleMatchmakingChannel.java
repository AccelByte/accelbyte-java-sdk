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
 * GetSingleMatchmakingChannel
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [READ]
 *
 * <p>Required Scope: social
 *
 * <p>Reads single channel based on namespace and channel name
 *
 * <p>Action Code: 510112
 */
@Getter
@Setter
public class GetSingleMatchmakingChannel extends Operation {
  /** generated field's value */
  private String path = "/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String channelName;

  private String namespace;

  /**
   * @param channelName required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetSingleMatchmakingChannel(String channelName, String namespace) {
    this.channelName = channelName;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.channelName != null) {
      pathParams.put("channelName", this.channelName);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.channelName == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsChannelV1 parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsChannelV1().createFromJson(json);
  }
}
