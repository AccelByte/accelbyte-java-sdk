package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.payment_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class PaymentConfig {

    private AccelByteSDK sdk;

    public PaymentConfig(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public TestResult testAdyenConfig(TestAdyenConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestAdyenConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testAliPayConfig(TestAliPayConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestAliPayConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testCheckoutConfig(TestCheckoutConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestCheckoutConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo debugMatchedPaymentMerchantConfig(DebugMatchedPaymentMerchantConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DebugMatchedPaymentMerchantConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testPayPalConfig(TestPayPalConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestPayPalConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testStripeConfig(TestStripeConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestStripeConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testWxPayConfig(TestWxPayConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestWxPayConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testXsollaConfig(TestXsollaConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestXsollaConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo getPaymentMerchantConfig(GetPaymentMerchantConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPaymentMerchantConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateAdyenConfig(UpdateAdyenConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateAdyenConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testAdyenConfigById(TestAdyenConfigById input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestAdyenConfigById()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateAliPayConfig(UpdateAliPayConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateAliPayConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testAliPayConfigById(TestAliPayConfigById input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestAliPayConfigById()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateCheckoutConfig(UpdateCheckoutConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateCheckoutConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testCheckoutConfigById(TestCheckoutConfigById input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestCheckoutConfigById()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updatePayPalConfig(UpdatePayPalConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdatePayPalConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testPayPalConfigById(TestPayPalConfigById input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestPayPalConfigById()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateStripeConfig(UpdateStripeConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateStripeConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testStripeConfigById(TestStripeConfigById input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestStripeConfigById()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateWxPayConfig(UpdateWxPayConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateWxPayConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateWxPayConfigCert(UpdateWxPayConfigCert input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateWxPayConfigCert()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testWxPayConfigById(TestWxPayConfigById input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestWxPayConfigById()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateXsollaConfig(UpdateXsollaConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateXsollaConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public TestResult testXsollaConfigById(TestXsollaConfigById input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new TestXsollaConfigById()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentMerchantConfigInfo updateXsollaUIConfig(UpdateXsollaUIConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateXsollaUIConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentProviderConfigPagingSlicedResult queryPaymentProviderConfig(QueryPaymentProviderConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryPaymentProviderConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentProviderConfigInfo createPaymentProviderConfig(CreatePaymentProviderConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreatePaymentProviderConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<String> getAggregatePaymentProviders(GetAggregatePaymentProviders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAggregatePaymentProviders()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentProviderConfigInfo debugMatchedPaymentProviderConfig(DebugMatchedPaymentProviderConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DebugMatchedPaymentProviderConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<String> getSpecialPaymentProviders(GetSpecialPaymentProviders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetSpecialPaymentProviders()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentProviderConfigInfo updatePaymentProviderConfig(UpdatePaymentProviderConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdatePaymentProviderConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deletePaymentProviderConfig(DeletePaymentProviderConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeletePaymentProviderConfig()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentTaxConfigInfo getPaymentTaxConfig(GetPaymentTaxConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPaymentTaxConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentTaxConfigInfo updatePaymentTaxConfig(UpdatePaymentTaxConfig input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdatePaymentTaxConfig()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
