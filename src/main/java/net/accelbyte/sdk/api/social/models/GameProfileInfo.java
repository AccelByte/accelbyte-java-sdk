/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class GameProfileInfo extends Model {

  @JsonProperty("achievements")
  private List<String> achievements;

  @JsonProperty("attributes")
  private Map<String, String> attributes;

  @JsonProperty("avatarUrl")
  private String avatarUrl;

  @JsonProperty("inventories")
  private List<String> inventories;

  @JsonProperty("label")
  private String label;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("profileId")
  private String profileId;

  @JsonProperty("profileName")
  private String profileName;

  @JsonProperty("statistics")
  private List<String> statistics;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public GameProfileInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<GameProfileInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<GameProfileInfo>>() {});
  }
}
