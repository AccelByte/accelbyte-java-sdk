package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class RewardCreate extends Model {

    @JsonProperty("description")
    private String description;

    @JsonProperty("eventTopic")
    private String eventTopic;

    @JsonProperty("maxAwarded")
    private Integer maxAwarded;

    @JsonProperty("maxAwardedPerUser")
    private Integer maxAwardedPerUser;

    @JsonProperty("namespaceExpression")
    private String namespaceExpression;

    @JsonProperty("rewardCode")
    private String rewardCode;

    @JsonProperty("rewardConditions")
    private List<RewardCondition> rewardConditions;

    @JsonProperty("userIdExpression")
    private String userIdExpression;

    @JsonIgnore
    public RewardCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<RewardCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<RewardCreate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("eventTopic", "eventTopic");
        result.put("maxAwarded", "maxAwarded");
        result.put("maxAwardedPerUser", "maxAwardedPerUser");
        result.put("namespaceExpression", "namespaceExpression");
        result.put("rewardCode", "rewardCode");
        result.put("rewardConditions", "rewardConditions");
        result.put("userIdExpression", "userIdExpression");
        return result;
    }
}