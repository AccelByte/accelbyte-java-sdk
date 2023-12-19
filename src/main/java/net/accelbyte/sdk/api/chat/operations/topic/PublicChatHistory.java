/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.topic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * publicChatHistory
 *
 * <p>get chat history in a namespace.
 */
@Getter
@Setter
public class PublicChatHistory extends Operation {
  /** generated field's value */
  private String path = "/chat/public/namespaces/{namespace}/topic/{topic}/chats";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String topic;
  private Integer limit;
  private String order;
  private Integer startCreatedAt;

  /**
   * @param namespace required
   * @param topic required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicChatHistory(
      String namespace, String topic, Integer limit, String order, Integer startCreatedAt) {
    this.namespace = namespace;
    this.topic = topic;
    this.limit = limit;
    this.order = order;
    this.startCreatedAt = startCreatedAt;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.topic != null) {
      pathParams.put("topic", this.topic);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put(
        "startCreatedAt",
        this.startCreatedAt == null ? null : Arrays.asList(String.valueOf(this.startCreatedAt)));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.topic == null) {
      return false;
    }
    return true;
  }

  public List<ModelsChatMessageResponse> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsChatMessageResponse>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("order", "None");
    result.put("startCreatedAt", "None");
    return result;
  }
}
