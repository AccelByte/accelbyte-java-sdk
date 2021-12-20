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
    String createdAt;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("statName")
    String statName;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;
    @JsonProperty("value")
    Float value;

    public UserStatItemInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("namespace", "namespace");
        result.put("statCode", "statCode");
        result.put("statName", "statName");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        result.put("value", "value");
        return result;
    }
}