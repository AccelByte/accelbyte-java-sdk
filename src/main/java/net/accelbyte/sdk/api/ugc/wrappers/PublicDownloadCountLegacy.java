/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_download_count_legacy.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicDownloadCountLegacy {

  private AccelByteSDK sdk;

  public PublicDownloadCountLegacy(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AddDownloadCount
   */
  public ModelsAddDownloadCountResponse addDownloadCount(AddDownloadCount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
