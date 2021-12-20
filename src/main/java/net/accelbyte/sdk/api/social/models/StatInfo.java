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
public class StatInfo extends Model {

    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("defaultValue")
    Float defaultValue;
    @JsonProperty("description")
    String description;
    @JsonProperty("incrementOnly")
    Boolean incrementOnly;
    @JsonProperty("maximum")
    Float maximum;
    @JsonProperty("minimum")
    Float minimum;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("setAsGlobal")
    Boolean setAsGlobal;
    @JsonProperty("setBy")
    String setBy;
    @JsonProperty("statCode")
    String statCode;
    @JsonProperty("status")
    String status;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("updatedAt")
    String updatedAt;

    public StatInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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