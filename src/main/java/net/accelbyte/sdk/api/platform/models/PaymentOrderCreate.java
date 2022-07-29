/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import net.accelbyte.sdk.core.Model;

@JsonIgnoreProperties(ignoreUnknown = true)
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PaymentOrderCreate extends Model {

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("currencyNamespace")
  private String currencyNamespace;

  @JsonProperty("customParameters")
  private Map<String, ?> customParameters;

  @JsonProperty("description")
  private String description;

  @JsonProperty("extOrderNo")
  private String extOrderNo;

  @JsonProperty("extUserId")
  private String extUserId;

  @JsonProperty("itemType")
  private String itemType;

  @JsonProperty("language")
  private String language;

  @JsonProperty("metadata")
  private Map<String, String> metadata;

  @JsonProperty("notifyUrl")
  private String notifyUrl;

  @JsonProperty("omitNotification")
  private Boolean omitNotification;

  @JsonProperty("platform")
  private String platform;

  @JsonProperty("price")
  private Integer price;

  @JsonProperty("recurringPaymentOrderNo")
  private String recurringPaymentOrderNo;

  @JsonProperty("region")
  private String region;

  @JsonProperty("returnUrl")
  private String returnUrl;

  @JsonProperty("sandbox")
  private Boolean sandbox;

  @JsonProperty("sku")
  private String sku;

  @JsonProperty("subscriptionId")
  private String subscriptionId;

  @JsonProperty("title")
  private String title;

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
  public PaymentOrderCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<PaymentOrderCreate> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<PaymentOrderCreate>>() {});
  }

  public enum ItemType {
    APP("APP"),
    BUNDLE("BUNDLE"),
    CODE("CODE"),
    COINS("COINS"),
    INGAMEITEM("INGAMEITEM"),
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

  public static class PaymentOrderCreateBuilder {
    private String itemType;

    public PaymentOrderCreateBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public PaymentOrderCreateBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }
  }
}
