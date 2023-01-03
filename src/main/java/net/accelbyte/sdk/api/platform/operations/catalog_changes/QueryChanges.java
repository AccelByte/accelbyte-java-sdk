/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.catalog_changes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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
 * queryChanges
 *
 * <p>This API is used to query changes .
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:STORE", action=2 (READ) *
 * Returns : the pagination of changes
 */
@Getter
@Setter
public class QueryChanges extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/stores/{storeId}/catalogChanges/byCriteria";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String storeId;
  private String action;
  private String itemSku;
  private String itemType;
  private Integer limit;
  private Integer offset;
  private Boolean selected;
  private List<String> sortBy;
  private String status;
  private String type;
  private String updatedAtEnd;
  private String updatedAtStart;

  /**
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryChanges(
      String namespace,
      String storeId,
      String action,
      String itemSku,
      String itemType,
      Integer limit,
      Integer offset,
      Boolean selected,
      List<String> sortBy,
      String status,
      String type,
      String updatedAtEnd,
      String updatedAtStart) {
    this.namespace = namespace;
    this.storeId = storeId;
    this.action = action;
    this.itemSku = itemSku;
    this.itemType = itemType;
    this.limit = limit;
    this.offset = offset;
    this.selected = selected;
    this.sortBy = sortBy;
    this.status = status;
    this.type = type;
    this.updatedAtEnd = updatedAtEnd;
    this.updatedAtStart = updatedAtStart;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.storeId != null) {
      pathParams.put("storeId", this.storeId);
    }
    return pathParams;
  }

  @Override
  public Map<String, List<String>> getQueryParams() {
    Map<String, List<String>> queryParams = new HashMap<>();
    queryParams.put("action", this.action == null ? null : Arrays.asList(this.action));
    queryParams.put("itemSku", this.itemSku == null ? null : Arrays.asList(this.itemSku));
    queryParams.put("itemType", this.itemType == null ? null : Arrays.asList(this.itemType));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "selected", this.selected == null ? null : Arrays.asList(String.valueOf(this.selected)));
    queryParams.put("sortBy", this.sortBy == null ? null : this.sortBy);
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
    queryParams.put(
        "updatedAtEnd", this.updatedAtEnd == null ? null : Arrays.asList(this.updatedAtEnd));
    queryParams.put(
        "updatedAtStart", this.updatedAtStart == null ? null : Arrays.asList(this.updatedAtStart));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.storeId == null) {
      return false;
    }
    return true;
  }

  public List<CatalogChangePagingSlicedResult> parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ObjectMapper()
        .readValue(json, new TypeReference<List<CatalogChangePagingSlicedResult>>() {});
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("action", "None");
    result.put("itemSku", "None");
    result.put("itemType", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("selected", "None");
    result.put("sortBy", "csv");
    result.put("status", "None");
    result.put("type", "None");
    result.put("updatedAtEnd", "None");
    result.put("updatedAtStart", "None");
    return result;
  }

  public enum Action {
    CREATE("CREATE"),
    DELETE("DELETE"),
    UPDATE("UPDATE");

    private String value;

    Action(String value) {
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
    CreatedAt("createdAt"),
    CreatedAtasc("createdAt:asc"),
    CreatedAtdesc("createdAt:desc"),
    UpdatedAt("updatedAt"),
    UpdatedAtasc("updatedAt:asc"),
    UpdatedAtdesc("updatedAt:desc");

    private String value;

    SortBy(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    PUBLISHED("PUBLISHED"),
    UNPUBLISHED("UNPUBLISHED");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Type {
    CATEGORY("CATEGORY"),
    ITEM("ITEM"),
    SECTION("SECTION"),
    STORE("STORE"),
    VIEW("VIEW");

    private String value;

    Type(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryChangesBuilder {
    private String action;
    private String itemType;
    private List<String> sortBy;
    private String status;
    private String type;

    public QueryChangesBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public QueryChangesBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }

    public QueryChangesBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public QueryChangesBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public QueryChangesBuilder sortBy(final List<String> sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public QueryChangesBuilder sortByFromEnum(final List<SortBy> sortBy) {
      ArrayList<String> en = new ArrayList<String>();
      for (SortBy e : sortBy) en.add(e.toString());
      this.sortBy = en;
      return this;
    }

    public QueryChangesBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public QueryChangesBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }

    public QueryChangesBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public QueryChangesBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
