package net.accelbyte.sdk.api.platform.models;

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
public class CampaignDynamicInfo extends Model {

    @JsonProperty("availableSaleCount")
    private Integer availableSaleCount;

    @JsonProperty("lastBatchNo")
    private Integer lastBatchNo;

    @JsonProperty("quantity")
    private Integer quantity;

    @JsonProperty("remainder")
    private Integer remainder;

    @JsonProperty("saleCount")
    private Integer saleCount;

    @JsonIgnore
    public CampaignDynamicInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<CampaignDynamicInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CampaignDynamicInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("availableSaleCount", "availableSaleCount");
        result.put("lastBatchNo", "lastBatchNo");
        result.put("quantity", "quantity");
        result.put("remainder", "remainder");
        result.put("saleCount", "saleCount");
        return result;
    }
}