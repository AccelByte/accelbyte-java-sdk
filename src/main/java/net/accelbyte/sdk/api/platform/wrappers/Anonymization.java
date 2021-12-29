package net.accelbyte.sdk.api.platform.wrappers;

import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.operations.anonymization.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Anonymization {

    private AccelByteSDK sdk;

    public Anonymization(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void anonymizeCampaign(AnonymizeCampaign input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeCampaign()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void anonymizeEntitlement(AnonymizeEntitlement input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeEntitlement()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void anonymizeFulfillment(AnonymizeFulfillment input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeFulfillment()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void anonymizeIntegration(AnonymizeIntegration input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeIntegration()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void anonymizeOrder(AnonymizeOrder input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeOrder()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void anonymizePayment(AnonymizePayment input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizePayment()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void anonymizeSubscription(AnonymizeSubscription input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeSubscription()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void anonymizeWallet(AnonymizeWallet input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AnonymizeWallet()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
