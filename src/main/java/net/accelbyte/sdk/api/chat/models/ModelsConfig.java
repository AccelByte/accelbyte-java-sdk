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
public class ModelsConfig extends Model {

  @JsonProperty("ChatRateLimitBurst")
  private Integer chatRateLimitBurst;

  @JsonProperty("ChatRateLimitDuration")
  private Integer chatRateLimitDuration;

  @JsonProperty("ConcurrentUsersLimit")
  private Integer concurrentUsersLimit;

  @JsonProperty("EnableManualTopicCreation")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableManualTopicCreation;

  @JsonProperty("EnableProfanityFilter")
  private Boolean enableProfanityFilter;

  @JsonProperty("FilterAppName")
  private String filterAppName;

  @JsonProperty("FilterParam")
  private String filterParam;

  @JsonProperty("FilterType")
  private String filterType;

  @JsonProperty("GeneralRateLimitBurst")
  private Integer generalRateLimitBurst;

  @JsonProperty("GeneralRateLimitDuration")
  private Integer generalRateLimitDuration;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("ShardCapacityLimit")
  private Integer shardCapacityLimit;

  @JsonProperty("ShardDefaultLimit")
  private Integer shardDefaultLimit;

  @JsonProperty("ShardHardLimit")
  private Integer shardHardLimit;

  @JsonProperty("SpamChatBurst")
  private Integer spamChatBurst;

  @JsonProperty("SpamChatDuration")
  private Integer spamChatDuration;

  @JsonProperty("SpamMuteDuration")
  private Integer spamMuteDuration;

  @JsonProperty("defaultDictionaryLoaded")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean defaultDictionaryLoaded;

  @JsonProperty("enableClanChat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean enableClanChat;

  @JsonProperty("useDefaultDictionary")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean useDefaultDictionary;

  @JsonIgnore
  public ModelsConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsConfig>>() {});
  }
}
