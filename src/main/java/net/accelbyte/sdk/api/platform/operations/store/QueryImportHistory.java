/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.store;

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
 * queryImportHistory
 *
 * <p>This API is used to query import store history
 *
 * <p>Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:STORE", action=2 (READ)
 */
@Getter
@Setter
public class QueryImportHistory extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/stores/{storeId}/import/history";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String storeId;
  private String end;
  private Integer limit;
  private Integer offset;
  private String sortBy;
  private String start;
  private Boolean success;

  /**
   * @param namespace required
   * @param storeId required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryImportHistory(
      String namespace,
      String storeId,
      String end,
      Integer limit,
      Integer offset,
      String sortBy,
      String start,
      Boolean success) {
    this.namespace = namespace;
    this.storeId = storeId;
    this.end = end;
    this.limit = limit;
    this.offset = offset;
    this.sortBy = sortBy;
    this.start = start;
    this.success = success;

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
    queryParams.put("end", this.end == null ? null : Arrays.asList(this.end));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("sortBy", this.sortBy == null ? null : Arrays.asList(this.sortBy));
    queryParams.put("start", this.start == null ? null : Arrays.asList(this.start));
    queryParams.put(
        "success", this.success == null ? null : Arrays.asList(String.valueOf(this.success)));
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

  public ImportStoreHistoryPagingResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new ImportStoreHistoryPagingResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("end", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("sortBy", "None");
    result.put("start", "None");
    result.put("success", "None");
    return result;
  }
}
