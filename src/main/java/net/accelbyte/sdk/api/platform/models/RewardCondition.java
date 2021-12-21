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
public class RewardCondition extends Model {

    @JsonProperty("condition")
    String condition;
    @JsonProperty("conditionName")
    String conditionName;
    @JsonProperty("eventName")
    String eventName;
    @JsonProperty("rewardItems")
    List<RewardItem> rewardItems;

    public RewardCondition createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("condition", "condition");
        result.put("conditionName", "conditionName");
        result.put("eventName", "eventName");
        result.put("rewardItems", "rewardItems");
        return result;
    }
}