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
public class GameProfileHeader extends Model {

    @JsonProperty("avatarUrl")
    private String avatarUrl;

    @JsonProperty("label")
    private String label;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("profileId")
    private String profileId;

    @JsonProperty("profileName")
    private String profileName;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("userId")
    private String userId;

    public GameProfileHeader createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<GameProfileHeader> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<GameProfileHeader>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("avatarUrl", "avatarUrl");
        result.put("label", "label");
        result.put("namespace", "namespace");
        result.put("profileId", "profileId");
        result.put("profileName", "profileName");
        result.put("tags", "tags");
        result.put("userId", "userId");
        return result;
    }
}