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
 * adminTopicChatHistory
 *
 * <p>Get chat history in a namespace.
 *
 * @deprecated
 */
@Deprecated
@Getter
@Setter
public class AdminTopicChatHistory extends Operation {
  /** generated field's value */
  private String path = "/chat/admin/namespaces/{namespace}/topic/{topic}/chats";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String topic;
  private Integer endCreatedAt;
  private String keyword;
  private Integer limit;
  private Integer offset;
  private String order;
  private String senderUserId;
  private String shardId;
  private Integer startCreatedAt;

  /**
   * @param namespace required
   * @param topic required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminTopicChatHistory(
      String namespace,
      String topic,
      Integer endCreatedAt,
      String keyword,
      Integer limit,
      Integer offset,
      String order,
      String senderUserId,
      String shardId,
      Integer startCreatedAt) {
    this.namespace = namespace;
    this.topic = topic;
    this.endCreatedAt = endCreatedAt;
    this.keyword = keyword;
    this.limit = limit;
    this.offset = offset;
    this.order = order;
    this.senderUserId = senderUserId;
    this.shardId = shardId;
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
    result.put("endCreatedAt", "None");
    result.put("keyword", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("order", "None");
    result.put("senderUserId", "None");
    result.put("shardId", "None");
    result.put("startCreatedAt", "None");
    return result;
  }
}
