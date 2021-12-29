package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.profanity.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Profanity {

    private AccelByteSDK sdk;

    public Profanity(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<ModelsProfanityFilter> adminDebugProfanityFilters(AdminDebugProfanityFilters input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminDebugProfanityFilters()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsAdminGetProfanityListFiltersV1Response adminGetProfanityListFiltersV1(AdminGetProfanityListFiltersV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetProfanityListFiltersV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminAddProfanityFilterIntoList(AdminAddProfanityFilterIntoList input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminAddProfanityFilterIntoList()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminAddProfanityFilters(AdminAddProfanityFilters input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminAddProfanityFilters()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminImportProfanityFiltersFromFile(AdminImportProfanityFiltersFromFile input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminImportProfanityFiltersFromFile()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsProfanityFilter> adminDeleteProfanityFilter(AdminDeleteProfanityFilter input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminDeleteProfanityFilter()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsAdminGetProfanityListsListResponse> adminGetProfanityLists(AdminGetProfanityLists input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetProfanityLists()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminCreateProfanityList(AdminCreateProfanityList input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminCreateProfanityList()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminUpdateProfanityList(AdminUpdateProfanityList input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminUpdateProfanityList()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteProfanityList(AdminDeleteProfanityList input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteProfanityList()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsProfanityRule adminGetProfanityRule(AdminGetProfanityRule input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetProfanityRule()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminSetProfanityRuleForNamespace(AdminSetProfanityRuleForNamespace input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminSetProfanityRuleForNamespace()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsAdminVerifyMessageProfanityResponse adminVerifyMessageProfanityResponse(AdminVerifyMessageProfanityResponse input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminVerifyMessageProfanityResponse()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
