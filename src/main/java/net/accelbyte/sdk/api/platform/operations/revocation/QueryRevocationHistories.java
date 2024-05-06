/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.revocation;

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
 * queryRevocationHistories
 *
 * <p>Query revocation histories in a namespace. Other detail info:
 *
 * <p>* Returns : query revocation history
 */
@Getter
@Setter
public class QueryRevocationHistories extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/revocation/history";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endTime;
  private Integer limit;
  private Integer offset;
  private String source;
  private String startTime;
  private String status;
  private String transactionId;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryRevocationHistories(
      String namespace,
      String endTime,
      Integer limit,
      Integer offset,
      String source,
      String startTime,
      String status,
      String transactionId,
      String userId) {
    this.namespace = namespace;
    this.endTime = endTime;
    this.limit = limit;
    this.offset = offset;
    this.source = source;
    this.startTime = startTime;
    this.status = status;
    this.transactionId = transactionId;
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
    queryParams.put("endTime", this.endTime == null ? null : Arrays.asList(this.endTime));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("source", this.source == null ? null : Arrays.asList(this.source));
    queryParams.put("startTime", this.startTime == null ? null : Arrays.asList(this.startTime));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    queryParams.put(
        "transactionId", this.transactionId == null ? null : Arrays.asList(this.transactionId));
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

  public RevocationHistoryPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new RevocationHistoryPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endTime", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("source", "None");
    result.put("startTime", "None");
    result.put("status", "None");
    result.put("transactionId", "None");
    result.put("userId", "None");
    return result;
  }

  public enum Source {
    DLC("DLC"),
    IAP("IAP"),
    ORDER("ORDER"),
    OTHER("OTHER");

    private String value;

    Source(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    FAIL("FAIL"),
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

  public static class QueryRevocationHistoriesBuilder {
    private String source;
    private String status;

    public QueryRevocationHistoriesBuilder source(final String source) {
      this.source = source;
      return this;
    }

    public QueryRevocationHistoriesBuilder sourceFromEnum(final Source source) {
      this.source = source.toString();
      return this;
    }

    public QueryRevocationHistoriesBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public QueryRevocationHistoriesBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
