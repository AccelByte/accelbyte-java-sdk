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
public class DiscountConfig extends Model {

  @JsonProperty("categories")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<DiscountCategory> categories;

  @JsonProperty("currencyCode")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currencyCode;

  @JsonProperty("currencyNamespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String currencyNamespace;

  @JsonProperty("discountAmount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer discountAmount;

  @JsonProperty("discountPercentage")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Integer discountPercentage;

  @JsonProperty("discountType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String discountType;

  @JsonProperty("items")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<DiscountItem> items;

  @JsonProperty("restrictType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String restrictType;

  @JsonProperty("stackable")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean stackable;

  @JsonIgnore
  public String getDiscountType() {
    return this.discountType;
  }

  @JsonIgnore
  public DiscountType getDiscountTypeAsEnum() {
    return DiscountType.valueOf(this.discountType);
  }

  @JsonIgnore
  public void setDiscountType(final String discountType) {
    this.discountType = discountType;
  }

  @JsonIgnore
  public void setDiscountTypeFromEnum(final DiscountType discountType) {
    this.discountType = discountType.toString();
  }

  @JsonIgnore
  public String getRestrictType() {
    return this.restrictType;
  }

  @JsonIgnore
  public RestrictType getRestrictTypeAsEnum() {
    return RestrictType.valueOf(this.restrictType);
  }

  @JsonIgnore
  public void setRestrictType(final String restrictType) {
    this.restrictType = restrictType;
  }

  @JsonIgnore
  public void setRestrictTypeFromEnum(final RestrictType restrictType) {
    this.restrictType = restrictType.toString();
  }

  @JsonIgnore
  public DiscountConfig createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<DiscountConfig> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<DiscountConfig>>() {});
  }

  public enum DiscountType {
    AMOUNT("AMOUNT"),
    PERCENTAGE("PERCENTAGE");

    private String value;

    DiscountType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum RestrictType {
    ITEMSANDCATEGORIES("ITEMS_AND_CATEGORIES"),
    NONE("NONE");

    private String value;

    RestrictType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class DiscountConfigBuilder {
    private String discountType;
    private String restrictType;

    public DiscountConfigBuilder discountType(final String discountType) {
      this.discountType = discountType;
      return this;
    }

    public DiscountConfigBuilder discountTypeFromEnum(final DiscountType discountType) {
      this.discountType = discountType.toString();
      return this;
    }

    public DiscountConfigBuilder restrictType(final String restrictType) {
      this.restrictType = restrictType;
      return this;
    }

    public DiscountConfigBuilder restrictTypeFromEnum(final RestrictType restrictType) {
      this.restrictType = restrictType.toString();
      return this;
    }
  }
}
