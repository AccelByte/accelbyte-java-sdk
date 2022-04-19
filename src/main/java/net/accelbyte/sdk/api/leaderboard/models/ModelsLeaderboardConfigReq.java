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
import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ModelsLeaderboardConfigReq extends Model {

    @JsonProperty("daily")
    private ModelsDailyConfig daily;

    @JsonProperty("descending")
    private Boolean descending;

    @JsonProperty("iconURL")
    private String iconURL;

    @JsonProperty("leaderboardCode")
    private String leaderboardCode;

    @JsonProperty("monthly")
    private ModelsMonthlyConfig monthly;

    @JsonProperty("name")
    private String name;

    @JsonProperty("seasonPeriod")
    private Integer seasonPeriod;

    @JsonProperty("startTime")
    private String startTime;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("weekly")
    private ModelsWeeklyConfig weekly;

    @JsonIgnore
    public ModelsLeaderboardConfigReq createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ModelsLeaderboardConfigReq> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsLeaderboardConfigReq>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("daily", "daily");
        result.put("descending", "descending");
        result.put("iconURL", "iconURL");
        result.put("leaderboardCode", "leaderboardCode");
        result.put("monthly", "monthly");
        result.put("name", "name");
        result.put("seasonPeriod", "seasonPeriod");
        result.put("startTime", "startTime");
        result.put("statCode", "statCode");
        result.put("weekly", "weekly");
        return result;
    }
}