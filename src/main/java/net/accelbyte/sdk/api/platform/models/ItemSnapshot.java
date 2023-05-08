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
// @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
@AllArgsConstructor(onConstructor = @__(@Deprecated))
@NoArgsConstructor
public class ItemSnapshot extends Model {

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

  @JsonProperty("createdAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String createdAt;

  @JsonProperty("description")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String description;

  @JsonProperty("entitlementType")
  private String entitlementType;

  @JsonProperty("features")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> features;

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

  @JsonProperty("language")
  private String language;

  @JsonProperty("listable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean listable;

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

  @JsonProperty("recurring")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Recurring recurring;

  @JsonProperty("region")
  private String region;

  @JsonProperty("regionDataItem")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RegionDataItem regionDataItem;

  @JsonProperty("saleConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private SaleConfig saleConfig;

  @JsonProperty("seasonType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String seasonType;

  @JsonProperty("sectionExclusive")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sectionExclusive;

  @JsonProperty("sellable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sellable;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("stackable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean stackable;

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

  @JsonProperty("title")
  private String title;

  @JsonProperty("updatedAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
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
  public ItemSnapshot createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ItemSnapshot> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ItemSnapshot>>() {});
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

  public static class ItemSnapshotBuilder {
    private String appType;
    private String entitlementType;
    private String itemType;
    private String seasonType;

    public ItemSnapshotBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public ItemSnapshotBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public ItemSnapshotBuilder entitlementType(final String entitlementType) {
      this.entitlementType = entitlementType;
      return this;
    }

    public ItemSnapshotBuilder entitlementTypeFromEnum(final EntitlementType entitlementType) {
      this.entitlementType = entitlementType.toString();
      return this;
    }

    public ItemSnapshotBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public ItemSnapshotBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public ItemSnapshotBuilder seasonType(final String seasonType) {
      this.seasonType = seasonType;
      return this;
    }

    public ItemSnapshotBuilder seasonTypeFromEnum(final SeasonType seasonType) {
      this.seasonType = seasonType.toString();
      return this;
    }
  }
}
