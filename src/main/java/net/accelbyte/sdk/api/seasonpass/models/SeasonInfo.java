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

    @JsonProperty("autoClaim")
    private Boolean autoClaim;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("defaultLanguage")
    private String defaultLanguage;

    @JsonProperty("defaultRequiredExp")
    private Integer defaultRequiredExp;

    @JsonProperty("draftStoreId")
    private String draftStoreId;

    @JsonProperty("end")
    private String end;

    @JsonProperty("excessStrategy")
    private ExcessStrategy excessStrategy;

    @JsonProperty("id")
    private String id;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("passCodes")
    private List<String> passCodes;

    @JsonProperty("publishedAt")
    private String publishedAt;

    @JsonProperty("start")
    private String start;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tierItemId")
    private String tierItemId;

    @JsonProperty("tierItemName")
    private String tierItemName;

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
        result.put("autoClaim", "autoClaim");
        result.put("createdAt", "createdAt");
        result.put("defaultLanguage", "defaultLanguage");
        result.put("defaultRequiredExp", "defaultRequiredExp");
        result.put("draftStoreId", "draftStoreId");
        result.put("end", "end");
        result.put("excessStrategy", "excessStrategy");
        result.put("id", "id");
        result.put("images", "images");
        result.put("localizations", "localizations");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("passCodes", "passCodes");
        result.put("publishedAt", "publishedAt");
        result.put("start", "start");
        result.put("status", "status");
        result.put("tierItemId", "tierItemId");
        result.put("tierItemName", "tierItemName");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}