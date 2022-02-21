/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.achievement.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.*;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsAdditionalInfo extends Model {

    @JsonProperty("numberOfAchievements")
    private Integer numberOfAchievements;

    @JsonProperty("numberOfHiddenAchievements")
    private Integer numberOfHiddenAchievements;

    @JsonProperty("numberOfVisibleAchievements")
    private Integer numberOfVisibleAchievements;

    @JsonIgnore
    public ModelsAdditionalInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsAdditionalInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAdditionalInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("numberOfAchievements", "numberOfAchievements");
        result.put("numberOfHiddenAchievements", "numberOfHiddenAchievements");
        result.put("numberOfVisibleAchievements", "numberOfVisibleAchievements");
        return result;
    }
}