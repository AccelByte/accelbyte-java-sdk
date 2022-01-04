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
public class ItemCreate extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("baseAppId")
    private String baseAppId;

    @JsonProperty("boothName")
    private String boothName;

    @JsonProperty("categoryPath")
    private String categoryPath;

    @JsonProperty("clazz")
    private String clazz;

    @JsonProperty("displayOrder")
    private Integer displayOrder;

    @JsonProperty("entitlementType")
    private String entitlementType;

    @JsonProperty("ext")
    private Map<String, ?> ext;

    @JsonProperty("features")
    private List<String> features;

    @JsonProperty("images")
    private List<Image> images;

    @JsonProperty("itemIds")
    private List<String> itemIds;

    @JsonProperty("itemType")
    private String itemType;

    @JsonProperty("listable")
    private Boolean listable;

    @JsonProperty("localizations")
    private Map<String, Localization> localizations;

    @JsonProperty("maxCount")
    private Integer maxCount;

    @JsonProperty("maxCountPerUser")
    private Integer maxCountPerUser;

    @JsonProperty("name")
    private String name;

    @JsonProperty("purchasable")
    private Boolean purchasable;

    @JsonProperty("recurring")
    private Recurring recurring;

    @JsonProperty("regionData")
    private Map<String, List<RegionDataItem>> regionData;

    @JsonProperty("seasonType")
    private String seasonType;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("stackable")
    private Boolean stackable;

    @JsonProperty("status")
    private String status;

    @JsonProperty("tags")
    private List<String> tags;

    @JsonProperty("targetCurrencyCode")
    private String targetCurrencyCode;

    @JsonProperty("targetNamespace")
    private String targetNamespace;

    @JsonProperty("thumbnailUrl")
    private String thumbnailUrl;

    @JsonProperty("useCount")
    private Integer useCount;

    @JsonIgnore
    public ItemCreate createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<ItemCreate> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<ItemCreate>>() {});
    }

    @JsonIgnore
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