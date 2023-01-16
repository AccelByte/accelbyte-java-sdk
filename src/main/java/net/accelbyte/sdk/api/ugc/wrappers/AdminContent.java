/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.admin_content.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminContent {

  private AccelByteSDK sdk;

  public AdminContent(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminUploadContentDirect
   * @deprecated
   */
  @Deprecated
  public ModelsCreateContentResponse adminUploadContentDirect(AdminUploadContentDirect input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUploadContentS3
   */
  public ModelsCreateContentResponse adminUploadContentS3(AdminUploadContentS3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminUpdateContentS3
   */
  public ModelsCreateContentResponse singleAdminUpdateContentS3(SingleAdminUpdateContentS3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSearchChannelSpecificContent
   */
  public ModelsPaginatedContentDownloadResponse adminSearchChannelSpecificContent(
      AdminSearchChannelSpecificContent input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminUpdateContentDirect
   * @deprecated
   */
  @Deprecated
  public ModelsCreateContentResponse singleAdminUpdateContentDirect(
      SingleAdminUpdateContentDirect input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminDeleteContent
   */
  public void singleAdminDeleteContent(SingleAdminDeleteContent input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SingleAdminGetContent
   */
  public ModelsPaginatedContentDownloadResponse singleAdminGetContent(SingleAdminGetContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetContentBulk
   */
  public List<ModelsContentDownloadResponse> adminGetContentBulk(AdminGetContentBulk input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSearchContent
   */
  public ModelsPaginatedContentDownloadResponse adminSearchContent(AdminSearchContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserContentByShareCode
   */
  public ModelsContentDownloadResponse adminGetUserContentByShareCode(
      AdminGetUserContentByShareCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetSpecificContent
   */
  public ModelsContentDownloadResponse adminGetSpecificContent(AdminGetSpecificContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDownloadContentPreview
   */
  public ModelsGetContentPreviewResponse adminDownloadContentPreview(
      AdminDownloadContentPreview input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateScreenshots
   */
  public ModelsUpdateScreenshotResponse adminUpdateScreenshots(AdminUpdateScreenshots input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUploadContentScreenshot
   */
  public ModelsCreateScreenshotResponse adminUploadContentScreenshot(
      AdminUploadContentScreenshot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteContentScreenshot
   */
  public void adminDeleteContentScreenshot(AdminDeleteContentScreenshot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateContentS3
   */
  public ModelsCreateContentResponse adminUpdateContentS3(AdminUpdateContentS3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateContentDirect
   * @deprecated
   */
  @Deprecated
  public ModelsCreateContentResponse adminUpdateContentDirect(AdminUpdateContentDirect input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteContent
   */
  public void adminDeleteContent(AdminDeleteContent input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetContent
   */
  public ModelsPaginatedContentDownloadResponse adminGetContent(AdminGetContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminHideUserContent
   */
  public ModelsCreateContentResponse adminHideUserContent(AdminHideUserContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
