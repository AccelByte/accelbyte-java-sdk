/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.platform.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.payment_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PaymentConfig {

  private AccelByteSDK sdk;

  public PaymentConfig(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see TestAdyenConfig
   */
  public TestResult testAdyenConfig(TestAdyenConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestAliPayConfig
   */
  public TestResult testAliPayConfig(TestAliPayConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestCheckoutConfig
   */
  public TestResult testCheckoutConfig(TestCheckoutConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DebugMatchedPaymentMerchantConfig
   */
  public PaymentMerchantConfigInfo debugMatchedPaymentMerchantConfig(
      DebugMatchedPaymentMerchantConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestPayPalConfig
   */
  public TestResult testPayPalConfig(TestPayPalConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestStripeConfig
   */
  public TestResult testStripeConfig(TestStripeConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestWxPayConfig
   */
  public TestResult testWxPayConfig(TestWxPayConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestXsollaConfig
   */
  public TestResult testXsollaConfig(TestXsollaConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPaymentMerchantConfig
   */
  public PaymentMerchantConfigInfo getPaymentMerchantConfig(GetPaymentMerchantConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateAdyenConfig
   */
  public PaymentMerchantConfigInfo updateAdyenConfig(UpdateAdyenConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestAdyenConfigById
   */
  public TestResult testAdyenConfigById(TestAdyenConfigById input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateAliPayConfig
   */
  public PaymentMerchantConfigInfo updateAliPayConfig(UpdateAliPayConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestAliPayConfigById
   */
  public TestResult testAliPayConfigById(TestAliPayConfigById input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateCheckoutConfig
   */
  public PaymentMerchantConfigInfo updateCheckoutConfig(UpdateCheckoutConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestCheckoutConfigById
   */
  public TestResult testCheckoutConfigById(TestCheckoutConfigById input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePayPalConfig
   */
  public PaymentMerchantConfigInfo updatePayPalConfig(UpdatePayPalConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestPayPalConfigById
   */
  public TestResult testPayPalConfigById(TestPayPalConfigById input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateStripeConfig
   */
  public PaymentMerchantConfigInfo updateStripeConfig(UpdateStripeConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestStripeConfigById
   */
  public TestResult testStripeConfigById(TestStripeConfigById input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateWxPayConfig
   */
  public PaymentMerchantConfigInfo updateWxPayConfig(UpdateWxPayConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateWxPayConfigCert
   */
  public PaymentMerchantConfigInfo updateWxPayConfigCert(UpdateWxPayConfigCert input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestWxPayConfigById
   */
  public TestResult testWxPayConfigById(TestWxPayConfigById input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateXsollaConfig
   */
  public PaymentMerchantConfigInfo updateXsollaConfig(UpdateXsollaConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see TestXsollaConfigById
   */
  public TestResult testXsollaConfigById(TestXsollaConfigById input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateXsollaUIConfig
   */
  public PaymentMerchantConfigInfo updateXsollaUIConfig(UpdateXsollaUIConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see QueryPaymentProviderConfig
   */
  public PaymentProviderConfigPagingSlicedResult queryPaymentProviderConfig(
      QueryPaymentProviderConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreatePaymentProviderConfig
   */
  public PaymentProviderConfigInfo createPaymentProviderConfig(CreatePaymentProviderConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAggregatePaymentProviders
   */
  public List<String> getAggregatePaymentProviders(GetAggregatePaymentProviders input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DebugMatchedPaymentProviderConfig
   */
  public PaymentProviderConfigInfo debugMatchedPaymentProviderConfig(
      DebugMatchedPaymentProviderConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSpecialPaymentProviders
   */
  public List<String> getSpecialPaymentProviders(GetSpecialPaymentProviders input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePaymentProviderConfig
   */
  public PaymentProviderConfigInfo updatePaymentProviderConfig(UpdatePaymentProviderConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeletePaymentProviderConfig
   */
  public void deletePaymentProviderConfig(DeletePaymentProviderConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPaymentTaxConfig
   */
  public PaymentTaxConfigInfo getPaymentTaxConfig(GetPaymentTaxConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePaymentTaxConfig
   */
  public PaymentTaxConfigInfo updatePaymentTaxConfig(UpdatePaymentTaxConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
