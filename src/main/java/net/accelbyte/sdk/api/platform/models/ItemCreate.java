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
public class ItemCreate extends Model {

    @JsonProperty("appId")
    String appId;
    @JsonProperty("appType")
    String appType;
    @JsonProperty("baseAppId")
    String baseAppId;
    @JsonProperty("boothName")
    String boothName;
    @JsonProperty("categoryPath")
    String categoryPath;
    @JsonProperty("clazz")
    String clazz;
    @JsonProperty("displayOrder")
    Integer displayOrder;
    @JsonProperty("entitlementType")
    String entitlementType;
    @JsonProperty("ext")
    Map<String, ?> ext;
    @JsonProperty("features")
    List<String> features;
    @JsonProperty("images")
    List<Image> images;
    @JsonProperty("itemIds")
    List<String> itemIds;
    @JsonProperty("itemType")
    String itemType;
    @JsonProperty("listable")
    Boolean listable;
    @JsonProperty("localizations")
    Map<String, Localization> localizations;
    @JsonProperty("maxCount")
    Integer maxCount;
    @JsonProperty("maxCountPerUser")
    Integer maxCountPerUser;
    @JsonProperty("name")
    String name;
    @JsonProperty("purchasable")
    Boolean purchasable;
    @JsonProperty("recurring")
    Recurring recurring;
    @JsonProperty("regionData")
    Map<String, List<RegionDataItem>> regionData;
    @JsonProperty("seasonType")
    String seasonType;
    @JsonProperty("sku")
    String sku;
    @JsonProperty("stackable")
    Boolean stackable;
    @JsonProperty("status")
    String status;
    @JsonProperty("tags")
    List<String> tags;
    @JsonProperty("targetCurrencyCode")
    String targetCurrencyCode;
    @JsonProperty("targetNamespace")
    String targetNamespace;
    @JsonProperty("thumbnailUrl")
    String thumbnailUrl;
    @JsonProperty("useCount")
    Integer useCount;

    public ItemCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("baseAppId", "baseAppId");
        result.put("boothName", "boothName");
        result.put("categoryPath", "categoryPath");
        result.put("clazz", "clazz");
        result.put("displayOrder", "displayOrder");
        result.put("entitlementType", "entitlementType");
        result.put("ext", "ext");
        result.put("features", "features");
        result.put("images", "images");
        result.put("itemIds", "itemIds");
        result.put("itemType", "itemType");
        result.put("listable", "listable");
        result.put("localizations", "localizations");
        result.put("maxCount", "maxCount");
        result.put("maxCountPerUser", "maxCountPerUser");
        result.put("name", "name");
        result.put("purchasable", "purchasable");
        result.put("recurring", "recurring");
        result.put("regionData", "regionData");
        result.put("seasonType", "seasonType");
        result.put("sku", "sku");
        result.put("stackable", "stackable");
        result.put("status", "status");
        result.put("tags", "tags");
        result.put("targetCurrencyCode", "targetCurrencyCode");
        result.put("targetNamespace", "targetNamespace");
        result.put("thumbnailUrl", "thumbnailUrl");
        result.put("useCount", "useCount");
        return result;
    }
}