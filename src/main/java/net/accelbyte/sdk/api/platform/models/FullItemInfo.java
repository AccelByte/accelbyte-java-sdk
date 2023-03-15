/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.*;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
// deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class FullItemInfo extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("appType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appType;

  @JsonProperty("baseAppId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String baseAppId;

  @JsonProperty("boothName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String boothName;

  @JsonProperty("boundItemIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> boundItemIds;

  @JsonProperty("categoryPath")
  private String categoryPath;

  @JsonProperty("clazz")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String clazz;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("displayOrder")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer displayOrder;

  @JsonProperty("entitlementType")
  private String entitlementType;

  @JsonProperty("ext")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> ext;

  @JsonProperty("features")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> features;

  @JsonProperty("images")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<Image> images;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemIds")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> itemIds;

  @JsonProperty("itemQty")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, Integer> itemQty;

  @JsonProperty("itemType")
  private String itemType;

  @JsonProperty("listable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean listable;

  @JsonProperty("localizations")
  private Map<String, Localization> localizations;

  @JsonProperty("lootBoxConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private LootBoxConfig lootBoxConfig;

  @JsonProperty("maxCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxCount;

  @JsonProperty("maxCountPerUser")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer maxCountPerUser;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("optionBoxConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private OptionBoxConfig optionBoxConfig;

  @JsonProperty("purchasable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean purchasable;

  @JsonProperty("purchaseCondition")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private PurchaseCondition purchaseCondition;

  @JsonProperty("recurring")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Recurring recurring;

  @JsonProperty("regionData")
  private Map<String, List<RegionDataItem>> regionData;

  @JsonProperty("saleConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private SaleConfig saleConfig;

  @JsonProperty("seasonType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String seasonType;

  @JsonProperty("sellable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sellable;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("stackable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean stackable;

  @JsonProperty("status")
  private String status;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

  @JsonProperty("targetCurrencyCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String targetCurrencyCode;

  @JsonProperty("targetItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String targetItemId;

  @JsonProperty("targetNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String targetNamespace;

  @JsonProperty("thumbnailUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String thumbnailUrl;

  @JsonProperty("updatedAt")
  private String updatedAt;

  @JsonProperty("useCount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer useCount;

  @JsonIgnore
  public String getAppType() {
    return this.appType;
  }

  @JsonIgnore
  public AppType getAppTypeAsEnum() {
    return AppType.valueOf(this.appType);
  }

  @JsonIgnore
  public void setAppType(final String appType) {
    this.appType = appType;
  }

  @JsonIgnore
  public void setAppTypeFromEnum(final AppType appType) {
    this.appType = appType.toString();
  }

  @JsonIgnore
  public String getEntitlementType() {
    return this.entitlementType;
  }

  @JsonIgnore
  public EntitlementType getEntitlementTypeAsEnum() {
    return EntitlementType.valueOf(this.entitlementType);
  }

  @JsonIgnore
  public void setEntitlementType(final String entitlementType) {
    this.entitlementType = entitlementType;
  }

  @JsonIgnore
  public void setEntitlementTypeFromEnum(final EntitlementType entitlementType) {
    this.entitlementType = entitlementType.toString();
  }

  @JsonIgnore
  public String getItemType() {
    return this.itemType;
  }

  @JsonIgnore
  public ItemType getItemTypeAsEnum() {
    return ItemType.valueOf(this.itemType);
  }

  @JsonIgnore
  public void setItemType(final String itemType) {
    this.itemType = itemType;
  }

  @JsonIgnore
  public void setItemTypeFromEnum(final ItemType itemType) {
    this.itemType = itemType.toString();
  }

  @JsonIgnore
  public String getSeasonType() {
    return this.seasonType;
  }

  @JsonIgnore
  public SeasonType getSeasonTypeAsEnum() {
    return SeasonType.valueOf(this.seasonType);
  }

  @JsonIgnore
  public void setSeasonType(final String seasonType) {
    this.seasonType = seasonType;
  }

  @JsonIgnore
  public void setSeasonTypeFromEnum(final SeasonType seasonType) {
    this.seasonType = seasonType.toString();
  }

  @JsonIgnore
  public String getStatus() {
    return this.status;
  }

  @JsonIgnore
  public Status getStatusAsEnum() {
    return Status.valueOf(this.status);
  }

  @JsonIgnore
  public void setStatus(final String status) {
    this.status = status;
  }

  @JsonIgnore
  public void setStatusFromEnum(final Status status) {
    this.status = status.toString();
  }

  @JsonIgnore
  public FullItemInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FullItemInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FullItemInfo>>() {});
  }

  public enum AppType {
    DEMO("DEMO"),
    DLC("DLC"),
    GAME("GAME"),
    SOFTWARE("SOFTWARE");

    private String value;

    AppType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum EntitlementType {
    CONSUMABLE("CONSUMABLE"),
    DURABLE("DURABLE");

    private String value;

    EntitlementType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum ItemType {
    APP("APP"),
    BUNDLE("BUNDLE"),
    CODE("CODE"),
    COINS("COINS"),
    EXTENSION("EXTENSION"),
    INGAMEITEM("INGAMEITEM"),
    LOOTBOX("LOOTBOX"),
    MEDIA("MEDIA"),
    OPTIONBOX("OPTIONBOX"),
    SEASON("SEASON"),
    SUBSCRIPTION("SUBSCRIPTION");

    private String value;

    ItemType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum SeasonType {
    PASS("PASS"),
    TIER("TIER");

    private String value;

    SeasonType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ACTIVE("ACTIVE"),
    INACTIVE("INACTIVE");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class FullItemInfoBuilder {
    private String appType;
    private String entitlementType;
    private String itemType;
    private String seasonType;
    private String status;

    public FullItemInfoBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public FullItemInfoBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public FullItemInfoBuilder entitlementType(final String entitlementType) {
      this.entitlementType = entitlementType;
      return this;
    }

    public FullItemInfoBuilder entitlementTypeFromEnum(final EntitlementType entitlementType) {
      this.entitlementType = entitlementType.toString();
      return this;
    }

    public FullItemInfoBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public FullItemInfoBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public FullItemInfoBuilder seasonType(final String seasonType) {
      this.seasonType = seasonType;
      return this;
    }

    public FullItemInfoBuilder seasonTypeFromEnum(final SeasonType seasonType) {
      this.seasonType = seasonType.toString();
      return this;
    }

    public FullItemInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public FullItemInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
