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
public class ItemSnapshot extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("baseAppId")
    private String baseAppId;

    @JsonProperty("boothName")
    private String boothName;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("description")
    private String description;

    @JsonProperty("entitlementType")
    private String entitlementType;

    @JsonProperty("features")
    private List<String> features;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemIds")
    private List<String> itemIds;

    @JsonProperty("itemQty")
    private Map<String, Integer> itemQty;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("language")
    private String language;

    @JsonProperty("listable")
    private Boolean listable;

    @JsonProperty("maxCount")
    private Integer maxCount;

    @JsonProperty("maxCountPerUser")
    private Integer maxCountPerUser;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("purchasable")
    private Boolean purchasable;

    @JsonProperty("recurring")
    private Recurring recurring;

    @JsonProperty("region")
    private String region;

    @JsonProperty("regionDataItem")
    private RegionDataItem regionDataItem;

    @JsonProperty("seasonType")
    private String seasonType;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("stackable")
    private Boolean stackable;

    @JsonProperty("targetCurrencyCode")
    private String targetCurrencyCode;

    @JsonProperty("targetItemId")
    private String targetItemId;

    @JsonProperty("targetNamespace")
    private String targetNamespace;

    @JsonProperty("thumbnailUrl")
    private String thumbnailUrl;

    @JsonProperty("title")
    private String title;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("useCount")
    private Integer useCount;

    @JsonIgnore
    public ItemSnapshot createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ItemSnapshot> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemSnapshot>>() {});
    }

    @JsonIgnore
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
        result.put("itemQty", "itemQty");
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