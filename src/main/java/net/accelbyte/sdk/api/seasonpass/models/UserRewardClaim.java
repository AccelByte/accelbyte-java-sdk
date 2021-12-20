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
public class UserRewardClaim extends Model {

    @JsonProperty("passCode")
    String passCode;
    @JsonProperty("tierIndex")
    Integer tierIndex;
    @JsonProperty("rewardCode")
    String rewardCode;

    public UserRewardClaim createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("passCode", "passCode");
        result.put("tierIndex", "tierIndex");
        result.put("rewardCode", "rewardCode");
        return result;
    }
}