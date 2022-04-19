/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.matchmaking.models;

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
public class ModelsAllianceFlexingRule extends Model {

    @JsonProperty("duration")
    private Integer duration;

    @JsonProperty("max_number")
    private Integer maxNumber;

    @JsonProperty("min_number")
    private Integer minNumber;

    @JsonProperty("player_max_number")
    private Integer playerMaxNumber;

    @JsonProperty("player_min_number")
    private Integer playerMinNumber;

    @JsonIgnore
    public ModelsAllianceFlexingRule createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsAllianceFlexingRule> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsAllianceFlexingRule>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("duration", "duration");
        result.put("max_number", "maxNumber");
        result.put("min_number", "minNumber");
        result.put("player_max_number", "playerMaxNumber");
        result.put("player_min_number", "playerMinNumber");
        return result;
    }
}