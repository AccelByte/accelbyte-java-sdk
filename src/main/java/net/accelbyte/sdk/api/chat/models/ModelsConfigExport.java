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
public class ModelsConfigExport extends Model {

  @JsonProperty("chatRateLimitBurst")
  private Integer chatRateLimitBurst;

  @JsonProperty("chatRateLimitDuration")
  private Long chatRateLimitDuration;

  @JsonProperty("concurrentUsersLimit")
  private Integer concurrentUsersLimit;

  @JsonProperty("enableClanChat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableClanChat;

  @JsonProperty("enableManualTopicCreation")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableManualTopicCreation;

  @JsonProperty("enablePmSendPlatformId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enablePmSendPlatformId;

  @JsonProperty("enableProfanityFilter")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableProfanityFilter;

  @JsonProperty("filterAppName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String filterAppName;

  @JsonProperty("filterParam")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String filterParam;

  @JsonProperty("filterType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String filterType;

  @JsonProperty("generalRateLimitBurst")
  private Integer generalRateLimitBurst;

  @JsonProperty("generalRateLimitDuration")
  private Long generalRateLimitDuration;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("shardCapacityLimit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer shardCapacityLimit;

  @JsonProperty("shardDefaultLimit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer shardDefaultLimit;

  @JsonProperty("shardHardLimit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer shardHardLimit;

  @JsonProperty("spamChatBurst")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer spamChatBurst;

  @JsonProperty("spamChatDuration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long spamChatDuration;

  @JsonProperty("spamMuteDuration")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long spamMuteDuration;

  @JsonIgnore
  public ModelsConfigExport createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsConfigExport> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsConfigExport>>() {});
  }
}
