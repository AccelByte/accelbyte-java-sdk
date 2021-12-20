package net.accelbyte.sdk.api.seasonpass.models;

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
public class ListSeasonInfo extends Model {

    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("name")
    String name;
    @JsonProperty("start")
    String start;
    @JsonProperty("end")
    String end;
    @JsonProperty("defaultLanguage")
    String defaultLanguage;
    @JsonProperty("passCodes")
    List<String> passCodes;
    @JsonProperty("status")
    String status;
    @JsonProperty("publishedAt")
    String publishedAt;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("updatedAt")
    String updatedAt;

    public ListSeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("name", "name");
        result.put("start", "start");
        result.put("end", "end");
        result.put("defaultLanguage", "defaultLanguage");
        result.put("passCodes", "passCodes");
        result.put("status", "status");
        result.put("publishedAt", "publishedAt");
        result.put("createdAt", "createdAt");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}