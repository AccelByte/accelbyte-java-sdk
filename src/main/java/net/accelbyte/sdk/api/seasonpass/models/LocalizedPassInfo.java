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
public class LocalizedPassInfo extends Model {

    @JsonProperty("title")
    String title;
    @JsonProperty("description")
    String description;
    @JsonProperty("seasonId")
    String seasonId;
    @JsonProperty("code")
    String code;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("displayOrder")
    String displayOrder;
    @JsonProperty("autoEnroll")
    Boolean autoEnroll;
    @JsonProperty("passItemId")
    String passItemId;
    @JsonProperty("images")
    List<Image> images;
    @JsonProperty("language")
    String language;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("updatedAt")
    String updatedAt;

    public LocalizedPassInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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