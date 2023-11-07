/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.session.wrappers;

import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.operations.max_active.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class MaxActive {

  private AccelByteSDK sdk;

  public MaxActive(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetMemberActiveSession
   */
  public ModelsMemberActiveSession adminGetMemberActiveSession(AdminGetMemberActiveSession input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminReconcileMaxActiveSession
   */
  public void adminReconcileMaxActiveSession(AdminReconcileMaxActiveSession input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
