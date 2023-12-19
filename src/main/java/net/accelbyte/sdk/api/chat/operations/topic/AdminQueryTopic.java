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
 * adminQueryTopic
 *
 * <p>Get topics in a namespace.
 */
@Getter
@Setter
public class AdminQueryTopic extends Operation {
  /** generated field's value */
  private String path = "/chat/admin/namespaces/{namespace}/topics";

  private String method = "GET";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Boolean includeMembers;
  private Boolean includePastMembers;
  private Boolean includePastTopics;
  private Integer limit;
  private Integer offset;
  private List<String> topic;
  private String topicSubType;
  private String topicType;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public AdminQueryTopic(
      String namespace,
      Boolean includeMembers,
      Boolean includePastMembers,
      Boolean includePastTopics,
      Integer limit,
      Integer offset,
      List<String> topic,
      String topicSubType,
      String topicType,
      String userId) {
    this.namespace = namespace;
    this.includeMembers = includeMembers;
    this.includePastMembers = includePastMembers;
    this.includePastTopics = includePastTopics;
    this.limit = limit;
    this.offset = offset;
    this.topic = topic;
    this.topicSubType = topicSubType;
    this.topicType = topicType;
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
        "includeMembers",
        this.includeMembers == null ? null : Arrays.asList(String.valueOf(this.includeMembers)));
    queryParams.put(
        "includePastMembers",
        this.includePastMembers == null
            ? null
            : Arrays.asList(String.valueOf(this.includePastMembers)));
    queryParams.put(
        "includePastTopics",
        this.includePastTopics == null
            ? null
            : Arrays.asList(String.valueOf(this.includePastTopics)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("topic", this.topic == null ? null : this.topic);
    queryParams.put(
        "topicSubType", this.topicSubType == null ? null : Arrays.asList(this.topicSubType));
    queryParams.put("topicType", this.topicType == null ? null : Arrays.asList(this.topicType));
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

  public List<ModelsTopicInfo> parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsTopicInfo>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("includeMembers", "None");
    result.put("includePastMembers", "None");
    result.put("includePastTopics", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("topic", "multi");
    result.put("topicSubType", "None");
    result.put("topicType", "None");
    result.put("userId", "None");
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

  public static class AdminQueryTopicBuilder {
    private String topicSubType;
    private String topicType;

    public AdminQueryTopicBuilder topicSubType(final String topicSubType) {
      this.topicSubType = topicSubType;
      return this;
    }

    public AdminQueryTopicBuilder topicSubTypeFromEnum(final TopicSubType topicSubType) {
      this.topicSubType = topicSubType.toString();
      return this;
    }

    public AdminQueryTopicBuilder topicType(final String topicType) {
      this.topicType = topicType;
      return this;
    }

    public AdminQueryTopicBuilder topicTypeFromEnum(final TopicType topicType) {
      this.topicType = topicType.toString();
      return this;
    }
  }
}
