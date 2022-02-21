/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.api.seasonpass.models;

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
public class ClaimableUserSeasonInfo extends Model {

    @JsonProperty("claimingRewards")
    private Map<String, ?> claimingRewards;

    @JsonProperty("cleared")
    private Boolean cleared;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currentExp")
    private Integer currentExp;

    @JsonProperty("currentTierIndex")
    private Integer currentTierIndex;

    @JsonProperty("enrolledAt")
    private String enrolledAt;

    @JsonProperty("enrolledPasses")
    private List<String> enrolledPasses;

    @JsonProperty("id")
    private String id;

    @JsonProperty("lastTierIndex")
    private Integer lastTierIndex;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("requiredExp")
    private Integer requiredExp;

    @JsonProperty("season")
    private SeasonSummary season;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("toClaimRewards")
    private Map<String, ?> toClaimRewards;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public ClaimableUserSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ClaimableUserSeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ClaimableUserSeasonInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("claimingRewards", "claimingRewards");
        result.put("cleared", "cleared");
        result.put("createdAt", "createdAt");
        result.put("currentExp", "currentExp");
        result.put("currentTierIndex", "currentTierIndex");
        result.put("enrolledAt", "enrolledAt");
        result.put("enrolledPasses", "enrolledPasses");
        result.put("id", "id");
        result.put("lastTierIndex", "lastTierIndex");
        result.put("namespace", "namespace");
        result.put("requiredExp", "requiredExp");
        result.put("season", "season");
        result.put("seasonId", "seasonId");
        result.put("toClaimRewards", "toClaimRewards");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}