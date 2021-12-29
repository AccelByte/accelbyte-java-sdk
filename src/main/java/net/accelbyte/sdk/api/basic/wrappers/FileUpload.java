package net.accelbyte.sdk.api.basic.wrappers;

import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.operations.file_upload.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class FileUpload {

    private AccelByteSDK sdk;

    public FileUpload(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public FileUploadUrlInfo generatedUploadUrl(GeneratedUploadUrl input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GeneratedUploadUrl()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FileUploadUrlInfo generatedUserUploadContentUrl(GeneratedUserUploadContentUrl input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GeneratedUserUploadContentUrl()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FileUploadUrlInfo publicGeneratedUploadUrl(PublicGeneratedUploadUrl input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGeneratedUploadUrl()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public FileUploadUrlInfo publicGeneratedUserUploadContentUrl(PublicGeneratedUserUploadContentUrl input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGeneratedUserUploadContentUrl()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
