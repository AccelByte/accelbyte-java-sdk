package net.accelbyte.sdk.api.eventlog.models;

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
public class ModelsUserLastActivity extends Model {

    @JsonProperty("LastActivityTime")
    private String lastActivityTime;

    @JsonProperty("Namespace")
    private String namespace;

    @JsonProperty("UserID")
    private String userID;

    public ModelsUserLastActivity createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsUserLastActivity> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsUserLastActivity>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("LastActivityTime", "lastActivityTime");
        result.put("Namespace", "namespace");
        result.put("UserID", "userID");
        return result;
    }
}