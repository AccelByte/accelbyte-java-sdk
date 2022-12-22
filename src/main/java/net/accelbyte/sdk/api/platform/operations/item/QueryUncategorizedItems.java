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
 * queryUncategorizedItems
 *
 * <p>This API is used to query uncategorized items within a store.
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:ITEM", action=2 (READ) * Returns
 * : the list of uncategorized items
 */
@Getter
@Setter
public class QueryUncategorizedItems extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/items/uncategorized";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private Boolean activeOnly;
  private Integer limit;
  private Integer offset;
  private List<String> sortBy;
  private String storeId;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryUncategorizedItems(
      String namespace,
      Boolean activeOnly,
      Integer limit,
      Integer offset,
      List<String> sortBy,
      String storeId) {
    this.namespace = namespace;
    this.activeOnly = activeOnly;
    this.limit = limit;
    this.offset = offset;
    this.sortBy = sortBy;
    this.storeId = storeId;

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
    queryParams.put(
        "activeOnly",
        this.activeOnly == null ? null : Arrays.asList(String.valueOf(this.activeOnly)));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : this.sortBy);
    queryParams.put("storeId", this.storeId == null ? null : Arrays.asList(this.storeId));
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
    result.put("activeOnly", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sortBy", "csv");
    result.put("storeId", "None");
    return result;
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

  public static class QueryUncategorizedItemsBuilder {
    private List<String> sortBy;

    public QueryUncategorizedItemsBuilder sortBy(final List<String> sortBy) {
      this.sortBy = sortBy;
      return this;
    }

    public QueryUncategorizedItemsBuilder sortByFromEnum(final List<SortBy> sortBy) {
      ArrayList<String> en = new ArrayList<String>();
      for (SortBy e : sortBy) en.add(e.toString());
      this.sortBy = en;
      return this;
    }
  }
}
