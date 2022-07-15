/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.lobby.wrappers;

import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.operations.player.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Player {

  private AccelByteSDK sdk;

  public Player(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminGetLobbyCCU
   */
  public ModelsGetLobbyCcuResponse adminGetLobbyCCU(AdminGetLobbyCCU input) throws Exception {
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
   * @see AdminGetAllPlayerSessionAttribute
   */
  public ModelsGetAllPlayerSessionAttributeResponse adminGetAllPlayerSessionAttribute(
      AdminGetAllPlayerSessionAttribute input) throws Exception {
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
   * @see AdminSetPlayerSessionAttribute
   */
  public void adminSetPlayerSessionAttribute(AdminSetPlayerSessionAttribute input)
      throws Exception {
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
   * @see AdminGetPlayerSessionAttribute
   */
  public ModelsGetPlayerSessionAttributeResponse adminGetPlayerSessionAttribute(
      AdminGetPlayerSessionAttribute input) throws Exception {
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
   * @see AdminGetPlayerBlockedPlayersV1
   */
  public ModelsGetAllPlayerBlockedUsersResponse adminGetPlayerBlockedPlayersV1(
      AdminGetPlayerBlockedPlayersV1 input) throws Exception {
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
   * @see AdminGetPlayerBlockedByPlayersV1
   */
  public ModelsGetAllPlayerBlockedByUsersResponse adminGetPlayerBlockedByPlayersV1(
      AdminGetPlayerBlockedByPlayersV1 input) throws Exception {
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
   * @see AdminBulkBlockPlayersV1
   */
  public void adminBulkBlockPlayersV1(AdminBulkBlockPlayersV1 input) throws Exception {
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
   * @see PublicGetPlayerBlockedPlayersV1
   */
  public ModelsGetAllPlayerBlockedUsersResponse publicGetPlayerBlockedPlayersV1(
      PublicGetPlayerBlockedPlayersV1 input) throws Exception {
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
   * @see PublicGetPlayerBlockedByPlayersV1
   */
  public ModelsGetAllPlayerBlockedByUsersResponse publicGetPlayerBlockedByPlayersV1(
      PublicGetPlayerBlockedByPlayersV1 input) throws Exception {
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
