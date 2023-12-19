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
 * publicQueryItems
 *
 * <p>This API is used to query items by criteria within a store. If item not exist in specific
 * region, default region item will return.
 *
 * <p>Other detail info:
 *
 * <p>* Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can
 * view draft store item) * Optional permission : resource="SANDBOX", action=1(CREATE) (user with
 * this permission can view draft store item) * Returns : the list of items
 */
@Getter
@Setter
public class PublicQueryItems extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/items/byCriteria";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String appType;
  private Boolean autoCalcEstimatedPrice;
  private String baseAppId;
  private String categoryPath;
  private String features;
  private Boolean includeSubCategoryItem;
  private String itemType;
  private String language;
  private Integer limit;
  private Integer offset;
  private String region;
  private List<String> sortBy;
  private String storeId;
  private String tags;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicQueryItems(
      String namespace,
      String appType,
      Boolean autoCalcEstimatedPrice,
      String baseAppId,
      String categoryPath,
      String features,
      Boolean includeSubCategoryItem,
      String itemType,
      String language,
      Integer limit,
      Integer offset,
      String region,
      List<String> sortBy,
      String storeId,
      String tags) {
    this.namespace = namespace;
    this.appType = appType;
    this.autoCalcEstimatedPrice = autoCalcEstimatedPrice;
    this.baseAppId = baseAppId;
    this.categoryPath = categoryPath;
    this.features = features;
    this.includeSubCategoryItem = includeSubCategoryItem;
    this.itemType = itemType;
    this.language = language;
    this.limit = limit;
    this.offset = offset;
    this.region = region;
    this.sortBy = sortBy;
    this.storeId = storeId;
    this.tags = tags;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("appType", this.appType == null ? null : Arrays.asList(this.appType));
    queryParams.put(
        "autoCalcEstimatedPrice",
        this.autoCalcEstimatedPrice == null
            ? null
            : Arrays.asList(String.valueOf(this.autoCalcEstimatedPrice)));
    queryParams.put("baseAppId", this.baseAppId == null ? null : Arrays.asList(this.baseAppId));
    queryParams.put(
        "categoryPath", this.categoryPath == null ? null : Arrays.asList(this.categoryPath));
    queryParams.put("features", this.features == null ? null : Arrays.asList(this.features));
    queryParams.put(
        "includeSubCategoryItem",
        this.includeSubCategoryItem == null
            ? null
            : Arrays.asList(String.valueOf(this.includeSubCategoryItem)));
    queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
    queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("sortBy", this.sortBy == null ? null : this.sortBy);
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public ItemPagingSlicedResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ItemPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("appType", "None");
    result.put("autoCalcEstimatedPrice", "None");
    result.put("baseAppId", "None");
    result.put("categoryPath", "None");
    result.put("features", "None");
    result.put("includeSubCategoryItem", "None");
    result.put("itemType", "None");
    result.put("language", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("region", "None");
    result.put("sortBy", "csv");
    result.put("storeId", "None");
    result.put("tags", "None");
    return result;
  }

  public enum AppType {
    DEMO("DEMO"),
    DLC("DLC"),
    GAME("GAME"),
    SOFTWARE("SOFTWARE");

    private String value;

    AppType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
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

  public enum SortBy {
    Name("name"),
    Nameasc("name:asc"),
    Namedesc("name:desc"),
    CreatedAt("createdAt"),
    CreatedAtasc("createdAt:asc"),
    CreatedAtdesc("createdAt:desc"),
    UpdatedAt("updatedAt"),
    UpdatedAtasc("updatedAt:asc"),
    UpdatedAtdesc("updatedAt:desc"),
    DisplayOrder("displayOrder"),
    DisplayOrderasc("displayOrder:asc"),
    DisplayOrderdesc("displayOrder:desc");

    private String value;

    SortBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class PublicQueryItemsBuilder {
    private String appType;
    private String itemType;
    private List<String> sortBy;

    public PublicQueryItemsBuilder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public PublicQueryItemsBuilder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public PublicQueryItemsBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public PublicQueryItemsBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public PublicQueryItemsBuilder sortBy(final List<String> sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public PublicQueryItemsBuilder sortByFromEnum(final List<SortBy> sortBy) {
      ArrayList<String> en = new ArrayList<String>();
      for (SortBy e : sortBy) en.add(e.toString());
      this.sortBy = en;
      return this;
    }
  }
}
