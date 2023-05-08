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
public class ModelsGetLeaderboardConfigRespV3 extends Model {

  @JsonProperty("allTime")
  private Boolean allTime;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("cycleIds")
  private List<String> cycleIds;

  @JsonProperty("deletedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String deletedAt;

  @JsonProperty("descending")
  private Boolean descending;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("iconURL")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String iconURL;

  @JsonProperty("isDeleted")
  private Boolean isDeleted;

  @JsonProperty("leaderboardCode")
  private String leaderboardCode;

  @JsonProperty("name")
  private String name;

  @JsonProperty("statCode")
  private String statCode;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public ModelsGetLeaderboardConfigRespV3 createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsGetLeaderboardConfigRespV3> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsGetLeaderboardConfigRespV3>>() {});
  }
}
