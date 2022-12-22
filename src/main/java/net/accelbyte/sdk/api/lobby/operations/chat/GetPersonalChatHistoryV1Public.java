/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.operations.chat;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * getPersonalChatHistoryV1Public
 *
 * <p>Required valid user authorization
 *
 * <p>load personal chat history in a namespace based on Friend User ID
 *
 * <p>Action Code: 50101
 */
@Getter
@Setter
public class GetPersonalChatHistoryV1Public extends Operation {
  /** generated field's value */
  private String path = "/lobby/v1/public/chat/namespaces/{namespace}/users/me/friends/{friendId}";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String friendId;

  private String namespace;

  /**
   * @param friendId required
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetPersonalChatHistoryV1Public(String friendId, String namespace) {
    this.friendId = friendId;
    this.namespace = namespace;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.friendId != null) {
      pathParams.put("friendId", this.friendId);
    }
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public boolean isValid() {
    if (this.friendId == null) {
      return false;
    }
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public List<ModelChatMessageResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelChatMessageResponse>>() {});
  }
}
