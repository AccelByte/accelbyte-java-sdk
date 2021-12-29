package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.admin_content.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class AdminContent {

    private AccelByteSDK sdk;

    public AdminContent(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsCreateContentResponse adminUploadContentDirect(AdminUploadContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUploadContentDirect()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse adminUploadContentS3(AdminUploadContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUploadContentS3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse singleAdminUpdateContentS3(SingleAdminUpdateContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminUpdateContentS3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse adminSearchChannelSpecificContent(AdminSearchChannelSpecificContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminSearchChannelSpecificContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse singleAdminUpdateContentDirect(SingleAdminUpdateContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminUpdateContentDirect()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void singleAdminDeleteContent(SingleAdminDeleteContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SingleAdminDeleteContent()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse singleAdminGetContent(SingleAdminGetContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SingleAdminGetContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse adminSearchContent(AdminSearchContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminSearchContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsContentDownloadResponse adminGetSpecificContent(AdminGetSpecificContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetSpecificContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetContentPreviewResponse adminDownloadContentPreview(AdminDownloadContentPreview input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminDownloadContentPreview()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsUpdateScreenshotResponse adminUpdateScreenshots(AdminUpdateScreenshots input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateScreenshots()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateScreenshotResponse adminUploadContentScreenshot(AdminUploadContentScreenshot input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUploadContentScreenshot()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteContentScreenshot(AdminDeleteContentScreenshot input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteContentScreenshot()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse adminUpdateContentS3(AdminUpdateContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateContentS3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse adminUpdateContentDirect(AdminUpdateContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateContentDirect()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteContent(AdminDeleteContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteContent()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse adminGetContent(AdminGetContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse adminHideUserContent(AdminHideUserContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminHideUserContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
