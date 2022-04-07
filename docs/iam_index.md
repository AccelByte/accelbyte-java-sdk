# Iam Service Index

&nbsp;  

## Operations

### Bans Wrapper:  [Bans](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/Bans.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/bans` | GET | GetBansType | [GetBansType](../src/main/java/net/accelbyte/sdk/api/iam/operations/bans/GetBansType.java) |
| `/iam/bans/reasons` | GET | GetListBanReason | [GetListBanReason](../src/main/java/net/accelbyte/sdk/api/iam/operations/bans/GetListBanReason.java) |
| `/iam/v3/admin/bans` | GET | AdminGetBansTypeV3 | [AdminGetBansTypeV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/bans/AdminGetBansTypeV3.java) |
| `/iam/v3/admin/bans/reasons` | GET | AdminGetListBanReasonV3 | [AdminGetListBanReasonV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/bans/AdminGetListBanReasonV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/bans/users` | GET | AdminGetBannedUsersV3 | [AdminGetBannedUsersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/bans/AdminGetBannedUsersV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/bantypes` | GET | AdminGetBansTypeWithNamespaceV3 | [AdminGetBansTypeWithNamespaceV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/bans/AdminGetBansTypeWithNamespaceV3.java) |

### Clients Wrapper:  [Clients](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/Clients.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/clients` | GET | GetClients | [GetClients](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/GetClients.java) |
| `/iam/clients` | POST | CreateClient | [CreateClient](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/CreateClient.java) |
| `/iam/clients/{clientId}` | GET | GetClient | [GetClient](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/GetClient.java) |
| `/iam/clients/{clientId}` | PUT | UpdateClient | [UpdateClient](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/UpdateClient.java) |
| `/iam/clients/{clientId}` | DELETE | DeleteClient | [DeleteClient](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/DeleteClient.java) |
| `/iam/clients/{clientId}/clientpermissions` | POST | UpdateClientPermission | [UpdateClientPermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/UpdateClientPermission.java) |
| `/iam/clients/{clientId}/clientpermissions/{resource}/{action}` | POST | AddClientPermission | [AddClientPermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AddClientPermission.java) |
| `/iam/clients/{clientId}/clientpermissions/{resource}/{action}` | DELETE | DeleteClientPermission | [DeleteClientPermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/DeleteClientPermission.java) |
| `/iam/clients/{clientId}/secret` | PUT | UpdateClientSecret | [UpdateClientSecret](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/UpdateClientSecret.java) |
| `/iam/namespaces/{namespace}/clients` | GET | GetClientsbyNamespace | [GetClientsbyNamespace](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/GetClientsbyNamespace.java) |
| `/iam/namespaces/{namespace}/clients` | POST | CreateClientByNamespace | [CreateClientByNamespace](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/CreateClientByNamespace.java) |
| `/iam/namespaces/{namespace}/clients/{clientId}` | DELETE | DeleteClientByNamespace | [DeleteClientByNamespace](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/DeleteClientByNamespace.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients` | GET | AdminGetClientsByNamespaceV3 | [AdminGetClientsByNamespaceV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminGetClientsByNamespaceV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients` | POST | AdminCreateClientV3 | [AdminCreateClientV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminCreateClientV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients/{clientId}` | GET | AdminGetClientsbyNamespacebyIDV3 | [AdminGetClientsbyNamespacebyIDV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminGetClientsbyNamespacebyIDV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients/{clientId}` | DELETE | AdminDeleteClientV3 | [AdminDeleteClientV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminDeleteClientV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients/{clientId}` | PATCH | AdminUpdateClientV3 | [AdminUpdateClientV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminUpdateClientV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients/{clientId}/permissions` | PUT | AdminUpdateClientPermissionV3 | [AdminUpdateClientPermissionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminUpdateClientPermissionV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients/{clientId}/permissions` | POST | AdminAddClientPermissionsV3 | [AdminAddClientPermissionsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminAddClientPermissionsV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/clients/{clientId}/permissions/{resource}/{action}` | DELETE | AdminDeleteClientPermissionV3 | [AdminDeleteClientPermissionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/clients/AdminDeleteClientPermissionV3.java) |

### Users Wrapper:  [Users](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/Users.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/namespaces/{namespace}/users` | POST | CreateUser | [CreateUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/CreateUser.java) |
| `/iam/namespaces/{namespace}/users/admin` | GET | GetAdminUsersByRoleID | [GetAdminUsersByRoleID](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetAdminUsersByRoleID.java) |
| `/iam/namespaces/{namespace}/users/byLoginId` | GET | GetUserByLoginID | [GetUserByLoginID](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserByLoginID.java) |
| `/iam/namespaces/{namespace}/users/byPlatformUserID` | GET | GetUserByPlatformUserID | [GetUserByPlatformUserID](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserByPlatformUserID.java) |
| `/iam/namespaces/{namespace}/users/forgotPassword` | POST | ForgotPassword | [ForgotPassword](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/ForgotPassword.java) |
| `/iam/namespaces/{namespace}/users/listByLoginIds` | GET | GetUsersByLoginIds | [GetUsersByLoginIds](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUsersByLoginIds.java) |
| `/iam/namespaces/{namespace}/users/resetPassword` | POST | ResetPassword | [ResetPassword](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/ResetPassword.java) |
| `/iam/namespaces/{namespace}/users/search` | GET | SearchUser | [SearchUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/SearchUser.java) |
| `/iam/namespaces/{namespace}/users/{userId}` | GET | GetUserByUserID | [GetUserByUserID](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserByUserID.java) |
| `/iam/namespaces/{namespace}/users/{userId}` | PUT | UpdateUser | [UpdateUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/UpdateUser.java) |
| `/iam/namespaces/{namespace}/users/{userId}` | DELETE | DeleteUser | [DeleteUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/DeleteUser.java) |
| `/iam/namespaces/{namespace}/users/{userId}/ban` | POST | BanUser | [BanUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/BanUser.java) |
| `/iam/namespaces/{namespace}/users/{userId}/bans` | GET | GetUserBanHistory | [GetUserBanHistory](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserBanHistory.java) |
| `/iam/namespaces/{namespace}/users/{userId}/bans/{banId}/disable` | PUT | DisableUserBan | [DisableUserBan](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/DisableUserBan.java) |
| `/iam/namespaces/{namespace}/users/{userId}/bans/{banId}/enable` | PUT | EnableUserBan | [EnableUserBan](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/EnableUserBan.java) |
| `/iam/namespaces/{namespace}/users/{userId}/crosslink` | POST | ListCrossNamespaceAccountLink | [ListCrossNamespaceAccountLink](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/ListCrossNamespaceAccountLink.java) |
| `/iam/namespaces/{namespace}/users/{userId}/disable` | PUT | DisableUser | [DisableUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/DisableUser.java) |
| `/iam/namespaces/{namespace}/users/{userId}/enable` | PUT | EnableUser | [EnableUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/EnableUser.java) |
| `/iam/namespaces/{namespace}/users/{userId}/information` | GET | GetUserInformation | [GetUserInformation](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserInformation.java) |
| `/iam/namespaces/{namespace}/users/{userId}/information` | DELETE | DeleteUserInformation | [DeleteUserInformation](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/DeleteUserInformation.java) |
| `/iam/namespaces/{namespace}/users/{userId}/logins/histories` | GET | GetUserLoginHistories | [GetUserLoginHistories](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserLoginHistories.java) |
| `/iam/namespaces/{namespace}/users/{userId}/password` | PUT | UpdatePassword | [UpdatePassword](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/UpdatePassword.java) |
| `/iam/namespaces/{namespace}/users/{userId}/permissions` | POST | SaveUserPermission | [SaveUserPermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/SaveUserPermission.java) |
| `/iam/namespaces/{namespace}/users/{userId}/permissions/{resource}/{action}` | POST | AddUserPermission | [AddUserPermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AddUserPermission.java) |
| `/iam/namespaces/{namespace}/users/{userId}/permissions/{resource}/{action}` | DELETE | DeleteUserPermission | [DeleteUserPermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/DeleteUserPermission.java) |
| `/iam/namespaces/{namespace}/users/{userId}/platforms` | GET | GetUserPlatformAccounts | [GetUserPlatformAccounts](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserPlatformAccounts.java) |
| `/iam/namespaces/{namespace}/users/{userId}/platforms/justice/{targetNamespace}` | GET | GetUserMapping | [GetUserMapping](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserMapping.java) |
| `/iam/namespaces/{namespace}/users/{userId}/platforms/justice/{targetNamespace}` | POST | GetUserJusticePlatformAccount | [GetUserJusticePlatformAccount](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserJusticePlatformAccount.java) |
| `/iam/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link` | POST | PlatformLink | [PlatformLink](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PlatformLink.java) |
| `/iam/namespaces/{namespace}/users/{userId}/platforms/{platformId}/unlink` | POST | PlatformUnlink | [PlatformUnlink](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PlatformUnlink.java) |
| `/iam/namespaces/{namespace}/users/{userId}/publisher` | GET | GetPublisherUser | [GetPublisherUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetPublisherUser.java) |
| `/iam/namespaces/{namespace}/users/{userId}/roles` | POST | SaveUserRoles | [SaveUserRoles](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/SaveUserRoles.java) |
| `/iam/namespaces/{namespace}/users/{userId}/roles/{roleId}` | POST | AddUserRole | [AddUserRole](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AddUserRole.java) |
| `/iam/namespaces/{namespace}/users/{userId}/roles/{roleId}` | DELETE | DeleteUserRole | [DeleteUserRole](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/DeleteUserRole.java) |
| `/iam/namespaces/{namespace}/users/{userId}/upgradeHeadlessAccount` | POST | UpgradeHeadlessAccount | [UpgradeHeadlessAccount](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/UpgradeHeadlessAccount.java) |
| `/iam/namespaces/{namespace}/users/{userId}/upgradeHeadlessAccountWithVerificationCode` | POST | UpgradeHeadlessAccountWithVerificationCode | [UpgradeHeadlessAccountWithVerificationCode](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/UpgradeHeadlessAccountWithVerificationCode.java) |
| `/iam/namespaces/{namespace}/users/{userId}/verification` | POST | UserVerification | [UserVerification](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/UserVerification.java) |
| `/iam/namespaces/{namespace}/users/{userId}/verificationcode` | POST | SendVerificationCode | [SendVerificationCode](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/SendVerificationCode.java) |
| `/iam/v2/admin/namespaces/{namespace}/agerestrictions` | GET | AdminGetAgeRestrictionStatusV2 | [AdminGetAgeRestrictionStatusV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetAgeRestrictionStatusV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/agerestrictions` | PATCH | AdminUpdateAgeRestrictionConfigV2 | [AdminUpdateAgeRestrictionConfigV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateAgeRestrictionConfigV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/countries/agerestrictions` | GET | GetListCountryAgeRestriction | [GetListCountryAgeRestriction](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetListCountryAgeRestriction.java) |
| `/iam/v2/admin/namespaces/{namespace}/countries/{countryCode}` | PATCH | UpdateCountryAgeRestriction | [UpdateCountryAgeRestriction](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/UpdateCountryAgeRestriction.java) |
| `/iam/v2/admin/namespaces/{namespace}/users` | GET | AdminSearchUsersV2 | [AdminSearchUsersV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminSearchUsersV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}` | GET | AdminGetUserByUserIdV2 | [AdminGetUserByUserIdV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserByUserIdV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}` | PATCH | AdminUpdateUserV2 | [AdminUpdateUserV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateUserV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/ban` | POST | AdminBanUserV2 | [AdminBanUserV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminBanUserV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/bans` | GET | AdminGetUserBanV2 | [AdminGetUserBanV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserBanV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/disable` | PUT | AdminDisableUserV2 | [AdminDisableUserV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminDisableUserV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/enable` | PUT | AdminEnableUserV2 | [AdminEnableUserV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminEnableUserV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/password` | PUT | AdminResetPasswordV2 | [AdminResetPasswordV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminResetPasswordV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link` | DELETE | AdminDeletePlatformLinkV2 | [AdminDeletePlatformLinkV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminDeletePlatformLinkV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/roles` | PUT | AdminPutUserRolesV2 | [AdminPutUserRolesV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminPutUserRolesV2.java) |
| `/iam/v2/admin/namespaces/{namespace}/users/{userId}/roles` | POST | AdminCreateUserRolesV2 | [AdminCreateUserRolesV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminCreateUserRolesV2.java) |
| `/iam/v2/public/namespaces/{namespace}/countries/{countryCode}/agerestrictions` | GET | PublicGetCountryAgeRestriction | [PublicGetCountryAgeRestriction](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetCountryAgeRestriction.java) |
| `/iam/v2/public/namespaces/{namespace}/users` | POST | PublicCreateUserV2 | [PublicCreateUserV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicCreateUserV2.java) |
| `/iam/v2/public/namespaces/{namespace}/users/forgotPassword` | POST | PublicForgotPasswordV2 | [PublicForgotPasswordV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicForgotPasswordV2.java) |
| `/iam/v2/public/namespaces/{namespace}/users/resetPassword` | POST | PublicResetPasswordV2 | [PublicResetPasswordV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicResetPasswordV2.java) |
| `/iam/v2/public/namespaces/{namespace}/users/{userId}` | GET | PublicGetUserByUserIDV2 | [PublicGetUserByUserIDV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetUserByUserIDV2.java) |
| `/iam/v2/public/namespaces/{namespace}/users/{userId}` | PATCH | PublicUpdateUserV2 | [PublicUpdateUserV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicUpdateUserV2.java) |
| `/iam/v2/public/namespaces/{namespace}/users/{userId}/bans` | GET | PublicGetUserBan | [PublicGetUserBan](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetUserBan.java) |
| `/iam/v2/public/namespaces/{namespace}/users/{userId}/password` | PUT | PublicUpdatePasswordV2 | [PublicUpdatePasswordV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicUpdatePasswordV2.java) |
| `/iam/v2/public/namespaces/{namespace}/users/{userId}/platforms/justice` | GET | GetListJusticePlatformAccounts | [GetListJusticePlatformAccounts](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetListJusticePlatformAccounts.java) |
| `/iam/v2/public/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link` | POST | PublicPlatformLinkV2 | [PublicPlatformLinkV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicPlatformLinkV2.java) |
| `/iam/v2/public/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link` | DELETE | PublicDeletePlatformLinkV2 | [PublicDeletePlatformLinkV2](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicDeletePlatformLinkV2.java) |
| `/iam/v3/admin/namespaces/{namespace}/admins` | GET | ListAdminsV3 | [ListAdminsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/ListAdminsV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/agerestrictions` | GET | AdminGetAgeRestrictionStatusV3 | [AdminGetAgeRestrictionStatusV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetAgeRestrictionStatusV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/agerestrictions` | PATCH | AdminUpdateAgeRestrictionConfigV3 | [AdminUpdateAgeRestrictionConfigV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateAgeRestrictionConfigV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/agerestrictions/countries` | GET | AdminGetListCountryAgeRestrictionV3 | [AdminGetListCountryAgeRestrictionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetListCountryAgeRestrictionV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/agerestrictions/countries/{countryCode}` | PATCH | AdminUpdateCountryAgeRestrictionV3 | [AdminUpdateCountryAgeRestrictionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateCountryAgeRestrictionV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/users/{platformUserId}` | GET | AdminGetUserByPlatformUserIDV3 | [AdminGetUserByPlatformUserIDV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserByPlatformUserIDV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/roles/{roleId}/users` | GET | GetAdminUsersByRoleIdV3 | [GetAdminUsersByRoleIdV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetAdminUsersByRoleIdV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users` | GET | AdminGetUserByEmailAddressV3 | [AdminGetUserByEmailAddressV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserByEmailAddressV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/bulk` | POST | AdminListUserIDByUserIDsV3 | [AdminListUserIDByUserIDsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminListUserIDByUserIDsV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/invite` | POST | AdminInviteUserV3 | [AdminInviteUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminInviteUserV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/platforms/justice` | GET | AdminListUsersV3 | [AdminListUsersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminListUsersV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/search` | GET | AdminSearchUserV3 | [AdminSearchUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminSearchUserV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/search/bulk` | POST | AdminGetBulkUserByEmailAddressV3 | [AdminGetBulkUserByEmailAddressV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetBulkUserByEmailAddressV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}` | GET | AdminGetUserByUserIdV3 | [AdminGetUserByUserIdV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserByUserIdV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}` | PATCH | AdminUpdateUserV3 | [AdminUpdateUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateUserV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/bans` | GET | AdminGetUserBanV3 | [AdminGetUserBanV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserBanV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/bans` | POST | AdminBanUserV3 | [AdminBanUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminBanUserV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/bans/{banId}` | PATCH | AdminUpdateUserBanV3 | [AdminUpdateUserBanV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateUserBanV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/code/request` | POST | AdminSendVerificationCodeV3 | [AdminSendVerificationCodeV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminSendVerificationCodeV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/code/verify` | POST | AdminVerifyAccountV3 | [AdminVerifyAccountV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminVerifyAccountV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/codes` | GET | GetUserVerificationCode | [GetUserVerificationCode](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetUserVerificationCode.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/deletion/status` | GET | AdminGetUserDeletionStatusV3 | [AdminGetUserDeletionStatusV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserDeletionStatusV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/deletion/status` | PATCH | AdminUpdateUserDeletionStatusV3 | [AdminUpdateUserDeletionStatusV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateUserDeletionStatusV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/headless/code/verify` | POST | AdminUpgradeHeadlessAccountV3 | [AdminUpgradeHeadlessAccountV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpgradeHeadlessAccountV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/information` | DELETE | AdminDeleteUserInformationV3 | [AdminDeleteUserInformationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminDeleteUserInformationV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/logins/histories` | GET | AdminGetUserLoginHistoriesV3 | [AdminGetUserLoginHistoriesV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserLoginHistoriesV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/permissions` | PUT | AdminUpdateUserPermissionV3 | [AdminUpdateUserPermissionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateUserPermissionV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/permissions` | POST | AdminAddUserPermissionsV3 | [AdminAddUserPermissionsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminAddUserPermissionsV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/permissions` | DELETE | AdminDeleteUserPermissionBulkV3 | [AdminDeleteUserPermissionBulkV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminDeleteUserPermissionBulkV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/permissions/{resource}/{action}` | DELETE | AdminDeleteUserPermissionV3 | [AdminDeleteUserPermissionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminDeleteUserPermissionV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms` | GET | AdminGetUserPlatformAccountsV3 | [AdminGetUserPlatformAccountsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetUserPlatformAccountsV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/justice` | GET | AdminGetListJusticePlatformAccounts | [AdminGetListJusticePlatformAccounts](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetListJusticePlatformAccounts.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/justice/{targetNamespace}` | POST | AdminCreateJusticeUser | [AdminCreateJusticeUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminCreateJusticeUser.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/link` | POST | AdminLinkPlatformAccount | [AdminLinkPlatformAccount](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminLinkPlatformAccount.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}` | DELETE | AdminPlatformUnlinkV3 | [AdminPlatformUnlinkV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminPlatformUnlinkV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/link` | POST | AdminPlatformLinkV3 | [AdminPlatformLinkV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminPlatformLinkV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/roles` | DELETE | AdminDeleteUserRolesV3 | [AdminDeleteUserRolesV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminDeleteUserRolesV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/roles` | PATCH | AdminSaveUserRoleV3 | [AdminSaveUserRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminSaveUserRoleV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/roles/{roleId}` | POST | AdminAddUserRoleV3 | [AdminAddUserRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminAddUserRoleV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/roles/{roleId}` | DELETE | AdminDeleteUserRoleV3 | [AdminDeleteUserRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminDeleteUserRoleV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/status` | PATCH | AdminUpdateUserStatusV3 | [AdminUpdateUserStatusV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminUpdateUserStatusV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/users/{userId}/verify` | PUT | AdminVerifyUserWithoutVerificationCodeV3 | [AdminVerifyUserWithoutVerificationCodeV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminVerifyUserWithoutVerificationCodeV3.java) |
| `/iam/v3/admin/users/me` | GET | AdminGetMyUserV3 | [AdminGetMyUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/AdminGetMyUserV3.java) |
| `/iam/v3/public/namespaces/{namespace}/platforms/{platformId}/users` | POST | PublicListUserIDByPlatformUserIDsV3 | [PublicListUserIDByPlatformUserIDsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicListUserIDByPlatformUserIDsV3.java) |
| `/iam/v3/public/namespaces/{namespace}/platforms/{platformId}/users/{platformUserId}` | GET | PublicGetUserByPlatformUserIDV3 | [PublicGetUserByPlatformUserIDV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetUserByPlatformUserIDV3.java) |
| `/iam/v3/public/namespaces/{namespace}/requests/{requestId}/async/status` | GET | PublicGetAsyncStatus | [PublicGetAsyncStatus](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetAsyncStatus.java) |
| `/iam/v3/public/namespaces/{namespace}/users` | GET | PublicSearchUserV3 | [PublicSearchUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicSearchUserV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users` | POST | PublicCreateUserV3 | [PublicCreateUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicCreateUserV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/availability` | GET | CheckUserAvailability | [CheckUserAvailability](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/CheckUserAvailability.java) |
| `/iam/v3/public/namespaces/{namespace}/users/bulk/basic` | POST | PublicBulkGetUsers | [PublicBulkGetUsers](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicBulkGetUsers.java) |
| `/iam/v3/public/namespaces/{namespace}/users/code/request` | POST | PublicSendRegistrationCode | [PublicSendRegistrationCode](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicSendRegistrationCode.java) |
| `/iam/v3/public/namespaces/{namespace}/users/code/verify` | POST | PublicVerifyRegistrationCode | [PublicVerifyRegistrationCode](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicVerifyRegistrationCode.java) |
| `/iam/v3/public/namespaces/{namespace}/users/forgot` | POST | PublicForgotPasswordV3 | [PublicForgotPasswordV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicForgotPasswordV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/invite/{invitationId}` | GET | GetAdminInvitationV3 | [GetAdminInvitationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/GetAdminInvitationV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/invite/{invitationId}` | POST | CreateUserFromInvitationV3 | [CreateUserFromInvitationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/CreateUserFromInvitationV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me` | PUT | UpdateUserV3 | [UpdateUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/UpdateUserV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me` | PATCH | PublicUpdateUserV3 | [PublicUpdateUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicUpdateUserV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/code/request` | POST | PublicSendVerificationCodeV3 | [PublicSendVerificationCodeV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicSendVerificationCodeV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/code/verify` | POST | PublicUserVerificationV3 | [PublicUserVerificationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicUserVerificationV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/headless/code/verify` | POST | PublicUpgradeHeadlessAccountV3 | [PublicUpgradeHeadlessAccountV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicUpgradeHeadlessAccountV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/headless/verify` | POST | PublicVerifyHeadlessAccountV3 | [PublicVerifyHeadlessAccountV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicVerifyHeadlessAccountV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/password` | PUT | PublicUpdatePasswordV3 | [PublicUpdatePasswordV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicUpdatePasswordV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/platforms/justice/{targetNamespace}` | POST | PublicCreateJusticeUser | [PublicCreateJusticeUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicCreateJusticeUser.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}` | POST | PublicPlatformLinkV3 | [PublicPlatformLinkV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicPlatformLinkV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}` | DELETE | PublicPlatformUnlinkV3 | [PublicPlatformUnlinkV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicPlatformUnlinkV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}/web/link` | GET | PublicWebLinkPlatform | [PublicWebLinkPlatform](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicWebLinkPlatform.java) |
| `/iam/v3/public/namespaces/{namespace}/users/me/platforms/{platformId}/web/link/establish` | GET | PublicWebLinkPlatformEstablish | [PublicWebLinkPlatformEstablish](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicWebLinkPlatformEstablish.java) |
| `/iam/v3/public/namespaces/{namespace}/users/reset` | POST | ResetPasswordV3 | [ResetPasswordV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/ResetPasswordV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/{userId}` | GET | PublicGetUserByUserIdV3 | [PublicGetUserByUserIdV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetUserByUserIdV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/{userId}/bans` | GET | PublicGetUserBanHistoryV3 | [PublicGetUserBanHistoryV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetUserBanHistoryV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/{userId}/logins/histories` | GET | PublicGetUserLoginHistoriesV3 | [PublicGetUserLoginHistoriesV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetUserLoginHistoriesV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/{userId}/platforms` | GET | PublicGetUserPlatformAccountsV3 | [PublicGetUserPlatformAccountsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetUserPlatformAccountsV3.java) |
| `/iam/v3/public/namespaces/{namespace}/users/{userId}/platforms/link` | POST | PublicLinkPlatformAccount | [PublicLinkPlatformAccount](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicLinkPlatformAccount.java) |
| `/iam/v3/public/namespaces/{namespace}/users/{userId}/validate` | POST | PublicValidateUserByUserIDAndPasswordV3 | [PublicValidateUserByUserIDAndPasswordV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicValidateUserByUserIDAndPasswordV3.java) |
| `/iam/v3/public/users/me` | GET | PublicGetMyUserV3 | [PublicGetMyUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/users/PublicGetMyUserV3.java) |

### OAuth Wrapper:  [OAuth](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/OAuth.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/oauth/authorize` | POST | Authorization | [Authorization](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/Authorization.java) |
| `/iam/oauth/jwks` | GET | GetJWKS | [GetJWKS](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/GetJWKS.java) |
| `/iam/oauth/namespaces/{namespace}/platforms/{platformId}/token` | POST | PlatformTokenRequestHandler | [PlatformTokenRequestHandler](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/PlatformTokenRequestHandler.java) |
| `/iam/oauth/namespaces/{namespace}/users/{userId}/revoke` | POST | RevokeUser | [RevokeUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/RevokeUser.java) |
| `/iam/oauth/revocationlist` | GET | GetRevocationList | [GetRevocationList](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/GetRevocationList.java) |
| `/iam/oauth/revoke/token` | POST | RevokeToken | [RevokeToken](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/RevokeToken.java) |
| `/iam/oauth/revoke/user` | POST | RevokeAUser | [RevokeAUser](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/RevokeAUser.java) |
| `/iam/oauth/token` | POST | TokenGrant | [TokenGrant](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/TokenGrant.java) |
| `/iam/oauth/verify` | POST | VerifyToken | [VerifyToken](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth/VerifyToken.java) |

### Roles Wrapper:  [Roles](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/Roles.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/roles` | GET | GetRoles | [GetRoles](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/GetRoles.java) |
| `/iam/roles` | POST | CreateRole | [CreateRole](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/CreateRole.java) |
| `/iam/roles/{roleId}` | GET | GetRole | [GetRole](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/GetRole.java) |
| `/iam/roles/{roleId}` | PUT | UpdateRole | [UpdateRole](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/UpdateRole.java) |
| `/iam/roles/{roleId}` | DELETE | DeleteRole | [DeleteRole](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/DeleteRole.java) |
| `/iam/roles/{roleId}/admin` | GET | GetRoleAdminStatus | [GetRoleAdminStatus](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/GetRoleAdminStatus.java) |
| `/iam/roles/{roleId}/admin` | POST | SetRoleAsAdmin | [SetRoleAsAdmin](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/SetRoleAsAdmin.java) |
| `/iam/roles/{roleId}/admin` | DELETE | RemoveRoleAdmin | [RemoveRoleAdmin](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/RemoveRoleAdmin.java) |
| `/iam/roles/{roleId}/managers` | GET | GetRoleManagers | [GetRoleManagers](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/GetRoleManagers.java) |
| `/iam/roles/{roleId}/managers` | POST | AddRoleManagers | [AddRoleManagers](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AddRoleManagers.java) |
| `/iam/roles/{roleId}/managers` | DELETE | RemoveRoleManagers | [RemoveRoleManagers](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/RemoveRoleManagers.java) |
| `/iam/roles/{roleId}/members` | GET | GetRoleMembers | [GetRoleMembers](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/GetRoleMembers.java) |
| `/iam/roles/{roleId}/members` | POST | AddRoleMembers | [AddRoleMembers](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AddRoleMembers.java) |
| `/iam/roles/{roleId}/members` | DELETE | RemoveRoleMembers | [RemoveRoleMembers](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/RemoveRoleMembers.java) |
| `/iam/roles/{roleId}/permissions` | POST | UpdateRolePermissions | [UpdateRolePermissions](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/UpdateRolePermissions.java) |
| `/iam/roles/{roleId}/permissions/{resource}/{action}` | POST | AddRolePermission | [AddRolePermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AddRolePermission.java) |
| `/iam/roles/{roleId}/permissions/{resource}/{action}` | DELETE | DeleteRolePermission | [DeleteRolePermission](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/DeleteRolePermission.java) |
| `/iam/v3/admin/roles` | GET | AdminGetRolesV3 | [AdminGetRolesV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminGetRolesV3.java) |
| `/iam/v3/admin/roles` | POST | AdminCreateRoleV3 | [AdminCreateRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminCreateRoleV3.java) |
| `/iam/v3/admin/roles/{roleId}` | GET | AdminGetRoleV3 | [AdminGetRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminGetRoleV3.java) |
| `/iam/v3/admin/roles/{roleId}` | DELETE | AdminDeleteRoleV3 | [AdminDeleteRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminDeleteRoleV3.java) |
| `/iam/v3/admin/roles/{roleId}` | PATCH | AdminUpdateRoleV3 | [AdminUpdateRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminUpdateRoleV3.java) |
| `/iam/v3/admin/roles/{roleId}/admin` | GET | AdminGetRoleAdminStatusV3 | [AdminGetRoleAdminStatusV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminGetRoleAdminStatusV3.java) |
| `/iam/v3/admin/roles/{roleId}/admin` | POST | AdminUpdateAdminRoleStatusV3 | [AdminUpdateAdminRoleStatusV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminUpdateAdminRoleStatusV3.java) |
| `/iam/v3/admin/roles/{roleId}/admin` | DELETE | AdminRemoveRoleAdminV3 | [AdminRemoveRoleAdminV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminRemoveRoleAdminV3.java) |
| `/iam/v3/admin/roles/{roleId}/managers` | GET | AdminGetRoleManagersV3 | [AdminGetRoleManagersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminGetRoleManagersV3.java) |
| `/iam/v3/admin/roles/{roleId}/managers` | POST | AdminAddRoleManagersV3 | [AdminAddRoleManagersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminAddRoleManagersV3.java) |
| `/iam/v3/admin/roles/{roleId}/managers` | DELETE | AdminRemoveRoleManagersV3 | [AdminRemoveRoleManagersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminRemoveRoleManagersV3.java) |
| `/iam/v3/admin/roles/{roleId}/members` | GET | AdminGetRoleMembersV3 | [AdminGetRoleMembersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminGetRoleMembersV3.java) |
| `/iam/v3/admin/roles/{roleId}/members` | POST | AdminAddRoleMembersV3 | [AdminAddRoleMembersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminAddRoleMembersV3.java) |
| `/iam/v3/admin/roles/{roleId}/members` | DELETE | AdminRemoveRoleMembersV3 | [AdminRemoveRoleMembersV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminRemoveRoleMembersV3.java) |
| `/iam/v3/admin/roles/{roleId}/permissions` | PUT | AdminUpdateRolePermissionsV3 | [AdminUpdateRolePermissionsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminUpdateRolePermissionsV3.java) |
| `/iam/v3/admin/roles/{roleId}/permissions` | POST | AdminAddRolePermissionsV3 | [AdminAddRolePermissionsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminAddRolePermissionsV3.java) |
| `/iam/v3/admin/roles/{roleId}/permissions` | DELETE | AdminDeleteRolePermissionsV3 | [AdminDeleteRolePermissionsV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminDeleteRolePermissionsV3.java) |
| `/iam/v3/admin/roles/{roleId}/permissions/{resource}/{action}` | DELETE | AdminDeleteRolePermissionV3 | [AdminDeleteRolePermissionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminDeleteRolePermissionV3.java) |
| `/iam/v3/public/roles` | GET | PublicGetRolesV3 | [PublicGetRolesV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/PublicGetRolesV3.java) |
| `/iam/v3/public/roles/{roleId}` | GET | PublicGetRoleV3 | [PublicGetRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/PublicGetRoleV3.java) |
| `/iam/v4/admin/roles` | GET | AdminGetRolesV4 | [AdminGetRolesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminGetRolesV4.java) |
| `/iam/v4/admin/roles` | POST | AdminCreateRoleV4 | [AdminCreateRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminCreateRoleV4.java) |
| `/iam/v4/admin/roles/{roleId}` | GET | AdminGetRoleV4 | [AdminGetRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminGetRoleV4.java) |
| `/iam/v4/admin/roles/{roleId}` | DELETE | AdminDeleteRoleV4 | [AdminDeleteRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminDeleteRoleV4.java) |
| `/iam/v4/admin/roles/{roleId}` | PATCH | AdminUpdateRoleV4 | [AdminUpdateRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminUpdateRoleV4.java) |
| `/iam/v4/admin/roles/{roleId}/permissions` | PUT | AdminUpdateRolePermissionsV4 | [AdminUpdateRolePermissionsV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminUpdateRolePermissionsV4.java) |
| `/iam/v4/admin/roles/{roleId}/permissions` | POST | AdminAddRolePermissionsV4 | [AdminAddRolePermissionsV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminAddRolePermissionsV4.java) |
| `/iam/v4/admin/roles/{roleId}/permissions` | DELETE | AdminDeleteRolePermissionsV4 | [AdminDeleteRolePermissionsV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminDeleteRolePermissionsV4.java) |
| `/iam/v4/admin/roles/{roleId}/users` | GET | AdminListAssignedUsersV4 | [AdminListAssignedUsersV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminListAssignedUsersV4.java) |
| `/iam/v4/admin/roles/{roleId}/users` | POST | AdminAssignUserToRoleV4 | [AdminAssignUserToRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminAssignUserToRoleV4.java) |
| `/iam/v4/admin/roles/{roleId}/users` | DELETE | AdminRevokeUserFromRoleV4 | [AdminRevokeUserFromRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/roles/AdminRevokeUserFromRoleV4.java) |

### InputValidations Wrapper:  [InputValidations](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/InputValidations.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v3/admin/inputValidations` | GET | AdminGetInputValidations | [AdminGetInputValidations](../src/main/java/net/accelbyte/sdk/api/iam/operations/input_validations/AdminGetInputValidations.java) |
| `/iam/v3/admin/inputValidations` | PUT | AdminUpdateInputValidations | [AdminUpdateInputValidations](../src/main/java/net/accelbyte/sdk/api/iam/operations/input_validations/AdminUpdateInputValidations.java) |
| `/iam/v3/admin/inputValidations/{field}` | DELETE | AdminResetInputValidations | [AdminResetInputValidations](../src/main/java/net/accelbyte/sdk/api/iam/operations/input_validations/AdminResetInputValidations.java) |
| `/iam/v3/public/inputValidations` | GET | PublicGetInputValidations | [PublicGetInputValidations](../src/main/java/net/accelbyte/sdk/api/iam/operations/input_validations/PublicGetInputValidations.java) |

### Third Party Credential Wrapper:  [ThirdPartyCredential](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/ThirdPartyCredential.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v3/admin/namespaces/{namespace}/platforms/all/clients` | GET | RetrieveAllThirdPartyLoginPlatformCredentialV3 | [RetrieveAllThirdPartyLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/RetrieveAllThirdPartyLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/all/clients/active` | GET | RetrieveAllActiveThirdPartyLoginPlatformCredentialV3 | [RetrieveAllActiveThirdPartyLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/RetrieveAllActiveThirdPartyLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients` | GET | RetrieveThirdPartyLoginPlatformCredentialV3 | [RetrieveThirdPartyLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/RetrieveThirdPartyLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients` | POST | AddThirdPartyLoginPlatformCredentialV3 | [AddThirdPartyLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/AddThirdPartyLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients` | DELETE | DeleteThirdPartyLoginPlatformCredentialV3 | [DeleteThirdPartyLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/DeleteThirdPartyLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients` | PATCH | UpdateThirdPartyLoginPlatformCredentialV3 | [UpdateThirdPartyLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/UpdateThirdPartyLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients/domain` | PUT | UpdateThirdPartyLoginPlatformDomainV3 | [UpdateThirdPartyLoginPlatformDomainV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/UpdateThirdPartyLoginPlatformDomainV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/clients/domain` | DELETE | DeleteThirdPartyLoginPlatformDomainV3 | [DeleteThirdPartyLoginPlatformDomainV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/DeleteThirdPartyLoginPlatformDomainV3.java) |
| `/iam/v3/public/namespaces/{namespace}/platforms/clients/active` | GET | RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 | [RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/third_party_credential/RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3.java) |

### SSO Credential Wrapper:  [SSOCredential](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/SSOCredential.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v3/admin/namespaces/{namespace}/platforms/sso` | GET | RetrieveAllSSOLoginPlatformCredentialV3 | [RetrieveAllSSOLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso_credential/RetrieveAllSSOLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/sso` | GET | RetrieveSSOLoginPlatformCredential | [RetrieveSSOLoginPlatformCredential](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso_credential/RetrieveSSOLoginPlatformCredential.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/sso` | POST | AddSSOLoginPlatformCredential | [AddSSOLoginPlatformCredential](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso_credential/AddSSOLoginPlatformCredential.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/sso` | DELETE | DeleteSSOLoginPlatformCredentialV3 | [DeleteSSOLoginPlatformCredentialV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso_credential/DeleteSSOLoginPlatformCredentialV3.java) |
| `/iam/v3/admin/namespaces/{namespace}/platforms/{platformId}/sso` | PATCH | UpdateSSOPlatformCredential | [UpdateSSOPlatformCredential](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso_credential/UpdateSSOPlatformCredential.java) |

### OAuth2.0 - Extension Wrapper:  [OAuth20Extension](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/OAuth20Extension.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v3/authenticate` | POST | UserAuthenticationV3 | [UserAuthenticationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0_extension/UserAuthenticationV3.java) |
| `/iam/v3/location/country` | GET | GetCountryLocationV3 | [GetCountryLocationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0_extension/GetCountryLocationV3.java) |
| `/iam/v3/logout` | POST | Logout | [Logout](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0_extension/Logout.java) |
| `/iam/v3/platforms/{platformId}/authenticate` | GET | PlatformAuthenticationV3 | [PlatformAuthenticationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0_extension/PlatformAuthenticationV3.java) |

### OAuth2.0 Wrapper:  [OAuth20](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/OAuth20.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v3/oauth/admin/namespaces/{namespace}/users/{userId}/platforms/{platformId}/platformToken` | GET | AdminRetrieveUserThirdPartyPlatformTokenV3 | [AdminRetrieveUserThirdPartyPlatformTokenV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/AdminRetrieveUserThirdPartyPlatformTokenV3.java) |
| `/iam/v3/oauth/admin/namespaces/{namespace}/users/{userId}/revoke` | POST | RevokeUserV3 | [RevokeUserV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/RevokeUserV3.java) |
| `/iam/v3/oauth/authorize` | GET | AuthorizeV3 | [AuthorizeV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/AuthorizeV3.java) |
| `/iam/v3/oauth/introspect` | POST | TokenIntrospectionV3 | [TokenIntrospectionV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/TokenIntrospectionV3.java) |
| `/iam/v3/oauth/jwks` | GET | GetJWKSV3 | [GetJWKSV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/GetJWKSV3.java) |
| `/iam/v3/oauth/mfa/factor/change` | POST | Change2faMethod | [Change2faMethod](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/Change2faMethod.java) |
| `/iam/v3/oauth/mfa/verify` | POST | Verify2faCode | [Verify2faCode](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/Verify2faCode.java) |
| `/iam/v3/oauth/namespaces/{namespace}/users/{userId}/platforms/{platformId}/platformToken` | GET | RetrieveUserThirdPartyPlatformTokenV3 | [RetrieveUserThirdPartyPlatformTokenV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/RetrieveUserThirdPartyPlatformTokenV3.java) |
| `/iam/v3/oauth/platforms/{platformId}/authorize` | GET | AuthCodeRequestV3 | [AuthCodeRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/AuthCodeRequestV3.java) |
| `/iam/v3/oauth/platforms/{platformId}/token` | POST | PlatformTokenGrantV3 | [PlatformTokenGrantV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/PlatformTokenGrantV3.java) |
| `/iam/v3/oauth/revocationlist` | GET | GetRevocationListV3 | [GetRevocationListV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/GetRevocationListV3.java) |
| `/iam/v3/oauth/revoke` | POST | TokenRevocationV3 | [TokenRevocationV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/TokenRevocationV3.java) |
| `/iam/v3/oauth/token` | POST | TokenGrantV3 | [TokenGrantV3](../src/main/java/net/accelbyte/sdk/api/iam/operations/o_auth2_0/TokenGrantV3.java) |

### SSO SAML 2.0 Wrapper:  [SSOSAML20](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/SSOSAML20.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v3/sso/saml/platforms/{platformId}/authenticate` | POST | PlatformAuthenticateSAMLV3Handler | [PlatformAuthenticateSAMLV3Handler](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso_saml_2_0/PlatformAuthenticateSAMLV3Handler.java) |

### SSO Wrapper:  [SSO](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/SSO.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v3/sso/{platformId}` | GET | LoginSSOClient | [LoginSSOClient](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso/LoginSSOClient.java) |
| `/iam/v3/sso/{platformId}/logout` | POST | LogoutSSOClient | [LogoutSSOClient](../src/main/java/net/accelbyte/sdk/api/iam/operations/sso/LogoutSSOClient.java) |

### Users V4 Wrapper:  [UsersV4](../src/main/java/net/accelbyte/sdk/api/iam/wrappers/UsersV4.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/iam/v4/admin/namespaces/{namespace}/users/bulk/validate` | POST | AdminBulkCheckValidUserIDV4 | [AdminBulkCheckValidUserIDV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminBulkCheckValidUserIDV4.java) |
| `/iam/v4/admin/namespaces/{namespace}/users/{userId}` | PUT | AdminUpdateUserV4 | [AdminUpdateUserV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminUpdateUserV4.java) |
| `/iam/v4/admin/namespaces/{namespace}/users/{userId}/email` | PUT | AdminUpdateUserEmailAddressV4 | [AdminUpdateUserEmailAddressV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminUpdateUserEmailAddressV4.java) |
| `/iam/v4/admin/namespaces/{namespace}/users/{userId}/roles` | GET | AdminListUserRolesV4 | [AdminListUserRolesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminListUserRolesV4.java) |
| `/iam/v4/admin/namespaces/{namespace}/users/{userId}/roles` | PUT | AdminUpdateUserRoleV4 | [AdminUpdateUserRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminUpdateUserRoleV4.java) |
| `/iam/v4/admin/namespaces/{namespace}/users/{userId}/roles` | POST | AdminAddUserRoleV4 | [AdminAddUserRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminAddUserRoleV4.java) |
| `/iam/v4/admin/namespaces/{namespace}/users/{userId}/roles` | DELETE | AdminRemoveUserRoleV4 | [AdminRemoveUserRoleV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminRemoveUserRoleV4.java) |
| `/iam/v4/admin/users/me` | PATCH | AdminUpdateMyUserV4 | [AdminUpdateMyUserV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminUpdateMyUserV4.java) |
| `/iam/v4/admin/users/me/mfa/authenticator/disable` | DELETE | AdminDisableMyAuthenticatorV4 | [AdminDisableMyAuthenticatorV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminDisableMyAuthenticatorV4.java) |
| `/iam/v4/admin/users/me/mfa/authenticator/enable` | POST | AdminEnableMyAuthenticatorV4 | [AdminEnableMyAuthenticatorV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminEnableMyAuthenticatorV4.java) |
| `/iam/v4/admin/users/me/mfa/authenticator/key` | POST | AdminGenerateMyAuthenticatorKeyV4 | [AdminGenerateMyAuthenticatorKeyV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminGenerateMyAuthenticatorKeyV4.java) |
| `/iam/v4/admin/users/me/mfa/backupCode` | GET | AdminGetMyBackupCodesV4 | [AdminGetMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminGetMyBackupCodesV4.java) |
| `/iam/v4/admin/users/me/mfa/backupCode` | POST | AdminGenerateMyBackupCodesV4 | [AdminGenerateMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminGenerateMyBackupCodesV4.java) |
| `/iam/v4/admin/users/me/mfa/backupCode/disable` | DELETE | AdminDisableMyBackupCodesV4 | [AdminDisableMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminDisableMyBackupCodesV4.java) |
| `/iam/v4/admin/users/me/mfa/backupCode/download` | GET | AdminDownloadMyBackupCodesV4 | [AdminDownloadMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminDownloadMyBackupCodesV4.java) |
| `/iam/v4/admin/users/me/mfa/backupCode/enable` | POST | AdminEnableMyBackupCodesV4 | [AdminEnableMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminEnableMyBackupCodesV4.java) |
| `/iam/v4/admin/users/me/mfa/factor` | GET | AdminGetMyEnabledFactorsV4 | [AdminGetMyEnabledFactorsV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminGetMyEnabledFactorsV4.java) |
| `/iam/v4/admin/users/me/mfa/factor` | POST | AdminMakeFactorMyDefaultV4 | [AdminMakeFactorMyDefaultV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminMakeFactorMyDefaultV4.java) |
| `/iam/v4/admin/users/users/invite` | POST | AdminInviteUserV4 | [AdminInviteUserV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/AdminInviteUserV4.java) |
| `/iam/v4/public/namespaces/{namespace}/test_users` | POST | PublicCreateTestUserV4 | [PublicCreateTestUserV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicCreateTestUserV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users` | POST | PublicCreateUserV4 | [PublicCreateUserV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicCreateUserV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/invite/{invitationId}` | POST | CreateUserFromInvitationV4 | [CreateUserFromInvitationV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/CreateUserFromInvitationV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me` | PATCH | PublicUpdateUserV4 | [PublicUpdateUserV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicUpdateUserV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/email` | PUT | PublicUpdateUserEmailAddressV4 | [PublicUpdateUserEmailAddressV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicUpdateUserEmailAddressV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/headless/code/verify` | POST | PublicUpgradeHeadlessAccountWithVerificationCodeV4 | [PublicUpgradeHeadlessAccountWithVerificationCodeV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicUpgradeHeadlessAccountWithVerificationCodeV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/headless/verify` | POST | PublicUpgradeHeadlessAccountV4 | [PublicUpgradeHeadlessAccountV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicUpgradeHeadlessAccountV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/authenticator/disable` | DELETE | PublicDisableMyAuthenticatorV4 | [PublicDisableMyAuthenticatorV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicDisableMyAuthenticatorV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/authenticator/enable` | POST | PublicEnableMyAuthenticatorV4 | [PublicEnableMyAuthenticatorV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicEnableMyAuthenticatorV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/authenticator/key` | POST | PublicGenerateMyAuthenticatorKeyV4 | [PublicGenerateMyAuthenticatorKeyV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicGenerateMyAuthenticatorKeyV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/backupCode` | GET | PublicGetMyBackupCodesV4 | [PublicGetMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicGetMyBackupCodesV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/backupCode` | POST | PublicGenerateMyBackupCodesV4 | [PublicGenerateMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicGenerateMyBackupCodesV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/backupCode/disable` | DELETE | PublicDisableMyBackupCodesV4 | [PublicDisableMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicDisableMyBackupCodesV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/backupCode/download` | GET | PublicDownloadMyBackupCodesV4 | [PublicDownloadMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicDownloadMyBackupCodesV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/backupCode/enable` | POST | PublicEnableMyBackupCodesV4 | [PublicEnableMyBackupCodesV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicEnableMyBackupCodesV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/factor` | GET | PublicGetMyEnabledFactorsV4 | [PublicGetMyEnabledFactorsV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicGetMyEnabledFactorsV4.java) |
| `/iam/v4/public/namespaces/{namespace}/users/me/mfa/factor` | POST | PublicMakeFactorMyDefaultV4 | [PublicMakeFactorMyDefaultV4](../src/main/java/net/accelbyte/sdk/api/iam/operations/users_v4/PublicMakeFactorMyDefaultV4.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `.BannedBy` | [BannedBy](../src/main/java/net/accelbyte/sdk/api/iam/models/BannedBy.java) |
| `.validation` | [Validation](../src/main/java/net/accelbyte/sdk/api/iam/models/Validation.java) |
| `.validation.description` | [ValidationDescription](../src/main/java/net/accelbyte/sdk/api/iam/models/ValidationDescription.java) |
| `account.UserActiveBanResponseV4` | [AccountUserActiveBanResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountUserActiveBanResponseV4.java) |
| `account.UserPermissionsResponseV4` | [AccountUserPermissionsResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountUserPermissionsResponseV4.java) |
| `account.UserResponseV4` | [AccountUserResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountUserResponseV4.java) |
| `account.createTestUserRequestV4` | [AccountCreateTestUserRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountCreateTestUserRequestV4.java) |
| `account.createUserRequestV4` | [AccountCreateUserRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountCreateUserRequestV4.java) |
| `account.createUserResponseV4` | [AccountCreateUserResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountCreateUserResponseV4.java) |
| `account.upgradeHeadlessAccountRequestV4` | [AccountUpgradeHeadlessAccountRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountUpgradeHeadlessAccountRequestV4.java) |
| `account.upgradeHeadlessAccountWithVerificationCodeRequestV4` | [AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4.java) |
| `accountcommon.Ban` | [AccountcommonBan](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBan.java) |
| `accountcommon.BanReason` | [AccountcommonBanReason](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBanReason.java) |
| `accountcommon.BanReasonV3` | [AccountcommonBanReasonV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBanReasonV3.java) |
| `accountcommon.BanReasons` | [AccountcommonBanReasons](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBanReasons.java) |
| `accountcommon.BanReasonsV3` | [AccountcommonBanReasonsV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBanReasonsV3.java) |
| `accountcommon.BanV3` | [AccountcommonBanV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBanV3.java) |
| `accountcommon.BannedByV3` | [AccountcommonBannedByV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBannedByV3.java) |
| `accountcommon.Bans` | [AccountcommonBans](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBans.java) |
| `accountcommon.BansV3` | [AccountcommonBansV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonBansV3.java) |
| `accountcommon.ClientPermission` | [AccountcommonClientPermission](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonClientPermission.java) |
| `accountcommon.ClientPermissionV3` | [AccountcommonClientPermissionV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonClientPermissionV3.java) |
| `accountcommon.ClientPermissions` | [AccountcommonClientPermissions](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonClientPermissions.java) |
| `accountcommon.ClientPermissionsV3` | [AccountcommonClientPermissionsV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonClientPermissionsV3.java) |
| `accountcommon.ConflictedUserPlatformAccounts` | [AccountcommonConflictedUserPlatformAccounts](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonConflictedUserPlatformAccounts.java) |
| `accountcommon.CountryAgeRestriction` | [AccountcommonCountryAgeRestriction](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonCountryAgeRestriction.java) |
| `accountcommon.Description` | [AccountcommonDescription](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonDescription.java) |
| `accountcommon.InputValidationDescription` | [AccountcommonInputValidationDescription](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonInputValidationDescription.java) |
| `accountcommon.JWTBanV3` | [AccountcommonJWTBanV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonJWTBanV3.java) |
| `accountcommon.ListUsersWithPlatformAccountsResponse` | [AccountcommonListUsersWithPlatformAccountsResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonListUsersWithPlatformAccountsResponse.java) |
| `accountcommon.NamespaceRole` | [AccountcommonNamespaceRole](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonNamespaceRole.java) |
| `accountcommon.Pagination` | [AccountcommonPagination](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonPagination.java) |
| `accountcommon.PaginationV3` | [AccountcommonPaginationV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonPaginationV3.java) |
| `accountcommon.Permission` | [AccountcommonPermission](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonPermission.java) |
| `accountcommon.PermissionV3` | [AccountcommonPermissionV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonPermissionV3.java) |
| `accountcommon.Permissions` | [AccountcommonPermissions](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonPermissions.java) |
| `accountcommon.PermissionsV3` | [AccountcommonPermissionsV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonPermissionsV3.java) |
| `accountcommon.PlatformAccount` | [AccountcommonPlatformAccount](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonPlatformAccount.java) |
| `accountcommon.RegisteredDomain` | [AccountcommonRegisteredDomain](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonRegisteredDomain.java) |
| `accountcommon.Role` | [AccountcommonRole](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonRole.java) |
| `accountcommon.RoleManager` | [AccountcommonRoleManager](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonRoleManager.java) |
| `accountcommon.RoleManagerV3` | [AccountcommonRoleManagerV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonRoleManagerV3.java) |
| `accountcommon.RoleMember` | [AccountcommonRoleMember](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonRoleMember.java) |
| `accountcommon.RoleMemberV3` | [AccountcommonRoleMemberV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonRoleMemberV3.java) |
| `accountcommon.RoleV3` | [AccountcommonRoleV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonRoleV3.java) |
| `accountcommon.UserLinkedPlatform` | [AccountcommonUserLinkedPlatform](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserLinkedPlatform.java) |
| `accountcommon.UserLinkedPlatformV3` | [AccountcommonUserLinkedPlatformV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserLinkedPlatformV3.java) |
| `accountcommon.UserLinkedPlatformsResponseV3` | [AccountcommonUserLinkedPlatformsResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserLinkedPlatformsResponseV3.java) |
| `accountcommon.UserPlatformInfo` | [AccountcommonUserPlatformInfo](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserPlatformInfo.java) |
| `accountcommon.UserPlatforms` | [AccountcommonUserPlatforms](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserPlatforms.java) |
| `accountcommon.UserSearchByPlatformIDResult` | [AccountcommonUserSearchByPlatformIDResult](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserSearchByPlatformIDResult.java) |
| `accountcommon.UserSearchResult` | [AccountcommonUserSearchResult](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserSearchResult.java) |
| `accountcommon.UserWithLinkedPlatformAccounts` | [AccountcommonUserWithLinkedPlatformAccounts](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserWithLinkedPlatformAccounts.java) |
| `accountcommon.UserWithPlatformAccounts` | [AccountcommonUserWithPlatformAccounts](../src/main/java/net/accelbyte/sdk/api/iam/models/AccountcommonUserWithPlatformAccounts.java) |
| `bloom.FilterJSON` | [BloomFilterJSON](../src/main/java/net/accelbyte/sdk/api/iam/models/BloomFilterJSON.java) |
| `clientmodel.ClientCreateRequest` | [ClientmodelClientCreateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientCreateRequest.java) |
| `clientmodel.ClientCreationResponse` | [ClientmodelClientCreationResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientCreationResponse.java) |
| `clientmodel.ClientCreationV3Request` | [ClientmodelClientCreationV3Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientCreationV3Request.java) |
| `clientmodel.ClientResponse` | [ClientmodelClientResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientResponse.java) |
| `clientmodel.ClientUpdateRequest` | [ClientmodelClientUpdateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientUpdateRequest.java) |
| `clientmodel.ClientUpdateSecretRequest` | [ClientmodelClientUpdateSecretRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientUpdateSecretRequest.java) |
| `clientmodel.ClientUpdateV3Request` | [ClientmodelClientUpdateV3Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientUpdateV3Request.java) |
| `clientmodel.ClientV3Response` | [ClientmodelClientV3Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientV3Response.java) |
| `clientmodel.ClientsV3Response` | [ClientmodelClientsV3Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ClientmodelClientsV3Response.java) |
| `legal.AcceptedPoliciesRequest` | [LegalAcceptedPoliciesRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/LegalAcceptedPoliciesRequest.java) |
| `model.AddUserRoleV4Request` | [ModelAddUserRoleV4Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAddUserRoleV4Request.java) |
| `model.AgeRestrictionRequest` | [ModelAgeRestrictionRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAgeRestrictionRequest.java) |
| `model.AgeRestrictionRequestV3` | [ModelAgeRestrictionRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAgeRestrictionRequestV3.java) |
| `model.AgeRestrictionResponse` | [ModelAgeRestrictionResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAgeRestrictionResponse.java) |
| `model.AgeRestrictionResponseV3` | [ModelAgeRestrictionResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAgeRestrictionResponseV3.java) |
| `model.AssignUserV4Request` | [ModelAssignUserV4Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAssignUserV4Request.java) |
| `model.AssignedUserV4Response` | [ModelAssignedUserV4Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAssignedUserV4Response.java) |
| `model.AuthenticatorKeyResponseV4` | [ModelAuthenticatorKeyResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelAuthenticatorKeyResponseV4.java) |
| `model.BackupCodesResponseV4` | [ModelBackupCodesResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelBackupCodesResponseV4.java) |
| `model.BanCreateRequest` | [ModelBanCreateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelBanCreateRequest.java) |
| `model.BanUpdateRequest` | [ModelBanUpdateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelBanUpdateRequest.java) |
| `model.CheckValidUserIDRequestV4` | [ModelCheckValidUserIDRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelCheckValidUserIDRequestV4.java) |
| `model.Country` | [ModelCountry](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelCountry.java) |
| `model.CountryAgeRestrictionRequest` | [ModelCountryAgeRestrictionRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelCountryAgeRestrictionRequest.java) |
| `model.CountryAgeRestrictionV3Request` | [ModelCountryAgeRestrictionV3Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelCountryAgeRestrictionV3Request.java) |
| `model.CountryV3Response` | [ModelCountryV3Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelCountryV3Response.java) |
| `model.CreateJusticeUserResponse` | [ModelCreateJusticeUserResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelCreateJusticeUserResponse.java) |
| `model.DisableUserRequest` | [ModelDisableUserRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelDisableUserRequest.java) |
| `model.EmailUpdateRequestV4` | [ModelEmailUpdateRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelEmailUpdateRequestV4.java) |
| `model.EnabledFactorsResponseV4` | [ModelEnabledFactorsResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelEnabledFactorsResponseV4.java) |
| `model.ForgotPasswordRequestV3` | [ModelForgotPasswordRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelForgotPasswordRequestV3.java) |
| `model.GetAdminUsersResponse` | [ModelGetAdminUsersResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelGetAdminUsersResponse.java) |
| `model.GetPublisherUserResponse` | [ModelGetPublisherUserResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelGetPublisherUserResponse.java) |
| `model.GetUserBanV3Response` | [ModelGetUserBanV3Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelGetUserBanV3Response.java) |
| `model.GetUserJusticePlatformAccountResponse` | [ModelGetUserJusticePlatformAccountResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelGetUserJusticePlatformAccountResponse.java) |
| `model.GetUserMapping` | [ModelGetUserMapping](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelGetUserMapping.java) |
| `model.GetUsersResponseWithPaginationV3` | [ModelGetUsersResponseWithPaginationV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelGetUsersResponseWithPaginationV3.java) |
| `model.InputValidationData` | [ModelInputValidationData](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInputValidationData.java) |
| `model.InputValidationDataPublic` | [ModelInputValidationDataPublic](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInputValidationDataPublic.java) |
| `model.InputValidationUpdatePayload` | [ModelInputValidationUpdatePayload](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInputValidationUpdatePayload.java) |
| `model.InputValidationsPublicResponse` | [ModelInputValidationsPublicResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInputValidationsPublicResponse.java) |
| `model.InputValidationsResponse` | [ModelInputValidationsResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInputValidationsResponse.java) |
| `model.InviteUserRequestV3` | [ModelInviteUserRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInviteUserRequestV3.java) |
| `model.InviteUserRequestV4` | [ModelInviteUserRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInviteUserRequestV4.java) |
| `model.InviteUserResponseV3` | [ModelInviteUserResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelInviteUserResponseV3.java) |
| `model.LinkPlatformAccountRequest` | [ModelLinkPlatformAccountRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelLinkPlatformAccountRequest.java) |
| `model.LinkRequest` | [ModelLinkRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelLinkRequest.java) |
| `model.ListAssignedUsersV4Response` | [ModelListAssignedUsersV4Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListAssignedUsersV4Response.java) |
| `model.ListBulkUserResponse` | [ModelListBulkUserResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListBulkUserResponse.java) |
| `model.ListEmailAddressRequest` | [ModelListEmailAddressRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListEmailAddressRequest.java) |
| `model.ListRoleV4Response` | [ModelListRoleV4Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListRoleV4Response.java) |
| `model.ListUserInformationResult` | [ModelListUserInformationResult](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListUserInformationResult.java) |
| `model.ListUserResponseV3` | [ModelListUserResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListUserResponseV3.java) |
| `model.ListUserRolesV4Response` | [ModelListUserRolesV4Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListUserRolesV4Response.java) |
| `model.ListValidUserIDResponseV4` | [ModelListValidUserIDResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelListValidUserIDResponseV4.java) |
| `model.LoginHistoriesResponse` | [ModelLoginHistoriesResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelLoginHistoriesResponse.java) |
| `model.NamespaceRoleRequest` | [ModelNamespaceRoleRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelNamespaceRoleRequest.java) |
| `model.PermissionDeleteRequest` | [ModelPermissionDeleteRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPermissionDeleteRequest.java) |
| `model.PlatformDomainDeleteRequest` | [ModelPlatformDomainDeleteRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPlatformDomainDeleteRequest.java) |
| `model.PlatformDomainResponse` | [ModelPlatformDomainResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPlatformDomainResponse.java) |
| `model.PlatformDomainUpdateRequest` | [ModelPlatformDomainUpdateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPlatformDomainUpdateRequest.java) |
| `model.PlatformUserIDRequest` | [ModelPlatformUserIDRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPlatformUserIDRequest.java) |
| `model.PlatformUserInformation` | [ModelPlatformUserInformation](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPlatformUserInformation.java) |
| `model.PublicThirdPartyPlatformInfo` | [ModelPublicThirdPartyPlatformInfo](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPublicThirdPartyPlatformInfo.java) |
| `model.PublicUserInformationResponseV3` | [ModelPublicUserInformationResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPublicUserInformationResponseV3.java) |
| `model.PublicUserInformationV3` | [ModelPublicUserInformationV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPublicUserInformationV3.java) |
| `model.PublicUserResponse` | [ModelPublicUserResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPublicUserResponse.java) |
| `model.PublicUserResponseV3` | [ModelPublicUserResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPublicUserResponseV3.java) |
| `model.PublicUsersResponse` | [ModelPublicUsersResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelPublicUsersResponse.java) |
| `model.RemoveUserRoleV4Request` | [ModelRemoveUserRoleV4Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRemoveUserRoleV4Request.java) |
| `model.ResetPasswordRequest` | [ModelResetPasswordRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelResetPasswordRequest.java) |
| `model.ResetPasswordRequestV3` | [ModelResetPasswordRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelResetPasswordRequestV3.java) |
| `model.RevokeUserV4Request` | [ModelRevokeUserV4Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRevokeUserV4Request.java) |
| `model.RoleAdminStatusResponse` | [ModelRoleAdminStatusResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleAdminStatusResponse.java) |
| `model.RoleAdminStatusResponseV3` | [ModelRoleAdminStatusResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleAdminStatusResponseV3.java) |
| `model.RoleCreateRequest` | [ModelRoleCreateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleCreateRequest.java) |
| `model.RoleCreateV3Request` | [ModelRoleCreateV3Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleCreateV3Request.java) |
| `model.RoleManagersRequest` | [ModelRoleManagersRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleManagersRequest.java) |
| `model.RoleManagersRequestV3` | [ModelRoleManagersRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleManagersRequestV3.java) |
| `model.RoleManagersResponse` | [ModelRoleManagersResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleManagersResponse.java) |
| `model.RoleManagersResponsesV3` | [ModelRoleManagersResponsesV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleManagersResponsesV3.java) |
| `model.RoleMembersRequest` | [ModelRoleMembersRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleMembersRequest.java) |
| `model.RoleMembersRequestV3` | [ModelRoleMembersRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleMembersRequestV3.java) |
| `model.RoleMembersResponse` | [ModelRoleMembersResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleMembersResponse.java) |
| `model.RoleMembersResponseV3` | [ModelRoleMembersResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleMembersResponseV3.java) |
| `model.RoleNamesResponseV3` | [ModelRoleNamesResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleNamesResponseV3.java) |
| `model.RoleResponse` | [ModelRoleResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleResponse.java) |
| `model.RoleResponseV3` | [ModelRoleResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleResponseV3.java) |
| `model.RoleResponseWithManagers` | [ModelRoleResponseWithManagers](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleResponseWithManagers.java) |
| `model.RoleResponseWithManagersAndPaginationV3` | [ModelRoleResponseWithManagersAndPaginationV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleResponseWithManagersAndPaginationV3.java) |
| `model.RoleResponseWithManagersV3` | [ModelRoleResponseWithManagersV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleResponseWithManagersV3.java) |
| `model.RoleUpdateRequest` | [ModelRoleUpdateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleUpdateRequest.java) |
| `model.RoleUpdateRequestV3` | [ModelRoleUpdateRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleUpdateRequestV3.java) |
| `model.RoleV4Request` | [ModelRoleV4Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleV4Request.java) |
| `model.RoleV4Response` | [ModelRoleV4Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelRoleV4Response.java) |
| `model.SSOPlatformCredentialRequest` | [ModelSSOPlatformCredentialRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSSOPlatformCredentialRequest.java) |
| `model.SSOPlatformCredentialResponse` | [ModelSSOPlatformCredentialResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSSOPlatformCredentialResponse.java) |
| `model.SearchUsersByPlatformIDResponse` | [ModelSearchUsersByPlatformIDResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSearchUsersByPlatformIDResponse.java) |
| `model.SearchUsersResponse` | [ModelSearchUsersResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSearchUsersResponse.java) |
| `model.SearchUsersResponseWithPaginationV3` | [ModelSearchUsersResponseWithPaginationV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSearchUsersResponseWithPaginationV3.java) |
| `model.SendRegisterVerificationCodeRequest` | [ModelSendRegisterVerificationCodeRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSendRegisterVerificationCodeRequest.java) |
| `model.SendVerificationCodeRequest` | [ModelSendVerificationCodeRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSendVerificationCodeRequest.java) |
| `model.SendVerificationCodeRequestV3` | [ModelSendVerificationCodeRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelSendVerificationCodeRequestV3.java) |
| `model.ThirdPartyLoginPlatformCredentialRequest` | [ModelThirdPartyLoginPlatformCredentialRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelThirdPartyLoginPlatformCredentialRequest.java) |
| `model.ThirdPartyLoginPlatformCredentialResponse` | [ModelThirdPartyLoginPlatformCredentialResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelThirdPartyLoginPlatformCredentialResponse.java) |
| `model.UnlinkUserPlatformRequest` | [ModelUnlinkUserPlatformRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUnlinkUserPlatformRequest.java) |
| `model.UpdatePermissionScheduleRequest` | [ModelUpdatePermissionScheduleRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUpdatePermissionScheduleRequest.java) |
| `model.UpdateUserDeletionStatusRequest` | [ModelUpdateUserDeletionStatusRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUpdateUserDeletionStatusRequest.java) |
| `model.UpdateUserStatusRequest` | [ModelUpdateUserStatusRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUpdateUserStatusRequest.java) |
| `model.UpgradeHeadlessAccountRequest` | [ModelUpgradeHeadlessAccountRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUpgradeHeadlessAccountRequest.java) |
| `model.UpgradeHeadlessAccountV3Request` | [ModelUpgradeHeadlessAccountV3Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUpgradeHeadlessAccountV3Request.java) |
| `model.UpgradeHeadlessAccountWithVerificationCodeRequest` | [ModelUpgradeHeadlessAccountWithVerificationCodeRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUpgradeHeadlessAccountWithVerificationCodeRequest.java) |
| `model.UpgradeHeadlessAccountWithVerificationCodeRequestV3` | [ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUpgradeHeadlessAccountWithVerificationCodeRequestV3.java) |
| `model.UserActiveBanResponse` | [ModelUserActiveBanResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserActiveBanResponse.java) |
| `model.UserActiveBanResponseV3` | [ModelUserActiveBanResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserActiveBanResponseV3.java) |
| `model.UserBanResponse` | [ModelUserBanResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserBanResponse.java) |
| `model.UserBanResponseV3` | [ModelUserBanResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserBanResponseV3.java) |
| `model.UserBaseInfo` | [ModelUserBaseInfo](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserBaseInfo.java) |
| `model.UserCreateFromInvitationRequestV3` | [ModelUserCreateFromInvitationRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserCreateFromInvitationRequestV3.java) |
| `model.UserCreateFromInvitationRequestV4` | [ModelUserCreateFromInvitationRequestV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserCreateFromInvitationRequestV4.java) |
| `model.UserCreateRequest` | [ModelUserCreateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserCreateRequest.java) |
| `model.UserCreateRequestV3` | [ModelUserCreateRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserCreateRequestV3.java) |
| `model.UserCreateResponse` | [ModelUserCreateResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserCreateResponse.java) |
| `model.UserCreateResponseV3` | [ModelUserCreateResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserCreateResponseV3.java) |
| `model.UserDeletionStatusResponse` | [ModelUserDeletionStatusResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserDeletionStatusResponse.java) |
| `model.UserIDsRequest` | [ModelUserIDsRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserIDsRequest.java) |
| `model.UserInfoResponse` | [ModelUserInfoResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserInfoResponse.java) |
| `model.UserInformation` | [ModelUserInformation](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserInformation.java) |
| `model.UserInvitationV3` | [ModelUserInvitationV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserInvitationV3.java) |
| `model.UserLoginHistoryResponse` | [ModelUserLoginHistoryResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserLoginHistoryResponse.java) |
| `model.UserPasswordUpdateRequest` | [ModelUserPasswordUpdateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserPasswordUpdateRequest.java) |
| `model.UserPasswordUpdateV3Request` | [ModelUserPasswordUpdateV3Request](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserPasswordUpdateV3Request.java) |
| `model.UserPermissionsResponseV3` | [ModelUserPermissionsResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserPermissionsResponseV3.java) |
| `model.UserResponse` | [ModelUserResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserResponse.java) |
| `model.UserResponseV3` | [ModelUserResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserResponseV3.java) |
| `model.UserRolesV4Response` | [ModelUserRolesV4Response](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserRolesV4Response.java) |
| `model.UserUpdateRequest` | [ModelUserUpdateRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserUpdateRequest.java) |
| `model.UserUpdateRequestV3` | [ModelUserUpdateRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserUpdateRequestV3.java) |
| `model.UserVerificationRequest` | [ModelUserVerificationRequest](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserVerificationRequest.java) |
| `model.UserVerificationRequestV3` | [ModelUserVerificationRequestV3](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelUserVerificationRequestV3.java) |
| `model.ValidUserIDResponseV4` | [ModelValidUserIDResponseV4](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelValidUserIDResponseV4.java) |
| `model.ValidationDetail` | [ModelValidationDetail](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelValidationDetail.java) |
| `model.ValidationDetailPublic` | [ModelValidationDetailPublic](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelValidationDetailPublic.java) |
| `model.VerificationCodeResponse` | [ModelVerificationCodeResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelVerificationCodeResponse.java) |
| `model.VerifyRegistrationCode` | [ModelVerifyRegistrationCode](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelVerifyRegistrationCode.java) |
| `model.WebLinkingResponse` | [ModelWebLinkingResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/ModelWebLinkingResponse.java) |
| `oauthapi.RevocationList` | [OauthapiRevocationList](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthapiRevocationList.java) |
| `oauthcommon.JWKKey` | [OauthcommonJWKKey](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthcommonJWKKey.java) |
| `oauthcommon.JWKSet` | [OauthcommonJWKSet](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthcommonJWKSet.java) |
| `oauthcommon.UserRevocationListRecord` | [OauthcommonUserRevocationListRecord](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthcommonUserRevocationListRecord.java) |
| `oauthmodel.CountryLocationResponse` | [OauthmodelCountryLocationResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthmodelCountryLocationResponse.java) |
| `oauthmodel.ErrorResponse` | [OauthmodelErrorResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthmodelErrorResponse.java) |
| `oauthmodel.TokenIntrospectResponse` | [OauthmodelTokenIntrospectResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthmodelTokenIntrospectResponse.java) |
| `oauthmodel.TokenResponse` | [OauthmodelTokenResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthmodelTokenResponse.java) |
| `oauthmodel.TokenResponseV3` | [OauthmodelTokenResponseV3](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthmodelTokenResponseV3.java) |
| `oauthmodel.TokenThirdPartyResponse` | [OauthmodelTokenThirdPartyResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/OauthmodelTokenThirdPartyResponse.java) |
| `rest.ErrorResponse` | [RestErrorResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/RestErrorResponse.java) |
| `restapi.ErrorResponse` | [RestapiErrorResponse](../src/main/java/net/accelbyte/sdk/api/iam/models/RestapiErrorResponse.java) |