/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.leaderboard.models;

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
public class ModelsUserLeaderboardRanking extends Model {

    @JsonProperty("allTime")
    private ModelsUserRankingResponseDetail allTime;

    @JsonProperty("current")
    private ModelsUserRankingResponseDetail current;

    @JsonProperty("daily")
    private ModelsUserRankingResponseDetail daily;

    @JsonProperty("leaderboardCode")
    private String leaderboardCode;

    @JsonProperty("leaderboardName")
    private String leaderboardName;

    @JsonProperty("monthly")
    private ModelsUserRankingResponseDetail monthly;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("weekly")
    private ModelsUserRankingResponseDetail weekly;



    @JsonIgnore
    public ModelsUserLeaderboardRanking createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsUserLeaderboardRanking> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUserLeaderboardRanking>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("allTime", "allTime");
        result.put("current", "current");
        result.put("daily", "daily");
        result.put("leaderboardCode", "leaderboardCode");
        result.put("leaderboardName", "leaderboardName");
        result.put("monthly", "monthly");
        result.put("userId", "userId");
        result.put("weekly", "weekly");
        return result;
    }
    
    public static class ModelsUserLeaderboardRankingBuilder {
        
    }
}