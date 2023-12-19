/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.catalog_changes;

import java.io.*;
import java.util.*;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.Operation;
import net.accelbyte.sdk.core.util.Helper;

/**
 * selectAllRecordsByCriteria
 *
 * <p>Select all changes by criteria Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:STORE", action=4 (UPDATE)
 */
@Getter
@Setter
public class SelectAllRecordsByCriteria extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/stores/{storeId}/catalogChanges/selectAllByCriteria";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String storeId;
  private String action;
  private String itemSku;
  private String itemType;
  private Boolean selected;
  private String type;
  private String updatedAtEnd;
  private String updatedAtStart;

  /**
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public SelectAllRecordsByCriteria(
      String namespace,
      String storeId,
      String action,
      String itemSku,
      String itemType,
      Boolean selected,
      String type,
      String updatedAtEnd,
      String updatedAtStart) {
    this.namespace = namespace;
    this.storeId = storeId;
    this.action = action;
    this.itemSku = itemSku;
    this.itemType = itemType;
    this.selected = selected;
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
    queryParams.put(
        "selected", this.selected == null ? null : Arrays.asList(String.valueOf(this.selected)));
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

  public void handleEmptyResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 204) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("action", "None");
    result.put("itemSku", "None");
    result.put("itemType", "None");
    result.put("selected", "None");
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

  public static class SelectAllRecordsByCriteriaBuilder {
    private String action;
    private String itemType;
    private String type;

    public SelectAllRecordsByCriteriaBuilder action(final String action) {
      this.action = action;
      return this;
    }

    public SelectAllRecordsByCriteriaBuilder actionFromEnum(final Action action) {
      this.action = action.toString();
      return this;
    }

    public SelectAllRecordsByCriteriaBuilder itemType(final String itemType) {
      this.itemType = itemType;
      return this;
    }

    public SelectAllRecordsByCriteriaBuilder itemTypeFromEnum(final ItemType itemType) {
      this.itemType = itemType.toString();
      return this;
    }

    public SelectAllRecordsByCriteriaBuilder type(final String type) {
      this.type = type;
      return this;
    }

    public SelectAllRecordsByCriteriaBuilder typeFromEnum(final Type type) {
      this.type = type.toString();
      return this;
    }
  }
}
