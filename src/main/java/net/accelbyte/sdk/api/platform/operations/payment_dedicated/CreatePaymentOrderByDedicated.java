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
 * createPaymentOrderByDedicated
 *
 * <p>This API is used to create payment order from non justice service. e.g. from dedicated server,
 * the result contains the payment station url.
 *
 * <p>Path Parameter:
 *
 * <p>Parameter | Type | Required | Description
 * -------------------------------------------------------------------|--------|----------|-----------------------------------------------------------------------------------------------------------------
 * namespace | String | Yes | Namespace that payment order resides in, should be publisher namespace
 * if it's a Steam like platform that share payment config cross namespaces, otherwise it's the game
 * namespace
 *
 * <p>Request Body Parameters:
 *
 * <p>Parameter | Type | Required | Description
 * ------------------|---------|----------|--------------------------------------------------------------------------------------------------
 * extOrderNo | String | Yes | External order number, it should be unique in invoker order system
 * sku | String | No | Item identity targetNamespace | String | Yes | The game namespace
 * targetUserId | String | Yes | User id for the order owner in game namespace extUserId | String |
 * No | External user id, can be user character id price | int | Yes | price which should be greater
 * than 0 title | String | Yes | Item title description | String | Yes | Item description
 * currencyCode | String | No | Currency code, default is USD currencyNamespace | String | No |
 * Currency namespace, default is publisher namespace region | String | No | Country of the user,
 * will get from user info if not present language | String | No | Language of the user sandbox |
 * Boolean | No | set to true will create sandbox order that not real paid for xsolla/alipay and
 * will not validate price for wxpay. returnUrl | String | No | customized return url for redirect
 * once payment finished, leave unset to use configuration in namespace notifyUrl | String | No |
 * customized notify url for payment web hook, leave unset to use configuration in namespace
 * customParameters | String | No | Custom parameters
 *
 * <p>Request Body Example:
 *
 * <p>{
 *
 * <p>"extOrderNo": "123456789", "sku": "sku", "targetNamespace": "game1", "targetUserId":
 * "94451623768940d58416ca33ca767ec3", "extUserId": "678", "title": "Frostmourne", "description":
 * "Here was power. Here was despair", "price": 100, "region": "CN", "language": "zh-CN",
 * "currencyCode": "USD", "currencyNamespace": "accelbyte"
 *
 * <p>}
 *
 * <p>`
 *
 * <p>#### Payment Notification:
 *
 * <p>After user complete the payment, it will send notification to configured web hook, http status
 * code should return 200 or 204 once you resolve notification successfully, otherwise payment
 * system will retry notification in interval
 *
 * <p>Payment notification parameter:
 *
 * <p>Parameter | Type | Required | Description
 * -----------|--------|----------|------------------------------------------------ payload | String
 * | Yes | Payment notification payload in json string sign | String | Yes | sha1 hex signature for
 * payload and private key
 *
 * <p>Payment notification parameter Example:
 *
 * <p>{
 *
 * <p>"payload": "{ "type": "payment", "nonceStr": "34c1dcf3eb58455eb161465bbfc0b590",
 * "paymentOrderNo": "18081239088", "namespace": "accelbyte", "targetNamespace": "game1",
 * "targetUserId": "94451623768940d58416ca33ca767ec3", "extOrderNo": "123456789", "sku": "sku",
 * "extUserId": "678", "price": 100, "paymentProvider": "XSOLLA", "vat": 0, "salesTax": 0,
 * "paymentProviderFee": 0, "paymentMethodFee": 0, "currency": { "currencyCode": "USD",
 * "currencySymbol": "$", "currencyType": "REAL", "namespace": "accelbyte", "decimals": 2 },
 * "status": "CHARGED", "createdTime": "2018-07-28T00:39:16.274Z", "chargedTime":
 * "2018-07-28T00:39:16.274Z" }",
 *
 * <p>"sign":"e31fb92516cc9faaf50ad70343e1293acec6f3d5"
 *
 * <p>}
 *
 * <p>`
 *
 * <p>Payment notification payload parameter list:
 *
 * <p>Parameter | Type | Required | Description
 * -------------------|----------|----------|--------------------------------------------------------------------------------------
 * type | String | Yes | Notification type: 'payment' paymentOrderNo | String | Yes | Payment system
 * generated order number extOrderNo | String | No | External order number that passed by invoker
 * namespace | String | Yes | Namespace that related payment order resides in targetNamespace |
 * String | Yes | The game namespace targetUserId | String | Yes | The user id in game namespace sku
 * | String | No | Item identify, it will return if pass it when create payment extUserId | String |
 * No | External user id, can be character id, it will return if pass it when create payment price |
 * int | Yes | Price of item paymentProvider | String | Yes | Payment provider, allowed values:
 * xsolla/alipay/wxpay/wallet vat | int | Yes | Payment order VAT salesTax | int | Yes | Payment
 * order sales tax paymentProviderFee | int | Yes | Payment provider fee paymentMethodFee | int |
 * Yes | Payment method fee currency | Map | Yes | Payment order currency info status | String | Yes
 * | Payment order status statusReason | String | No | Payment order status reason createdTime |
 * Datetime | No | The time of the order created chargedTime | Datetime | No | The time of the order
 * charged customParameters | Map | No | custom parameters, will return if pass it when create
 * payment nonceStr | String | Yes | Random string, max length is 32, can be timestamp or uuid
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
 * resource="ADMIN:NAMESPACE:{namespace}:PAYMENT", action=1 (CREATE) * Optional permission(user with
 * this permission will create sandbox order) : resource="SANDBOX", action=1 (CREATE) * It will be
 * forbidden while the target user is banned: PAYMENT_INITIATE or ORDER_AND_PAYMENT * cross
 * namespace allowed * Returns : created payment order info
 */
@Getter
@Setter
public class CreatePaymentOrderByDedicated extends Operation {
  /** generated field's value */
  private String path = "/platform/admin/namespaces/{namespace}/payment/orders";

  private String method = "POST";
  private List<String> consumes = Arrays.asList("application/json");
  private List<String> produces = Arrays.asList("application/json");
  private String locationQuery = null;
  /** fields as input parameter */
  private String namespace;

  private ExternalPaymentOrderCreate body;

  /**
   * @param namespace required
   */
  @Builder
  // @deprecated 2022-08-29 - All args constructor may cause problems. Use builder instead.
  @Deprecated
  public CreatePaymentOrderByDedicated(String namespace, ExternalPaymentOrderCreate body) {
    this.namespace = namespace;
    this.body = body;

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
  public ExternalPaymentOrderCreate getBodyParams() {
    return this.body;
  }

  @Override
  public boolean isValid() {
    if (this.namespace == null) {
      return false;
    }
    return true;
  }

  public PaymentOrderCreateResult parseResponse(int code, String contentType, InputStream payload)
      throws HttpResponseException, IOException {
    if (code != 201) {
      final String json = Helper.convertInputStreamToString(payload);
      throw new HttpResponseException(code, json);
    }
    final String json = Helper.convertInputStreamToString(payload);
    return new PaymentOrderCreateResult().createFromJson(json);
  }
}
