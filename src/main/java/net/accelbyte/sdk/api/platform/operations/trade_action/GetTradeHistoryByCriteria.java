/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.trade_action;

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
 * getTradeHistoryByCriteria
 *
 * <p>This API is used to fetch trade history based on the provided criteria
 *
 * <p>Other detail info:
 *
 * <p>* Returns : trade history list based on criteria
 */
@Getter
@Setter
public class GetTradeHistoryByCriteria extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/trade/history/byCriteria";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private Integer limit;
  private Integer offset;
  private String status;
  private String type;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public GetTradeHistoryByCriteria(
      String namespace, Integer limit, Integer offset, String status, String type, String userId) {
    this.namespace = namespace;
    this.limit = limit;
    this.offset = offset;
    this.status = status;
    this.type = type;
    this.userId = userId;

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
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put("type", this.type == null ? null : Arrays.asList(this.type));
    queryParams.put("userId", this.userId == null ? null : Arrays.asList(this.userId));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public TradeActionPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new TradeActionPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("status", "None");
    result.put("type", "None");
    result.put("userId", "None");
    return result;
  }

  public enum Status {
    FAILED("FAILED"),
    INIT("INIT"),
    SUCCESS("SUCCESS");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class GetTradeHistoryByCriteriaBuilder {
    private String status;

    public GetTradeHistoryByCriteriaBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public GetTradeHistoryByCriteriaBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
