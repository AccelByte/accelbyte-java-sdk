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
public class Tier extends Model {

    @JsonProperty("id")
    String id;
    @JsonProperty("requiredExp")
    Integer requiredExp;
    @JsonProperty("rewards")
    Map<String, List<String>> rewards;

    public Tier createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        result.put("requiredExp", "requiredExp");
        result.put("rewards", "rewards");
        return result;
    }
}