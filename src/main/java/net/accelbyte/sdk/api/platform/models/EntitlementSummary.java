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
public class EntitlementSummary extends Model {

    @JsonProperty("clazz")
    String clazz;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("endDate")
    String endDate;
    @JsonProperty("grantedCode")
    String grantedCode;
    @JsonProperty("id")
    String id;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("stackable")
    Boolean stackable;
    @JsonProperty("stackedQuantity")
    Integer stackedQuantity;
    @JsonProperty("stackedUseCount")
    Integer stackedUseCount;
    @JsonProperty("startDate")
    String startDate;
    @JsonProperty("storeId")
    String storeId;
    @JsonProperty("type")
    String type;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("userId")
    String userId;

    public EntitlementSummary createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("clazz", "clazz");
        result.put("createdAt", "createdAt");
        result.put("endDate", "endDate");
        result.put("grantedCode", "grantedCode");
        result.put("id", "id");
        result.put("itemId", "itemId");
        result.put("namespace", "namespace");
        result.put("stackable", "stackable");
        result.put("stackedQuantity", "stackedQuantity");
        result.put("stackedUseCount", "stackedUseCount");
        result.put("startDate", "startDate");
        result.put("storeId", "storeId");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("userId", "userId");
        return result;
    }
}