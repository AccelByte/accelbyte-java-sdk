/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.csm.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.operations.messages.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Messages {

  private AccelByteSDK sdk;

  public Messages(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PublicGetMessages
   */
  public List<LogAppMessageDeclaration> publicGetMessages(PublicGetMessages input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
