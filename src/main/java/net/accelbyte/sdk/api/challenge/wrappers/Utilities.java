/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.challenge.wrappers;

import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.operations.utilities.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Utilities {

  private AccelByteSDK sdk;

  public Utilities(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetItemReferences
   */
  public ModelItemReferenceResponse adminGetItemReferences(AdminGetItemReferences input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
