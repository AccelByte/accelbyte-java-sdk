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
public class ItemSnapshot extends Model {

    @JsonProperty("appId")
    String appId;
    @JsonProperty("appType")
    String appType;
    @JsonProperty("baseAppId")
    String baseAppId;
    @JsonProperty("boothName")
    String boothName;
    @JsonProperty("createdAt")
    String createdAt;
    @JsonProperty("description")
    String description;
    @JsonProperty("entitlementType")
    String entitlementType;
    @JsonProperty("features")
    List<String> features;
    @JsonProperty("itemId")
    String itemId;
    @JsonProperty("itemIds")
    List<String> itemIds;
    @JsonProperty("itemType")
    String itemType;
    @JsonProperty("language")
    String language;
    @JsonProperty("listable")
    Boolean listable;
    @JsonProperty("maxCount")
    Integer maxCount;
    @JsonProperty("maxCountPerUser")
    Integer maxCountPerUser;
    @JsonProperty("name")
    String name;
    @JsonProperty("namespace")
    String namespace;
    @JsonProperty("purchasable")
    Boolean purchasable;
    @JsonProperty("recurring")
    Recurring recurring;
    @JsonProperty("region")
    String region;
    @JsonProperty("regionDataItem")
    RegionDataItem regionDataItem;
    @JsonProperty("seasonType")
    String seasonType;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("stackable")
    Boolean stackable;
    @JsonProperty("targetCurrencyCode")
    String targetCurrencyCode;
    @JsonProperty("targetItemId")
    String targetItemId;
    @JsonProperty("targetNamespace")
    String targetNamespace;
    @JsonProperty("thumbnailUrl")
    String thumbnailUrl;
    @JsonProperty("title")
    String title;
    @JsonProperty("updatedAt")
    String updatedAt;
    @JsonProperty("useCount")
    Integer useCount;

    public ItemSnapshot createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("baseAppId", "baseAppId");
        result.put("boothName", "boothName");
        result.put("createdAt", "createdAt");
        result.put("description", "description");
        result.put("entitlementType", "entitlementType");
        result.put("features", "features");
        result.put("itemId", "itemId");
        result.put("itemIds", "itemIds");
        result.put("itemType", "itemType");
        result.put("language", "language");
        result.put("listable", "listable");
        result.put("maxCount", "maxCount");
        result.put("maxCountPerUser", "maxCountPerUser");
        result.put("name", "name");
        result.put("namespace", "namespace");
        result.put("purchasable", "purchasable");
        result.put("recurring", "recurring");
        result.put("region", "region");
        result.put("regionDataItem", "regionDataItem");
        result.put("seasonType", "seasonType");
        result.put("sku", "sku");
        result.put("stackable", "stackable");
        result.put("targetCurrencyCode", "targetCurrencyCode");
        result.put("targetItemId", "targetItemId");
        result.put("targetNamespace", "targetNamespace");
        result.put("thumbnailUrl", "thumbnailUrl");
        result.put("title", "title");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        return result;
    }
}