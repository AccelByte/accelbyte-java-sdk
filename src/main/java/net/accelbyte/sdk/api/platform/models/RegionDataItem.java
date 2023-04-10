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
public class RegionDataItem extends Model {

  @JsonProperty("currencyCode")
  private String currencyCode;

  @JsonProperty("currencyNamespace")
  private String currencyNamespace;

  @JsonProperty("currencyType")
  private String currencyType;

  @JsonProperty("discountAmount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer discountAmount;

  @JsonProperty("discountExpireAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String discountExpireAt;

  @JsonProperty("discountPercentage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer discountPercentage;

  @JsonProperty("discountPurchaseAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String discountPurchaseAt;

  @JsonProperty("discountedPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer discountedPrice;

  @JsonProperty("expireAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String expireAt;

  @JsonProperty("price")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer price;

  @JsonProperty("purchaseAt")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String purchaseAt;

  @JsonProperty("trialPrice")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer trialPrice;

  @JsonIgnore
  public String getCurrencyType() {
    return this.currencyType;
  }

  @JsonIgnore
  public CurrencyType getCurrencyTypeAsEnum() {
    return CurrencyType.valueOf(this.currencyType);
  }

  @JsonIgnore
  public void setCurrencyType(final String currencyType) {
    this.currencyType = currencyType;
  }

  @JsonIgnore
  public void setCurrencyTypeFromEnum(final CurrencyType currencyType) {
    this.currencyType = currencyType.toString();
  }

  @JsonIgnore
  public RegionDataItem createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RegionDataItem> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RegionDataItem>>() {});
  }

  public enum CurrencyType {
    REAL("REAL"),
    VIRTUAL("VIRTUAL");

    private String value;

    CurrencyType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class RegionDataItemBuilder {
    private String currencyType;

    public RegionDataItemBuilder currencyType(final String currencyType) {
      this.currencyType = currencyType;
      return this;
    }

    public RegionDataItemBuilder currencyTypeFromEnum(final CurrencyType currencyType) {
      this.currencyType = currencyType.toString();
      return this;
    }
  }
}
