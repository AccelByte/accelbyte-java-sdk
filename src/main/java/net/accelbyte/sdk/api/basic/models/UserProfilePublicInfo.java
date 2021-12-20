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
public class UserProfilePublicInfo extends Model {

    @JsonProperty("avatarLargeUrl")
    String avatarLargeUrl;
    @JsonProperty("avatarSmallUrl")
    String avatarSmallUrl;
    @JsonProperty("avatarUrl")
    String avatarUrl;
    @JsonProperty("customAttributes")
    Map<String, ?> customAttributes;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("timeZone")
    String timeZone;
    @JsonProperty("userId")
    String userId;

    public UserProfilePublicInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("avatarLargeUrl", "avatarLargeUrl");
        result.put("avatarSmallUrl", "avatarSmallUrl");
        result.put("avatarUrl", "avatarUrl");
        result.put("customAttributes", "customAttributes");
        result.put("namespace", "namespace");
        result.put("timeZone", "timeZone");
        result.put("userId", "userId");
        return result;
    }
}