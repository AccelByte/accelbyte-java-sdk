/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.iam.bans.*;
import net.accelbyte.sdk.cli.api.iam.clients.*;
import net.accelbyte.sdk.cli.api.iam.input_validations.*;
import net.accelbyte.sdk.cli.api.iam.o_auth.*;
import net.accelbyte.sdk.cli.api.iam.o_auth2_0.*;
import net.accelbyte.sdk.cli.api.iam.o_auth2_0_extension.*;
import net.accelbyte.sdk.cli.api.iam.roles.*;
import net.accelbyte.sdk.cli.api.iam.sso.*;
import net.accelbyte.sdk.cli.api.iam.sso_credential.*;
import net.accelbyte.sdk.cli.api.iam.sso_saml_2_0.*;
import net.accelbyte.sdk.cli.api.iam.third_party_credential.*;
import net.accelbyte.sdk.cli.api.iam.users.*;
import net.accelbyte.sdk.cli.api.iam.users_v4.*;
import picocli.CommandLine.Command;

@Command(
    name = "iam",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetBansType.class,
      GetListBanReason.class,
      GetClients.class,
      CreateClient.class,
      GetClient.class,
      UpdateClient.class,
      DeleteClient.class,
      UpdateClientPermission.class,
      AddClientPermission.class,
      DeleteClientPermission.class,
      UpdateClientSecret.class,
      GetClientsbyNamespace.class,
      CreateClientByNamespace.class,
      DeleteClientByNamespace.class,
      CreateUser.class,
      GetAdminUsersByRoleID.class,
      GetUserByLoginID.class,
      GetUserByPlatformUserID.class,
      ForgotPassword.class,
      GetUsersByLoginIds.class,
      ResetPassword.class,
      SearchUser.class,
      GetUserByUserID.class,
      UpdateUser.class,
      DeleteUser.class,
      BanUser.class,
      GetUserBanHistory.class,
      DisableUserBan.class,
      EnableUserBan.class,
      ListCrossNamespaceAccountLink.class,
      DisableUser.class,
      EnableUser.class,
      GetUserInformation.class,
      DeleteUserInformation.class,
      GetUserLoginHistories.class,
      UpdatePassword.class,
      SaveUserPermission.class,
      AddUserPermission.class,
      DeleteUserPermission.class,
      GetUserPlatformAccounts.class,
      GetUserMapping.class,
      GetUserJusticePlatformAccount.class,
      PlatformLink.class,
      PlatformUnlink.class,
      GetPublisherUser.class,
      SaveUserRoles.class,
      AddUserRole.class,
      DeleteUserRole.class,
      UpgradeHeadlessAccount.class,
      UpgradeHeadlessAccountWithVerificationCode.class,
      UserVerification.class,
      SendVerificationCode.class,
      Authorization.class,
      GetJWKS.class,
      PlatformTokenRequestHandler.class,
      RevokeUser.class,
      GetRevocationList.class,
      RevokeToken.class,
      RevokeAUser.class,
      TokenGrant.class,
      VerifyToken.class,
      GetRoles.class,
      CreateRole.class,
      GetRole.class,
      UpdateRole.class,
      DeleteRole.class,
      GetRoleAdminStatus.class,
      SetRoleAsAdmin.class,
      RemoveRoleAdmin.class,
      GetRoleManagers.class,
      AddRoleManagers.class,
      RemoveRoleManagers.class,
      GetRoleMembers.class,
      AddRoleMembers.class,
      RemoveRoleMembers.class,
      UpdateRolePermissions.class,
      AddRolePermission.class,
      DeleteRolePermission.class,
      AdminGetAgeRestrictionStatusV2.class,
      AdminUpdateAgeRestrictionConfigV2.class,
      GetListCountryAgeRestriction.class,
      UpdateCountryAgeRestriction.class,
      AdminSearchUsersV2.class,
      AdminGetUserByUserIdV2.class,
      AdminUpdateUserV2.class,
      AdminBanUserV2.class,
      AdminGetUserBanV2.class,
      AdminDisableUserV2.class,
      AdminEnableUserV2.class,
      AdminResetPasswordV2.class,
      AdminDeletePlatformLinkV2.class,
      AdminPutUserRolesV2.class,
      AdminCreateUserRolesV2.class,
      PublicGetCountryAgeRestriction.class,
      PublicCreateUserV2.class,
      PublicForgotPasswordV2.class,
      PublicResetPasswordV2.class,
      PublicGetUserByUserIDV2.class,
      PublicUpdateUserV2.class,
      PublicGetUserBan.class,
      PublicUpdatePasswordV2.class,
      GetListJusticePlatformAccounts.class,
      PublicPlatformLinkV2.class,
      PublicDeletePlatformLinkV2.class,
      AdminGetBansTypeV3.class,
      AdminGetListBanReasonV3.class,
      AdminGetInputValidations.class,
      AdminUpdateInputValidations.class,
      AdminResetInputValidations.class,
      ListAdminsV3.class,
      AdminGetAgeRestrictionStatusV3.class,
      AdminUpdateAgeRestrictionConfigV3.class,
      AdminGetListCountryAgeRestrictionV3.class,
      AdminUpdateCountryAgeRestrictionV3.class,
      AdminGetBannedUsersV3.class,
      AdminGetBansTypeWithNamespaceV3.class,
      AdminGetClientsByNamespaceV3.class,
      AdminCreateClientV3.class,
      AdminGetClientsbyNamespacebyIDV3.class,
      AdminDeleteClientV3.class,
      AdminUpdateClientV3.class,
      AdminUpdateClientPermissionV3.class,
      AdminAddClientPermissionsV3.class,
      AdminDeleteClientPermissionV3.class,
      RetrieveAllThirdPartyLoginPlatformCredentialV3.class,
      RetrieveAllActiveThirdPartyLoginPlatformCredentialV3.class,
      RetrieveAllSSOLoginPlatformCredentialV3.class,
      RetrieveThirdPartyLoginPlatformCredentialV3.class,
      AddThirdPartyLoginPlatformCredentialV3.class,
      DeleteThirdPartyLoginPlatformCredentialV3.class,
      UpdateThirdPartyLoginPlatformCredentialV3.class,
      UpdateThirdPartyLoginPlatformDomainV3.class,
      DeleteThirdPartyLoginPlatformDomainV3.class,
      RetrieveSSOLoginPlatformCredential.class,
      AddSSOLoginPlatformCredential.class,
      DeleteSSOLoginPlatformCredentialV3.class,
      UpdateSSOPlatformCredential.class,
      AdminGetUserByPlatformUserIDV3.class,
      GetAdminUsersByRoleIdV3.class,
      AdminGetUserByEmailAddressV3.class,
      AdminListUserIDByUserIDsV3.class,
      AdminInviteUserV3.class,
      AdminListUsersV3.class,
      AdminSearchUserV3.class,
      AdminGetBulkUserByEmailAddressV3.class,
      AdminGetUserByUserIdV3.class,
      AdminUpdateUserV3.class,
      AdminGetUserBanV3.class,
      AdminBanUserV3.class,
      AdminUpdateUserBanV3.class,
      AdminSendVerificationCodeV3.class,
      AdminVerifyAccountV3.class,
      GetUserVerificationCode.class,
      AdminGetUserDeletionStatusV3.class,
      AdminUpdateUserDeletionStatusV3.class,
      AdminUpgradeHeadlessAccountV3.class,
      AdminDeleteUserInformationV3.class,
      AdminGetUserLoginHistoriesV3.class,
      AdminUpdateUserPermissionV3.class,
      AdminAddUserPermissionsV3.class,
      AdminDeleteUserPermissionBulkV3.class,
      AdminDeleteUserPermissionV3.class,
      AdminGetUserPlatformAccountsV3.class,
      AdminGetListJusticePlatformAccounts.class,
      AdminCreateJusticeUser.class,
      AdminLinkPlatformAccount.class,
      AdminPlatformUnlinkV3.class,
      AdminPlatformLinkV3.class,
      AdminDeleteUserRolesV3.class,
      AdminSaveUserRoleV3.class,
      AdminAddUserRoleV3.class,
      AdminDeleteUserRoleV3.class,
      AdminUpdateUserStatusV3.class,
      AdminVerifyUserWithoutVerificationCodeV3.class,
      AdminGetRolesV3.class,
      AdminCreateRoleV3.class,
      AdminGetRoleV3.class,
      AdminDeleteRoleV3.class,
      AdminUpdateRoleV3.class,
      AdminGetRoleAdminStatusV3.class,
      AdminUpdateAdminRoleStatusV3.class,
      AdminRemoveRoleAdminV3.class,
      AdminGetRoleManagersV3.class,
      AdminAddRoleManagersV3.class,
      AdminRemoveRoleManagersV3.class,
      AdminGetRoleMembersV3.class,
      AdminAddRoleMembersV3.class,
      AdminRemoveRoleMembersV3.class,
      AdminUpdateRolePermissionsV3.class,
      AdminAddRolePermissionsV3.class,
      AdminDeleteRolePermissionsV3.class,
      AdminDeleteRolePermissionV3.class,
      AdminGetMyUserV3.class,
      UserAuthenticationV3.class,
      AuthenticationWithPlatformLinkV3.class,
      GenerateTokenByNewHeadlessAccountV3.class,
      GetCountryLocationV3.class,
      Logout.class,
      AdminRetrieveUserThirdPartyPlatformTokenV3.class,
      RevokeUserV3.class,
      AuthorizeV3.class,
      TokenIntrospectionV3.class,
      GetJWKSV3.class,
      Change2faMethod.class,
      Verify2faCode.class,
      RetrieveUserThirdPartyPlatformTokenV3.class,
      AuthCodeRequestV3.class,
      PlatformTokenGrantV3.class,
      GetRevocationListV3.class,
      TokenRevocationV3.class,
      TokenGrantV3.class,
      PlatformAuthenticationV3.class,
      PublicGetInputValidations.class,
      RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3.class,
      PublicListUserIDByPlatformUserIDsV3.class,
      PublicGetUserByPlatformUserIDV3.class,
      PublicGetAsyncStatus.class,
      PublicSearchUserV3.class,
      PublicCreateUserV3.class,
      CheckUserAvailability.class,
      PublicBulkGetUsers.class,
      PublicSendRegistrationCode.class,
      PublicVerifyRegistrationCode.class,
      PublicForgotPasswordV3.class,
      GetAdminInvitationV3.class,
      CreateUserFromInvitationV3.class,
      UpdateUserV3.class,
      PublicUpdateUserV3.class,
      PublicSendVerificationCodeV3.class,
      PublicUserVerificationV3.class,
      PublicUpgradeHeadlessAccountV3.class,
      PublicVerifyHeadlessAccountV3.class,
      PublicUpdatePasswordV3.class,
      PublicCreateJusticeUser.class,
      PublicPlatformLinkV3.class,
      PublicPlatformUnlinkV3.class,
      PublicPlatformUnlinkAllV3.class,
      PublicWebLinkPlatform.class,
      PublicWebLinkPlatformEstablish.class,
      ResetPasswordV3.class,
      PublicGetUserByUserIdV3.class,
      PublicGetUserBanHistoryV3.class,
      PublicListUserAllPlatformAccountsDistinctV3.class,
      PublicGetUserLoginHistoriesV3.class,
      PublicGetUserPlatformAccountsV3.class,
      PublicLinkPlatformAccount.class,
      PublicForceLinkPlatformWithProgression.class,
      PublicValidateUserByUserIDAndPasswordV3.class,
      PublicGetRolesV3.class,
      PublicGetRoleV3.class,
      PublicGetMyUserV3.class,
      PlatformAuthenticateSAMLV3Handler.class,
      LoginSSOClient.class,
      LogoutSSOClient.class,
      AdminBulkCheckValidUserIDV4.class,
      AdminUpdateUserV4.class,
      AdminUpdateUserEmailAddressV4.class,
      AdminDisableUserMFAV4.class,
      AdminListUserRolesV4.class,
      AdminUpdateUserRoleV4.class,
      AdminAddUserRoleV4.class,
      AdminRemoveUserRoleV4.class,
      AdminGetRolesV4.class,
      AdminCreateRoleV4.class,
      AdminGetRoleV4.class,
      AdminDeleteRoleV4.class,
      AdminUpdateRoleV4.class,
      AdminUpdateRolePermissionsV4.class,
      AdminAddRolePermissionsV4.class,
      AdminDeleteRolePermissionsV4.class,
      AdminListAssignedUsersV4.class,
      AdminAssignUserToRoleV4.class,
      AdminRevokeUserFromRoleV4.class,
      AdminUpdateMyUserV4.class,
      AdminDisableMyAuthenticatorV4.class,
      AdminEnableMyAuthenticatorV4.class,
      AdminGenerateMyAuthenticatorKeyV4.class,
      AdminGetMyBackupCodesV4.class,
      AdminGenerateMyBackupCodesV4.class,
      AdminDisableMyBackupCodesV4.class,
      AdminDownloadMyBackupCodesV4.class,
      AdminEnableMyBackupCodesV4.class,
      AdminGetMyEnabledFactorsV4.class,
      AdminMakeFactorMyDefaultV4.class,
      AdminInviteUserV4.class,
      PublicCreateTestUserV4.class,
      PublicCreateUserV4.class,
      CreateUserFromInvitationV4.class,
      PublicUpdateUserV4.class,
      PublicUpdateUserEmailAddressV4.class,
      PublicUpgradeHeadlessAccountWithVerificationCodeV4.class,
      PublicUpgradeHeadlessAccountV4.class,
      PublicDisableMyAuthenticatorV4.class,
      PublicEnableMyAuthenticatorV4.class,
      PublicGenerateMyAuthenticatorKeyV4.class,
      PublicGetMyBackupCodesV4.class,
      PublicGenerateMyBackupCodesV4.class,
      PublicDisableMyBackupCodesV4.class,
      PublicDownloadMyBackupCodesV4.class,
      PublicEnableMyBackupCodesV4.class,
      PublicRemoveTrustedDeviceV4.class,
      PublicGetMyEnabledFactorsV4.class,
      PublicMakeFactorMyDefaultV4.class,
    })
public class Iam implements Runnable {

  @Override
  public void run() {}
}
