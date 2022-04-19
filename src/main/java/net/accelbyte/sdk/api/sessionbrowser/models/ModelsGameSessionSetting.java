/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsGameSessionSetting extends Model {

    @JsonProperty("allow_join_in_progress")
    private Boolean allowJoinInProgress;

    @JsonProperty("current_internal_player")
    private Integer currentInternalPlayer;

    @JsonProperty("current_player")
    private Integer currentPlayer;

    @JsonProperty("map_name")
    private String mapName;

    @JsonProperty("max_internal_player")
    private Integer maxInternalPlayer;

    @JsonProperty("max_player")
    private Integer maxPlayer;

    @JsonProperty("mode")
    private String mode;

    @JsonProperty("num_bot")
    private Integer numBot;

    @JsonProperty("password")
    private String password;

    @JsonProperty("settings")
    private Map<String, ?> settings;

    @JsonIgnore
    public ModelsGameSessionSetting createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsGameSessionSetting> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsGameSessionSetting>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allow_join_in_progress", "allowJoinInProgress");
        result.put("current_internal_player", "currentInternalPlayer");
        result.put("current_player", "currentPlayer");
        result.put("map_name", "mapName");
        result.put("max_internal_player", "maxInternalPlayer");
        result.put("max_player", "maxPlayer");
        result.put("mode", "mode");
        result.put("num_bot", "numBot");
        result.put("password", "password");
        result.put("settings", "settings");
        return result;
    }
}