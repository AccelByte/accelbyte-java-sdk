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
public class PassInfo extends Model {

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

    @JsonProperty("passItemName")
    private String passItemName;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public PassInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PassInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PassInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("seasonId", "seasonId");
        result.put("code", "code");
        result.put("namespace", "namespace");
        result.put("displayOrder", "displayOrder");
        result.put("autoEnroll", "autoEnroll");
        result.put("passItemId", "passItemId");
        result.put("passItemName", "passItemName");
        result.put("localizations", "localizations");
        result.put("images", "images");
        result.put("createdAt", "createdAt");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}