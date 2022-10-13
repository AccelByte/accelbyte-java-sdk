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
import net.accelbyte.sdk.api.lobby.operations.lobby_operations.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class LobbyOperations {

  private AccelByteSDK sdk;

  public LobbyOperations(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminUpdatePartyAttributesV1
   */
  public ModelsPartyData adminUpdatePartyAttributesV1(AdminUpdatePartyAttributesV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminJoinPartyV1
   */
  public void adminJoinPartyV1(AdminJoinPartyV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
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
