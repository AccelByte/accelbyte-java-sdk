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
public class ItemNaming extends Model {

  @JsonProperty("categoryPath")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String categoryPath;

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
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

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
  public ItemNaming createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ItemNaming> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<ItemNaming>>() {});
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

  public static class ItemNamingBuilder {
    private String itemType;
    private String seasonType;
    private String status;

    public ItemNamingBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public ItemNamingBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public ItemNamingBuilder seasonType(final String seasonType) {
      this.seasonType = seasonType;
      return this;
    }

    public ItemNamingBuilder seasonTypeFromEnum(final SeasonType seasonType) {
      this.seasonType = seasonType.toString();
      return this;
    }

    public ItemNamingBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public ItemNamingBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
