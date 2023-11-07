/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_download_count_v2.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicDownloadCountV2 {

  private AccelByteSDK sdk;

  public PublicDownloadCountV2(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicAddDownloadCountV2
   */
  public ModelsAddDownloadCountResponse publicAddDownloadCountV2(PublicAddDownloadCountV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListContentDownloaderV2
   */
  public ModelsPaginatedContentDownloaderResponse publicListContentDownloaderV2(
      PublicListContentDownloaderV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
