package net.accelbyte.sdk.api.platform.models;

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
public class RewardInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("eventTopic")
    private String eventTopic;

    @JsonProperty("maxAwarded")
    private Integer maxAwarded;

    @JsonProperty("maxAwardedPerUser")
    private Integer maxAwardedPerUser;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("rewardCode")
    private String rewardCode;

    @JsonProperty("rewardConditions")
    private List<RewardCondition> rewardConditions;

    @JsonProperty("rewardId")
    private String rewardId;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public RewardInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<RewardInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("eventTopic", "eventTopic");
        result.put("maxAwarded", "maxAwarded");
        result.put("maxAwardedPerUser", "maxAwardedPerUser");
        result.put("namespace", "namespace");
        result.put("rewardCode", "rewardCode");
        result.put("rewardConditions", "rewardConditions");
        result.put("rewardId", "rewardId");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}