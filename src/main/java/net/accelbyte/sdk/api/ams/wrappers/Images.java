/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.ams.wrappers;

import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.operations.images.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Images {

  private AccelByteSDK sdk;

  public Images(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see ImageList
   */
  public ApiImageList imageList(ImageList input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ImageGet
   */
  public ApiImageDetails imageGet(ImageGet input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ImagePatch
   */
  public ApiImageDetails imagePatch(ImagePatch input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
