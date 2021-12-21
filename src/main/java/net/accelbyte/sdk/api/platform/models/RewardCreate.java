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
public class RewardCreate extends Model {

    @JsonProperty("description")
    String description;
    @JsonProperty("eventTopic")
    String eventTopic;
    @JsonProperty("maxAwarded")
    Integer maxAwarded;
    @JsonProperty("maxAwardedPerUser")
    Integer maxAwardedPerUser;
    @JsonProperty("rewardCode")
    String rewardCode;
    @JsonProperty("rewardConditions")
    List<RewardCondition> rewardConditions;

    public RewardCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("eventTopic", "eventTopic");
        result.put("maxAwarded", "maxAwarded");
        result.put("maxAwardedPerUser", "maxAwardedPerUser");
        result.put("rewardCode", "rewardCode");
        result.put("rewardConditions", "rewardConditions");
        return result;
    }
}