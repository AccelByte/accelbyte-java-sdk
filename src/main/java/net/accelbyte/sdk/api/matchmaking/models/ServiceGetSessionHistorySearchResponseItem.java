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
public class ServiceGetSessionHistorySearchResponseItem extends Model {

    @JsonProperty("_id")
    private String id;

    @JsonProperty("channel")
    private String channel;

    @JsonProperty("client_version")
    private String clientVersion;

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("event_description")
    private String eventDescription;

    @JsonProperty("event_name")
    private String eventName;

    @JsonProperty("game_mode")
    private String gameMode;

    @JsonProperty("joinable")
    private Boolean joinable;

    @JsonProperty("match_id")
    private String matchId;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("party_id")
    private String partyId;

    @JsonProperty("region")
    private String region;

    @JsonProperty("server_name")
    private String serverName;

    @JsonProperty("status")
    private String status;

    @JsonProperty("sub_game_mode")
    private List<String> subGameMode;

    @JsonIgnore
    public ServiceGetSessionHistorySearchResponseItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ServiceGetSessionHistorySearchResponseItem> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ServiceGetSessionHistorySearchResponseItem>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("_id", "id");
        result.put("channel", "channel");
        result.put("client_version", "clientVersion");
        result.put("created_at", "createdAt");
        result.put("event_description", "eventDescription");
        result.put("event_name", "eventName");
        result.put("game_mode", "gameMode");
        result.put("joinable", "joinable");
        result.put("match_id", "matchId");
        result.put("namespace", "namespace");
        result.put("party_id", "partyId");
        result.put("region", "region");
        result.put("server_name", "serverName");
        result.put("status", "status");
        result.put("sub_game_mode", "subGameMode");
        return result;
    }
}