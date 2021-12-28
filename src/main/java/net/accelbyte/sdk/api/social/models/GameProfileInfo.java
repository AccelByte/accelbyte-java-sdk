package net.accelbyte.sdk.api.social.models;

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
public class GameProfileInfo extends Model {

    @JsonProperty("achievements")
    private List<String> achievements;

    @JsonProperty("attributes")
    private Map<String, String> attributes;

    @JsonProperty("avatarUrl")
    private String avatarUrl;

    @JsonProperty("inventories")
    private List<String> inventories;

    @JsonProperty("label")
    private String label;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("profileId")
    private String profileId;

    @JsonProperty("profileName")
    private String profileName;

    @JsonProperty("statistics")
    private List<String> statistics;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("userId")
    private String userId;

    public GameProfileInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<GameProfileInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<GameProfileInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("achievements", "achievements");
        result.put("attributes", "attributes");
        result.put("avatarUrl", "avatarUrl");
        result.put("inventories", "inventories");
        result.put("label", "label");
        result.put("namespace", "namespace");
        result.put("profileId", "profileId");
        result.put("profileName", "profileName");
        result.put("statistics", "statistics");
        result.put("tags", "tags");
        result.put("userId", "userId");
        return result;
    }
}