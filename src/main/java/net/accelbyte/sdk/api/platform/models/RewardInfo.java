/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

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
public class RewardInfo extends Model {

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("description")
  private String description;

  @JsonProperty("eventTopic")
  private String eventTopic;

  @JsonProperty("maxAwarded")
  private Integer maxAwarded;

  @JsonProperty("maxAwardedPerUser")
  private Integer maxAwardedPerUser;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("namespaceExpression")
  private String namespaceExpression;

  @JsonProperty("rewardCode")
  private String rewardCode;

  @JsonProperty("rewardConditions")
  private List<RewardCondition> rewardConditions;

  @JsonProperty("rewardId")
  private String rewardId;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("userIdExpression")
  private String userIdExpression;

  @JsonIgnore
  public RewardInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RewardInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RewardInfo>>() {});
  }
}
