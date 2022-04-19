/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

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

    /**
     * @see AdminUploadContentDirect
     * @deprecated
     */
    @Deprecated
    public ModelsCreateContentResponse adminUploadContentDirect(AdminUploadContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminUploadContentS3
     */
    public ModelsCreateContentResponse adminUploadContentS3(AdminUploadContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see SingleAdminUpdateContentS3
     */
    public ModelsCreateContentResponse singleAdminUpdateContentS3(SingleAdminUpdateContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminSearchChannelSpecificContent
     */
    public ModelsPaginatedContentDownloadResponse adminSearchChannelSpecificContent(AdminSearchChannelSpecificContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see SingleAdminUpdateContentDirect
     * @deprecated
     */
    @Deprecated
    public ModelsCreateContentResponse singleAdminUpdateContentDirect(SingleAdminUpdateContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see SingleAdminDeleteContent
     */
    public void singleAdminDeleteContent(SingleAdminDeleteContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          input
              .handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see SingleAdminGetContent
     */
    public ModelsPaginatedContentDownloadResponse singleAdminGetContent(SingleAdminGetContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminSearchContent
     */
    public ModelsPaginatedContentDownloadResponse adminSearchContent(AdminSearchContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminGetSpecificContent
     */
    public ModelsContentDownloadResponse adminGetSpecificContent(AdminGetSpecificContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminDownloadContentPreview
     */
    public ModelsGetContentPreviewResponse adminDownloadContentPreview(AdminDownloadContentPreview input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminUpdateScreenshots
     */
    public ModelsUpdateScreenshotResponse adminUpdateScreenshots(AdminUpdateScreenshots input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminUploadContentScreenshot
     */
    public ModelsCreateScreenshotResponse adminUploadContentScreenshot(AdminUploadContentScreenshot input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminDeleteContentScreenshot
     */
    public void adminDeleteContentScreenshot(AdminDeleteContentScreenshot input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          input
              .handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminUpdateContentS3
     */
    public ModelsCreateContentResponse adminUpdateContentS3(AdminUpdateContentS3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminUpdateContentDirect
     * @deprecated
     */
    @Deprecated
    public ModelsCreateContentResponse adminUpdateContentDirect(AdminUpdateContentDirect input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminDeleteContent
     */
    public void adminDeleteContent(AdminDeleteContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          input
              .handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminGetContent
     */
    public ModelsPaginatedContentDownloadResponse adminGetContent(AdminGetContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

    /**
     * @see AdminHideUserContent
     */
    public ModelsCreateContentResponse adminHideUserContent(AdminHideUserContent input) throws ResponseException, IOException {
        HttpResponse httpResponse = null;
        try {
          httpResponse = sdk.runRequest(input);
          return input
              .parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
          );
        }
        finally {
          if (httpResponse != null && httpResponse.getPayload() != null) {
            httpResponse.getPayload().close();
          }
        }
    }

}
