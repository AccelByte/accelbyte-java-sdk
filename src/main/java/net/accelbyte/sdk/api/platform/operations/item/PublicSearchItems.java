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
 * publicSearchItems
 *
 * <p>This API is used to search items by keyword in title, description and long description, It's
 * language constrained, also if item not exist in specific region, default region item will return.
 *
 * <p>Other detail info:
 *
 * <p>* Optional permission : resource="PREVIEW", action=1(CREATE) (user with this permission can
 * view draft store item) * Optional permission : resource="SANDBOX", action=1(CREATE) (user with
 * this permission can view draft store item) * Returns : the list of items
 */
@Getter
@Setter
public class PublicSearchItems extends Operation {
  /** generated field's value */
  private String path = "/platform/public/namespaces/{namespace}/items/search";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String itemType;
  private Integer limit;
  private Integer offset;
  private String region;
  private String storeId;
  private String keyword;
  private String language;

  /**
   * @param namespace required
   * @param keyword required
   * @param language required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public PublicSearchItems(
      String namespace,
      String itemType,
      Integer limit,
      Integer offset,
      String region,
      String storeId,
      String keyword,
      String language) {
    this.namespace = namespace;
    this.itemType = itemType;
    this.limit = limit;
    this.offset = offset;
    this.region = region;
    this.storeId = storeId;
    this.keyword = keyword;
    this.language = language;

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
    queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("region", this.region == null ? null : Arrays.asList(this.region));
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
    queryParams.put("keyword", this.keyword == null ? null : Arrays.asList(this.keyword));
    queryParams.put("language", this.language == null ? null : Arrays.asList(this.language));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.keyword == null) {
      return false;
    }
    if (this.language == null) {
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
    result.put("itemType", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("region", "None");
    result.put("storeId", "None");
    result.put("keyword", "None");
    result.put("language", "None");
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

  public static class PublicSearchItemsBuilder {
    private String itemType;

    public PublicSearchItemsBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public PublicSearchItemsBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }
  }
}
