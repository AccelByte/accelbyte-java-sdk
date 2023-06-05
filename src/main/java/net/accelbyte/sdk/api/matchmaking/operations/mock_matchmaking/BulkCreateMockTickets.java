/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.operations.mock_matchmaking;

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
 * BulkCreateMockTickets
 *
 * <p>Required Permission: ADMIN:NAMESPACE:{namespace}:MATCHMAKING:CHANNEL [Create]
 *
 * <p>Required Scope: social
 *
 * <p>Create and queue mock tickets into specified game mode's pool. The tickets input will be used
 * as is. '
 */
@Getter
@Setter
public class BulkCreateMockTickets extends Operation {
  /** generated field's value */
  private String path =
      "/matchmaking/v1/admin/namespaces/{namespace}/channels/{channelName}/mocks/tickets/bulk";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String channelName;

  private String namespace;
  private List<ModelsMatchingParty> body;

  /**
   * @param channelName required
   * @param namespace required
   * @param body required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public BulkCreateMockTickets(
      String channelName, String namespace, List<ModelsMatchingParty> body) {
    this.channelName = channelName;
    this.namespace = namespace;
    this.body = body;

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
  public List<ModelsMatchingParty> getBodyParams() {
    return this.body;
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }
}
