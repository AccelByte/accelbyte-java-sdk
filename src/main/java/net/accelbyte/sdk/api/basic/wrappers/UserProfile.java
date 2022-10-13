/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.basic.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.operations.user_profile.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UserProfile {

  private AccelByteSDK sdk;

  public UserProfile(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetUserProfileInfoByPublicId
   */
  public UserProfileInfo getUserProfileInfoByPublicId(GetUserProfileInfoByPublicId input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserProfilePublicInfoByIds
   */
  public List<UserProfilePublicInfo> adminGetUserProfilePublicInfoByIds(
      AdminGetUserProfilePublicInfoByIds input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserProfileInfo
   */
  public UserProfilePrivateInfo getUserProfileInfo(GetUserProfileInfo input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserProfile
   */
  public UserProfilePrivateInfo updateUserProfile(UpdateUserProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserProfile
   */
  public UserProfilePrivateInfo deleteUserProfile(DeleteUserProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetCustomAttributesInfo
   */
  public Map<String, ?> getCustomAttributesInfo(GetCustomAttributesInfo input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateCustomAttributesPartially
   */
  public Map<String, ?> updateCustomAttributesPartially(UpdateCustomAttributesPartially input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPrivateCustomAttributesInfo
   */
  public Map<String, ?> getPrivateCustomAttributesInfo(GetPrivateCustomAttributesInfo input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePrivateCustomAttributesPartially
   */
  public Map<String, ?> updatePrivateCustomAttributesPartially(
      UpdatePrivateCustomAttributesPartially input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserProfileStatus
   */
  public UserProfilePrivateInfo updateUserProfileStatus(UpdateUserProfileStatus input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserProfilePublicInfoByIds
   */
  public List<UserProfilePublicInfo> publicGetUserProfilePublicInfoByIds(
      PublicGetUserProfilePublicInfoByIds input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserProfileInfoByPublicId
   */
  public UserProfilePublicInfo publicGetUserProfileInfoByPublicId(
      PublicGetUserProfileInfoByPublicId input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMyProfileInfo
   */
  public UserProfilePrivateInfo getMyProfileInfo(GetMyProfileInfo input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMyProfile
   */
  public UserProfilePrivateInfo updateMyProfile(UpdateMyProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateMyProfile
   */
  public UserProfilePrivateInfo createMyProfile(CreateMyProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMyPrivateCustomAttributesInfo
   */
  public Map<String, ?> getMyPrivateCustomAttributesInfo(GetMyPrivateCustomAttributesInfo input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMyPrivateCustomAttributesPartially
   */
  public Map<String, ?> updateMyPrivateCustomAttributesPartially(
      UpdateMyPrivateCustomAttributesPartially input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMyZipCode
   */
  public UserZipCode getMyZipCode(GetMyZipCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMyZipCode
   */
  public UserZipCode updateMyZipCode(UpdateMyZipCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserProfileInfo
   */
  public UserProfileInfo publicGetUserProfileInfo(PublicGetUserProfileInfo input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserProfile
   */
  public UserProfileInfo publicUpdateUserProfile(PublicUpdateUserProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateUserProfile
   */
  public UserProfileInfo publicCreateUserProfile(PublicCreateUserProfile input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetCustomAttributesInfo
   */
  public Map<String, ?> publicGetCustomAttributesInfo(PublicGetCustomAttributesInfo input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateCustomAttributesPartially
   */
  public Map<String, ?> publicUpdateCustomAttributesPartially(
      PublicUpdateCustomAttributesPartially input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserProfilePublicInfo
   */
  public UserProfilePublicInfo publicGetUserProfilePublicInfo(PublicGetUserProfilePublicInfo input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserProfileStatus
   */
  public UserProfileInfo publicUpdateUserProfileStatus(PublicUpdateUserProfileStatus input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
