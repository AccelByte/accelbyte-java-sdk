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
 * adminQueryUsersTopic
 *
 * <p>Get user's topics in a namespace.
 */
@Getter
@Setter
public class AdminQueryUsersTopic extends Operation {
  /** generated field's value */
  private String path = "/chat/admin/namespaces/{namespace}/users/{userId}/topics";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String userId;
  private Boolean includePastTopics;
  private Integer limit;
  private Integer offset;
  private String topicSubType;
  private String topicType;

  /**
   * @param namespace required
   * @param userId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryUsersTopic(
      String namespace,
      String userId,
      Boolean includePastTopics,
      Integer limit,
      Integer offset,
      String topicSubType,
      String topicType) {
    this.namespace = namespace;
    this.userId = userId;
    this.includePastTopics = includePastTopics;
    this.limit = limit;
    this.offset = offset;
    this.topicSubType = topicSubType;
    this.topicType = topicType;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put(
        "includePastTopics",
        this.includePastTopics == null
            ? null
            : Arrays.asList(String.valueOf(this.includePastTopics)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "topicSubType", this.topicSubType == null ? null : Arrays.asList(this.topicSubType));
    queryParams.put("topicType", this.topicType == null ? null : Arrays.asList(this.topicType));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.userId == null) {
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
    result.put("includePastTopics", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("topicSubType", "None");
    result.put("topicType", "None");
    return result;
  }

  public enum TopicSubType {
    CLAN("CLAN"),
    NAMESPACE("NAMESPACE"),
    NORMAL("NORMAL"),
    PARTY("PARTY"),
    SESSION("SESSION");

    private String value;

    TopicSubType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum TopicType {
    GROUP("GROUP"),
    PERSONAL("PERSONAL");

    private String value;

    TopicType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class AdminQueryUsersTopicBuilder {
    private String topicSubType;
    private String topicType;

    public AdminQueryUsersTopicBuilder topicSubType(final String topicSubType) {
      this.topicSubType = topicSubType;
      return this;
    }

    public AdminQueryUsersTopicBuilder topicSubTypeFromEnum(final TopicSubType topicSubType) {
      this.topicSubType = topicSubType.toString();
      return this;
    }

    public AdminQueryUsersTopicBuilder topicType(final String topicType) {
      this.topicType = topicType;
      return this;
    }

    public AdminQueryUsersTopicBuilder topicTypeFromEnum(final TopicType topicType) {
      this.topicType = topicType.toString();
      return this;
    }
  }
}
