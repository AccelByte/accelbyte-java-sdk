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
import net.accelbyte.sdk.api.ugc.operations.public_content_v2.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicContentV2 {

  private AccelByteSDK sdk;

  public PublicContentV2(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicGetContentByChannelIDV2
   */
  public ModelsPaginatedContentDownloadResponseV2 publicGetContentByChannelIDV2(
      PublicGetContentByChannelIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListContentV2
   */
  public ModelsPaginatedContentDownloadResponseV2 publicListContentV2(PublicListContentV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkGetContentByIDV2
   */
  public List<ModelsContentDownloadResponseV2> publicBulkGetContentByIDV2(
      PublicBulkGetContentByIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetContentBulkByShareCodesV2
   */
  public List<ModelsContentDownloadResponseV2> publicGetContentBulkByShareCodesV2(
      PublicGetContentBulkByShareCodesV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetContentByShareCodeV2
   */
  public ModelsContentDownloadResponseV2 publicGetContentByShareCodeV2(
      PublicGetContentByShareCodeV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetContentByIDV2
   */
  public ModelsContentDownloadResponseV2 publicGetContentByIDV2(PublicGetContentByIDV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateContentV2
   */
  public ModelsCreateContentResponseV2 publicCreateContentV2(PublicCreateContentV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateContentByShareCodeV2
   */
  public ModelsCreateContentResponseV2 publicUpdateContentByShareCodeV2(
      PublicUpdateContentByShareCodeV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeleteContentByShareCodeV2
   */
  public void publicDeleteContentByShareCodeV2(PublicDeleteContentByShareCodeV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeleteContentV2
   */
  public void publicDeleteContentV2(PublicDeleteContentV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateContentV2
   */
  public ModelsUpdateContentResponseV2 publicUpdateContentV2(PublicUpdateContentV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateContentFileLocation
   */
  public ModelsUpdateContentResponseV2 publicUpdateContentFileLocation(
      PublicUpdateContentFileLocation input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateContentShareCodeV2
   */
  public ModelsCreateContentResponseV2 updateContentShareCodeV2(UpdateContentShareCodeV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateContentUploadURLV2
   */
  public ModelsGenerateContentUploadURLResponse publicGenerateContentUploadURLV2(
      PublicGenerateContentUploadURLV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetContentByUserIDV2
   */
  public ModelsPaginatedContentDownloadResponseV2 publicGetContentByUserIDV2(
      PublicGetContentByUserIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateScreenshotsV2
   */
  public ModelsUpdateScreenshotResponse updateScreenshotsV2(UpdateScreenshotsV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UploadContentScreenshotV2
   */
  public ModelsCreateScreenshotResponse uploadContentScreenshotV2(UploadContentScreenshotV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteContentScreenshotV2
   */
  public void deleteContentScreenshotV2(DeleteContentScreenshotV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
