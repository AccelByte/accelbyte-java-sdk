/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.login_allowlist.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class LoginAllowlist {

  private AccelByteSDK sdk;

  public LoginAllowlist(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetLoginAllowlistV3
   */
  public ModelLoginAllowlistResponse adminGetLoginAllowlistV3(AdminGetLoginAllowlistV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateLoginAllowlistV3
   */
  public void adminUpdateLoginAllowlistV3(AdminUpdateLoginAllowlistV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
