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
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBulkPlayerBlockedPlayersV1
   */
  public ModelsGetBulkAllPlayerBlockedUsersResponse adminGetBulkPlayerBlockedPlayersV1(
      AdminGetBulkPlayerBlockedPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAllPlayerSessionAttribute
   * @deprecated
   */
  @Deprecated
  public ModelsGetAllPlayerSessionAttributeResponse adminGetAllPlayerSessionAttribute(
      AdminGetAllPlayerSessionAttribute input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSetPlayerSessionAttribute
   * @deprecated
   */
  @Deprecated
  public void adminSetPlayerSessionAttribute(AdminSetPlayerSessionAttribute input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerSessionAttribute
   * @deprecated
   */
  @Deprecated
  public ModelsGetPlayerSessionAttributeResponse adminGetPlayerSessionAttribute(
      AdminGetPlayerSessionAttribute input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerBlockedPlayersV1
   */
  public ModelsGetAllPlayerBlockedUsersResponse adminGetPlayerBlockedPlayersV1(
      AdminGetPlayerBlockedPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetPlayerBlockedByPlayersV1
   */
  public ModelsGetAllPlayerBlockedByUsersResponse adminGetPlayerBlockedByPlayersV1(
      AdminGetPlayerBlockedByPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkBlockPlayersV1
   */
  public void adminBulkBlockPlayersV1(AdminBulkBlockPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkUnblockPlayersV1
   */
  public void adminBulkUnblockPlayersV1(AdminBulkUnblockPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicPlayerBlockPlayersV1
   */
  public void publicPlayerBlockPlayersV1(PublicPlayerBlockPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetPlayerBlockedPlayersV1
   */
  public ModelsGetAllPlayerBlockedUsersResponse publicGetPlayerBlockedPlayersV1(
      PublicGetPlayerBlockedPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetPlayerBlockedByPlayersV1
   */
  public ModelsGetAllPlayerBlockedByUsersResponse publicGetPlayerBlockedByPlayersV1(
      PublicGetPlayerBlockedByPlayersV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUnblockPlayerV1
   */
  public void publicUnblockPlayerV1(PublicUnblockPlayerV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
