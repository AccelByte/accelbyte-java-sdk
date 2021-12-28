package net.accelbyte.sdk.api.sessionbrowser.models;

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
public class ModelsRecentPlayerHistory extends Model {

    @JsonProperty("created_at")
    private String createdAt;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("other_display_name")
    private String otherDisplayName;

    @JsonProperty("other_id")
    private String otherId;

    @JsonProperty("updated_at")
    private String updatedAt;

    @JsonProperty("user_id")
    private String userId;

    public ModelsRecentPlayerHistory createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsRecentPlayerHistory> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsRecentPlayerHistory>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("created_at", "createdAt");
        result.put("namespace", "namespace");
        result.put("other_display_name", "otherDisplayName");
        result.put("other_id", "otherId");
        result.put("updated_at", "updatedAt");
        result.put("user_id", "userId");
        return result;
    }
}