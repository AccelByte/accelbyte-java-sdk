/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.social.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.operations.game_profile.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GameProfile {

  private AccelByteSDK sdk;

  public GameProfile(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserProfiles
   */
  public List<GameProfileHeader> getUserProfiles(GetUserProfiles input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetProfile
   */
  public GameProfileInfo getProfile(GetProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserGameProfiles
   */
  public List<UserGameProfiles> publicGetUserGameProfiles(PublicGetUserGameProfiles input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserProfiles
   */
  public List<GameProfileHeader> publicGetUserProfiles(PublicGetUserProfiles input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateProfile
   */
  public void publicCreateProfile(PublicCreateProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetProfile
   */
  public GameProfileInfo publicGetProfile(PublicGetProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateProfile
   */
  public GameProfileInfo publicUpdateProfile(PublicUpdateProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeleteProfile
   */
  public void publicDeleteProfile(PublicDeleteProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetProfileAttribute
   */
  public Attribute publicGetProfileAttribute(PublicGetProfileAttribute input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateAttribute
   */
  public GameProfileInfo publicUpdateAttribute(PublicUpdateAttribute input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
