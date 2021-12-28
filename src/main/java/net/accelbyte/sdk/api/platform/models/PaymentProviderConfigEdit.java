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
public class PaymentProviderConfigEdit extends Model {

    @JsonProperty("aggregate")
    private String aggregate;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("region")
    private String region;

    @JsonProperty("sandboxTaxJarApiToken")
    private String sandboxTaxJarApiToken;

    @JsonProperty("specials")
    private List<String> specials;

    @JsonProperty("taxJarApiToken")
    private String taxJarApiToken;

    @JsonProperty("taxJarEnabled")
    private Boolean taxJarEnabled;

    @JsonProperty("useGlobalTaxJarApiToken")
    private Boolean useGlobalTaxJarApiToken;

    public PaymentProviderConfigEdit createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public List<PaymentProviderConfigEdit> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<PaymentProviderConfigEdit>>() {});
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("aggregate", "aggregate");
        result.put("namespace", "namespace");
        result.put("region", "region");
        result.put("sandboxTaxJarApiToken", "sandboxTaxJarApiToken");
        result.put("specials", "specials");
        result.put("taxJarApiToken", "taxJarApiToken");
        result.put("taxJarEnabled", "taxJarEnabled");
        result.put("useGlobalTaxJarApiToken", "useGlobalTaxJarApiToken");
        return result;
    }
}