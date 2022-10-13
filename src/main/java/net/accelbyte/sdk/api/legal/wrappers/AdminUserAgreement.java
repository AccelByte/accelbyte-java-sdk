/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.legal.wrappers;

import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.operations.admin_user_agreement.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class AdminUserAgreement {

  private AccelByteSDK sdk;

  public AdminUserAgreement(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see IndirectBulkAcceptVersionedPolicy
   */
  public AcceptAgreementResponse indirectBulkAcceptVersionedPolicy(
      IndirectBulkAcceptVersionedPolicy input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
