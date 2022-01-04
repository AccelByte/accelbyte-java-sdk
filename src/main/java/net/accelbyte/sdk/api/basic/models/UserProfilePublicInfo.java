package net.accelbyte.sdk.api.basic.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class UserProfilePublicInfo extends Model {

    @JsonProperty("avatarLargeUrl")
    private String avatarLargeUrl;

    @JsonProperty("avatarSmallUrl")
    private String avatarSmallUrl;

    @JsonProperty("avatarUrl")
    private String avatarUrl;

    @JsonProperty("customAttributes")
    private Map<String, ?> customAttributes;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("timeZone")
    private String timeZone;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public UserProfilePublicInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<UserProfilePublicInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<UserProfilePublicInfo>>() {});
    }

    @JsonIgnore
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