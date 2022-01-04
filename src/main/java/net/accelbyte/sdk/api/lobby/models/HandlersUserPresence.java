package net.accelbyte.sdk.api.lobby.models;

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
public class HandlersUserPresence extends Model {

    @JsonProperty("activity")
    private String activity;

    @JsonProperty("availability")
    private String availability;

    @JsonProperty("lastSeenAt")
    private String lastSeenAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("userID")
    private String userID;

    @JsonIgnore
    public HandlersUserPresence createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<HandlersUserPresence> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<HandlersUserPresence>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("activity", "activity");
        result.put("availability", "availability");
        result.put("lastSeenAt", "lastSeenAt");
        result.put("namespace", "namespace");
        result.put("userID", "userID");
        return result;
    }
}