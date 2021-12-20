package net.accelbyte.sdk.api.social.models;

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
public class GameProfileRequest extends Model {

    @JsonProperty("achievements")
    List<String> achievements;
    @JsonProperty("attributes")
    Map<String, String> attributes;
    @JsonProperty("avatarUrl")
    String avatarUrl;
    @JsonProperty("inventories")
    List<String> inventories;
    @JsonProperty("label")
    String label;
    @JsonProperty("profileName")
    String profileName;
    @JsonProperty("statistics")
    List<String> statistics;
    @JsonProperty("tags")
    List<String> tags;

    public GameProfileRequest createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievements", "achievements");
        result.put("attributes", "attributes");
        result.put("avatarUrl", "avatarUrl");
        result.put("inventories", "inventories");
        result.put("label", "label");
        result.put("profileName", "profileName");
        result.put("statistics", "statistics");
        result.put("tags", "tags");
        return result;
    }
}