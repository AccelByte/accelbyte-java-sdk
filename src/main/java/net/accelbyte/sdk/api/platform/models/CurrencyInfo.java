package net.accelbyte.sdk.api.platform.models;

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
public class CurrencyInfo extends Model {

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("currencyCode")
    private String currencyCode;

    @JsonProperty("currencySymbol")
    private String currencySymbol;

    @JsonProperty("currencyType")
    private String currencyType;

    @JsonProperty("decimals")
    private Integer decimals;

    @JsonProperty("localizationDescriptions")
    private Map<String, String> localizationDescriptions;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("updatedAt")
    private String updatedAt;

    public CurrencyInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<CurrencyInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CurrencyInfo>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("createdAt", "createdAt");
        result.put("currencyCode", "currencyCode");
        result.put("currencySymbol", "currencySymbol");
        result.put("currencyType", "currencyType");
        result.put("decimals", "decimals");
        result.put("localizationDescriptions", "localizationDescriptions");
        result.put("namespace", "namespace");
        result.put("updatedAt", "updatedAt");
        return result;
    }
}