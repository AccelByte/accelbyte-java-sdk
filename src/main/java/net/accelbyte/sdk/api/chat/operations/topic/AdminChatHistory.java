/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.operations.topic;

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
 * adminChatHistory
 *
 * <p>Get chat history in a namespace.
 */
@Getter
@Setter
public class AdminChatHistory extends Operation {
  /** generated field's value */
  private String path = "/chat/admin/namespaces/{namespace}/chats";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private List<String> chatId;
  private Integer endCreatedAt;
  private String keyword;
  private Integer limit;
  private Integer offset;
  private String order;
  private String senderUserId;
  private String shardId;
  private Integer startCreatedAt;
  private List<String> topic;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminChatHistory(
      String namespace,
      List<String> chatId,
      Integer endCreatedAt,
      String keyword,
      Integer limit,
      Integer offset,
      String order,
      String senderUserId,
      String shardId,
      Integer startCreatedAt,
      List<String> topic) {
    this.namespace = namespace;
    this.chatId = chatId;
    this.endCreatedAt = endCreatedAt;
    this.keyword = keyword;
    this.limit = limit;
    this.offset = offset;
    this.order = order;
    this.senderUserId = senderUserId;
    this.shardId = shardId;
    this.startCreatedAt = startCreatedAt;
    this.topic = topic;

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
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("chatId", this.chatId == null ? null : this.chatId);
    queryParams.put(
        "endCreatedAt",
        this.endCreatedAt == null ? null : Arrays.asList(String.valueOf(this.endCreatedAt)));
    queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("order", this.order == null ? null : Arrays.asList(this.order));
    queryParams.put(
        "senderUserId", this.senderUserId == null ? null : Arrays.asList(this.senderUserId));
    queryParams.put("shardId", this.shardId == null ? null : Arrays.asList(this.shardId));
    queryParams.put(
        "startCreatedAt",
        this.startCreatedAt == null ? null : Arrays.asList(String.valueOf(this.startCreatedAt)));
    queryParams.put("topic", this.topic == null ? null : this.topic);
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsChatMessageWithPaginationResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsChatMessageWithPaginationResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("chatId", "multi");
    result.put("endCreatedAt", "None");
    result.put("keyword", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("senderUserId", "None");
    result.put("shardId", "None");
    result.put("startCreatedAt", "None");
    result.put("topic", "multi");
    return result;
  }
}
