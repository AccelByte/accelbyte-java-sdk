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
public class ApiCreateTopicParams extends Model {

  @JsonProperty("admins")
  private List<String> admins;

  @JsonProperty("description")
  private String description;

  @JsonProperty("isChannel")
  private Boolean isChannel;

  @JsonProperty("isJoinable")
  private Boolean isJoinable;

  @JsonProperty("members")
  private List<String> members;

  @JsonProperty("name")
  private String name;

  @JsonProperty("shardLimit")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer shardLimit;

  @JsonProperty("type")
  private String type;

  @JsonIgnore
  public ApiCreateTopicParams createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ApiCreateTopicParams> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ApiCreateTopicParams>>() {});
  }
}
