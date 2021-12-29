package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.subscription.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Subscription {

    private AccelByteSDK sdk;

    public Subscription(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public SubscriptionPagingSlicedResult querySubscriptions(QuerySubscriptions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QuerySubscriptions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RecurringChargeResult recurringChargeSubscription(RecurringChargeSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RecurringChargeSubscription()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionPagingSlicedResult queryUserSubscriptions(QueryUserSubscriptions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new QueryUserSubscriptions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionActivityPagingSlicedResult getUserSubscriptionActivities(GetUserSubscriptionActivities input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserSubscriptionActivities()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionInfo platformSubscribeSubscription(PlatformSubscribeSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PlatformSubscribeSubscription()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Subscribable checkUserSubscriptionSubscribableByItemId(CheckUserSubscriptionSubscribableByItemId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CheckUserSubscriptionSubscribableByItemId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionInfo getUserSubscription(GetUserSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserSubscription()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteUserSubscription(DeleteUserSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteUserSubscription()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionInfo cancelSubscription(CancelSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CancelSubscription()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionInfo grantDaysToSubscription(GrantDaysToSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GrantDaysToSubscription()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public BillingHistoryPagingSlicedResult getUserSubscriptionBillingHistories(GetUserSubscriptionBillingHistories input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserSubscriptionBillingHistories()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void processUserSubscriptionNotification(ProcessUserSubscriptionNotification input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ProcessUserSubscriptionNotification()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionPagingSlicedResult publicQueryUserSubscriptions(PublicQueryUserSubscriptions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicQueryUserSubscriptions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publicSubscribeSubscription(PublicSubscribeSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublicSubscribeSubscription()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public Subscribable publicCheckUserSubscriptionSubscribableByItemId(PublicCheckUserSubscriptionSubscribableByItemId input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCheckUserSubscriptionSubscribableByItemId()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionInfo publicGetUserSubscription(PublicGetUserSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserSubscription()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionInfo publicChangeSubscriptionBillingAccount(PublicChangeSubscriptionBillingAccount input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicChangeSubscriptionBillingAccount()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public SubscriptionInfo publicCancelSubscription(PublicCancelSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCancelSubscription()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public BillingHistoryPagingSlicedResult publicGetUserSubscriptionBillingHistories(PublicGetUserSubscriptionBillingHistories input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserSubscriptionBillingHistories()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
