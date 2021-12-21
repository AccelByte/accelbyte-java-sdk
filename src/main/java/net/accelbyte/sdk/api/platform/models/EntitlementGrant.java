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
public class EntitlementGrant extends Model {

    @JsonProperty("endDate")
    String endDate;
    @JsonProperty("grantedCode")
    String grantedCode;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemNamespace")
    String itemNamespace;
    @JsonProperty("language")
    String language;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("region")
    String region;
    @JsonProperty("source")
    String source;
    @JsonProperty("startDate")
    String startDate;
    @JsonProperty("storeId")
    String storeId;

    public EntitlementGrant createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("endDate", "endDate");
        result.put("grantedCode", "grantedCode");
        result.put("itemId", "itemId");
        result.put("itemNamespace", "itemNamespace");
        result.put("language", "language");
        result.put("quantity", "quantity");
        result.put("region", "region");
        result.put("source", "source");
        result.put("startDate", "startDate");
        result.put("storeId", "storeId");
        return result;
    }
}