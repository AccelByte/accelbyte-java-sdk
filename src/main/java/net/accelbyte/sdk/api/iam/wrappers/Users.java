/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.users.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Users {

  private AccelByteSDK sdk;

  public Users(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see CreateUser
   * @deprecated
   */
  @Deprecated
  public ModelUserCreateResponse createUser(CreateUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAdminUsersByRoleID
   * @deprecated
   */
  @Deprecated
  public ModelGetAdminUsersResponse getAdminUsersByRoleID(GetAdminUsersByRoleID input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserByLoginID
   * @deprecated
   */
  @Deprecated
  public ModelPublicUserResponse getUserByLoginID(GetUserByLoginID input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserByPlatformUserID
   * @deprecated
   */
  @Deprecated
  public ModelPublicUserResponse getUserByPlatformUserID(GetUserByPlatformUserID input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ForgotPassword
   * @deprecated
   */
  @Deprecated
  public void forgotPassword(ForgotPassword input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUsersByLoginIds
   * @deprecated
   */
  @Deprecated
  public ModelPublicUsersResponse getUsersByLoginIds(GetUsersByLoginIds input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ResetPassword
   * @deprecated
   */
  @Deprecated
  public void resetPassword(ResetPassword input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SearchUser
   * @deprecated
   */
  @Deprecated
  public ModelSearchUsersResponse searchUser(SearchUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserByUserID
   * @deprecated
   */
  @Deprecated
  public ModelUserResponse getUserByUserID(GetUserByUserID input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUser
   * @deprecated
   */
  @Deprecated
  public ModelUserResponse updateUser(UpdateUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUser
   * @deprecated
   */
  @Deprecated
  public void deleteUser(DeleteUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see BanUser
   * @deprecated
   */
  @Deprecated
  public ModelUserBanResponse banUser(BanUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserBanHistory
   * @deprecated
   */
  @Deprecated
  public List<ModelUserBanResponse> getUserBanHistory(GetUserBanHistory input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DisableUserBan
   * @deprecated
   */
  @Deprecated
  public ModelUserBanResponse disableUserBan(DisableUserBan input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EnableUserBan
   * @deprecated
   */
  @Deprecated
  public ModelUserBanResponse enableUserBan(EnableUserBan input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListCrossNamespaceAccountLink
   * @deprecated
   */
  @Deprecated
  public void listCrossNamespaceAccountLink(ListCrossNamespaceAccountLink input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DisableUser
   * @deprecated
   */
  @Deprecated
  public void disableUser(DisableUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see EnableUser
   * @deprecated
   */
  @Deprecated
  public void enableUser(EnableUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserInformation
   * @deprecated
   */
  @Deprecated
  public ModelUserInformation getUserInformation(GetUserInformation input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserInformation
   * @deprecated
   */
  @Deprecated
  public void deleteUserInformation(DeleteUserInformation input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserLoginHistories
   * @deprecated
   */
  @Deprecated
  public ModelLoginHistoriesResponse getUserLoginHistories(GetUserLoginHistories input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdatePassword
   * @deprecated
   */
  @Deprecated
  public void updatePassword(UpdatePassword input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SaveUserPermission
   * @deprecated
   */
  @Deprecated
  public void saveUserPermission(SaveUserPermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddUserPermission
   * @deprecated
   */
  @Deprecated
  public void addUserPermission(AddUserPermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserPermission
   * @deprecated
   */
  @Deprecated
  public void deleteUserPermission(DeleteUserPermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserPlatformAccounts
   * @deprecated
   */
  @Deprecated
  public List<AccountcommonUserLinkedPlatform> getUserPlatformAccounts(
      GetUserPlatformAccounts input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserMapping
   * @deprecated
   */
  @Deprecated
  public ModelGetUserMapping getUserMapping(GetUserMapping input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserJusticePlatformAccount
   * @deprecated
   */
  @Deprecated
  public ModelGetUserJusticePlatformAccountResponse getUserJusticePlatformAccount(
      GetUserJusticePlatformAccount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformLink
   * @deprecated
   */
  @Deprecated
  public void platformLink(PlatformLink input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PlatformUnlink
   * @deprecated
   */
  @Deprecated
  public void platformUnlink(PlatformUnlink input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetPublisherUser
   * @deprecated
   */
  @Deprecated
  public ModelGetPublisherUserResponse getPublisherUser(GetPublisherUser input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SaveUserRoles
   * @deprecated
   */
  @Deprecated
  public void saveUserRoles(SaveUserRoles input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddUserRole
   * @deprecated
   */
  @Deprecated
  public void addUserRole(AddUserRole input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteUserRole
   * @deprecated
   */
  @Deprecated
  public void deleteUserRole(DeleteUserRole input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpgradeHeadlessAccount
   * @deprecated
   */
  @Deprecated
  public ModelUserResponse upgradeHeadlessAccount(UpgradeHeadlessAccount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpgradeHeadlessAccountWithVerificationCode
   * @deprecated
   */
  @Deprecated
  public ModelUserResponse upgradeHeadlessAccountWithVerificationCode(
      UpgradeHeadlessAccountWithVerificationCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UserVerification
   * @deprecated
   */
  @Deprecated
  public void userVerification(UserVerification input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SendVerificationCode
   * @deprecated
   */
  @Deprecated
  public void sendVerificationCode(SendVerificationCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAgeRestrictionStatusV2
   * @deprecated
   */
  @Deprecated
  public ModelAgeRestrictionResponse adminGetAgeRestrictionStatusV2(
      AdminGetAgeRestrictionStatusV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateAgeRestrictionConfigV2
   * @deprecated
   */
  @Deprecated
  public ModelAgeRestrictionResponse adminUpdateAgeRestrictionConfigV2(
      AdminUpdateAgeRestrictionConfigV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListCountryAgeRestriction
   * @deprecated
   */
  @Deprecated
  public List<AccountcommonCountryAgeRestriction> getListCountryAgeRestriction(
      GetListCountryAgeRestriction input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateCountryAgeRestriction
   * @deprecated
   */
  @Deprecated
  public ModelCountry updateCountryAgeRestriction(UpdateCountryAgeRestriction input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSearchUsersV2
   * @deprecated
   */
  @Deprecated
  public ModelSearchUsersByPlatformIDResponse adminSearchUsersV2(AdminSearchUsersV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserByUserIdV2
   * @deprecated
   */
  @Deprecated
  public ModelUserResponse adminGetUserByUserIdV2(AdminGetUserByUserIdV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserV2
   * @deprecated
   */
  @Deprecated
  public ModelUserResponse adminUpdateUserV2(AdminUpdateUserV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBanUserV2
   * @deprecated
   */
  @Deprecated
  public ModelUserBanResponse adminBanUserV2(AdminBanUserV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserBanV2
   * @deprecated
   */
  @Deprecated
  public List<ModelUserBanResponse> adminGetUserBanV2(AdminGetUserBanV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableUserV2
   * @deprecated
   */
  @Deprecated
  public void adminDisableUserV2(AdminDisableUserV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableUserV2
   * @deprecated
   */
  @Deprecated
  public void adminEnableUserV2(AdminEnableUserV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetPasswordV2
   * @deprecated
   */
  @Deprecated
  public void adminResetPasswordV2(AdminResetPasswordV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeletePlatformLinkV2
   * @deprecated
   */
  @Deprecated
  public void adminDeletePlatformLinkV2(AdminDeletePlatformLinkV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPutUserRolesV2
   * @deprecated
   */
  @Deprecated
  public void adminPutUserRolesV2(AdminPutUserRolesV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateUserRolesV2
   * @deprecated
   */
  @Deprecated
  public void adminCreateUserRolesV2(AdminCreateUserRolesV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetCountryAgeRestriction
   * @deprecated
   */
  @Deprecated
  public AccountcommonCountry publicGetCountryAgeRestriction(PublicGetCountryAgeRestriction input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateUserV2
   * @deprecated
   */
  @Deprecated
  public ModelUserCreateResponse publicCreateUserV2(PublicCreateUserV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicForgotPasswordV2
   * @deprecated
   */
  @Deprecated
  public void publicForgotPasswordV2(PublicForgotPasswordV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicResetPasswordV2
   * @deprecated
   */
  @Deprecated
  public void publicResetPasswordV2(PublicResetPasswordV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserByUserIDV2
   * @deprecated
   */
  @Deprecated
  public ModelUserResponse publicGetUserByUserIDV2(PublicGetUserByUserIDV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserV2
   * @deprecated
   */
  @Deprecated
  public List<ModelUserResponse> publicUpdateUserV2(PublicUpdateUserV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserBan
   * @deprecated
   */
  @Deprecated
  public List<ModelUserBanResponse> publicGetUserBan(PublicGetUserBan input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdatePasswordV2
   * @deprecated
   */
  @Deprecated
  public void publicUpdatePasswordV2(PublicUpdatePasswordV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetListJusticePlatformAccounts
   * @deprecated
   */
  @Deprecated
  public List<ModelGetUserMapping> getListJusticePlatformAccounts(
      GetListJusticePlatformAccounts input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicPlatformLinkV2
   * @deprecated
   */
  @Deprecated
  public void publicPlatformLinkV2(PublicPlatformLinkV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDeletePlatformLinkV2
   * @deprecated
   */
  @Deprecated
  public void publicDeletePlatformLinkV2(PublicDeletePlatformLinkV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ListAdminsV3
   */
  public ModelGetUsersResponseWithPaginationV3 listAdminsV3(ListAdminsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetAgeRestrictionStatusV3
   */
  public ModelAgeRestrictionResponseV3 adminGetAgeRestrictionStatusV3(
      AdminGetAgeRestrictionStatusV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateAgeRestrictionConfigV3
   */
  public ModelAgeRestrictionResponseV3 adminUpdateAgeRestrictionConfigV3(
      AdminUpdateAgeRestrictionConfigV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetListCountryAgeRestrictionV3
   */
  public List<ModelCountryV3Response> adminGetListCountryAgeRestrictionV3(
      AdminGetListCountryAgeRestrictionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateCountryAgeRestrictionV3
   */
  public ModelCountryV3Response adminUpdateCountryAgeRestrictionV3(
      AdminUpdateCountryAgeRestrictionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListUserIDByPlatformUserIDsV3
   */
  public AccountcommonUserPlatforms adminListUserIDByPlatformUserIDsV3(
      AdminListUserIDByPlatformUserIDsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserByPlatformUserIDV3
   */
  public ModelUserResponseV3 adminGetUserByPlatformUserIDV3(AdminGetUserByPlatformUserIDV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAdminUsersByRoleIdV3
   */
  public ModelGetUsersResponseWithPaginationV3 getAdminUsersByRoleIdV3(
      GetAdminUsersByRoleIdV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserByEmailAddressV3
   */
  public ModelUserResponseV3 adminGetUserByEmailAddressV3(AdminGetUserByEmailAddressV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBulkUserBanV3
   */
  public ModelGetUserBanV3Response adminGetBulkUserBanV3(AdminGetBulkUserBanV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListUserIDByUserIDsV3
   */
  public ModelListUserInformationResult adminListUserIDByUserIDsV3(AdminListUserIDByUserIDsV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkGetUsersPlatform
   */
  public ModelListBulkUserPlatformsResponse adminBulkGetUsersPlatform(
      AdminBulkGetUsersPlatform input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminInviteUserV3
   */
  public ModelInviteUserResponseV3 adminInviteUserV3(AdminInviteUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminQueryThirdPlatformLinkHistoryV3
   */
  public ModelLinkingHistoryResponseWithPaginationV3 adminQueryThirdPlatformLinkHistoryV3(
      AdminQueryThirdPlatformLinkHistoryV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListUsersV3
   */
  public AccountcommonListUsersWithPlatformAccountsResponse adminListUsersV3(AdminListUsersV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSearchUserV3
   */
  public ModelSearchUsersResponseWithPaginationV3 adminSearchUserV3(AdminSearchUserV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBulkUserByEmailAddressV3
   */
  public ModelListUserResponseV3 adminGetBulkUserByEmailAddressV3(
      AdminGetBulkUserByEmailAddressV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserByUserIdV3
   */
  public ModelUserResponseV3 adminGetUserByUserIdV3(AdminGetUserByUserIdV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserV3
   */
  public ModelUserResponseV3 adminUpdateUserV3(AdminUpdateUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserBanV3
   */
  public ModelGetUserBanV3Response adminGetUserBanV3(AdminGetUserBanV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBanUserV3
   */
  public ModelUserBanResponseV3 adminBanUserV3(AdminBanUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserBanV3
   */
  public ModelUserBanResponseV3 adminUpdateUserBanV3(AdminUpdateUserBanV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSendVerificationCodeV3
   */
  public void adminSendVerificationCodeV3(AdminSendVerificationCodeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminVerifyAccountV3
   */
  public void adminVerifyAccountV3(AdminVerifyAccountV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserVerificationCode
   */
  public ModelVerificationCodeResponse getUserVerificationCode(GetUserVerificationCode input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserDeletionStatusV3
   */
  public ModelUserDeletionStatusResponse adminGetUserDeletionStatusV3(
      AdminGetUserDeletionStatusV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserDeletionStatusV3
   */
  public void adminUpdateUserDeletionStatusV3(AdminUpdateUserDeletionStatusV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpgradeHeadlessAccountV3
   */
  public ModelUserResponseV3 adminUpgradeHeadlessAccountV3(AdminUpgradeHeadlessAccountV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteUserInformationV3
   */
  public void adminDeleteUserInformationV3(AdminDeleteUserInformationV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserLoginHistoriesV3
   */
  public ModelLoginHistoriesResponse adminGetUserLoginHistoriesV3(
      AdminGetUserLoginHistoriesV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminResetPasswordV3
   */
  public void adminResetPasswordV3(AdminResetPasswordV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserPermissionV3
   */
  public void adminUpdateUserPermissionV3(AdminUpdateUserPermissionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddUserPermissionsV3
   */
  public void adminAddUserPermissionsV3(AdminAddUserPermissionsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteUserPermissionBulkV3
   */
  public void adminDeleteUserPermissionBulkV3(AdminDeleteUserPermissionBulkV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteUserPermissionV3
   */
  public void adminDeleteUserPermissionV3(AdminDeleteUserPermissionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserPlatformAccountsV3
   */
  public AccountcommonUserLinkedPlatformsResponseV3 adminGetUserPlatformAccountsV3(
      AdminGetUserPlatformAccountsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetListJusticePlatformAccounts
   */
  public List<ModelGetUserMapping> adminGetListJusticePlatformAccounts(
      AdminGetListJusticePlatformAccounts input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserMapping
   */
  public ModelGetUserMappingV3 adminGetUserMapping(AdminGetUserMapping input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateJusticeUser
   */
  public ModelCreateJusticeUserResponse adminCreateJusticeUser(AdminCreateJusticeUser input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminLinkPlatformAccount
   */
  public void adminLinkPlatformAccount(AdminLinkPlatformAccount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPlatformUnlinkV3
   */
  public void adminPlatformUnlinkV3(AdminPlatformUnlinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminPlatformLinkV3
   */
  public void adminPlatformLinkV3(AdminPlatformLinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetThirdPartyPlatformTokenLinkStatusV3
   */
  public ModelTokenThirdPartyLinkStatusResponse adminGetThirdPartyPlatformTokenLinkStatusV3(
      AdminGetThirdPartyPlatformTokenLinkStatusV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserSinglePlatformAccount
   */
  public ModelUserPlatformMetadata adminGetUserSinglePlatformAccount(
      AdminGetUserSinglePlatformAccount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteUserRolesV3
   */
  public void adminDeleteUserRolesV3(AdminDeleteUserRolesV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSaveUserRoleV3
   */
  public void adminSaveUserRoleV3(AdminSaveUserRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddUserRoleV3
   */
  public void adminAddUserRoleV3(AdminAddUserRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteUserRoleV3
   */
  public void adminDeleteUserRoleV3(AdminDeleteUserRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserStatusV3
   */
  public void adminUpdateUserStatusV3(AdminUpdateUserStatusV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminTrustlyUpdateUserIdentity
   */
  public void adminTrustlyUpdateUserIdentity(AdminTrustlyUpdateUserIdentity input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminVerifyUserWithoutVerificationCodeV3
   */
  public void adminVerifyUserWithoutVerificationCodeV3(
      AdminVerifyUserWithoutVerificationCodeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyUserV3
   */
  public ModelUserResponseV3 adminGetMyUserV3(AdminGetMyUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetCountryAgeRestrictionV3
   */
  public ModelCountryV3Response publicGetCountryAgeRestrictionV3(
      PublicGetCountryAgeRestrictionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListUserIDByPlatformUserIDsV3
   */
  public AccountcommonUserPlatforms publicListUserIDByPlatformUserIDsV3(
      PublicListUserIDByPlatformUserIDsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserByPlatformUserIDV3
   */
  public ModelUserResponseV3 publicGetUserByPlatformUserIDV3(PublicGetUserByPlatformUserIDV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetAsyncStatus
   */
  public ModelLinkRequest publicGetAsyncStatus(PublicGetAsyncStatus input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSearchUserV3
   */
  public ModelPublicUserInformationResponseV3 publicSearchUserV3(PublicSearchUserV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateUserV3
   */
  public ModelUserCreateResponseV3 publicCreateUserV3(PublicCreateUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CheckUserAvailability
   */
  public void checkUserAvailability(CheckUserAvailability input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicBulkGetUsers
   */
  public ModelListBulkUserResponse publicBulkGetUsers(PublicBulkGetUsers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSendRegistrationCode
   */
  public void publicSendRegistrationCode(PublicSendRegistrationCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicVerifyRegistrationCode
   */
  public void publicVerifyRegistrationCode(PublicVerifyRegistrationCode input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicForgotPasswordV3
   */
  public void publicForgotPasswordV3(PublicForgotPasswordV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetAdminInvitationV3
   */
  public ModelUserInvitationV3 getAdminInvitationV3(GetAdminInvitationV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateUserFromInvitationV3
   */
  public ModelUserCreateResponseV3 createUserFromInvitationV3(CreateUserFromInvitationV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateUserV3
   */
  public ModelUserResponseV3 updateUserV3(UpdateUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicPartialUpdateUserV3
   */
  public ModelUserResponseV3 publicPartialUpdateUserV3(PublicPartialUpdateUserV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSendVerificationCodeV3
   */
  public void publicSendVerificationCodeV3(PublicSendVerificationCodeV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUserVerificationV3
   */
  public void publicUserVerificationV3(PublicUserVerificationV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpgradeHeadlessAccountV3
   */
  public ModelUserResponseV3 publicUpgradeHeadlessAccountV3(PublicUpgradeHeadlessAccountV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicVerifyHeadlessAccountV3
   */
  public ModelUserResponseV3 publicVerifyHeadlessAccountV3(PublicVerifyHeadlessAccountV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdatePasswordV3
   */
  public void publicUpdatePasswordV3(PublicUpdatePasswordV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateJusticeUser
   */
  public ModelCreateJusticeUserResponse publicCreateJusticeUser(PublicCreateJusticeUser input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicPlatformLinkV3
   */
  public void publicPlatformLinkV3(PublicPlatformLinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicPlatformUnlinkV3
   */
  public void publicPlatformUnlinkV3(PublicPlatformUnlinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicPlatformUnlinkAllV3
   */
  public void publicPlatformUnlinkAllV3(PublicPlatformUnlinkAllV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicForcePlatformLinkV3
   */
  public void publicForcePlatformLinkV3(PublicForcePlatformLinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicWebLinkPlatform
   */
  public ModelWebLinkingResponse publicWebLinkPlatform(PublicWebLinkPlatform input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicWebLinkPlatformEstablish
   */
  public String publicWebLinkPlatformEstablish(PublicWebLinkPlatformEstablish input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicProcessWebLinkPlatformV3
   */
  public ModelLinkRequest publicProcessWebLinkPlatformV3(PublicProcessWebLinkPlatformV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see ResetPasswordV3
   */
  public void resetPasswordV3(ResetPasswordV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserByUserIdV3
   * @deprecated
   */
  @Deprecated
  public ModelPublicUserResponseV3 publicGetUserByUserIdV3(PublicGetUserByUserIdV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserBanHistoryV3
   */
  public ModelGetUserBanV3Response publicGetUserBanHistoryV3(PublicGetUserBanHistoryV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListUserAllPlatformAccountsDistinctV3
   */
  public AccountcommonDistinctPlatformResponseV3 publicListUserAllPlatformAccountsDistinctV3(
      PublicListUserAllPlatformAccountsDistinctV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserInformationV3
   */
  public AccountcommonUserInformationV3 publicGetUserInformationV3(PublicGetUserInformationV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserLoginHistoriesV3
   */
  public ModelLoginHistoriesResponse publicGetUserLoginHistoriesV3(
      PublicGetUserLoginHistoriesV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserPlatformAccountsV3
   */
  public AccountcommonUserLinkedPlatformsResponseV3 publicGetUserPlatformAccountsV3(
      PublicGetUserPlatformAccountsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListJusticePlatformAccountsV3
   */
  public List<ModelGetUserMappingV3> publicListJusticePlatformAccountsV3(
      PublicListJusticePlatformAccountsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicLinkPlatformAccount
   */
  public void publicLinkPlatformAccount(PublicLinkPlatformAccount input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicForceLinkPlatformWithProgression
   */
  public void publicForceLinkPlatformWithProgression(PublicForceLinkPlatformWithProgression input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetPublisherUserV3
   */
  public ModelGetPublisherUserV3Response publicGetPublisherUserV3(PublicGetPublisherUserV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicValidateUserByUserIDAndPasswordV3
   */
  public void publicValidateUserByUserIDAndPasswordV3(PublicValidateUserByUserIDAndPasswordV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyUserV3
   */
  public ModelUserResponseV3 publicGetMyUserV3(PublicGetMyUserV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetLinkHeadlessAccountToMyAccountConflictV3
   */
  public ModelGetLinkHeadlessAccountConflictResponse
      publicGetLinkHeadlessAccountToMyAccountConflictV3(
          PublicGetLinkHeadlessAccountToMyAccountConflictV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LinkHeadlessAccountToMyAccountV3
   */
  public void linkHeadlessAccountToMyAccountV3(LinkHeadlessAccountToMyAccountV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSendVerificationLinkV3
   */
  public void publicSendVerificationLinkV3(PublicSendVerificationLinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicVerifyUserByLinkV3
   */
  public String publicVerifyUserByLinkV3(PublicVerifyUserByLinkV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
