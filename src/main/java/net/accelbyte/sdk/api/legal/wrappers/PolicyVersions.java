package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.policy_versions.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class PolicyVersions {

    private AccelByteSDK sdk;

    public PolicyVersions(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public UpdatePolicyVersionResponse updatePolicyVersion(UpdatePolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdatePolicyVersion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void publishPolicyVersion(PublishPolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new PublishPolicyVersion()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<RetrievePolicyVersionResponse> retrieveSinglePolicyVersion(RetrieveSinglePolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveSinglePolicyVersion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CreatePolicyVersionResponse createPolicyVersion(CreatePolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreatePolicyVersion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<RetrievePolicyVersionResponse> retrievePolicyVersions(RetrievePolicyVersions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrievePolicyVersions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
