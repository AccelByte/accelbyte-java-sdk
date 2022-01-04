package net.accelbyte.sdk.api.seasonpass.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
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
@JsonIgnoreProperties(ignoreUnknown = true)
public class SeasonInfo extends Model {

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

    @JsonProperty("defaultLanguage")
    private String defaultLanguage;

    @JsonProperty("defaultRequiredExp")
    private Integer defaultRequiredExp;

    @JsonProperty("draftStoreId")
    private String draftStoreId;

    @JsonProperty("tierItemId")
    private String tierItemId;

    @JsonProperty("tierItemName")
    private String tierItemName;

    @JsonProperty("autoClaim")
    private Boolean autoClaim;

    @JsonProperty("excessStrategy")
    private ExcessStrategy excessStrategy;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("passCodes")
    private List<String> passCodes;

    @JsonProperty("status")
    private String status;

    @JsonProperty("publishedAt")
    private String publishedAt;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonIgnore
    public SeasonInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SeasonInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SeasonInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("name", "name");
        result.put("start", "start");
        result.put("end", "end");
        result.put("defaultLanguage", "defaultLanguage");
        result.put("defaultRequiredExp", "defaultRequiredExp");
        result.put("draftStoreId", "draftStoreId");
        result.put("tierItemId", "tierItemId");
        result.put("tierItemName", "tierItemName");
        result.put("autoClaim", "autoClaim");
        result.put("excessStrategy", "excessStrategy");
        result.put("localizations", "localizations");
        result.put("images", "images");
        result.put("passCodes", "passCodes");
        result.put("status", "status");
        result.put("publishedAt", "publishedAt");
        result.put("createdAt", "createdAt");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}