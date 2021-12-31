package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.order.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Order {

    private AccelByteSDK sdk;

    public Order(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public OrderPagingResult queryOrders(QueryOrders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderStatistics getOrderStatistics(GetOrderStatistics input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo getOrder(GetOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo refundOrder(RefundOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderPagingSlicedResult queryUserOrders(QueryUserOrders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public PurchasedItemCount countOfPurchasedItem(CountOfPurchasedItem input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo getUserOrder(GetUserOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo updateUserOrderStatus(UpdateUserOrderStatus input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo fulfillUserOrder(FulfillUserOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderGrantInfo getUserOrderGrant(GetUserOrderGrant input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<OrderHistoryInfo> getUserOrderHistories(GetUserOrderHistories input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void processUserOrderNotification(ProcessUserOrderNotification input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void downloadUserOrderReceipt(DownloadUserOrderReceipt input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderPagingSlicedResult publicQueryUserOrders(PublicQueryUserOrders input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo publicCreateUserOrder(PublicCreateUserOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo publicGetUserOrder(PublicGetUserOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public OrderInfo publicCancelUserOrder(PublicCancelUserOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<OrderHistoryInfo> publicGetUserOrderHistories(PublicGetUserOrderHistories input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicDownloadUserOrderReceipt(PublicDownloadUserOrderReceipt input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
