package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.sso_credential.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class SSOCredential {

    private AccelByteSDK sdk;

    public SSOCredential(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<ModelSSOPlatformCredentialResponse> retrieveAllSSOLoginPlatformCredentialV3(RetrieveAllSSOLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveAllSSOLoginPlatformCredentialV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelSSOPlatformCredentialResponse retrieveSSOLoginPlatformCredential(RetrieveSSOLoginPlatformCredential input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RetrieveSSOLoginPlatformCredential()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelSSOPlatformCredentialResponse addSSOLoginPlatformCredential(AddSSOLoginPlatformCredential input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AddSSOLoginPlatformCredential()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteSSOLoginPlatformCredentialV3(DeleteSSOLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteSSOLoginPlatformCredentialV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelSSOPlatformCredentialResponse updateSSOPlatformCredential(UpdateSSOPlatformCredential input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateSSOPlatformCredential()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}