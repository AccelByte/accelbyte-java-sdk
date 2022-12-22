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
 * queryPaymentNotifications
 *
 * <p>Query payment notifications. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:PAYMENT:NOTIFICATION", action=2
 * (READ) * Returns : Payment notifications
 */
@Getter
@Setter
public class QueryPaymentNotifications extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/payment/notifications";

  private String method = "GET";
  private List<String> consumes = Arrays.asList();
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String endDate;
  private String externalId;
  private Integer limit;
  private String notificationSource;
  private String notificationType;
  private Integer offset;
  private String paymentOrderNo;
  private String startDate;
  private String status;

  /**
   * @param namespace required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public QueryPaymentNotifications(
      String namespace,
      String endDate,
      String externalId,
      Integer limit,
      String notificationSource,
      String notificationType,
      Integer offset,
      String paymentOrderNo,
      String startDate,
      String status) {
    this.namespace = namespace;
    this.endDate = endDate;
    this.externalId = externalId;
    this.limit = limit;
    this.notificationSource = notificationSource;
    this.notificationType = notificationType;
    this.offset = offset;
    this.paymentOrderNo = paymentOrderNo;
    this.startDate = startDate;
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
    queryParams.put("endDate", this.endDate == null ? null : Arrays.asList(this.endDate));
    queryParams.put("externalId", this.externalId == null ? null : Arrays.asList(this.externalId));
    queryParams.put("limit", this.limit == null ? null : Arrays.asList(String.valueOf(this.limit)));
    queryParams.put(
        "notificationSource",
        this.notificationSource == null ? null : Arrays.asList(this.notificationSource));
    queryParams.put(
        "notificationType",
        this.notificationType == null ? null : Arrays.asList(this.notificationType));
    queryParams.put(
        "offset", this.offset == null ? null : Arrays.asList(String.valueOf(this.offset)));
    queryParams.put(
        "paymentOrderNo", this.paymentOrderNo == null ? null : Arrays.asList(this.paymentOrderNo));
    queryParams.put("startDate", this.startDate == null ? null : Arrays.asList(this.startDate));
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

  public PaymentNotificationPagingSlicedResult parseResponse(
      int code, String contentType, InputStream payload) throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentNotificationPagingSlicedResult().createFromJson(json);
  }

  @Override
  protected Map<String, String> getCollectionFormatMap() {
    Map<String, String> result = new HashMap<>();
    result.put("endDate", "None");
    result.put("externalId", "None");
    result.put("limit", "None");
    result.put("notificationSource", "None");
    result.put("notificationType", "None");
    result.put("offset", "None");
    result.put("paymentOrderNo", "None");
    result.put("startDate", "None");
    result.put("status", "None");
    return result;
  }

  public enum NotificationSource {
    ADYEN("ADYEN"),
    ALIPAY("ALIPAY"),
    CHECKOUT("CHECKOUT"),
    PAYPAL("PAYPAL"),
    STRIPE("STRIPE"),
    WALLET("WALLET"),
    WXPAY("WXPAY"),
    XSOLLA("XSOLLA");

    private String value;

    NotificationSource(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public enum Status {
    ERROR("ERROR"),
    IGNORED("IGNORED"),
    PROCESSED("PROCESSED"),
    WARN("WARN");

    private String value;

    Status(String value) {
      this.value = value;
    }

    @Override
    public String toString() {
      return this.value;
    }
  }

  public static class QueryPaymentNotificationsBuilder {
    private String notificationSource;
    private String status;

    public QueryPaymentNotificationsBuilder notificationSource(final String notificationSource) {
      this.notificationSource = notificationSource;
      return this;
    }

    public QueryPaymentNotificationsBuilder notificationSourceFromEnum(
        final NotificationSource notificationSource) {
      this.notificationSource = notificationSource.toString();
      return this;
    }

    public QueryPaymentNotificationsBuilder status(final String status) {
      this.status = status;
      return this;
    }

    public QueryPaymentNotificationsBuilder statusFromEnum(final Status status) {
      this.status = status.toString();
      return this;
    }
  }
}
