/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.models;

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
public class ModelsUserRankingResponse extends Model {

  @JsonProperty("allTime")
  private ModelsUserRankingResponseDetail allTime;

  @JsonProperty("current")
  private ModelsUserRankingResponseDetail current;

  @JsonProperty("daily")
  private ModelsUserRankingResponseDetail daily;

  @JsonProperty("monthly")
  private ModelsUserRankingResponseDetail monthly;

  @JsonProperty("userId")
  private String userId;

  @JsonProperty("weekly")
  private ModelsUserRankingResponseDetail weekly;

  @JsonIgnore
  public ModelsUserRankingResponse createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsUserRankingResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsUserRankingResponse>>() {});
  }
}
