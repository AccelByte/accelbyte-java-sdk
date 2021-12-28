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
public class StatInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("defaultValue")
    private Float defaultValue;

    @JsonProperty("description")
    private String description;

    @JsonProperty("incrementOnly")
    private Boolean incrementOnly;

    @JsonProperty("maximum")
    private Float maximum;

    @JsonProperty("minimum")
    private Float minimum;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("setAsGlobal")
    private Boolean setAsGlobal;

    @JsonProperty("setBy")
    private String setBy;

    @JsonProperty("statCode")
    private String statCode;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public StatInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<StatInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<StatInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("defaultValue", "defaultValue");
        result.put("description", "description");
        result.put("incrementOnly", "incrementOnly");
        result.put("maximum", "maximum");
        result.put("minimum", "minimum");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("setAsGlobal", "setAsGlobal");
        result.put("setBy", "setBy");
        result.put("statCode", "statCode");
        result.put("status", "status");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}