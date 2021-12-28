package net.accelbyte.sdk.api.seasonpass.models;

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
public class SeasonSummary extends Model {

    @JsonProperty("id")
    private String id;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("name")
    private String name;

    @JsonProperty("start")
    private String start;

    @JsonProperty("end")
    private String end;

    @JsonProperty("passCodes")
    private List<String> passCodes;

    @JsonProperty("status")
    private String status;

    @JsonProperty("publishedAt")
    private String publishedAt;

    @JsonProperty("previous")
    private SeasonSummary previous;

    public SeasonSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<SeasonSummary> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SeasonSummary>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("name", "name");
        result.put("start", "start");
        result.put("end", "end");
        result.put("passCodes", "passCodes");
        result.put("status", "status");
        result.put("publishedAt", "publishedAt");
        result.put("previous", "previous");
        return result;
    }
}