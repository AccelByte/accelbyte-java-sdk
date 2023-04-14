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
 * queryItems_1
 *
 * <p>This API is used to query items by criteria within a store.
 *
 * <p>The behaviour for itemStatus query parameter: * TRUE: Show only ACTIVE items * FALSE: Show
 * only INACTIVE items * Not provided: show both ACTIVE and INACTIVE items Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=2 (READ) * Returns
 * : the list of items
 */
@Getter
@Setter
public class QueryItems1 extends Operation {
  /** generated field's value */
  private String path = "/platform/v2/admin/namespaces/{namespace}/items/byCriteria";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String appType;
  private String availableDate;
  private String baseAppId;
  private String categoryPath;
  private String features;
  private Boolean includeSubCategoryItem;
  private String itemName;
  private String itemStatus;
  private String itemType;
  private Integer limit;
  private Integer offset;
  private String region;
  private Boolean sectionExclusive;
  private List<String> sortBy;
  private String storeId;
  private String tags;
  private String targetNamespace;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryItems1(
      String namespace,
      String appType,
      String availableDate,
      String baseAppId,
      String categoryPath,
      String features,
      Boolean includeSubCategoryItem,
      String itemName,
      String itemStatus,
      String itemType,
      Integer limit,
      Integer offset,
      String region,
      Boolean sectionExclusive,
      List<String> sortBy,
      String storeId,
      String tags,
      String targetNamespace) {
    this.namespace = namespace;
    this.appType = appType;
    this.availableDate = availableDate;
    this.baseAppId = baseAppId;
    this.categoryPath = categoryPath;
    this.features = features;
    this.includeSubCategoryItem = includeSubCategoryItem;
    this.itemName = itemName;
    this.itemStatus = itemStatus;
    this.itemType = itemType;
    this.limit = limit;
    this.offset = offset;
    this.region = region;
    this.sectionExclusive = sectionExclusive;
    this.sortBy = sortBy;
    this.storeId = storeId;
    this.tags = tags;
    this.targetNamespace = targetNamespace;

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
        "availableDate", this.availableDate == null ? null : Arrays.asList(this.availableDate));
    queryParams.put("baseAppId", this.baseAppId == null ? null : Arrays.asList(this.baseAppId));
    queryParams.put(
        "categoryPath", this.categoryPath == null ? null : Arrays.asList(this.categoryPath));
    queryParams.put("features", this.features == null ? null : Arrays.asList(this.features));
    queryParams.put(
        "includeSubCategoryItem",
        this.includeSubCategoryItem == null
            ? null
            : Arrays.asList(String.valueOf(this.includeSubCategoryItem)));
    queryParams.put("itemName", this.itemName == null ? null : Arrays.asList(this.itemName));
    queryParams.put("itemStatus", this.itemStatus == null ? null : Arrays.asList(this.itemStatus));
    queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put(
        "sectionExclusive",
        this.sectionExclusive == null
            ? null
            : Arrays.asList(String.valueOf(this.sectionExclusive)));
    queryParams.put("sortBy", this.sortBy == null ? null : this.sortBy);
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    queryParams.put("tags", this.tags == null ? null : Arrays.asList(this.tags));
    queryParams.put(
        "targetNamespace",
        this.targetNamespace == null ? null : Arrays.asList(this.targetNamespace));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public FullItemPagingSlicedResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FullItemPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("appType", "None");
    result.put("availableDate", "None");
    result.put("baseAppId", "None");
    result.put("categoryPath", "None");
    result.put("features", "None");
    result.put("includeSubCategoryItem", "None");
    result.put("itemName", "None");
    result.put("itemStatus", "None");
    result.put("itemType", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("region", "None");
    result.put("sectionExclusive", "None");
    result.put("sortBy", "csv");
    result.put("storeId", "None");
    result.put("tags", "None");
    result.put("targetNamespace", "None");
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

  public enum ItemStatus {
    ACTIVE("ACTIVE"),
    INACTIVE("INACTIVE");

    private String value;

    ItemStatus(String value) {
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

  public static class QueryItems1Builder {
    private String appType;
    private String itemStatus;
    private String itemType;
    private List<String> sortBy;

    public QueryItems1Builder appType(final String appType) {
      this.appType = appType;
      return this;
    }

    public QueryItems1Builder appTypeFromEnum(final AppType appType) {
      this.appType = appType.toString();
      return this;
    }

    public QueryItems1Builder itemStatus(final String itemStatus) {
      this.itemStatus = itemStatus;
      return this;
    }

    public QueryItems1Builder itemStatusFromEnum(final ItemStatus itemStatus) {
      this.itemStatus = itemStatus.toString();
      return this;
    }

    public QueryItems1Builder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public QueryItems1Builder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public QueryItems1Builder sortBy(final List<String> sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public QueryItems1Builder sortByFromEnum(final List<SortBy> sortBy) {
      ArrayList<String> en = new ArrayList<String>();
      for (SortBy e : sortBy) en.add(e.toString());
      this.sortBy = en;
      return this;
    }
  }
}
