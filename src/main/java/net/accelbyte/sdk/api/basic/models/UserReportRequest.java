package net.accelbyte.sdk.api.basic.models;

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
public class UserReportRequest extends Model {

    @JsonProperty("category")
    String category;
    @JsonProperty("description")
    String description;
    @JsonProperty("gameSessionId")
    String gameSessionId;
    @JsonProperty("subcategory")
    String subcategory;
    @JsonProperty("userId")
    String userId;

    public UserReportRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("category", "category");
        result.put("description", "description");
        result.put("gameSessionId", "gameSessionId");
        result.put("subcategory", "subcategory");
        result.put("userId", "userId");
        return result;
    }
}