package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.admin_group.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class AdminGroup {

    private AccelByteSDK sdk;

    public AdminGroup(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsPaginatedGroupResponse singleAdminGetAllGroups(SingleAdminGetAllGroups input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminGetAllGroups()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateGroupResponse adminCreateGroup(AdminCreateGroup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminCreateGroup()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateGroupResponse singleAdminGetGroup(SingleAdminGetGroup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminGetGroup()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateGroupResponse singleAdminUpdateGroup(SingleAdminUpdateGroup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminUpdateGroup()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void singleAdminDeleteGroup(SingleAdminDeleteGroup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SingleAdminDeleteGroup()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse singleAdminGetGroupContents(SingleAdminGetGroupContents input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminGetGroupContents()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedGroupResponse adminGetAllGroups(AdminGetAllGroups input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetAllGroups()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateGroupResponse adminGetGroup(AdminGetGroup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetGroup()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateGroupResponse adminUpdateGroup(AdminUpdateGroup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateGroup()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteGroup(AdminDeleteGroup input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteGroup()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse adminGetGroupContents(AdminGetGroupContents input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetGroupContents()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
