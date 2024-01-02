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
public class FulFillItemPayload extends Model {

  @JsonProperty("count")
  private Integer count;

  @JsonProperty("entitlementOrigin")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private String entitlementOrigin;

  @JsonProperty("itemIdentity")
  private String itemIdentity;

  @JsonProperty("itemIdentityType")
  private String itemIdentityType;

  @JsonIgnore
  public String getEntitlementOrigin() {
    return this.entitlementOrigin;
  }

  @JsonIgnore
  public EntitlementOrigin getEntitlementOriginAsEnum() {
    return EntitlementOrigin.valueOf(this.entitlementOrigin);
  }

  @JsonIgnore
  public void setEntitlementOrigin(final String entitlementOrigin) {
    this.entitlementOrigin = entitlementOrigin;
  }

  @JsonIgnore
  public void setEntitlementOriginFromEnum(final EntitlementOrigin entitlementOrigin) {
    this.entitlementOrigin = entitlementOrigin.toString();
  }

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
  public FulFillItemPayload createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<FulFillItemPayload> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<FulFillItemPayload>>() {});
  }

  public enum EntitlementOrigin {
    Epic("Epic"),
    GooglePlay("GooglePlay"),
    IOS("IOS"),
    Nintendo("Nintendo"),
    Oculus("Oculus"),
    Other("Other"),
    Playstation("Playstation"),
    Steam("Steam"),
    System("System"),
    Twitch("Twitch"),
    Xbox("Xbox");

    private String value;

    EntitlementOrigin(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
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

  public static class FulFillItemPayloadBuilder {
    private String entitlementOrigin;
    private String itemIdentityType;

    public FulFillItemPayloadBuilder entitlementOrigin(final String entitlementOrigin) {
      this.entitlementOrigin = entitlementOrigin;
      return this;
    }

    public FulFillItemPayloadBuilder entitlementOriginFromEnum(
        final EntitlementOrigin entitlementOrigin) {
      this.entitlementOrigin = entitlementOrigin.toString();
      return this;
    }

    public FulFillItemPayloadBuilder itemIdentityType(final String itemIdentityType) {
      this.itemIdentityType = itemIdentityType;
      return this;
    }

    public FulFillItemPayloadBuilder itemIdentityTypeFromEnum(
        final ItemIdentityType itemIdentityType) {
      this.itemIdentityType = itemIdentityType.toString();
      return this;
    }
  }
}
