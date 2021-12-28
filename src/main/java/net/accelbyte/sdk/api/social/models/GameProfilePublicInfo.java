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
public class GameProfilePublicInfo extends Model {

    @JsonProperty("avatarUrl")
    private String avatarUrl;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("profileId")
    private String profileId;

    @JsonProperty("profileName")
    private String profileName;

    public GameProfilePublicInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<GameProfilePublicInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<GameProfilePublicInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("avatarUrl", "avatarUrl");
        result.put("namespace", "namespace");
        result.put("profileId", "profileId");
        result.put("profileName", "profileName");
        return result;
    }
}