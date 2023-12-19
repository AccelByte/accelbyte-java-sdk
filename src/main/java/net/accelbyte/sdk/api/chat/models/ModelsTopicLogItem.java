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
public class ModelsTopicLogItem extends Model {

  @JsonProperty("createdAt")
  private Integer createdAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("message")
  private String message;

  @JsonProperty("senderId")
  private String senderId;

  @JsonProperty("topicId")
  private String topicId;

  @JsonProperty("type")
  private String type;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public String getType() {
    return this.type;
  }

  @JsonIgnore
  public Type getTypeAsEnum() {
    return Type.valueOf(this.type);
  }

  @JsonIgnore
  public void setType(final String type) {
    this.type = type;
  }

  @JsonIgnore
  public void setTypeFromEnum(final Type type) {
    this.type = type.toString();
  }

  @JsonIgnore
  public ModelsTopicLogItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsTopicLogItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsTopicLogItem>>() {});
  }

  public enum Type {
    TOPICCREATE("TOPIC_CREATE"),
    TOPICDELETE("TOPIC_DELETE"),
    TOPICJOIN("TOPIC_JOIN"),
    TOPICLEAVE("TOPIC_LEAVE");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class ModelsTopicLogItemBuilder {
    private String type;

    public ModelsTopicLogItemBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public ModelsTopicLogItemBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
