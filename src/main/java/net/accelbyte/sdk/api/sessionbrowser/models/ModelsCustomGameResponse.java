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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsCustomGameResponse extends Model {

    @JsonProperty("all_players")
    private List<String> allPlayers;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("game_session_setting")
    private ModelsGameSessionSetting gameSessionSetting;

    @JsonProperty("joinable")
    private Boolean joinable;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("players")
    private List<String> players;

    @JsonProperty("server")
    private ModelsServer server;

    @JsonProperty("session_id")
    private String sessionId;

    @JsonProperty("session_type")
    private String sessionType;

    @JsonProperty("spectators")
    private List<String> spectators;



    @JsonIgnore
    public ModelsCustomGameResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsCustomGameResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsCustomGameResponse>>() {});
    }

    
}