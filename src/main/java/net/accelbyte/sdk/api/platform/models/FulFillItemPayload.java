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

  @JsonProperty("itemIdentity")
  private String itemIdentity;

  @JsonProperty("itemIdentityType")
  private String itemIdentityType;

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
    private String itemIdentityType;

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
