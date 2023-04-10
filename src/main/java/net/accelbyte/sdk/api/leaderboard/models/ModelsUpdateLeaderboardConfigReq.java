/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.models;

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
public class ModelsUpdateLeaderboardConfigReq extends Model {

  @JsonProperty("daily")
  private ModelsDailyConfig daily;

  @JsonProperty("descending")
  private Boolean descending;

  @JsonProperty("iconURL")
  private String iconURL;

  @JsonProperty("monthly")
  private ModelsMonthlyConfig monthly;

  @JsonProperty("name")
  private String name;

  @JsonProperty("seasonPeriod")
  private Integer seasonPeriod;

  @JsonProperty("startTime")
  private String startTime;

  @JsonProperty("statCode")
  private String statCode;

  @JsonProperty("weekly")
  private ModelsWeeklyConfig weekly;

  @JsonIgnore
  public ModelsUpdateLeaderboardConfigReq createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsUpdateLeaderboardConfigReq> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsUpdateLeaderboardConfigReq>>() {});
  }
}
