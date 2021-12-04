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
public class UserStatItemInfo extends Model {
    @JsonProperty("createdAt")
    private String createdAt;
    @JsonProperty("namespace")
    private String namespace;
    @JsonProperty("statCode")
    private String statCode;
    @JsonProperty("statName")
    private String statName;
    @JsonProperty("updatedAt")
    private String updatedAt;
    @JsonProperty("userId")
    private String userId;
    @JsonProperty("value")
    private Float value;
    @JsonProperty("tags")
    private List<String> tags;

    public UserStatItemInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("namespace", "namespace");
        result.put("statCode", "statCode");
        result.put("statName", "statName");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("value", "value");
        result.put("tags", "tags");
        return result;
    }
}
