/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class ClaimableUserSeasonInfo extends Model {

  @JsonProperty("claimingRewards")
  private Map<String, ?> claimingRewards;

  @JsonProperty("cleared")
  private Boolean cleared;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("currentExp")
  private Integer currentExp;

  @JsonProperty("currentTierIndex")
  private Integer currentTierIndex;

  @JsonProperty("enrolledAt")
  private String enrolledAt;

  @JsonProperty("enrolledPasses")
  private List<String> enrolledPasses;

  @JsonProperty("id")
  private String id;

  @JsonProperty("lastTierIndex")
  private Integer lastTierIndex;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("requiredExp")
  private Integer requiredExp;

  @JsonProperty("season")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private SeasonSummary season;

  @JsonProperty("seasonId")
  private String seasonId;

  @JsonProperty("toClaimRewards")
  private Map<String, ?> toClaimRewards;

  @JsonProperty("totalExp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalExp;

  @JsonProperty("totalPaidForExp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalPaidForExp;

  @JsonProperty("totalSweatExp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer totalSweatExp;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public ClaimableUserSeasonInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ClaimableUserSeasonInfo> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ClaimableUserSeasonInfo>>() {});
  }
}
