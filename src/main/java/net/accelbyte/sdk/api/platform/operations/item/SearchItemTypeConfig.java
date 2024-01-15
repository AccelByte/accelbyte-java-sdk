/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.item;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * searchItemTypeConfig
 *
 * <p>[Not Supported Yet In Starter] This API is used to get an item type config.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:ITEM:CONFIG", action=2 (READ) * Returns : item type
 * config data
 */
@Getter
@Setter
public class SearchItemTypeConfig extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/items/configs/search";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String clazz;

  private String itemType;

  /**
   * @param itemType required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SearchItemTypeConfig(String clazz, String itemType) {
    this.clazz = clazz;
    this.itemType = itemType;

    securities.add("Bearer");
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("clazz", this.clazz == null ? null : Arrays.asList(this.clazz));
    queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.itemType == null) {
      return false;
    }
    return true;
  }

  public ItemTypeConfigInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ItemTypeConfigInfo().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("clazz", "None");
    result.put("itemType", "None");
    return result;
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

  public static class SearchItemTypeConfigBuilder {
    private String itemType;

    public SearchItemTypeConfigBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public SearchItemTypeConfigBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }
  }
}
