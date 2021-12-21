package net.accelbyte.sdk.api.platform.models;

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
public class PaymentProviderConfigEdit extends Model {

    @JsonProperty("aggregate")
    String aggregate;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("region")
    String region;
    @JsonProperty("sandboxTaxJarApiToken")
    String sandboxTaxJarApiToken;
    @JsonProperty("specials")
    List<String> specials;
    @JsonProperty("taxJarApiToken")
    String taxJarApiToken;
    @JsonProperty("taxJarEnabled")
    Boolean taxJarEnabled;
    @JsonProperty("useGlobalTaxJarApiToken")
    Boolean useGlobalTaxJarApiToken;

    public PaymentProviderConfigEdit createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
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