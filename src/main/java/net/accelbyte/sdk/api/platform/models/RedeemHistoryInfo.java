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
public class RedeemHistoryInfo extends Model {

    @JsonProperty("campaignId")
    String campaignId;
    @JsonProperty("code")
    String code;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("id")
    String id;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("orderNo")
    String orderNo;
    @JsonProperty("redeemedAt")
    String redeemedAt;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public RedeemHistoryInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("campaignId", "campaignId");
        result.put("code", "code");
        result.put("createdAt", "createdAt");
        result.put("id", "id");
        result.put("namespace", "namespace");
        result.put("orderNo", "orderNo");
        result.put("redeemedAt", "redeemedAt");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}