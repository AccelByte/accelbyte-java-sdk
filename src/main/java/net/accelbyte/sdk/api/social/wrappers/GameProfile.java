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
   * @deprecated
   */
  @Deprecated
  public List<GameProfileHeader> getUserProfiles(GetUserProfiles input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetProfile
   * @deprecated
   */
  @Deprecated
  public GameProfileInfo getProfile(GetProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserGameProfiles
   * @deprecated
   */
  @Deprecated
  public List<UserGameProfiles> publicGetUserGameProfiles(PublicGetUserGameProfiles input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserProfiles
   * @deprecated
   */
  @Deprecated
  public List<GameProfileHeader> publicGetUserProfiles(PublicGetUserProfiles input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateProfile
   * @deprecated
   */
  @Deprecated
  public void publicCreateProfile(PublicCreateProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetProfile
   * @deprecated
   */
  @Deprecated
  public GameProfileInfo publicGetProfile(PublicGetProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateProfile
   * @deprecated
   */
  @Deprecated
  public GameProfileInfo publicUpdateProfile(PublicUpdateProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeleteProfile
   * @deprecated
   */
  @Deprecated
  public void publicDeleteProfile(PublicDeleteProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetProfileAttribute
   * @deprecated
   */
  @Deprecated
  public Attribute publicGetProfileAttribute(PublicGetProfileAttribute input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateAttribute
   * @deprecated
   */
  @Deprecated
  public GameProfileInfo publicUpdateAttribute(PublicUpdateAttribute input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
