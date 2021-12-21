package net.accelbyte.sdk.api.platform.models;

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
public class RewardInfo extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("eventTopic")
    String eventTopic;
    @JsonProperty("maxAwarded")
    Integer maxAwarded;
    @JsonProperty("maxAwardedPerUser")
    Integer maxAwardedPerUser;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("rewardCode")
    String rewardCode;
    @JsonProperty("rewardConditions")
    List<RewardCondition> rewardConditions;
    @JsonProperty("rewardId")
    String rewardId;
    @JsonProperty("updatedAt")
    String updatedAt;

    public RewardInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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