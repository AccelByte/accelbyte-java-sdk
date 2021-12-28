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
public class LocalizedPassInfo extends Model {

    @JsonProperty("title")
    private String title;

    @JsonProperty("description")
    private String description;

    @JsonProperty("seasonId")
    private String seasonId;

    @JsonProperty("code")
    private String code;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("displayOrder")
    private String displayOrder;

    @JsonProperty("autoEnroll")
    private Boolean autoEnroll;

    @JsonProperty("passItemId")
    private String passItemId;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("language")
    private String language;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public LocalizedPassInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<LocalizedPassInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<LocalizedPassInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("title", "title");
        result.put("description", "description");
        result.put("seasonId", "seasonId");
        result.put("code", "code");
        result.put("namespace", "namespace");
        result.put("displayOrder", "displayOrder");
        result.put("autoEnroll", "autoEnroll");
        result.put("passItemId", "passItemId");
        result.put("images", "images");
        result.put("language", "language");
        result.put("createdAt", "createdAt");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}