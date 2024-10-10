/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.fulfillment;

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
 * queryFulfillments
 *
 * <p>[Not supported yet in AGS Shared Cloud] Query fulfillments in a namespace. Other detail info:
 *
 * <p>* Returns : list of fulfillment info: * storeId in items can be ignored * error in successList
 * will always be null
 */
@Getter
@Setter
public class QueryFulfillments extends Operation {
  /** generated field's value */
  private String path = "/platform/v2/admin/namespaces/{namespace}/fulfillments";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String endTime;
  private Integer limit;
  private Integer offset;
  private String startTime;
  private String state;
  private String transactionId;
  private String userId;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryFulfillments(
      String namespace,
      String endTime,
      Integer limit,
      Integer offset,
      String startTime,
      String state,
      String transactionId,
      String userId) {
    this.namespace = namespace;
    this.endTime = endTime;
    this.limit = limit;
    this.offset = offset;
    this.startTime = startTime;
    this.state = state;
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
    queryParams.put("startTime", this.startTime == null ? null : Arrays.asList(this.startTime));
    queryParams.put("state", this.state == null ? null : Arrays.asList(this.state));
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

  public FulfillmentPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new FulfillmentPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endTime", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("startTime", "None");
    result.put("state", "None");
    result.put("transactionId", "None");
    result.put("userId", "None");
    return result;
  }

  public enum State {
    FULFILLED("FULFILLED"),
    FULFILLFAILED("FULFILL_FAILED"),
    REVOKED("REVOKED"),
    REVOKEFAILED("REVOKE_FAILED");

    private String value;

    State(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryFulfillmentsBuilder {
    private String state;

    public QueryFulfillmentsBuilder state(final String state) {
      this.state = state;
      return this;
    }

    public QueryFulfillmentsBuilder stateFromEnum(final State state) {
      this.state = state.toString();
      return this;
    }
  }
}
