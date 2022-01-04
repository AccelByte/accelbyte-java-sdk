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
public class HandlersGetUsersPresenceResponse extends Model {

    @JsonProperty("busy")
    private Integer busy;

    @JsonProperty("data")
    private List<HandlersUserPresence> data;

    @JsonProperty("invisible")
    private Integer invisible;

    @JsonProperty("offline")
    private Integer offline;

    @JsonProperty("online")
    private Integer online;

    @JsonIgnore
    public HandlersGetUsersPresenceResponse createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<HandlersGetUsersPresenceResponse> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<HandlersGetUsersPresenceResponse>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("busy", "busy");
        result.put("data", "data");
        result.put("invisible", "invisible");
        result.put("offline", "offline");
        result.put("online", "online");
        return result;
    }
}