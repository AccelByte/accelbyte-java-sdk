package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.third_party_credential.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class ThirdPartyCredential {

    private AccelByteSDK sdk;

    public ThirdPartyCredential(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<ModelThirdPartyLoginPlatformCredentialResponse> retrieveAllThirdPartyLoginPlatformCredentialV3(RetrieveAllThirdPartyLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelThirdPartyLoginPlatformCredentialResponse> retrieveAllActiveThirdPartyLoginPlatformCredentialV3(RetrieveAllActiveThirdPartyLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelThirdPartyLoginPlatformCredentialResponse retrieveThirdPartyLoginPlatformCredentialV3(RetrieveThirdPartyLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelThirdPartyLoginPlatformCredentialResponse addThirdPartyLoginPlatformCredentialV3(AddThirdPartyLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteThirdPartyLoginPlatformCredentialV3(DeleteThirdPartyLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelThirdPartyLoginPlatformCredentialResponse updateThirdPartyLoginPlatformCredentialV3(UpdateThirdPartyLoginPlatformCredentialV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelPlatformDomainResponse updateThirdPartyLoginPlatformDomainV3(UpdateThirdPartyLoginPlatformDomainV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteThirdPartyLoginPlatformDomainV3(DeleteThirdPartyLoginPlatformDomainV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            input
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelPublicThirdPartyPlatformInfo> retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3(RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return input
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
