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
 * refundUserPaymentOrder
 *
 * <p>[SERVICE COMMUNICATION ONLY] This API is used to refund order by paymentOrderNo from justice
 * service. Other detail info:
 *
 * <p>* Required permission : resource="ADMIN:NAMESPACE:{namespace}:USER:{userId}:PAYMENT", action=4
 * (UPDATE)
 */
@Getter
@Setter
public class RefundUserPaymentOrder extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/users/{userId}/payment/orders/{paymentOrderNo}/refund";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private String paymentOrderNo;
  private String userId;
  private PaymentOrderRefund body;

  /**
   * @param namespace required
   * @param paymentOrderNo required
   * @param userId required
   */
  @Builder
  // deprecated(2022-08-29): All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RefundUserPaymentOrder(
      String namespace, String paymentOrderNo, String userId, PaymentOrderRefund body) {
    this.namespace = namespace;
    this.paymentOrderNo = paymentOrderNo;
    this.userId = userId;
    this.body = body;

    securities.add("Bearer");
  }

  @Override
  public Map<String, String> getPathParams() {
    Map<String, String> pathParams = new HashMap<>();
    if (this.namespace != null) {
      pathParams.put("namespace", this.namespace);
    }
    if (this.paymentOrderNo != null) {
      pathParams.put("paymentOrderNo", this.paymentOrderNo);
    }
    if (this.userId != null) {
      pathParams.put("userId", this.userId);
    }
    return pathParams;
  }

  @Override
  public PaymentOrderRefund getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    if (this.paymentOrderNo == null) {
      return false;
    }
    if (this.userId == null) {
      return false;
    }
    return true;
  }

  public PaymentOrderInfo parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentOrderInfo().createFromJson(json);
  }
}
