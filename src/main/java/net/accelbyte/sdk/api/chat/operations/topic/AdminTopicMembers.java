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
 * adminTopicMembers
 *
 * <p>Get topic members.
 */
@Getter
@Setter
public class AdminTopicMembers extends Operation {
  /** generated field's value */
  private String path = "/chat/admin/namespaces/{namespace}/topic/{topic}/members";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String topic;
  private Boolean isBanned;
  private Boolean isModerator;
  private Integer limit;
  private Integer offset;
  private String shardId;

  /**
   * @param namespace required
   * @param topic required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminTopicMembers(
      String namespace,
      String topic,
      Boolean isBanned,
      Boolean isModerator,
      Integer limit,
      Integer offset,
      String shardId) {
    this.namespace = namespace;
    this.topic = topic;
    this.isBanned = isBanned;
    this.isModerator = isModerator;
    this.limit = limit;
    this.offset = offset;
    this.shardId = shardId;

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
        "isBanned", this.isBanned == null ? null : Arrays.asList(String.valueOf(this.isBanned)));
    queryParams.put(
        "isModerator",
        this.isModerator == null ? null : Arrays.asList(String.valueOf(this.isModerator)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("shardId", this.shardId == null ? null : Arrays.asList(this.shardId));
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

  public ModelsTopicMemberWithPaginationResponse parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ModelsTopicMemberWithPaginationResponse().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("isBanned", "None");
    result.put("isModerator", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("shardId", "None");
    return result;
  }
}
