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
public class ModelsPublicConfigResponse extends Model {

  @JsonProperty("chatRateLimitBurst")
  private Integer chatRateLimitBurst;

  @JsonProperty("chatRateLimitDuration")
  private Integer chatRateLimitDuration;

  @JsonProperty("generalRateLimitBurst")
  private Integer generalRateLimitBurst;

  @JsonProperty("generalRateLimitDuration")
  private Integer generalRateLimitDuration;

  @JsonProperty("maxChatMessageLength")
  private Integer maxChatMessageLength;

  @JsonProperty("spamChatBurst")
  private Integer spamChatBurst;

  @JsonProperty("spamChatDuration")
  private Integer spamChatDuration;

  @JsonProperty("spamMuteDuration")
  private Integer spamMuteDuration;

  @JsonIgnore
  public ModelsPublicConfigResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsPublicConfigResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsPublicConfigResponse>>() {});
  }
}
