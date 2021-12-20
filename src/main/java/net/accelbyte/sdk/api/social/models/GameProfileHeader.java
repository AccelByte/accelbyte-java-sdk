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
public class GameProfileHeader extends Model {

    @JsonProperty("avatarUrl")
    String avatarUrl;
    @JsonProperty("label")
    String label;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("profileId")
    String profileId;
    @JsonProperty("profileName")
    String profileName;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("userId")
    String userId;

    public GameProfileHeader createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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