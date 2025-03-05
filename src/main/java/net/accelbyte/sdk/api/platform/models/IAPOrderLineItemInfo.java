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
public class IAPOrderLineItemInfo extends Model {

  @JsonProperty("amount")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long amount;

  @JsonProperty("iapOrderNo")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String iapOrderNo;

  @JsonProperty("id")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String id;

  @JsonProperty("itemIdentity")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemIdentity;

  @JsonProperty("itemIdentityType")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String itemIdentityType;

  @JsonProperty("lastFulfillmentV2Result")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private FulfillmentV2Result lastFulfillmentV2Result;

  @JsonProperty("lastRevokeFulfillmentV2Result")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private RevokeFulfillmentV2Result lastRevokeFulfillmentV2Result;

  @JsonProperty("lineItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String lineItemId;

  @JsonProperty("namespace")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String namespace;

  @JsonProperty("platform")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String platform;

  @JsonProperty("qty")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long qty;

  @JsonProperty("sandbox")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Boolean sandbox;

  @JsonProperty("status")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String status;

  @JsonProperty("statusReason")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String statusReason;

  @JsonProperty("thirdPartyItemId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String thirdPartyItemId;

  @JsonProperty("thirdPartyOrderId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String thirdPartyOrderId;

  @JsonProperty("userId")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String userId;

  @JsonProperty("vat")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Long vat;

  @JsonIgnore
  public String getItemIdentityType() {
    return this.itemIdentityType;
  }

  @JsonIgnore
  public ItemIdentityType getItemIdentityTypeAsEnum() {
    return ItemIdentityType.valueOf(this.itemIdentityType);
  }

  @JsonIgnore
  public void setItemIdentityType(final String itemIdentityType) {
    this.itemIdentityType = itemIdentityType;
  }

  @JsonIgnore
  public void setItemIdentityTypeFromEnum(final ItemIdentityType itemIdentityType) {
    this.itemIdentityType = itemIdentityType.toString();
  }

  @JsonIgnore
  public String getPlatform() {
    return this.platform;
  }

  @JsonIgnore
  public Platform getPlatformAsEnum() {
    return Platform.valueOf(this.platform);
  }

  @JsonIgnore
  public void setPlatform(final String platform) {
    this.platform = platform;
  }

  @JsonIgnore
  public void setPlatformFromEnum(final Platform platform) {
    this.platform = platform.toString();
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
  public IAPOrderLineItemInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<IAPOrderLineItemInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<IAPOrderLineItemInfo>>() {});
  }

  public enum ItemIdentityType {
    ITEMID("ITEM_ID"),
    ITEMSKU("ITEM_SKU");

    private String value;

    ItemIdentityType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Platform {
    STEAM("STEAM");

    private String value;

    Platform(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    FULFILLED("FULFILLED"),
    VERIFIED("VERIFIED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class IAPOrderLineItemInfoBuilder {
    private String itemIdentityType;
    private String platform;
    private String status;

    public IAPOrderLineItemInfoBuilder itemIdentityType(final String itemIdentityType) {
      this.itemIdentityType = itemIdentityType;
      return this;
    }

    public IAPOrderLineItemInfoBuilder itemIdentityTypeFromEnum(
        final ItemIdentityType itemIdentityType) {
      this.itemIdentityType = itemIdentityType.toString();
      return this;
    }

    public IAPOrderLineItemInfoBuilder platform(final String platform) {
      this.platform = platform;
      return this;
    }

    public IAPOrderLineItemInfoBuilder platformFromEnum(final Platform platform) {
      this.platform = platform.toString();
      return this;
    }

    public IAPOrderLineItemInfoBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public IAPOrderLineItemInfoBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
