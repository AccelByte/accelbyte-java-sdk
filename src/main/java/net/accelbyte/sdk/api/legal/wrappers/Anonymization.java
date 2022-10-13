/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.operations.anonymization.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Anonymization {

  private AccelByteSDK sdk;

  public Anonymization(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AnonymizeUserAgreement
   */
  public void anonymizeUserAgreement(AnonymizeUserAgreement input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
