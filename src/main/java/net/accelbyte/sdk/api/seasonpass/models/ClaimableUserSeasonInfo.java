package net.accelbyte.sdk.api.seasonpass.models;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
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
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("userId")
    private String userId;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("enrolledAt")
    private String enrolledAt;

    @JsonProperty("enrolledPasses")
    private List<String> enrolledPasses;

    @JsonProperty("currentTierIndex")
    private Integer currentTierIndex;

    @JsonProperty("lastTierIndex")
    private Integer lastTierIndex;

    @JsonProperty("requiredExp")
    private Integer requiredExp;

    @JsonProperty("currentExp")
    private Integer currentExp;

    @JsonProperty("cleared")
    private Boolean cleared;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("season")
    private SeasonSummary season;

    @JsonProperty("toClaimRewards")
    private Map<String, ?> toClaimRewards;

    @JsonProperty("claimingRewards")
    private Map<String, ?> claimingRewards;

    public ClaimableUserSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ClaimableUserSeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ClaimableUserSeasonInfo>>() {});
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