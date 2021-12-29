package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.payment.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Payment {

    private AccelByteSDK sdk;

    public Payment(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public PaymentNotificationPagingSlicedResult queryPaymentNotifications(QueryPaymentNotifications input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryPaymentNotifications()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderPagingSlicedResult queryPaymentOrders(QueryPaymentOrders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryPaymentOrders()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<String> listExtOrderNoByExtTxId(ListExtOrderNoByExtTxId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListExtOrderNoByExtTxId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderInfo getPaymentOrder(GetPaymentOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPaymentOrder()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderInfo chargePaymentOrder(ChargePaymentOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ChargePaymentOrder()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public NotificationProcessResult simulatePaymentOrderNotification(SimulatePaymentOrderNotification input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SimulatePaymentOrderNotification()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderChargeStatus getPaymentOrderChargeStatus(GetPaymentOrderChargeStatus input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetPaymentOrderChargeStatus()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderInfo createUserPaymentOrder(CreateUserPaymentOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateUserPaymentOrder()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderInfo refundUserPaymentOrder(RefundUserPaymentOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RefundUserPaymentOrder()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
