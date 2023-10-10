/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.seasonpass.wrappers;

import java.io.*;
import net.accelbyte.sdk.api.seasonpass.operations.export.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Export {

  private AccelByteSDK sdk;

  public Export(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ExportSeason
   */
  public InputStream exportSeason(ExportSeason input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
