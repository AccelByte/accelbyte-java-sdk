package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.payment_dedicated.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class PaymentDedicated {

    private AccelByteSDK sdk;

    public PaymentDedicated(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public PaymentOrderCreateResult createPaymentOrderByDedicated(CreatePaymentOrderByDedicated input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreatePaymentOrderByDedicated()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderRefundResult refundPaymentOrderByDedicated(RefundPaymentOrderByDedicated input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RefundPaymentOrderByDedicated()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PaymentOrderSyncResult syncPaymentOrders(SyncPaymentOrders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SyncPaymentOrders()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
