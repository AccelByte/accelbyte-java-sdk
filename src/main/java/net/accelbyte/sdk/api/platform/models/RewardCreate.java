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
import java.util.List;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RewardCreate extends Model {

  @JsonProperty("description")
  private String description;

  @JsonProperty("eventTopic")
  private String eventTopic;

  @JsonProperty("maxAwarded")
  private Integer maxAwarded;

  @JsonProperty("maxAwardedPerUser")
  private Integer maxAwardedPerUser;

  @JsonProperty("namespaceExpression")
  private String namespaceExpression;

  @JsonProperty("rewardCode")
  private String rewardCode;

  @JsonProperty("rewardConditions")
  private List<RewardCondition> rewardConditions;

  @JsonProperty("userIdExpression")
  private String userIdExpression;

  @JsonIgnore
  public RewardCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RewardCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RewardCreate>>() {});
  }
}
