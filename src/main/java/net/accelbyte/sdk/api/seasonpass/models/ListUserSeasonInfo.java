/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ListUserSeasonInfo extends Model {

  @JsonProperty("cleared")
  private Boolean cleared;

  @JsonProperty("currentTierIndex")
  private Integer currentTierIndex;

  @JsonProperty("enrolledAt")
  private String enrolledAt;

  @JsonProperty("id")
  private String id;

  @JsonProperty("lastTierIndex")
  private Integer lastTierIndex;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("season")
  private SeasonSummary season;

  @JsonProperty("seasonId")
  private String seasonId;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public ListUserSeasonInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ListUserSeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ListUserSeasonInfo>>() {});
  }
}
