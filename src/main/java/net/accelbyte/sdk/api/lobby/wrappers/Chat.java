/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.chat.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Chat {

  private AccelByteSDK sdk;

  public Chat(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see PersonalChatHistory
   */
  public List<ModelChatMessageResponse> personalChatHistory(PersonalChatHistory input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminChatHistory
   */
  public List<ModelChatMessageResponse> adminChatHistory(AdminChatHistory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPersonalChatHistoryV1Public
   */
  public List<ModelChatMessageResponse> getPersonalChatHistoryV1Public(
      GetPersonalChatHistoryV1Public input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
