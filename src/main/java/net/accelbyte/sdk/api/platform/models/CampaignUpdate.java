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
public class CampaignUpdate extends Model {

    @JsonProperty("description")
    private String description;

    @JsonProperty("items")
    private List<RedeemableItem> items;

    @JsonProperty("maxRedeemCountPerCampaignPerUser")
    private Integer maxRedeemCountPerCampaignPerUser;

    @JsonProperty("maxRedeemCountPerCode")
    private Integer maxRedeemCountPerCode;

    @JsonProperty("maxRedeemCountPerCodePerUser")
    private Integer maxRedeemCountPerCodePerUser;

    @JsonProperty("maxSaleCount")
    private Integer maxSaleCount;

    @JsonProperty("name")
    private String name;

    @JsonProperty("redeemEnd")
    private String redeemEnd;

    @JsonProperty("redeemStart")
    private String redeemStart;

    @JsonProperty("redeemType")
    private String redeemType;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonIgnore
    public CampaignUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<CampaignUpdate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<CampaignUpdate>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("description", "description");
        result.put("items", "items");
        result.put("maxRedeemCountPerCampaignPerUser", "maxRedeemCountPerCampaignPerUser");
        result.put("maxRedeemCountPerCode", "maxRedeemCountPerCode");
        result.put("maxRedeemCountPerCodePerUser", "maxRedeemCountPerCodePerUser");
        result.put("maxSaleCount", "maxSaleCount");
        result.put("name", "name");
        result.put("redeemEnd", "redeemEnd");
        result.put("redeemStart", "redeemStart");
        result.put("redeemType", "redeemType");
        result.put("status", "status");
        result.put("tags", "tags");
        return result;
    }
}