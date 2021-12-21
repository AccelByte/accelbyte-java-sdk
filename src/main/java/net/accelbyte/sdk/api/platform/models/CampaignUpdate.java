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
public class CampaignUpdate extends Model {

    @JsonProperty("description")
    String description;
    @JsonProperty("items")
    List<RedeemableItem> items;
    @JsonProperty("maxRedeemCountPerCampaignPerUser")
    Integer maxRedeemCountPerCampaignPerUser;
    @JsonProperty("maxRedeemCountPerCode")
    Integer maxRedeemCountPerCode;
    @JsonProperty("maxRedeemCountPerCodePerUser")
    Integer maxRedeemCountPerCodePerUser;
    @JsonProperty("maxSaleCount")
    Integer maxSaleCount;
    @JsonProperty("name")
    String name;
    @JsonProperty("redeemEnd")
    String redeemEnd;
    @JsonProperty("redeemStart")
    String redeemStart;
    @JsonProperty("redeemType")
    String redeemType;
    @JsonProperty("status")
    String status;
    @JsonProperty("tags")
    List<String> tags;

    public CampaignUpdate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

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