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
public class RegionDataChange extends Model {

  @JsonProperty("itemIdentities")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> itemIdentities;

  @JsonProperty("itemIdentityType")
  private String itemIdentityType;

  @JsonProperty("regionData")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private Map<String, List<RegionDataItem>> regionData;

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
  public RegionDataChange createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<RegionDataChange> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<RegionDataChange>>() {});
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

  public static class RegionDataChangeBuilder {
    private String itemIdentityType;

    public RegionDataChangeBuilder itemIdentityType(final String itemIdentityType) {
      this.itemIdentityType = itemIdentityType;
      return this;
    }

    public RegionDataChangeBuilder itemIdentityTypeFromEnum(
        final ItemIdentityType itemIdentityType) {
      this.itemIdentityType = itemIdentityType.toString();
      return this;
    }
  }
}
