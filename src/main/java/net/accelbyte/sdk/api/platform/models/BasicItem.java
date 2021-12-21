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
public class BasicItem extends Model {

    @JsonProperty("appId")
    String appId;
    @JsonProperty("appType")
    String appType;
    @JsonProperty("baseAppId")
    String baseAppId;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("entitlementType")
    String entitlementType;
    @JsonProperty("features")
    List<String> features;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemType")
    String itemType;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("seasonType")
    String seasonType;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("status")
    String status;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("useCount")
    Integer useCount;

    public BasicItem createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("baseAppId", "baseAppId");
        result.put("createdAt", "createdAt");
        result.put("entitlementType", "entitlementType");
        result.put("features", "features");
        result.put("itemId", "itemId");
        result.put("itemType", "itemType");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("seasonType", "seasonType");
        result.put("sku", "sku");
        result.put("status", "status");
        result.put("tags", "tags");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        return result;
    }
}