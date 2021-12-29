package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.agreement.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Agreement {

    private AccelByteSDK sdk;

    public Agreement(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<RetrieveAcceptedAgreementResponse> retrieveAcceptedAgreements(RetrieveAcceptedAgreements input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveAcceptedAgreements()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<PagedRetrieveUserAcceptedAgreementResponse> retrieveAllUsersByPolicyVersion(RetrieveAllUsersByPolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveAllUsersByPolicyVersion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void changePreferenceConsent(ChangePreferenceConsent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new ChangePreferenceConsent()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void acceptVersionedPolicy(AcceptVersionedPolicy input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AcceptVersionedPolicy()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<RetrieveAcceptedAgreementResponse> retrieveAgreementsPublic(RetrieveAgreementsPublic input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveAgreementsPublic()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AcceptAgreementResponse bulkAcceptVersionedPolicy(BulkAcceptVersionedPolicy input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new BulkAcceptVersionedPolicy()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AcceptAgreementResponse indirectBulkAcceptVersionedPolicyV2(IndirectBulkAcceptVersionedPolicyV2 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new IndirectBulkAcceptVersionedPolicyV2()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AcceptAgreementResponse indirectBulkAcceptVersionedPolicy(IndirectBulkAcceptVersionedPolicy input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new IndirectBulkAcceptVersionedPolicy()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
