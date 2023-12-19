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
public class ModelsChannelTopicResponse extends Model {

  @JsonProperty("createdAt")
  private Integer createdAt;

  @JsonProperty("createdBy")
  private String createdBy;

  @JsonProperty("description")
  private String description;

  @JsonProperty("isJoinable")
  private Boolean isJoinable;

  @JsonProperty("messagePerMinutes")
  private Float messagePerMinutes;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("shardLimit")
  private Integer shardLimit;

  @JsonProperty("shardNumber")
  private Integer shardNumber;

  @JsonProperty("topicId")
  private String topicId;

  @JsonProperty("totalMember")
  private Integer totalMember;

  @JsonIgnore
  public ModelsChannelTopicResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsChannelTopicResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsChannelTopicResponse>>() {});
  }
}
