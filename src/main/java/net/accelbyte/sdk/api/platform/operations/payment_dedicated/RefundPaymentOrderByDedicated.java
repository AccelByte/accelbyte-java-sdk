/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.operations.payment_dedicated;

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
 * refundPaymentOrderByDedicated
 *
 * <p>This API is used to refund payment order by paymentOrderNo from non justice service. e.g.
 * dedicated server.
 *
 * <p>* if the status field of response json is "REFUNDED", usually wallet paid, it indicates
 * payment order already refunded * if the status field of response json is "REFUNDING", usually
 * real money paid, platform will send notification to registered notify url once refund
 * successfully
 *
 * <p>Path Parameter:
 *
 * <p>Parameter | Type | Required | Description
 * ---------------|--------|----------|----------------------------------------- namespace | String
 * | Yes | Namespace that payment order resides in paymentOrderNo | String | Yes | Payment order
 * number
 *
 * <p>Request Body Parameters:
 *
 * <p>Parameter | Type | Required | Description
 * ------------|--------|----------|-------------------- description | String | Yes | Refund
 * description
 *
 * <p>Request Body Example:
 *
 * <p>{
 *
 * <p>"description": "Repeated item."
 *
 * <p>}
 *
 * <p>`
 *
 * <p>#### Refund Notification:
 *
 * <p>It will send notification to configured web hook after refund successfully, http status code
 * should return 200 or 204 once you resolve notification successfully, otherwise payment system
 * will retry notification in interval
 *
 * <p>Refund notification parameter:
 *
 * <p>Parameter | Type | Required | Description
 * -----------|--------|----------|------------------------------------------------ payload | String
 * | Yes | Refund notification payload in json string sign | String | Yes | sha1 hex signature for
 * payload and private key
 *
 * <p>Refund notification Example:
 *
 * <p>{
 *
 * <p>"payload": "{ "type": "payment", "nonceStr": "34c1dcf3eb58455eb161465bbfc0b590",
 * "paymentOrderNo": "18081239088", "namespace": "accelbyte", "targetNamespace": "game1",
 * "targetUserId": "94451623768940d58416ca33ca767ec3", "extOrderNo": "123456789", "sku": "sku",
 * "extUserId": "678", "price": 100, "paymentProvider": "XSOLLA", "vat": 0, "salesTax": 0,
 * "paymentProviderFee": 0, "paymentMethodFee": 0, "currency": { "currencyCode": "USD",
 * "currencySymbol": "$", "currencyType": "REAL", "namespace": "accelbyte", "decimals": 2 },
 * "status": "REFUNDED", "createdTime": "2018-07-28T00:39:16.274Z", "chargedTime":
 * "2018-07-28T00:39:16.274Z", "refundedTime": "2018-07-28T00:39:16.274Z" }",
 *
 * <p>"sign":"e31fb92516cc9faaf50ad70343e1293acec6f3d5"
 *
 * <p>}
 *
 * <p>`
 *
 * <p>Refund notification payload parameter list:
 *
 * <p>Parameter | Type | Required | Description
 * -------------------|----------|----------|--------------------------------------------------------------------------------------
 * type | String | Yes | Notification type: 'payment' paymentOrderNo | String | Yes | Payment system
 * generated order number extOrderNo | String | No | External order number that passed by invoker
 * namespace | String | Yes | Namespace that related payment order resides in targetNamespace |
 * String | Yes | The game namespace targetUserId | String | Yes | The user id in game namespace sku
 * | String | No | Item identify, it will return if pass it when create payment extUserId | String |
 * No | External user id, can be character id, it will return if pass it when create payment price |
 * int | Yes | Price of item paymentProvider | String | Yes | Payment provider:
 * xsolla/alipay/wxpay/wallet vat | int | Yes | Payment order VAT salesTax | int | Yes | Payment
 * order sales tax paymentProviderFee | int | Yes | Payment provider fee paymentMethodFee | int |
 * Yes | Payment method fee currency | Map | Yes | Payment order currency info status | String | Yes
 * | Payment order status statusReason | String | No | Payment order refund status reason
 * createdTime | Datetime | No | The time of the order created chargedTime | Datetime | No | The
 * time of the order charged refundedTime | Datetime | No | The time of the order refunded
 * customParameters | Map | No | custom parameters, will return if pass it when create payment
 * nonceStr | String | Yes | Random string, max length is 32,
 *
 * <p>Currency info parameter list:
 *
 * <p>Parameter | Type | Required | Description
 * ---------------|--------|----------|----------------------------- currencyCode | String | Yes |
 * Currency Code currencySymbol | String | Yes | Currency Symbol currencyType | String | Yes |
 * Currency type(REAL/VIRTUAL) namespace | String | Yes | Currency namespace decimals | int | Yes |
 * Currency decimals
 *
 * <p>#### Encryption Rule:
 *
 * <p>Concat payload json string and private key and then do sha1Hex.
 *
 * <p>#### Other detail info:
 *
 * <p>* Token type : client token * Required permission :
 * resource="ADMIN:NAMESPACE:{namespace}:PAYMENT", action=4 (UPDATE) * cross namespace allowed
 */
@Getter
@Setter
public class RefundPaymentOrderByDedicated extends Operation {
  /** generated field's value */
  private String path =
      "/platform/admin/namespaces/{namespace}/payment/orders/{paymentOrderNo}/refund";

  private String method = "PUT";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;

  /** fields as input parameter */
  private String namespace;

  private String paymentOrderNo;
  private PaymentOrderRefund body;

  /**
   * @param namespace required
   * @param paymentOrderNo required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public RefundPaymentOrderByDedicated(
      String namespace, String paymentOrderNo, PaymentOrderRefund body) {
    this.namespace = namespace;
    this.paymentOrderNo = paymentOrderNo;
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
    return true;
  }

  public PaymentOrderRefundResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 200) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentOrderRefundResult().createFromJson(json);
  }
}
