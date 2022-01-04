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
public class EntitlementInfo extends Model {

    @JsonProperty("appId")
    private String appId;

    @JsonProperty("appType")
    private String appType;

    @JsonProperty("clazz")
    private String clazz;

    @JsonProperty("createdAt")
    private String createdAt;

    @JsonProperty("endDate")
    private String endDate;

    @JsonProperty("features")
    private List<String> features;

    @JsonProperty("grantedAt")
    private String grantedAt;

    @JsonProperty("grantedCode")
    private String grantedCode;

    @JsonProperty("id")
    private String id;

    @JsonProperty("itemId")
    private String itemId;

    @JsonProperty("itemNamespace")
    private String itemNamespace;

    @JsonProperty("itemSnapshot")
    private ItemSnapshot itemSnapshot;

    @JsonProperty("name")
    private String name;

    @JsonProperty("namespace")
    private String namespace;

    @JsonProperty("sku")
    private String sku;

    @JsonProperty("source")
    private String source;

    @JsonProperty("stackable")
    private Boolean stackable;

    @JsonProperty("startDate")
    private String startDate;

    @JsonProperty("status")
    private String status;

    @JsonProperty("storeId")
    private String storeId;

    @JsonProperty("type")
    private String type;

    @JsonProperty("updatedAt")
    private String updatedAt;

    @JsonProperty("useCount")
    private Integer useCount;

    @JsonProperty("userId")
    private String userId;

    @JsonIgnore
    public EntitlementInfo createFromJson(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, this.getClass());
    }

    @JsonIgnore
    public List<EntitlementInfo> createFromJsonList(String json) throws JsonProcessingException {
        return new ObjectMapper().readValue(json, new TypeReference<List<EntitlementInfo>>() {});
    }

    @JsonIgnore
    public static Map<String, String> getFieldInfo() {
        Map<String, String> result = new HashMap<>();
        result.put("appId", "appId");
        result.put("appType", "appType");
        result.put("clazz", "clazz");
        result.put("createdAt", "createdAt");
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
        result.put("sku", "sku");
        result.put("source", "source");
        result.put("stackable", "stackable");
        result.put("startDate", "startDate");
        result.put("status", "status");
        result.put("storeId", "storeId");
        result.put("type", "type");
        result.put("updatedAt", "updatedAt");
        result.put("useCount", "useCount");
        result.put("userId", "userId");
        return result;
    }
}