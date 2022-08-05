/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.achievement.models;

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
@AllArgsConstructor
@NoArgsConstructor
public class ModelsAchievement extends Model {

  @JsonProperty("AchievementCode")
  private String achievementCode;

  @JsonProperty("CreatedAt")
  private String createdAt;

  @JsonProperty("DefaultLanguage")
  private String defaultLanguage;

  @JsonProperty("Description")
  private Map<String, String> description;

  @JsonProperty("GoalValue")
  private Float goalValue;

  @JsonProperty("Hidden")
  private Boolean hidden;

  @JsonProperty("ID")
  private String id;

  @JsonProperty("Incremental")
  private Boolean incremental;

  @JsonProperty("ListOrder")
  private Integer listOrder;

  @JsonProperty("LockedIcons")
  private List<ModelsIcon> lockedIcons;

  @JsonProperty("Name")
  private Map<String, String> name;

  @JsonProperty("Namespace")
  private String namespace;

  @JsonProperty("StatCode")
  private String statCode;

  @JsonProperty("Tags")
  private List<String> tags;

  @JsonProperty("UnlockedIcons")
  private List<ModelsIcon> unlockedIcons;

  @JsonProperty("UpdatedAt")
  private String updatedAt;

  @JsonIgnore
  public ModelsAchievement createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsAchievement> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAchievement>>() {});
  }
}
