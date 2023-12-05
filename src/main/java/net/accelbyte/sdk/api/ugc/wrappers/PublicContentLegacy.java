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
import net.accelbyte.sdk.api.ugc.operations.public_content_legacy.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicContentLegacy {

  private AccelByteSDK sdk;

  public PublicContentLegacy(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see SearchChannelSpecificContent
   */
  public ModelsPaginatedContentDownloadResponse searchChannelSpecificContent(
      SearchChannelSpecificContent input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSearchContent
   */
  public ModelsPaginatedContentDownloadResponse publicSearchContent(PublicSearchContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetContentBulk
   */
  public List<ModelsContentDownloadResponse> publicGetContentBulk(PublicGetContentBulk input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetContentBulkByShareCodes
   */
  public List<ModelsContentDownloadResponse> publicGetContentBulkByShareCodes(
      PublicGetContentBulkByShareCodes input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDownloadContentByShareCode
   */
  public ModelsContentDownloadResponse publicDownloadContentByShareCode(
      PublicDownloadContentByShareCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDownloadContentByContentID
   */
  public ModelsContentDownloadResponse publicDownloadContentByContentID(
      PublicDownloadContentByContentID input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDownloadContentPreview
   */
  public ModelsGetContentPreviewResponse publicDownloadContentPreview(
      PublicDownloadContentPreview input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateContentDirect
   * @deprecated
   */
  @Deprecated
  public ModelsCreateContentResponse createContentDirect(CreateContentDirect input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateContentS3
   */
  public ModelsCreateContentResponse createContentS3(CreateContentS3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateContentByShareCode
   */
  public ModelsCreateContentResponse publicUpdateContentByShareCode(
      PublicUpdateContentByShareCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateContentS3
   */
  public ModelsCreateContentResponse updateContentS3(UpdateContentS3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeleteContentByShareCode
   */
  public void publicDeleteContentByShareCode(PublicDeleteContentByShareCode input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateContentDirect
   * @deprecated
   */
  @Deprecated
  public ModelsCreateContentResponse updateContentDirect(UpdateContentDirect input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteContent
   */
  public void deleteContent(DeleteContent input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateContentShareCode
   */
  public ModelsCreateContentResponse updateContentShareCode(UpdateContentShareCode input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserContent
   */
  public ModelsPaginatedContentDownloadResponse publicGetUserContent(PublicGetUserContent input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateScreenshots
   */
  public ModelsUpdateScreenshotResponse updateScreenshots(UpdateScreenshots input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UploadContentScreenshot
   */
  public ModelsCreateScreenshotResponse uploadContentScreenshot(UploadContentScreenshot input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteContentScreenshot
   */
  public void deleteContentScreenshot(DeleteContentScreenshot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
