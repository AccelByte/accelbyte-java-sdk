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
public class CatalogConfigInfo extends Model {

  @JsonProperty("enableInventoryCheck")
  private Boolean enableInventoryCheck;

  @JsonProperty("itemDeletionCheckConfig")
  @JsonInclude(JsonInclude.Include.NON_NULL)
  private List<String> itemDeletionCheckConfig;

  @JsonIgnore
  public List<String> getItemDeletionCheckConfig() {
    return this.itemDeletionCheckConfig;
  }

  @JsonIgnore
  public List<ItemDeletionCheckConfig> getItemDeletionCheckConfigAsEnum() {
    ArrayList<ItemDeletionCheckConfig> en = new ArrayList<ItemDeletionCheckConfig>();
    for (String e : this.itemDeletionCheckConfig) en.add(ItemDeletionCheckConfig.valueOf(e));
    return en;
  }

  @JsonIgnore
  public void setItemDeletionCheckConfig(final List<String> itemDeletionCheckConfig) {
    this.itemDeletionCheckConfig = itemDeletionCheckConfig;
  }

  @JsonIgnore
  public void setItemDeletionCheckConfigFromEnum(
      final List<ItemDeletionCheckConfig> itemDeletionCheckConfig) {
    ArrayList<String> en = new ArrayList<String>();
    for (ItemDeletionCheckConfig e : itemDeletionCheckConfig) en.add(e.toString());
    this.itemDeletionCheckConfig = en;
  }

  @JsonIgnore
  public CatalogConfigInfo createFromJson(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, this.getClass());
  }

  @JsonIgnore
  public List<CatalogConfigInfo> createFromJsonList(String json) throws JsonProcessingException {
    return new ObjectMapper().readValue(json, new TypeReference<List<CatalogConfigInfo>>() {});
  }

  public enum ItemDeletionCheckConfig {
    CAMPAIGN("CAMPAIGN"),
    CATALOG("CATALOG"),
    DLC("DLC"),
    ENTITLEMENT("ENTITLEMENT"),
    IAP("IAP"),
    REWARD("REWARD");

    private String value;

    ItemDeletionCheckConfig(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class CatalogConfigInfoBuilder {
    private List<String> itemDeletionCheckConfig;

    public CatalogConfigInfoBuilder itemDeletionCheckConfig(
        final List<String> itemDeletionCheckConfig) {
      this.itemDeletionCheckConfig = itemDeletionCheckConfig;
      return this;
    }

    public CatalogConfigInfoBuilder itemDeletionCheckConfigFromEnum(
        final List<ItemDeletionCheckConfig> itemDeletionCheckConfig) {
      ArrayList<String> en = new ArrayList<String>();
      for (ItemDeletionCheckConfig e : itemDeletionCheckConfig) en.add(e.toString());
      this.itemDeletionCheckConfig = en;
      return this;
    }
  }
}
