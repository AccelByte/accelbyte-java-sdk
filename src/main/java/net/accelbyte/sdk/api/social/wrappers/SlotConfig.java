/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.wrappers;

import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.slot_config.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class SlotConfig {

  private AccelByteSDK sdk;

  public SlotConfig(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetNamespaceSlotConfig
   */
  public NamespaceSlotConfigInfo getNamespaceSlotConfig(GetNamespaceSlotConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateNamespaceSlotConfig
   */
  public NamespaceSlotConfigInfo updateNamespaceSlotConfig(UpdateNamespaceSlotConfig input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteNamespaceSlotConfig
   */
  public void deleteNamespaceSlotConfig(DeleteNamespaceSlotConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserSlotConfig
   */
  public UserSlotConfigInfo getUserSlotConfig(GetUserSlotConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserSlotConfig
   */
  public UserSlotConfigInfo updateUserSlotConfig(UpdateUserSlotConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserSlotConfig
   */
  public void deleteUserSlotConfig(DeleteUserSlotConfig input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
