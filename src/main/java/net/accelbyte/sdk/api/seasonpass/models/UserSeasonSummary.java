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
public class UserSeasonSummary extends Model {

  @JsonProperty("cleared")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean cleared;

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("currentExp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer currentExp;

  @JsonProperty("currentTierIndex")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer currentTierIndex;

  @JsonProperty("enrolledAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String enrolledAt;

  @JsonProperty("enrolledPasses")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> enrolledPasses;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("lastTierIndex")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer lastTierIndex;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("requiredExp")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer requiredExp;

  @JsonProperty("seasonId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String seasonId;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String updatedAt;

  @JsonProperty("userId")
  private String userId;

  @JsonIgnore
  public UserSeasonSummary createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<UserSeasonSummary> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<UserSeasonSummary>>() {});
  }
}
