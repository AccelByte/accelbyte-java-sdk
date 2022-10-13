/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import java.io.*;
import java.util.*;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.payment_station.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PaymentStation {

  private AccelByteSDK sdk;

  public PaymentStation(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetPaymentCustomization
   * @deprecated
   */
  @Deprecated
  public Customization getPaymentCustomization(GetPaymentCustomization input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetPaymentUrl
   */
  public PaymentUrl publicGetPaymentUrl(PublicGetPaymentUrl input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetPaymentMethods
   */
  public List<PaymentMethod> publicGetPaymentMethods(PublicGetPaymentMethods input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUnpaidPaymentOrder
   */
  public PaymentOrderDetails publicGetUnpaidPaymentOrder(PublicGetUnpaidPaymentOrder input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see Pay
   */
  public PaymentProcessResult pay(Pay input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCheckPaymentOrderPaidStatus
   */
  public PaymentOrderPaidResult publicCheckPaymentOrderPaidStatus(
      PublicCheckPaymentOrderPaidStatus input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPaymentPublicConfig
   */
  public Map<String, ?> getPaymentPublicConfig(GetPaymentPublicConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetQRCode
   */
  public InputStream publicGetQRCode(PublicGetQRCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicNormalizePaymentReturnUrl
   */
  public void publicNormalizePaymentReturnUrl(PublicNormalizePaymentReturnUrl input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPaymentTaxValue
   */
  public TaxResult getPaymentTaxValue(GetPaymentTaxValue input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
