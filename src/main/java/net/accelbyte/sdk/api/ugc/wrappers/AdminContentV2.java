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
import net.accelbyte.sdk.api.ugc.operations.admin_content_v2.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminContentV2 {

  private AccelByteSDK sdk;

  public AdminContentV2(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetContentByChannelIDV2
   */
  public ModelsPaginatedContentDownloadResponseV2 adminGetContentByChannelIDV2(
      AdminGetContentByChannelIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateContentV2
   */
  public ModelsCreateContentResponseV2 adminCreateContentV2(AdminCreateContentV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteOfficialContentV2
   */
  public void adminDeleteOfficialContentV2(AdminDeleteOfficialContentV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateOfficialContentV2
   */
  public ModelsUpdateContentResponseV2 adminUpdateOfficialContentV2(
      AdminUpdateOfficialContentV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateOfficialContentFileLocation
   */
  public ModelsUpdateContentResponseV2 adminUpdateOfficialContentFileLocation(
      AdminUpdateOfficialContentFileLocation input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateOfficialContentUploadURLV2
   */
  public ModelsGenerateContentUploadURLResponse adminGenerateOfficialContentUploadURLV2(
      AdminGenerateOfficialContentUploadURLV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListContentV2
   */
  public ModelsPaginatedContentDownloadResponseV2 adminListContentV2(AdminListContentV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkGetContentByIDsV2
   */
  public List<ModelsContentDownloadResponseV2> adminBulkGetContentByIDsV2(
      AdminBulkGetContentByIDsV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetContentBulkByShareCodesV2
   */
  public List<ModelsContentDownloadResponseV2> adminGetContentBulkByShareCodesV2(
      AdminGetContentBulkByShareCodesV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetContentByShareCodeV2
   */
  public ModelsContentDownloadResponseV2 adminGetContentByShareCodeV2(
      AdminGetContentByShareCodeV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetContentByContentIDV2
   */
  public ModelsContentDownloadResponseV2 adminGetContentByContentIDV2(
      AdminGetContentByContentIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RollbackContentVersionV2
   */
  public ModelsContentDownloadResponse rollbackContentVersionV2(RollbackContentVersionV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateScreenshotsV2
   */
  public ModelsUpdateScreenshotResponse adminUpdateScreenshotsV2(AdminUpdateScreenshotsV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUploadContentScreenshotV2
   */
  public ModelsCreateScreenshotResponse adminUploadContentScreenshotV2(
      AdminUploadContentScreenshotV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteContentScreenshotV2
   */
  public void adminDeleteContentScreenshotV2(AdminDeleteContentScreenshotV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListContentVersionsV2
   */
  public ModelsListContentVersionsResponse listContentVersionsV2(ListContentVersionsV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateContentByShareCodeV2
   */
  public ModelsCreateContentResponseV2 adminUpdateContentByShareCodeV2(
      AdminUpdateContentByShareCodeV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteContentByShareCodeV2
   */
  public void adminDeleteContentByShareCodeV2(AdminDeleteContentByShareCodeV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteUserContentV2
   */
  public void adminDeleteUserContentV2(AdminDeleteUserContentV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserContentV2
   */
  public ModelsUpdateContentResponseV2 adminUpdateUserContentV2(AdminUpdateUserContentV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserContentFileLocation
   */
  public ModelsUpdateContentResponseV2 adminUpdateUserContentFileLocation(
      AdminUpdateUserContentFileLocation input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateUserContentUploadURLV2
   */
  public ModelsGenerateContentUploadURLResponse adminGenerateUserContentUploadURLV2(
      AdminGenerateUserContentUploadURLV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetContentByUserIDV2
   */
  public ModelsPaginatedContentDownloadResponseV2 adminGetContentByUserIDV2(
      AdminGetContentByUserIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateContentHideStatusV2
   */
  public ModelsCreateContentResponseV2 adminUpdateContentHideStatusV2(
      AdminUpdateContentHideStatusV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
