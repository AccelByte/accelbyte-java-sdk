package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_content.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class PublicContent {

    private AccelByteSDK sdk;

    public PublicContent(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsPaginatedContentDownloadResponse searchChannelSpecificContent(SearchChannelSpecificContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new SearchChannelSpecificContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse publicSearchContent(PublicSearchContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicSearchContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsContentDownloadResponse downloadContentByShareCode(DownloadContentByShareCode input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new DownloadContentByShareCode()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsContentDownloadResponse publicDownloadContentByContentID(PublicDownloadContentByContentID input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicDownloadContentByContentID()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetContentPreviewResponse publicDownloadContentPreview(PublicDownloadContentPreview input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicDownloadContentPreview()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse createContentDirect(CreateContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateContentDirect()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse createContentS3(CreateContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateContentS3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse updateContentS3(UpdateContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateContentS3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateContentResponse updateContentDirect(UpdateContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateContentDirect()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteContent(DeleteContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteContent()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsPaginatedContentDownloadResponse publicGetUserContent(PublicGetUserContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetUserContent()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsUpdateScreenshotResponse updateScreenshots(UpdateScreenshots input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateScreenshots()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsCreateScreenshotResponse uploadContentScreenshot(UploadContentScreenshot input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UploadContentScreenshot()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteContentScreenshot(DeleteContentScreenshot input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteContentScreenshot()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
