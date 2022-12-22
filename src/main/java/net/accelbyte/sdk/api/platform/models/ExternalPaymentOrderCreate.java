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
public class ExternalPaymentOrderCreate extends Model {

  @JsonProperty("currencyCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currencyCode;

  @JsonProperty("currencyNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currencyNamespace;

  @JsonProperty("customParameters")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, ?> customParameters;

  @JsonProperty("description")
  private String description;

  @JsonProperty("extOrderNo")
  private String extOrderNo;

  @JsonProperty("extUserId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String extUserId;

  @JsonProperty("itemType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemType;

  @JsonProperty("language")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String language;

  @JsonProperty("metadata")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, String> metadata;

  @JsonProperty("notifyUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String notifyUrl;

  @JsonProperty("omitNotification")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean omitNotification;

  @JsonProperty("platform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platform;

  @JsonProperty("price")
  private Integer price;

  @JsonProperty("recurringPaymentOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String recurringPaymentOrderNo;

  @JsonProperty("region")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String region;

  @JsonProperty("returnUrl")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String returnUrl;

  @JsonProperty("sandbox")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sandbox;

  @JsonProperty("sku")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String sku;

  @JsonProperty("subscriptionId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String subscriptionId;

  @JsonProperty("targetNamespace")
  private String targetNamespace;

  @JsonProperty("targetUserId")
  private String targetUserId;

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
  public ExternalPaymentOrderCreate createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<ExternalPaymentOrderCreate> createFromJsonList(String json)
      throws JsonProcessingException {
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<ExternalPaymentOrderCreate>>() {});
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

  public static class ExternalPaymentOrderCreateBuilder {
    private String itemType;

    public ExternalPaymentOrderCreateBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public ExternalPaymentOrderCreateBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }
  }
}
