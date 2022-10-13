/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.operations.sso_saml_2_0.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class SSOSAML20 {

  private AccelByteSDK sdk;

  public SSOSAML20(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PlatformAuthenticateSAMLV3Handler
   */
  public String platformAuthenticateSAMLV3Handler(PlatformAuthenticateSAMLV3Handler input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
