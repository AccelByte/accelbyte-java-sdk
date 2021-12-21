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
public class CodeInfo extends Model {

    @JsonProperty("acquireOrderNo")
    String acquireOrderNo;
    @JsonProperty("acquireUserId")
    String acquireUserId;
    @JsonProperty("batchNo")
    Integer batchNo;
    @JsonProperty("campaignId")
    String campaignId;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("id")
    String id;
    @JsonProperty("items")
    List<RedeemableItem> items;
    @JsonProperty("maxRedeemCountPerCampaignPerUser")
    Integer maxRedeemCountPerCampaignPerUser;
    @JsonProperty("maxRedeemCountPerCode")
    Integer maxRedeemCountPerCode;
    @JsonProperty("maxRedeemCountPerCodePerUser")
    Integer maxRedeemCountPerCodePerUser;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("redeemEnd")
    String redeemEnd;
    @JsonProperty("redeemStart")
    String redeemStart;
    @JsonProperty("redeemType")
    String redeemType;
    @JsonProperty("redeemedCount")
    Integer redeemedCount;
    @JsonProperty("remainder")
    Integer remainder;
    @JsonProperty("status")
    String status;
    @JsonProperty("type")
    String type;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("value")
    String value;

    public CodeInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("acquireOrderNo", "acquireOrderNo");
        result.put("acquireUserId", "acquireUserId");
        result.put("batchNo", "batchNo");
        result.put("campaignId", "campaignId");
        result.put("createdAt", "createdAt");
        result.put("id", "id");
        result.put("items", "items");
        result.put("maxRedeemCountPerCampaignPerUser", "maxRedeemCountPerCampaignPerUser");
        result.put("maxRedeemCountPerCode", "maxRedeemCountPerCode");
        result.put("maxRedeemCountPerCodePerUser", "maxRedeemCountPerCodePerUser");
        result.put("namespace", "namespace");
        result.put("redeemEnd", "redeemEnd");
        result.put("redeemStart", "redeemStart");
        result.put("redeemType", "redeemType");
        result.put("redeemedCount", "redeemedCount");
        result.put("remainder", "remainder");
        result.put("status", "status");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("value", "value");
        return result;
    }
}