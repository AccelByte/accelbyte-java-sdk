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
public class FulfillmentItem extends Model {

  @JsonProperty("extraSubscriptionDays")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer extraSubscriptionDays;

  @JsonProperty("itemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemId;

  @JsonProperty("itemName")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemName;

  @JsonProperty("itemSku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemSku;

  @JsonProperty("itemType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemType;

  @JsonProperty("quantity")
  private Integer quantity;

  @JsonProperty("storeId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String storeId;

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
  public FulfillmentItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FulfillmentItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FulfillmentItem>>() {});
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

  public static class FulfillmentItemBuilder {
    private String itemType;

    public FulfillmentItemBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public FulfillmentItemBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }
  }
}
