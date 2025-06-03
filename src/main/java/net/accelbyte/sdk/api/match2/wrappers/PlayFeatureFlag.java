/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.match2.wrappers;

import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.operations.play_feature_flag.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class PlayFeatureFlag {

  private AccelByteSDK sdk;

  public PlayFeatureFlag(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetPlayFeatureFlag
   */
  public ModelsPlayFeatureFlag adminGetPlayFeatureFlag(AdminGetPlayFeatureFlag input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpsertPlayFeatureFlag
   */
  public ModelsPlayFeatureFlag adminUpsertPlayFeatureFlag(AdminUpsertPlayFeatureFlag input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlayFeatureFlag
   */
  public void adminDeletePlayFeatureFlag(AdminDeletePlayFeatureFlag input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
