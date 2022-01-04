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
public class SeasonUpdate extends Model {

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

    @JsonProperty("autoClaim")
    private Boolean autoClaim;

    @JsonProperty("excessStrategy")
    private ExcessStrategy excessStrategy;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("images")
    private List<Image> images;

    @JsonIgnore
    public SeasonUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<SeasonUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<SeasonUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("name", "name");
        result.put("start", "start");
        result.put("end", "end");
        result.put("defaultLanguage", "defaultLanguage");
        result.put("defaultRequiredExp", "defaultRequiredExp");
        result.put("draftStoreId", "draftStoreId");
        result.put("tierItemId", "tierItemId");
        result.put("autoClaim", "autoClaim");
        result.put("excessStrategy", "excessStrategy");
        result.put("localizations", "localizations");
        result.put("images", "images");
        return result;
    }
}