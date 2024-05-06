/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsMessageRequest extends Model {

  @JsonProperty("message")
  private String message;

  @JsonProperty("timestamp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer timestamp;

  @JsonProperty("topicId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String topicId;

  @JsonProperty("topicType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String topicType;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonIgnore
  public String getTopicType() {
    return this.topicType;
  }

  @JsonIgnore
  public TopicType getTopicTypeAsEnum() {
    return TopicType.valueOf(this.topicType);
  }

  @JsonIgnore
  public void setTopicType(final String topicType) {
    this.topicType = topicType;
  }

  @JsonIgnore
  public void setTopicTypeFromEnum(final TopicType topicType) {
    this.topicType = topicType.toString();
  }

  @JsonIgnore
  public ModelsMessageRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsMessageRequest> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsMessageRequest>>() {});
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

  public static class ModelsMessageRequestBuilder {
    private String topicType;

    public ModelsMessageRequestBuilder topicType(final String topicType) {
      this.topicType = topicType;
      return this;
    }

    public ModelsMessageRequestBuilder topicTypeFromEnum(final TopicType topicType) {
      this.topicType = topicType.toString();
      return this;
    }
  }
}
