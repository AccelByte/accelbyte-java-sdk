/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.chat.wrappers;

import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.operations.moderation.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Moderation {

  private AccelByteSDK sdk;

  public Moderation(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetChatSnapshot
   */
  public ModelsChatSnapshots adminGetChatSnapshot(AdminGetChatSnapshot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteChatSnapshot
   */
  public void adminDeleteChatSnapshot(AdminDeleteChatSnapshot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetChatSnapshot
   */
  public ModelsChatSnapshots publicGetChatSnapshot(PublicGetChatSnapshot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
