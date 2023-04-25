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
public class ModelsPublicAchievementResponse extends Model {

  @JsonProperty("achievementCode")
  private String achievementCode;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("customAttributes")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customAttributes;

  @JsonProperty("description")
  private String description;

  @JsonProperty("global")
  private Boolean global;

  @JsonProperty("goalValue")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Float goalValue;

  @JsonProperty("hidden")
  private Boolean hidden;

  @JsonProperty("incremental")
  private Boolean incremental;

  @JsonProperty("listOrder")
  private Integer listOrder;

  @JsonProperty("lockedIcons")
  private List<ModelsIcon> lockedIcons;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("statCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statCode;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("tags")
  private List<String> tags;

  @JsonProperty("unlockedIcons")
  private List<ModelsIcon> unlockedIcons;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonIgnore
  public ModelsPublicAchievementResponse createFromJson(String json)
      throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ModelsPublicAchievementResponse> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ModelsPublicAchievementResponse>>() {});
  }
}
