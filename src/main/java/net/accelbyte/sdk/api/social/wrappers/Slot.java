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
   */
  public List<SlotInfo> getUserNamespaceSlots(GetUserNamespaceSlots input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see GetSlotData
   */
  public InputStream getSlotData(GetSlotData input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicGetUserNamespaceSlots
   */
  public List<SlotInfo> publicGetUserNamespaceSlots(PublicGetUserNamespaceSlots input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicCreateUserNamespaceSlot
   */
  public void publicCreateUserNamespaceSlot(PublicCreateUserNamespaceSlot input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicGetSlotData
   */
  public InputStream publicGetSlotData(PublicGetSlotData input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicUpdateUserNamespaceSlot
   */
  public SlotInfo publicUpdateUserNamespaceSlot(PublicUpdateUserNamespaceSlot input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicDeleteUserNamespaceSlot
   */
  public void publicDeleteUserNamespaceSlot(PublicDeleteUserNamespaceSlot input) throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      input.handleEmptyResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }

  /**
   * @see PublicUpdateUserNamespaceSlotMetadata
   */
  public SlotInfo publicUpdateUserNamespaceSlotMetadata(PublicUpdateUserNamespaceSlotMetadata input)
      throws Exception {
    HttpResponse httpResponse = null;
    try {
      httpResponse = sdk.runRequest(input);
      return input.parseResponse(
          httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
    } finally {
      if (httpResponse != null && httpResponse.getPayload() != null) {
        httpResponse.getPayload().close();
      }
    }
  }
}
