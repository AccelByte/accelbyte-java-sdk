/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.wrappers;

import java.io.*;
import java.util.*;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.slot.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Slot {

  private AccelByteSDK sdk;

  public Slot(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserNamespaceSlots
   * @deprecated
   */
  @Deprecated
  public List<SlotInfo> getUserNamespaceSlots(GetUserNamespaceSlots input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSlotData
   * @deprecated
   */
  @Deprecated
  public InputStream getSlotData(GetSlotData input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserNamespaceSlots
   * @deprecated
   */
  @Deprecated
  public List<SlotInfo> publicGetUserNamespaceSlots(PublicGetUserNamespaceSlots input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateUserNamespaceSlot
   * @deprecated
   */
  @Deprecated
  public void publicCreateUserNamespaceSlot(PublicCreateUserNamespaceSlot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetSlotData
   * @deprecated
   */
  @Deprecated
  public InputStream publicGetSlotData(PublicGetSlotData input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserNamespaceSlot
   * @deprecated
   */
  @Deprecated
  public SlotInfo publicUpdateUserNamespaceSlot(PublicUpdateUserNamespaceSlot input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeleteUserNamespaceSlot
   * @deprecated
   */
  @Deprecated
  public void publicDeleteUserNamespaceSlot(PublicDeleteUserNamespaceSlot input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserNamespaceSlotMetadata
   * @deprecated
   */
  @Deprecated
  public SlotInfo publicUpdateUserNamespaceSlotMetadata(PublicUpdateUserNamespaceSlotMetadata input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
