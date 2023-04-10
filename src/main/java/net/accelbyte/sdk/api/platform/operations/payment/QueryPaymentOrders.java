/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment;

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
 * queryPaymentOrders
 *
 * <p>Query payment orders. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:PAYMENT", action=2 (READ) *
 * Returns : query payment orders
 */
@Getter
@Setter
public class QueryPaymentOrders extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/payment/orders";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String channel;
  private String extTxId;
  private Integer limit;
  private Integer offset;
  private String status;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryPaymentOrders(
      String namespace,
      String channel,
      String extTxId,
      Integer limit,
      Integer offset,
      String status) {
    this.namespace = namespace;
    this.channel = channel;
    this.extTxId = extTxId;
    this.limit = limit;
    this.offset = offset;
    this.status = status;

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
    queryParams.put("channel", this.channel == null ? null : Arrays.asList(this.channel));
    queryParams.put("extTxId", this.extTxId == null ? null : Arrays.asList(this.extTxId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put("status", this.status == null ? null : Arrays.asList(this.status));
    return queryParams;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public PaymentOrderPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentOrderPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("channel", "None");
    result.put("extTxId", "None");
    result.put("limit", "None");
    result.put("offset", "None");
    result.put("status", "None");
    return result;
  }

  public enum Channel {
    EXTERNAL("EXTERNAL"),
    INTERNAL("INTERNAL");

    private String value;

    Channel(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    AUTHORISED("AUTHORISED"),
    AUTHORISEFAILED("AUTHORISE_FAILED"),
    CHARGEBACK("CHARGEBACK"),
    CHARGEBACKREVERSED("CHARGEBACK_REVERSED"),
    CHARGED("CHARGED"),
    CHARGEFAILED("CHARGE_FAILED"),
    DELETED("DELETED"),
    INIT("INIT"),
    NOTIFICATIONOFCHARGEBACK("NOTIFICATION_OF_CHARGEBACK"),
    REFUNDED("REFUNDED"),
    REFUNDING("REFUNDING"),
    REFUNDFAILED("REFUND_FAILED"),
    REQUESTFORINFORMATION("REQUEST_FOR_INFORMATION");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryPaymentOrdersBuilder {
    private String channel;
    private String status;

    public QueryPaymentOrdersBuilder channel(final String channel) {
      this.channel = channel;
      return this;
    }

    public QueryPaymentOrdersBuilder channelFromEnum(final Channel channel) {
      this.channel = channel.toString();
      return this;
    }

    public QueryPaymentOrdersBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public QueryPaymentOrdersBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
