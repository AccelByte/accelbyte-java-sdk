package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.localized_policy_versions.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class LocalizedPolicyVersions {

    private AccelByteSDK sdk;

    public LocalizedPolicyVersions(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<RetrieveLocalizedPolicyVersionResponse> retrieveLocalizedPolicyVersions(RetrieveLocalizedPolicyVersions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveLocalizedPolicyVersions()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public CreateLocalizedPolicyVersionResponse createLocalizedPolicyVersion(CreateLocalizedPolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateLocalizedPolicyVersion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UpdateLocalizedPolicyVersionResponse retrieveSingleLocalizedPolicyVersion(RetrieveSingleLocalizedPolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveSingleLocalizedPolicyVersion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UpdateLocalizedPolicyVersionResponse updateLocalizedPolicyVersion(UpdateLocalizedPolicyVersion input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateLocalizedPolicyVersion()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public UploadLocalizedPolicyVersionAttachmentResponse requestPresignedURL(RequestPresignedURL input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RequestPresignedURL()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void setDefaultPolicy(SetDefaultPolicy input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SetDefaultPolicy()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public RetrieveLocalizedPolicyVersionPublicResponse retrieveSingleLocalizedPolicyVersion1(RetrieveSingleLocalizedPolicyVersion1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveSingleLocalizedPolicyVersion1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
