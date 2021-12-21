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
public class EntitlementInfo extends Model {

    @JsonProperty("appId")
    String appId;
    @JsonProperty("appType")
    String appType;
    @JsonProperty("clazz")
    String clazz;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("distributedQuantity")
    Integer distributedQuantity;
    @JsonProperty("endDate")
    String endDate;
    @JsonProperty("features")
    List<String> features;
    @JsonProperty("grantedAt")
    String grantedAt;
    @JsonProperty("grantedCode")
    String grantedCode;
    @JsonProperty("id")
    String id;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemNamespace")
    String itemNamespace;
    @JsonProperty("itemSnapshot")
    ItemSnapshot itemSnapshot;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("quantity")
    Integer quantity;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("source")
    String source;
    @JsonProperty("stackable")
    Boolean stackable;
    @JsonProperty("startDate")
    String startDate;
    @JsonProperty("status")
    String status;
    @JsonProperty("storeId")
    String storeId;
    @JsonProperty("targetNamespace")
    String targetNamespace;
    @JsonProperty("type")
    String type;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("useCount")
    Integer useCount;
    @JsonProperty("userId")
    String userId;

    public EntitlementInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("clazz", "clazz");
        result.put("createdAt", "createdAt");
        result.put("distributedQuantity", "distributedQuantity");
        result.put("endDate", "endDate");
        result.put("features", "features");
        result.put("grantedAt", "grantedAt");
        result.put("grantedCode", "grantedCode");
        result.put("id", "id");
        result.put("itemId", "itemId");
        result.put("itemNamespace", "itemNamespace");
        result.put("itemSnapshot", "itemSnapshot");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("quantity", "quantity");
        result.put("sku", "sku");
        result.put("source", "source");
        result.put("stackable", "stackable");
        result.put("startDate", "startDate");
        result.put("status", "status");
        result.put("storeId", "storeId");
        result.put("targetNamespace", "targetNamespace");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        result.put("userId", "userId");
        return result;
    }
}