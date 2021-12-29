package net.accelbyte.sdk.api.dsmc.wrappers;

import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.operations.image_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class ImageConfig {

    private AccelByteSDK sdk;

    public ImageConfig(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public void updateImage(UpdateImage input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateImage()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void createImage(CreateImage input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new CreateImage()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsImportResponse importImages(ImportImages input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ImportImages()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsListImageResponse listImages(ListImages input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ListImages()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteImage(DeleteImage input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteImage()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public List<ModelsImageRecord> exportImages(ExportImages input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ExportImages()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetImageLimitResponse getImageLimit(GetImageLimit input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetImageLimit()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetImageDetailResponse getImageDetail(GetImageDetail input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetImageDetail()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetImageDetailResponse imageDetailClient(ImageDetailClient input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new ImageDetailClient()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
