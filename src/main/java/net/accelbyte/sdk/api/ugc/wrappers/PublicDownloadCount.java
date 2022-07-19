/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ugc.wrappers;

import java.io.*;
import java.util.*;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.operations.public_download_count.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PublicDownloadCount {

  private AccelByteSDK sdk;

  public PublicDownloadCount(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AddDownloadCount
   */
  public ModelsAddDownloadCountResponse addDownloadCount(AddDownloadCount input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }
}
