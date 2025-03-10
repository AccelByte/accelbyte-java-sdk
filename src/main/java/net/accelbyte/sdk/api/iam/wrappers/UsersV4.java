/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import java.io.*;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.users_v4.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class UsersV4 {

  private AccelByteSDK sdk;

  public UsersV4(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see AdminListInvitationHistoriesV4
   */
  public ModelListInvitationHistoriesV4Response adminListInvitationHistoriesV4(
      AdminListInvitationHistoriesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetNamespaceInvitationHistoryV4
   */
  public ModelInvitationHistoryResponse adminGetNamespaceInvitationHistoryV4(
      AdminGetNamespaceInvitationHistoryV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetNamespaceUserInvitationHistoryV4
   */
  public ModelNamespaceInvitationHistoryUserV4Response adminGetNamespaceUserInvitationHistoryV4(
      AdminGetNamespaceUserInvitationHistoryV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateTestUsersV4
   */
  public AccountCreateTestUsersResponseV4 adminCreateTestUsersV4(AdminCreateTestUsersV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateUserV4
   */
  public AccountCreateUserResponseV4 adminCreateUserV4(AdminCreateUserV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkUpdateUserAccountTypeV4
   */
  public void adminBulkUpdateUserAccountTypeV4(AdminBulkUpdateUserAccountTypeV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminBulkCheckValidUserIDV4
   */
  public ModelListValidUserIDResponseV4 adminBulkCheckValidUserIDV4(
      AdminBulkCheckValidUserIDV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserV4
   */
  public ModelUserResponseV3 adminUpdateUserV4(AdminUpdateUserV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserEmailAddressV4
   */
  public void adminUpdateUserEmailAddressV4(AdminUpdateUserEmailAddressV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableUserMFAV4
   */
  public void adminDisableUserMFAV4(AdminDisableUserMFAV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetUserMFAStatusV4
   */
  public ModelUserMFAStatusResponseV4 adminGetUserMFAStatusV4(AdminGetUserMFAStatusV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListUserRolesV4
   */
  public ModelListUserRolesV4Response adminListUserRolesV4(AdminListUserRolesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateUserRoleV4
   */
  public ModelListUserRolesV4Response adminUpdateUserRoleV4(AdminUpdateUserRoleV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddUserRoleV4
   */
  public ModelListUserRolesV4Response adminAddUserRoleV4(AdminAddUserRoleV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRemoveUserRoleV4
   */
  public void adminRemoveUserRoleV4(AdminRemoveUserRoleV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminInviteUserNewV4
   */
  public ModelInviteUserResponseV3 adminInviteUserNewV4(AdminInviteUserNewV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateMyUserV4
   */
  public ModelUserResponseV3 adminUpdateMyUserV4(AdminUpdateMyUserV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableMyAuthenticatorV4
   */
  public void adminDisableMyAuthenticatorV4(AdminDisableMyAuthenticatorV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableMyAuthenticatorV4
   */
  public void adminEnableMyAuthenticatorV4(AdminEnableMyAuthenticatorV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateMyAuthenticatorKeyV4
   */
  public ModelAuthenticatorKeyResponseV4 adminGenerateMyAuthenticatorKeyV4(
      AdminGenerateMyAuthenticatorKeyV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public ModelBackupCodesResponseV4 adminGetMyBackupCodesV4(AdminGetMyBackupCodesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public ModelBackupCodesResponseV4 adminGenerateMyBackupCodesV4(AdminGenerateMyBackupCodesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableMyBackupCodesV4
   */
  public void adminDisableMyBackupCodesV4(AdminDisableMyBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDownloadMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public InputStream adminDownloadMyBackupCodesV4(AdminDownloadMyBackupCodesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public ModelBackupCodesResponseV4 adminEnableMyBackupCodesV4(AdminEnableMyBackupCodesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetBackupCodesV4
   */
  public void adminGetBackupCodesV4(AdminGetBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGenerateBackupCodesV4
   */
  public void adminGenerateBackupCodesV4(AdminGenerateBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableBackupCodesV4
   */
  public void adminEnableBackupCodesV4(AdminEnableBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminChallengeMyMFAV4
   */
  public ModelUserMFATokenResponseV4 adminChallengeMyMFAV4(AdminChallengeMyMFAV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminSendMyMFAEmailCodeV4
   */
  public void adminSendMyMFAEmailCodeV4(AdminSendMyMFAEmailCodeV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDisableMyEmailV4
   */
  public void adminDisableMyEmailV4(AdminDisableMyEmailV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminEnableMyEmailV4
   */
  public void adminEnableMyEmailV4(AdminEnableMyEmailV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyEnabledFactorsV4
   */
  public ModelEnabledFactorsResponseV4 adminGetMyEnabledFactorsV4(AdminGetMyEnabledFactorsV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminMakeFactorMyDefaultV4
   */
  public void adminMakeFactorMyDefaultV4(AdminMakeFactorMyDefaultV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyOwnMFAStatusV4
   */
  public ModelUserMFAStatusResponseV4 adminGetMyOwnMFAStatusV4(AdminGetMyOwnMFAStatusV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetMyMFAStatusV4
   * @deprecated
   */
  @Deprecated
  public ModelUserMFAStatusResponseV4 adminGetMyMFAStatusV4(AdminGetMyMFAStatusV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminInviteUserV4
   * @deprecated
   */
  @Deprecated
  public ModelInviteUserResponseV3 adminInviteUserV4(AdminInviteUserV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicListUserIDByPlatformUserIDsV4
   */
  public AccountcommonUserPlatforms publicListUserIDByPlatformUserIDsV4(
      PublicListUserIDByPlatformUserIDsV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserByPlatformUserIDV4
   */
  public ModelUserResponseV3 publicGetUserByPlatformUserIDV4(PublicGetUserByPlatformUserIDV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateTestUserV4
   */
  public AccountCreateUserResponseV4 publicCreateTestUserV4(PublicCreateTestUserV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicCreateUserV4
   */
  public AccountCreateUserResponseV4 publicCreateUserV4(PublicCreateUserV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateUserFromInvitationV4
   */
  public AccountCreateUserResponseV4 createUserFromInvitationV4(CreateUserFromInvitationV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserV4
   */
  public ModelUserResponseV3 publicUpdateUserV4(PublicUpdateUserV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpdateUserEmailAddressV4
   */
  public void publicUpdateUserEmailAddressV4(PublicUpdateUserEmailAddressV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpgradeHeadlessAccountWithVerificationCodeV4
   */
  public AccountUserResponseV4 publicUpgradeHeadlessAccountWithVerificationCodeV4(
      PublicUpgradeHeadlessAccountWithVerificationCodeV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpgradeHeadlessAccountV4
   */
  public AccountUserResponseV4 publicUpgradeHeadlessAccountV4(PublicUpgradeHeadlessAccountV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDisableMyAuthenticatorV4
   */
  public void publicDisableMyAuthenticatorV4(PublicDisableMyAuthenticatorV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableMyAuthenticatorV4
   */
  public void publicEnableMyAuthenticatorV4(PublicEnableMyAuthenticatorV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateMyAuthenticatorKeyV4
   */
  public ModelAuthenticatorKeyResponseV4 publicGenerateMyAuthenticatorKeyV4(
      PublicGenerateMyAuthenticatorKeyV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public ModelBackupCodesResponseV4 publicGetMyBackupCodesV4(PublicGetMyBackupCodesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public ModelBackupCodesResponseV4 publicGenerateMyBackupCodesV4(
      PublicGenerateMyBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDisableMyBackupCodesV4
   */
  public void publicDisableMyBackupCodesV4(PublicDisableMyBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDownloadMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public InputStream publicDownloadMyBackupCodesV4(PublicDownloadMyBackupCodesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableMyBackupCodesV4
   * @deprecated
   */
  @Deprecated
  public ModelBackupCodesResponseV4 publicEnableMyBackupCodesV4(PublicEnableMyBackupCodesV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetBackupCodesV4
   */
  public void publicGetBackupCodesV4(PublicGetBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGenerateBackupCodesV4
   */
  public void publicGenerateBackupCodesV4(PublicGenerateBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableBackupCodesV4
   */
  public void publicEnableBackupCodesV4(PublicEnableBackupCodesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicChallengeMyMFAV4
   */
  public ModelUserMFATokenResponseV4 publicChallengeMyMFAV4(PublicChallengeMyMFAV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicRemoveTrustedDeviceV4
   */
  public void publicRemoveTrustedDeviceV4(PublicRemoveTrustedDeviceV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicSendMyMFAEmailCodeV4
   */
  public void publicSendMyMFAEmailCodeV4(PublicSendMyMFAEmailCodeV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicDisableMyEmailV4
   */
  public void publicDisableMyEmailV4(PublicDisableMyEmailV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicEnableMyEmailV4
   */
  public void publicEnableMyEmailV4(PublicEnableMyEmailV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyEnabledFactorsV4
   */
  public ModelEnabledFactorsResponseV4 publicGetMyEnabledFactorsV4(
      PublicGetMyEnabledFactorsV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicMakeFactorMyDefaultV4
   */
  public void publicMakeFactorMyDefaultV4(PublicMakeFactorMyDefaultV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyOwnMFAStatusV4
   */
  public ModelUserMFAStatusResponseV4 publicGetMyOwnMFAStatusV4(PublicGetMyOwnMFAStatusV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetMyMFAStatusV4
   * @deprecated
   */
  @Deprecated
  public ModelUserMFAStatusResponseV4 publicGetMyMFAStatusV4(PublicGetMyMFAStatusV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetUserPublicInfoByUserIdV4
   */
  public ModelUserPublicInfoResponseV4 publicGetUserPublicInfoByUserIdV4(
      PublicGetUserPublicInfoByUserIdV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicInviteUserV4
   */
  public ModelInviteUserResponseV3 publicInviteUserV4(PublicInviteUserV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicUpgradeHeadlessWithCodeV4Forward
   */
  public String publicUpgradeHeadlessWithCodeV4Forward(PublicUpgradeHeadlessWithCodeV4Forward input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
