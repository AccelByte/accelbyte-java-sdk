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
public class ModelsChatSnapshots extends Model {

  @JsonProperty("chatId")
  private String chatId;

  @JsonProperty("createdAt")
  private Integer createdAt;

  @JsonProperty("joinedTopics")
  private List<String> joinedTopics;

  @JsonProperty("messages")
  private List<ModelsChatSnapshotMessage> messages;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("senderId")
  private String senderId;

  @JsonProperty("ticketId")
  private String ticketId;

  @JsonProperty("topicId")
  private String topicId;

  @JsonIgnore
  public ModelsChatSnapshots createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsChatSnapshots> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsChatSnapshots>>() {});
  }
}
