/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.utility.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Utility {

  private AccelByteSDK sdk;

  public Utility(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CheckReadiness
   */
  public LegalReadinessStatusResponse checkReadiness(CheckReadiness input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
