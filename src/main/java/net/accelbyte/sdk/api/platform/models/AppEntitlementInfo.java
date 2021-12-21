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
public class AppEntitlementInfo extends Model {

    @JsonProperty("appId")
    String appId;
    @JsonProperty("appType")
    String appType;
    @JsonProperty("endDate")
    String endDate;
    @JsonProperty("grantedAt")
    String grantedAt;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemSnapshot")
    ItemSnapshot itemSnapshot;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("startDate")
    String startDate;
    @JsonProperty("status")
    String status;
    @JsonProperty("storeId")
    String storeId;
    @JsonProperty("userId")
    String userId;

    public AppEntitlementInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("endDate", "endDate");
        result.put("grantedAt", "grantedAt");
        result.put("itemId", "itemId");
        result.put("itemSnapshot", "itemSnapshot");
        result.put("namespace", "namespace");
        result.put("sku", "sku");
        result.put("startDate", "startDate");
        result.put("status", "status");
        result.put("storeId", "storeId");
        result.put("userId", "userId");
        return result;
    }
}