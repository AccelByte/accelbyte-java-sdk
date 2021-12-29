package net.accelbyte.sdk.api.gdpr.wrappers;

import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class DataRetrieval {

    private AccelByteSDK sdk;

    public DataRetrieval(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<String> getAdminEmailConfiguration(GetAdminEmailConfiguration input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetAdminEmailConfiguration()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateAdminEmailConfiguration(UpdateAdminEmailConfiguration input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateAdminEmailConfiguration()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void saveAdminEmailConfiguration(SaveAdminEmailConfiguration input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SaveAdminEmailConfiguration()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteAdminEmailConfiguration(DeleteAdminEmailConfiguration input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteAdminEmailConfiguration()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsListPersonalDataResponse adminGetListPersonalDataRequest(AdminGetListPersonalDataRequest input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetListPersonalDataRequest()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsUserPersonalDataResponse adminGetUserPersonalDataRequests(AdminGetUserPersonalDataRequests input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetUserPersonalDataRequests()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsDataRetrievalResponse adminRequestDataRetrieval(AdminRequestDataRetrieval input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminRequestDataRetrieval()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminCancelUserPersonalDataRequest(AdminCancelUserPersonalDataRequest input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminCancelUserPersonalDataRequest()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsUserDataURL adminGeneratePersonalDataURL(AdminGeneratePersonalDataURL input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGeneratePersonalDataURL()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsUserPersonalDataResponse publicGetUserPersonalDataRequests(PublicGetUserPersonalDataRequests input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserPersonalDataRequests()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsDataRetrievalResponse publicRequestDataRetrieval(PublicRequestDataRetrieval input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicRequestDataRetrieval()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsListPersonalDataResponse publicCancelUserPersonalDataRequest(PublicCancelUserPersonalDataRequest input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicCancelUserPersonalDataRequest()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsUserDataURL publicGeneratePersonalDataURL(PublicGeneratePersonalDataURL input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGeneratePersonalDataURL()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
