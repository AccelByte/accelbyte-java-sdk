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
 * adminQueryTopicLog
 *
 * <p>Get chat log of topic in a namespace.
 */
@Getter
@Setter
public class AdminQueryTopicLog extends Operation {
  /** generated field's value */
  private String path = "/chat/admin/namespaces/{namespace}/topic/log";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Integer endCreatedAt;
  private Integer limit;
  private Integer offset;
  private String senderUserId;
  private Integer startCreatedAt;
  private String topicId;
  private List<String> topicIds;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryTopicLog(
      String namespace,
      Integer endCreatedAt,
      Integer limit,
      Integer offset,
      String senderUserId,
      Integer startCreatedAt,
      String topicId,
      List<String> topicIds,
      String userId) {
    this.namespace = namespace;
    this.endCreatedAt = endCreatedAt;
    this.limit = limit;
    this.offset = offset;
    this.senderUserId = senderUserId;
    this.startCreatedAt = startCreatedAt;
    this.topicId = topicId;
    this.topicIds = topicIds;
    this.userId = userId;

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
    queryParams.put(
        "endCreatedAt",
        this.endCreatedAt == null ? null : Arrays.asList(String.valueOf(this.endCreatedAt)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "senderUserId", this.senderUserId == null ? null : Arrays.asList(this.senderUserId));
    queryParams.put(
        "startCreatedAt",
        this.startCreatedAt == null ? null : Arrays.asList(String.valueOf(this.startCreatedAt)));
    queryParams.put("topicId", this.topicId == null ? null : Arrays.asList(this.topicId));
    queryParams.put("topicIds", this.topicIds == null ? null : this.topicIds);
    queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ModelsTopicLogWithPaginationResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsTopicLogWithPaginationResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endCreatedAt", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("senderUserId", "None");
    result.put("startCreatedAt", "None");
    result.put("topicId", "None");
    result.put("topicIds", "multi");
    result.put("userId", "None");
    return result;
  }
}
