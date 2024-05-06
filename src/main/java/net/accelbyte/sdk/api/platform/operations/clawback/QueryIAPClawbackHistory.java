/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.clawback;

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
 * queryIAPClawbackHistory
 *
 * <p>Query clawback history. Other detail info:
 *
 * <p>* Returns : paginated clawback history
 */
@Getter
@Setter
public class QueryIAPClawbackHistory extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/iap/clawback/histories";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endTime;
  private String eventType;
  private String externalOrderId;
  private Integer limit;
  private Integer offset;
  private String startTime;
  private String status;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryIAPClawbackHistory(
      String namespace,
      String endTime,
      String eventType,
      String externalOrderId,
      Integer limit,
      Integer offset,
      String startTime,
      String status,
      String userId) {
    this.namespace = namespace;
    this.endTime = endTime;
    this.eventType = eventType;
    this.externalOrderId = externalOrderId;
    this.limit = limit;
    this.offset = offset;
    this.startTime = startTime;
    this.status = status;
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
    queryParams.put("eventType", this.eventType == null ? null : Arrays.asList(this.eventType));
    queryParams.put(
        "externalOrderId",
        this.externalOrderId == null ? null : Arrays.asList(this.externalOrderId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("startTime", this.startTime == null ? null : Arrays.asList(this.startTime));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
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

  public IAPClawbackPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new IAPClawbackPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endTime", "None");
    result.put("eventType", "None");
    result.put("externalOrderId", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("startTime", "None");
    result.put("status", "None");
    result.put("userId", "None");
    return result;
  }

  public enum EventType {
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    OTHER("OTHER"),
    REFUND("REFUND");

    private String value;

    EventType(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    FAIL("FAIL"),
    IGNORED("IGNORED"),
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

  public static class QueryIAPClawbackHistoryBuilder {
    private String eventType;
    private String status;

    public QueryIAPClawbackHistoryBuilder eventType(final String eventType) {
      this.eventType = eventType;
      return this;
    }

    public QueryIAPClawbackHistoryBuilder eventTypeFromEnum(final EventType eventType) {
      this.eventType = eventType.toString();
      return this;
    }

    public QueryIAPClawbackHistoryBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public QueryIAPClawbackHistoryBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
