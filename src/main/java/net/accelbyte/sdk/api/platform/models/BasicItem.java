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
public class BasicItem extends Model {

  @JsonProperty("appId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appId;

  @JsonProperty("appType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String appType;

  @JsonProperty("baseAppId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String baseAppId;

  @JsonProperty("createdAt")
  private String createdAt;

  @JsonProperty("entitlementType")
  private String entitlementType;

  @JsonProperty("features")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> features;

  @JsonProperty("itemId")
  private String itemId;

  @JsonProperty("itemType")
  private String itemType;

  @JsonProperty("name")
  private String name;

  @JsonProperty("namespace")
  private String namespace;

  @JsonProperty("seasonType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String seasonType;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("status")
  private String status;

  @JsonProperty("tags")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> tags;

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
  public BasicItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<BasicItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<BasicItem>>() {});
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

  public static class BasicItemBuilder {
    private String appType;
    private String entitlementType;
    private String itemType;
    private String seasonType;
    private String status;

    public BasicItemBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public BasicItemBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public BasicItemBuilder entitlementType(final String entitlementType) {
      this.entitlementType = entitlementType;
      return this;
    }

    public BasicItemBuilder entitlementTypeFromEnum(final EntitlementType entitlementType) {
      this.entitlementType = entitlementType.toString();
      return this;
    }

    public BasicItemBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public BasicItemBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public BasicItemBuilder seasonType(final String seasonType) {
      this.seasonType = seasonType;
      return this;
    }

    public BasicItemBuilder seasonTypeFromEnum(final SeasonType seasonType) {
      this.seasonType = seasonType.toString();
      return this;
    }

    public BasicItemBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public BasicItemBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
