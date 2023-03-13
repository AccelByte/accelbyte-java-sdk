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
import net.accelbyte.sdk.api.lobby.operations.friends.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Friends {

  private AccelByteSDK sdk;

  public Friends(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserFriendsUpdated
   */
  public List<ModelGetUserFriendsResponse> getUserFriendsUpdated(GetUserFriendsUpdated input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserIncomingFriends
   */
  public List<ModelGetUserIncomingFriendsResponse> getUserIncomingFriends(
      GetUserIncomingFriends input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserIncomingFriendsWithTime
   */
  public List<ModelLoadIncomingFriendsWithTimeResponse> getUserIncomingFriendsWithTime(
      GetUserIncomingFriendsWithTime input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserOutgoingFriends
   */
  public List<ModelGetUserOutgoingFriendsResponse> getUserOutgoingFriends(
      GetUserOutgoingFriends input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserOutgoingFriendsWithTime
   */
  public List<ModelLoadOutgoingFriendsWithTimeResponse> getUserOutgoingFriendsWithTime(
      GetUserOutgoingFriendsWithTime input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserRequestFriend
   */
  public void userRequestFriend(UserRequestFriend input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserAcceptFriendRequest
   */
  public void userAcceptFriendRequest(UserAcceptFriendRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserCancelFriendRequest
   */
  public void userCancelFriendRequest(UserCancelFriendRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserRejectFriendRequest
   */
  public void userRejectFriendRequest(UserRejectFriendRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserGetFriendshipStatus
   */
  public ModelUserGetFriendshipStatusResponse userGetFriendshipStatus(UserGetFriendshipStatus input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserUnfriendRequest
   */
  public void userUnfriendRequest(UserUnfriendRequest input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddFriendsWithoutConfirmation
   */
  public void addFriendsWithoutConfirmation(AddFriendsWithoutConfirmation input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListOfFriends
   */
  public ModelGetFriendsResponse getListOfFriends(GetListOfFriends input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
