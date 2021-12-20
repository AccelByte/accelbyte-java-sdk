package net.accelbyte.sdk.api.seasonpass.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Getter
@Setter
public class ClaimableUserSeasonInfo extends Model {

    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("seasonId")
    String seasonId;
    @JsonProperty("enrolledAt")
    String enrolledAt;
    @JsonProperty("enrolledPasses")
    List<String> enrolledPasses;
    @JsonProperty("currentTierIndex")
    Integer currentTierIndex;
    @JsonProperty("lastTierIndex")
    Integer lastTierIndex;
    @JsonProperty("requiredExp")
    Integer requiredExp;
    @JsonProperty("currentExp")
    Integer currentExp;
    @JsonProperty("cleared")
    Boolean cleared;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("season")
    SeasonSummary season;
    @JsonProperty("toClaimRewards")
    Map<String, ?> toClaimRewards;
    @JsonProperty("claimingRewards")
    Map<String, ?> claimingRewards;

    public ClaimableUserSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("userId", "userId");
        result.put("seasonId", "seasonId");
        result.put("enrolledAt", "enrolledAt");
        result.put("enrolledPasses", "enrolledPasses");
        result.put("currentTierIndex", "currentTierIndex");
        result.put("lastTierIndex", "lastTierIndex");
        result.put("requiredExp", "requiredExp");
        result.put("currentExp", "currentExp");
        result.put("cleared", "cleared");
        result.put("createdAt", "createdAt");
        result.put("updatedAt", "updatedAt");
        result.put("season", "season");
        result.put("toClaimRewards", "toClaimRewards");
        result.put("claimingRewards", "claimingRewards");
        return result;
    }
}