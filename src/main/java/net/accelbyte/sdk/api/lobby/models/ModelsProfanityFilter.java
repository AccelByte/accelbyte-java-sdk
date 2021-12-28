package net.accelbyte.sdk.api.lobby.models;

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
public class ModelsProfanityFilter extends Model {

    @JsonProperty("filter")
    private String filter;

    @JsonProperty("listName")
    private String listName;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("note")
    private String note;

    public ModelsProfanityFilter createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<ModelsProfanityFilter> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ModelsProfanityFilter>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("filter", "filter");
        result.put("listName", "listName");
        result.put("namespace", "namespace");
        result.put("note", "note");
        return result;
    }
}