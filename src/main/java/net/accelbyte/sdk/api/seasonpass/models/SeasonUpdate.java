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
public class SeasonUpdate extends Model {

    @JsonProperty("name")
    String name;
    @JsonProperty("start")
    String start;
    @JsonProperty("end")
    String end;
    @JsonProperty("defaultLanguage")
    String defaultLanguage;
    @JsonProperty("defaultRequiredExp")
    Integer defaultRequiredExp;
    @JsonProperty("draftStoreId")
    String draftStoreId;
    @JsonProperty("tierItemId")
    String tierItemId;
    @JsonProperty("autoClaim")
    Boolean autoClaim;
    @JsonProperty("excessStrategy")
    ExcessStrategy excessStrategy;
    @JsonProperty("localizations")
    Map<String, Localization> localizations;
    @JsonProperty("images")
    List<Image> images;

    public SeasonUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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