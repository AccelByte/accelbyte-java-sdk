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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ModelsAchievementRequest extends Model {

  @JsonProperty("achievementCode")
  private String achievementCode;

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("defaultLanguage")
  private String defaultLanguage;

  @JsonProperty("description")
  private Map<String, String> description;

  @JsonProperty("global")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean global;

  @JsonProperty("goalValue")
  private Float goalValue;

  @JsonProperty("hidden")
  private Boolean hidden;

  @JsonProperty("incremental")
  private Boolean incremental;

  @JsonProperty("lockedIcons")
  private List<ModelsIcon> lockedIcons;

  @JsonProperty("name")
  private Map<String, String> name;

  @JsonProperty("statCode")
  private String statCode;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("unlockedIcons")
  private List<ModelsIcon> unlockedIcons;

  @JsonIgnore
  public ModelsAchievementRequest createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsAchievementRequest> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsAchievementRequest>>() {});
  }
}
