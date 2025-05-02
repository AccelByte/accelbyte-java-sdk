## Java Extend SDK CLI Sample App Operation Index for Iam service

### Operation AdminGetBansTypeV3

```sh
$ build/install/cli/bin/cli iam adminGetBansTypeV3
```

### Operation AdminGetListBanReasonV3

```sh
$ build/install/cli/bin/cli iam adminGetListBanReasonV3
```

### Operation AdminListClientAvailablePermissions

```sh
$ build/install/cli/bin/cli iam adminListClientAvailablePermissions \
    --excludePermissions <excludePermissions value - optional>
```

### Operation AdminUpdateAvailablePermissionsByModule

```sh
$ build/install/cli/bin/cli iam adminUpdateAvailablePermissionsByModule \
    --forceDelete <forceDelete value - optional> \
    --body <json string for request body>
```

### Operation AdminDeleteConfigPermissionsByGroup

```sh
$ build/install/cli/bin/cli iam adminDeleteConfigPermissionsByGroup \
    --forceDelete <forceDelete value - optional> \
    --body <json string for request body>
```

### Operation AdminListClientTemplates

```sh
$ build/install/cli/bin/cli iam adminListClientTemplates
```

### Operation AdminGetInputValidations

```sh
$ build/install/cli/bin/cli iam adminGetInputValidations
```

### Operation AdminUpdateInputValidations

```sh
$ build/install/cli/bin/cli iam adminUpdateInputValidations \
    --body <json string for request body>
```

### Operation AdminResetInputValidations

```sh
$ build/install/cli/bin/cli iam adminResetInputValidations \
    --field <field value>
```

### Operation ListAdminsV3

```sh
$ build/install/cli/bin/cli iam listAdminsV3 \
    --namespace <namespace value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --endDate <endDate value - optional> \
    --limit <limit value - optional> \
    --query <query value - optional> \
    --roleId <roleId value - optional> \
    --startDate <startDate value - optional>
```

### Operation AdminGetAgeRestrictionStatusV3

```sh
$ build/install/cli/bin/cli iam adminGetAgeRestrictionStatusV3 \
    --namespace <namespace value>
```

### Operation AdminUpdateAgeRestrictionConfigV3

```sh
$ build/install/cli/bin/cli iam adminUpdateAgeRestrictionConfigV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetListCountryAgeRestrictionV3

```sh
$ build/install/cli/bin/cli iam adminGetListCountryAgeRestrictionV3 \
    --namespace <namespace value>
```

### Operation AdminUpdateCountryAgeRestrictionV3

```sh
$ build/install/cli/bin/cli iam adminUpdateCountryAgeRestrictionV3 \
    --countryCode <countryCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetBannedUsersV3

```sh
$ build/install/cli/bin/cli iam adminGetBannedUsersV3 \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --banType <banType value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminBanUserBulkV3

```sh
$ build/install/cli/bin/cli iam adminBanUserBulkV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUnbanUserBulkV3

```sh
$ build/install/cli/bin/cli iam adminUnbanUserBulkV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetBansTypeWithNamespaceV3

```sh
$ build/install/cli/bin/cli iam adminGetBansTypeWithNamespaceV3 \
    --namespace <namespace value>
```

### Operation AdminGetClientsByNamespaceV3

```sh
$ build/install/cli/bin/cli iam adminGetClientsByNamespaceV3 \
    --namespace <namespace value> \
    --clientId <clientId value - optional> \
    --clientName <clientName value - optional> \
    --clientType <clientType value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --skipLoginQueue <skipLoginQueue value - optional>
```

### Operation AdminBulkUpdateClientsV3

```sh
$ build/install/cli/bin/cli iam adminBulkUpdateClientsV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminCreateClientV3

```sh
$ build/install/cli/bin/cli iam adminCreateClientV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetClientsbyNamespacebyIDV3

```sh
$ build/install/cli/bin/cli iam adminGetClientsbyNamespacebyIDV3 \
    --clientId <clientId value> \
    --namespace <namespace value>
```

### Operation AdminDeleteClientV3

```sh
$ build/install/cli/bin/cli iam adminDeleteClientV3 \
    --clientId <clientId value> \
    --namespace <namespace value>
```

### Operation AdminUpdateClientV3

```sh
$ build/install/cli/bin/cli iam adminUpdateClientV3 \
    --clientId <clientId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateClientPermissionV3

```sh
$ build/install/cli/bin/cli iam adminUpdateClientPermissionV3 \
    --clientId <clientId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminAddClientPermissionsV3

```sh
$ build/install/cli/bin/cli iam adminAddClientPermissionsV3 \
    --clientId <clientId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminDeleteClientPermissionV3

```sh
$ build/install/cli/bin/cli iam adminDeleteClientPermissionV3 \
    --action <action value> \
    --clientId <clientId value> \
    --namespace <namespace value> \
    --resource <resource value>
```

### Operation AdminGetConfigValueV3

```sh
$ build/install/cli/bin/cli iam adminGetConfigValueV3 \
    --configKey <configKey value> \
    --namespace <namespace value>
```

### Operation AdminGetCountryListV3

```sh
$ build/install/cli/bin/cli iam adminGetCountryListV3 \
    --namespace <namespace value> \
    --filterBlacklist <filterBlacklist value - optional>
```

### Operation AdminGetCountryBlacklistV3

```sh
$ build/install/cli/bin/cli iam adminGetCountryBlacklistV3 \
    --namespace <namespace value>
```

### Operation AdminAddCountryBlacklistV3

```sh
$ build/install/cli/bin/cli iam adminAddCountryBlacklistV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetLoginAllowlistV3

```sh
$ build/install/cli/bin/cli iam adminGetLoginAllowlistV3 \
    --namespace <namespace value>
```

### Operation AdminUpdateLoginAllowlistV3

```sh
$ build/install/cli/bin/cli iam adminUpdateLoginAllowlistV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RetrieveAllThirdPartyLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam retrieveAllThirdPartyLoginPlatformCredentialV3 \
    --namespace <namespace value>
```

### Operation RetrieveAllActiveThirdPartyLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam retrieveAllActiveThirdPartyLoginPlatformCredentialV3 \
    --namespace <namespace value>
```

### Operation RetrieveAllSSOLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam retrieveAllSSOLoginPlatformCredentialV3 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation RetrieveThirdPartyLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam retrieveThirdPartyLoginPlatformCredentialV3 \
    --namespace <namespace value> \
    --platformId <platformId value>
```

### Operation AddThirdPartyLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam addThirdPartyLoginPlatformCredentialV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --body <json string for request body>
```

### Operation DeleteThirdPartyLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam deleteThirdPartyLoginPlatformCredentialV3 \
    --namespace <namespace value> \
    --platformId <platformId value>
```

### Operation UpdateThirdPartyLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam updateThirdPartyLoginPlatformCredentialV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --body <json string for request body>
```

### Operation UpdateThirdPartyLoginPlatformDomainV3

```sh
$ build/install/cli/bin/cli iam updateThirdPartyLoginPlatformDomainV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --body <json string for request body>
```

### Operation DeleteThirdPartyLoginPlatformDomainV3

```sh
$ build/install/cli/bin/cli iam deleteThirdPartyLoginPlatformDomainV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --body <json string for request body>
```

### Operation PartialUpdateThirdPartyLoginPlatformDomainV3

```sh
$ build/install/cli/bin/cli iam partialUpdateThirdPartyLoginPlatformDomainV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --body <json string for request body>
```

### Operation RetrieveSSOLoginPlatformCredential

```sh
$ build/install/cli/bin/cli iam retrieveSSOLoginPlatformCredential \
    --namespace <namespace value> \
    --platformId <platformId value>
```

### Operation AddSSOLoginPlatformCredential

```sh
$ build/install/cli/bin/cli iam addSSOLoginPlatformCredential \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --body <json string for request body>
```

### Operation DeleteSSOLoginPlatformCredentialV3

```sh
$ build/install/cli/bin/cli iam deleteSSOLoginPlatformCredentialV3 \
    --namespace <namespace value> \
    --platformId <platformId value>
```

### Operation UpdateSSOPlatformCredential

```sh
$ build/install/cli/bin/cli iam updateSSOPlatformCredential \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --body <json string for request body>
```

### Operation AdminListUserIDByPlatformUserIDsV3

```sh
$ build/install/cli/bin/cli iam adminListUserIDByPlatformUserIDsV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --rawPID <rawPID value - optional> \
    --rawPUID <rawPUID value - optional> \
    --body <json string for request body>
```

### Operation AdminGetUserByPlatformUserIDV3

```sh
$ build/install/cli/bin/cli iam adminGetUserByPlatformUserIDV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --platformUserId <platformUserId value> \
    --pidType <pidType value - optional>
```

### Operation AdminGetProfileUpdateStrategyV3

```sh
$ build/install/cli/bin/cli iam adminGetProfileUpdateStrategyV3 \
    --namespace <namespace value> \
    --field <field value - optional>
```

### Operation AdminUpdateProfileUpdateStrategyV3

```sh
$ build/install/cli/bin/cli iam adminUpdateProfileUpdateStrategyV3 \
    --namespace <namespace value> \
    --field <field value> \
    --body <json string for request body>
```

### Operation AdminGetRoleOverrideConfigV3

```sh
$ build/install/cli/bin/cli iam adminGetRoleOverrideConfigV3 \
    --namespace <namespace value> \
    --identity <identity value>
```

### Operation AdminUpdateRoleOverrideConfigV3

```sh
$ build/install/cli/bin/cli iam adminUpdateRoleOverrideConfigV3 \
    --namespace <namespace value> \
    --identity <identity value> \
    --body <json string for request body>
```

### Operation AdminGetRoleSourceV3

```sh
$ build/install/cli/bin/cli iam adminGetRoleSourceV3 \
    --namespace <namespace value> \
    --identity <identity value>
```

### Operation AdminChangeRoleOverrideConfigStatusV3

```sh
$ build/install/cli/bin/cli iam adminChangeRoleOverrideConfigStatusV3 \
    --namespace <namespace value> \
    --identity <identity value> \
    --body <json string for request body>
```

### Operation AdminGetRoleNamespacePermissionV3

```sh
$ build/install/cli/bin/cli iam adminGetRoleNamespacePermissionV3 \
    --namespace <namespace value> \
    --roleId <roleId value>
```

### Operation GetAdminUsersByRoleIdV3

```sh
$ build/install/cli/bin/cli iam getAdminUsersByRoleIdV3 \
    --namespace <namespace value> \
    --roleId <roleId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation AdminQueryTagV3

```sh
$ build/install/cli/bin/cli iam adminQueryTagV3 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --tagName <tagName value - optional>
```

### Operation AdminCreateTagV3

```sh
$ build/install/cli/bin/cli iam adminCreateTagV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateTagV3

```sh
$ build/install/cli/bin/cli iam adminUpdateTagV3 \
    --namespace <namespace value> \
    --tagId <tagId value> \
    --body <json string for request body>
```

### Operation AdminDeleteTagV3

```sh
$ build/install/cli/bin/cli iam adminDeleteTagV3 \
    --namespace <namespace value> \
    --tagId <tagId value>
```

### Operation AdminGetUserByEmailAddressV3

```sh
$ build/install/cli/bin/cli iam adminGetUserByEmailAddressV3 \
    --namespace <namespace value> \
    --emailAddress <emailAddress value - optional>
```

### Operation AdminBulkUpdateUsersV3

```sh
$ build/install/cli/bin/cli iam adminBulkUpdateUsersV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetBulkUserBanV3

```sh
$ build/install/cli/bin/cli iam adminGetBulkUserBanV3 \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional> \
    --banType <banType value - optional> \
    --body <json string for request body>
```

### Operation AdminListUserIDByUserIDsV3

```sh
$ build/install/cli/bin/cli iam adminListUserIDByUserIDsV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminBulkGetUsersPlatform

```sh
$ build/install/cli/bin/cli iam adminBulkGetUsersPlatform \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminCursorGetUserV3

```sh
$ build/install/cli/bin/cli iam adminCursorGetUserV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminInviteUserV3

```sh
$ build/install/cli/bin/cli iam adminInviteUserV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminQueryThirdPlatformLinkHistoryV3

```sh
$ build/install/cli/bin/cli iam adminQueryThirdPlatformLinkHistoryV3 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --platformUserId <platformUserId value - optional> \
    --platformId <platformId value>
```

### Operation AdminListUsersV3

```sh
$ build/install/cli/bin/cli iam adminListUsersV3 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminSearchUserV3

```sh
$ build/install/cli/bin/cli iam adminSearchUserV3 \
    --namespace <namespace value> \
    --by <by value - optional> \
    --endDate <endDate value - optional> \
    --includeTotal <includeTotal value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --platformBy <platformBy value - optional> \
    --platformId <platformId value - optional> \
    --query <query value - optional> \
    --roleIds <roleIds value - optional> \
    --skipLoginQueue <skipLoginQueue value - optional> \
    --startDate <startDate value - optional> \
    --tagIds <tagIds value - optional> \
    --testAccount <testAccount value - optional>
```

### Operation AdminGetBulkUserByEmailAddressV3

```sh
$ build/install/cli/bin/cli iam adminGetBulkUserByEmailAddressV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetUserByUserIdV3

```sh
$ build/install/cli/bin/cli iam adminGetUserByUserIdV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateUserV3

```sh
$ build/install/cli/bin/cli iam adminUpdateUserV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetUserBanV3

```sh
$ build/install/cli/bin/cli iam adminGetUserBanV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation AdminBanUserV3

```sh
$ build/install/cli/bin/cli iam adminBanUserV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetUserBanSummaryV3

```sh
$ build/install/cli/bin/cli iam adminGetUserBanSummaryV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateUserBanV3

```sh
$ build/install/cli/bin/cli iam adminUpdateUserBanV3 \
    --banId <banId value> \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminSendVerificationCodeV3

```sh
$ build/install/cli/bin/cli iam adminSendVerificationCodeV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminVerifyAccountV3

```sh
$ build/install/cli/bin/cli iam adminVerifyAccountV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetUserVerificationCode

```sh
$ build/install/cli/bin/cli iam getUserVerificationCode \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetUserDeletionStatusV3

```sh
$ build/install/cli/bin/cli iam adminGetUserDeletionStatusV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateUserDeletionStatusV3

```sh
$ build/install/cli/bin/cli iam adminUpdateUserDeletionStatusV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminListUserAllPlatformAccountsDistinctV3

```sh
$ build/install/cli/bin/cli iam adminListUserAllPlatformAccountsDistinctV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpgradeHeadlessAccountV3

```sh
$ build/install/cli/bin/cli iam adminUpgradeHeadlessAccountV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminDeleteUserInformationV3

```sh
$ build/install/cli/bin/cli iam adminDeleteUserInformationV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetUserLoginHistoriesV3

```sh
$ build/install/cli/bin/cli iam adminGetUserLoginHistoriesV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation AdminResetPasswordV3

```sh
$ build/install/cli/bin/cli iam adminResetPasswordV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminUpdateUserPermissionV3

```sh
$ build/install/cli/bin/cli iam adminUpdateUserPermissionV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminAddUserPermissionsV3

```sh
$ build/install/cli/bin/cli iam adminAddUserPermissionsV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminDeleteUserPermissionBulkV3

```sh
$ build/install/cli/bin/cli iam adminDeleteUserPermissionBulkV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminDeleteUserPermissionV3

```sh
$ build/install/cli/bin/cli iam adminDeleteUserPermissionV3 \
    --action <action value> \
    --namespace <namespace value> \
    --resource <resource value> \
    --userId <userId value>
```

### Operation AdminGetUserPlatformAccountsV3

```sh
$ build/install/cli/bin/cli iam adminGetUserPlatformAccountsV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional> \
    --platformId <platformId value - optional> \
    --targetNamespace <targetNamespace value - optional>
```

### Operation AdminListAllDistinctPlatformAccountsV3

```sh
$ build/install/cli/bin/cli iam adminListAllDistinctPlatformAccountsV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --status <status value - optional>
```

### Operation AdminGetListJusticePlatformAccounts

```sh
$ build/install/cli/bin/cli iam adminGetListJusticePlatformAccounts \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetUserMapping

```sh
$ build/install/cli/bin/cli iam adminGetUserMapping \
    --namespace <namespace value> \
    --targetNamespace <targetNamespace value> \
    --userId <userId value>
```

### Operation AdminCreateJusticeUser

```sh
$ build/install/cli/bin/cli iam adminCreateJusticeUser \
    --namespace <namespace value> \
    --targetNamespace <targetNamespace value> \
    --userId <userId value>
```

### Operation AdminLinkPlatformAccount

```sh
$ build/install/cli/bin/cli iam adminLinkPlatformAccount \
    --namespace <namespace value> \
    --userId <userId value> \
    --skipConflict <skipConflict value - optional> \
    --body <json string for request body>
```

### Operation AdminGetUserLinkHistoriesV3

```sh
$ build/install/cli/bin/cli iam adminGetUserLinkHistoriesV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --platformId <platformId value>
```

### Operation AdminPlatformUnlinkAllV3

```sh
$ build/install/cli/bin/cli iam adminPlatformUnlinkAllV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --userId <userId value>
```

### Operation AdminPlatformLinkV3

```sh
$ build/install/cli/bin/cli iam adminPlatformLinkV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --userId <userId value> \
    --ticket <ticket value>
```

### Operation AdminDeleteUserLinkingRestrictionByPlatformIDV3

```sh
$ build/install/cli/bin/cli iam adminDeleteUserLinkingRestrictionByPlatformIDV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --userId <userId value>
```

### Operation AdminGetThirdPartyPlatformTokenLinkStatusV3

```sh
$ build/install/cli/bin/cli iam adminGetThirdPartyPlatformTokenLinkStatusV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --userId <userId value> \
    --platformToken <platformToken value>
```

### Operation AdminGetUserSinglePlatformAccount

```sh
$ build/install/cli/bin/cli iam adminGetUserSinglePlatformAccount \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --userId <userId value> \
    --crossNamespace <crossNamespace value - optional>
```

### Operation AdminDeleteUserRolesV3

```sh
$ build/install/cli/bin/cli iam adminDeleteUserRolesV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminSaveUserRoleV3

```sh
$ build/install/cli/bin/cli iam adminSaveUserRoleV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminAddUserRoleV3

```sh
$ build/install/cli/bin/cli iam adminAddUserRoleV3 \
    --namespace <namespace value> \
    --roleId <roleId value> \
    --userId <userId value>
```

### Operation AdminDeleteUserRoleV3

```sh
$ build/install/cli/bin/cli iam adminDeleteUserRoleV3 \
    --namespace <namespace value> \
    --roleId <roleId value> \
    --userId <userId value>
```

### Operation AdminGetUserStateByUserIdV3

```sh
$ build/install/cli/bin/cli iam adminGetUserStateByUserIdV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateUserStatusV3

```sh
$ build/install/cli/bin/cli iam adminUpdateUserStatusV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminTrustlyUpdateUserIdentity

```sh
$ build/install/cli/bin/cli iam adminTrustlyUpdateUserIdentity \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminVerifyUserWithoutVerificationCodeV3

```sh
$ build/install/cli/bin/cli iam adminVerifyUserWithoutVerificationCodeV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateClientSecretV3

```sh
$ build/install/cli/bin/cli iam adminUpdateClientSecretV3 \
    --clientId <clientId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminCheckThirdPartyLoginPlatformAvailabilityV3

```sh
$ build/install/cli/bin/cli iam adminCheckThirdPartyLoginPlatformAvailabilityV3 \
    --platformId <platformId value>
```

### Operation AdminGetRolesV3

```sh
$ build/install/cli/bin/cli iam adminGetRolesV3 \
    --after <after value - optional> \
    --before <before value - optional> \
    --isWildcard <isWildcard value - optional> \
    --limit <limit value - optional>
```

### Operation AdminCreateRoleV3

```sh
$ build/install/cli/bin/cli iam adminCreateRoleV3 \
    --body <json string for request body>
```

### Operation AdminGetRoleV3

```sh
$ build/install/cli/bin/cli iam adminGetRoleV3 \
    --roleId <roleId value>
```

### Operation AdminDeleteRoleV3

```sh
$ build/install/cli/bin/cli iam adminDeleteRoleV3 \
    --roleId <roleId value>
```

### Operation AdminUpdateRoleV3

```sh
$ build/install/cli/bin/cli iam adminUpdateRoleV3 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminGetRoleAdminStatusV3

```sh
$ build/install/cli/bin/cli iam adminGetRoleAdminStatusV3 \
    --roleId <roleId value>
```

### Operation AdminUpdateAdminRoleStatusV3

```sh
$ build/install/cli/bin/cli iam adminUpdateAdminRoleStatusV3 \
    --roleId <roleId value>
```

### Operation AdminRemoveRoleAdminV3

```sh
$ build/install/cli/bin/cli iam adminRemoveRoleAdminV3 \
    --roleId <roleId value>
```

### Operation AdminGetRoleManagersV3

```sh
$ build/install/cli/bin/cli iam adminGetRoleManagersV3 \
    --roleId <roleId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation AdminAddRoleManagersV3

```sh
$ build/install/cli/bin/cli iam adminAddRoleManagersV3 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminRemoveRoleManagersV3

```sh
$ build/install/cli/bin/cli iam adminRemoveRoleManagersV3 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminGetRoleMembersV3

```sh
$ build/install/cli/bin/cli iam adminGetRoleMembersV3 \
    --roleId <roleId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation AdminAddRoleMembersV3

```sh
$ build/install/cli/bin/cli iam adminAddRoleMembersV3 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminUpdateRolePermissionsV3

```sh
$ build/install/cli/bin/cli iam adminUpdateRolePermissionsV3 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminAddRolePermissionsV3

```sh
$ build/install/cli/bin/cli iam adminAddRolePermissionsV3 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminDeleteRolePermissionsV3

```sh
$ build/install/cli/bin/cli iam adminDeleteRolePermissionsV3 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminDeleteRolePermissionV3

```sh
$ build/install/cli/bin/cli iam adminDeleteRolePermissionV3 \
    --action <action value> \
    --resource <resource value> \
    --roleId <roleId value>
```

### Operation AdminGetMyUserV3

```sh
$ build/install/cli/bin/cli iam adminGetMyUserV3
```

### Operation UserAuthenticationV3

```sh
$ build/install/cli/bin/cli iam userAuthenticationV3 \
    --clientId <client_id value - optional> \
    --extendExp <extend_exp value - optional> \
    --redirectUri <redirect_uri value - optional> \
    --password <password value> \
    --requestId <request_id value> \
    --userName <user_name value>
```

### Operation AuthenticationWithPlatformLinkV3

```sh
$ build/install/cli/bin/cli iam authenticationWithPlatformLinkV3 \
    --extendExp <extend_exp value - optional> \
    --clientId <client_id value> \
    --linkingToken <linkingToken value> \
    --password <password value> \
    --username <username value>
```

### Operation AuthenticateAndLinkForwardV3

```sh
$ build/install/cli/bin/cli iam authenticateAndLinkForwardV3 \
    --extendExp <extend_exp value - optional> \
    --clientId <client_id value> \
    --linkingToken <linkingToken value> \
    --password <password value> \
    --username <username value>
```

### Operation PublicGetSystemConfigV3

```sh
$ build/install/cli/bin/cli iam publicGetSystemConfigV3
```

### Operation GenerateTokenByNewHeadlessAccountV3

```sh
$ build/install/cli/bin/cli iam generateTokenByNewHeadlessAccountV3 \
    --additionalData <additionalData value - optional> \
    --extendExp <extend_exp value - optional> \
    --linkingToken <linkingToken value>
```

### Operation RequestOneTimeLinkingCodeV3

```sh
$ build/install/cli/bin/cli iam requestOneTimeLinkingCodeV3 \
    --redirectUri <redirectUri value - optional> \
    --state <state value - optional> \
    --platformId <platformId value>
```

### Operation ValidateOneTimeLinkingCodeV3

```sh
$ build/install/cli/bin/cli iam validateOneTimeLinkingCodeV3 \
    --oneTimeLinkCode <oneTimeLinkCode value>
```

### Operation RequestTokenByOneTimeLinkCodeResponseV3

```sh
$ build/install/cli/bin/cli iam requestTokenByOneTimeLinkCodeResponseV3 \
    --additionalData <additionalData value - optional> \
    --isTransient <isTransient value - optional> \
    --clientId <client_id value> \
    --oneTimeLinkCode <oneTimeLinkCode value>
```

### Operation GetCountryLocationV3

```sh
$ build/install/cli/bin/cli iam getCountryLocationV3
```

### Operation Logout

```sh
$ build/install/cli/bin/cli iam logout
```

### Operation RequestTokenExchangeCodeV3

```sh
$ build/install/cli/bin/cli iam requestTokenExchangeCodeV3 \
    --namespace <namespace value> \
    --codeChallenge <code_challenge value - optional> \
    --codeChallengeMethod <code_challenge_method value - optional> \
    --clientId <client_id value>
```

### Operation AdminRetrieveUserThirdPartyPlatformTokenV3

```sh
$ build/install/cli/bin/cli iam adminRetrieveUserThirdPartyPlatformTokenV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --userId <userId value> \
    --platformUserId <platformUserId value - optional>
```

### Operation RevokeUserV3

```sh
$ build/install/cli/bin/cli iam revokeUserV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --includeGameNamespace <includeGameNamespace value - optional>
```

### Operation AuthorizeV3

```sh
$ build/install/cli/bin/cli iam authorizeV3 \
    --blockedPlatformId <blockedPlatformId value - optional> \
    --codeChallenge <code_challenge value - optional> \
    --codeChallengeMethod <code_challenge_method value - optional> \
    --createHeadless <createHeadless value - optional> \
    --loginWebBased <loginWebBased value - optional> \
    --nonce <nonce value - optional> \
    --oneTimeLinkCode <oneTimeLinkCode value - optional> \
    --redirectUri <redirect_uri value - optional> \
    --scope <scope value - optional> \
    --state <state value - optional> \
    --targetAuthPage <target_auth_page value - optional> \
    --useRedirectUriAsLoginUrlWhenLocked <useRedirectUriAsLoginUrlWhenLocked value - optional> \
    --clientId <client_id value> \
    --responseType <response_type value>
```

### Operation TokenIntrospectionV3

```sh
$ build/install/cli/bin/cli iam tokenIntrospectionV3 \
    --token <token value>
```

### Operation GetJWKSV3

```sh
$ build/install/cli/bin/cli iam getJWKSV3
```

### Operation SendMFAAuthenticationCode

```sh
$ build/install/cli/bin/cli iam sendMFAAuthenticationCode \
    --clientId <clientId value> \
    --factor <factor value> \
    --mfaToken <mfaToken value>
```

### Operation Change2faMethod

```sh
$ build/install/cli/bin/cli iam change2faMethod \
    --factor <factor value> \
    --mfaToken <mfaToken value>
```

### Operation Verify2faCode

```sh
$ build/install/cli/bin/cli iam verify2faCode \
    --code <code value> \
    --factor <factor value> \
    --mfaToken <mfaToken value> \
    --rememberDevice <rememberDevice value>
```

### Operation Verify2faCodeForward

```sh
$ build/install/cli/bin/cli iam verify2faCodeForward \
    --defaultFactor <defaultFactor value - optional> \
    --factors <factors value - optional> \
    --rememberDevice <rememberDevice value - optional> \
    --clientId <clientId value> \
    --code <code value> \
    --factor <factor value> \
    --mfaToken <mfaToken value>
```

### Operation RetrieveUserThirdPartyPlatformTokenV3

```sh
$ build/install/cli/bin/cli iam retrieveUserThirdPartyPlatformTokenV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --userId <userId value>
```

### Operation AuthCodeRequestV3

```sh
$ build/install/cli/bin/cli iam authCodeRequestV3 \
    --platformId <platformId value> \
    --clientId <client_id value - optional> \
    --redirectUri <redirect_uri value - optional> \
    --requestId <request_id value>
```

### Operation PlatformTokenGrantV3

```sh
$ build/install/cli/bin/cli iam platformTokenGrantV3 \
    --platformId <platformId value> \
    --additionalData <additionalData value - optional> \
    --clientId <client_id value - optional> \
    --createHeadless <createHeadless value - optional> \
    --deviceId <device_id value - optional> \
    --macAddress <macAddress value - optional> \
    --platformToken <platform_token value - optional> \
    --serviceLabel <serviceLabel value - optional> \
    --skipSetCookie <skipSetCookie value - optional>
```

### Operation GetRevocationListV3

```sh
$ build/install/cli/bin/cli iam getRevocationListV3
```

### Operation TokenRevocationV3

```sh
$ build/install/cli/bin/cli iam tokenRevocationV3 \
    --token <token value>
```

### Operation SimultaneousLoginV3

```sh
$ build/install/cli/bin/cli iam simultaneousLoginV3 \
    --simultaneousPlatform <simultaneousPlatform value - optional> \
    --simultaneousTicket <simultaneousTicket value - optional> \
    --nativePlatform <nativePlatform value> \
    --nativePlatformTicket <nativePlatformTicket value>
```

### Operation TokenGrantV3

```sh
$ build/install/cli/bin/cli iam tokenGrantV3 \
    --additionalData <additionalData value - optional> \
    --clientId <client_id value - optional> \
    --clientSecret <client_secret value - optional> \
    --code <code value - optional> \
    --codeVerifier <code_verifier value - optional> \
    --extendNamespace <extendNamespace value - optional> \
    --extendExp <extend_exp value - optional> \
    --password <password value - optional> \
    --redirectUri <redirect_uri value - optional> \
    --refreshToken <refresh_token value - optional> \
    --scope <scope value - optional> \
    --username <username value - optional> \
    --grantType <grant_type value>
```

### Operation VerifyTokenV3

```sh
$ build/install/cli/bin/cli iam verifyTokenV3 \
    --token <token value>
```

### Operation PlatformAuthenticationV3

```sh
$ build/install/cli/bin/cli iam platformAuthenticationV3 \
    --platformId <platformId value> \
    --code <code value - optional> \
    --error <error value - optional> \
    --openidAssocHandle <openid.assoc_handle value - optional> \
    --openidClaimedId <openid.claimed_id value - optional> \
    --openidIdentity <openid.identity value - optional> \
    --openidMode <openid.mode value - optional> \
    --openidNs <openid.ns value - optional> \
    --openidOpEndpoint <openid.op_endpoint value - optional> \
    --openidResponseNonce <openid.response_nonce value - optional> \
    --openidReturnTo <openid.return_to value - optional> \
    --openidSig <openid.sig value - optional> \
    --openidSigned <openid.signed value - optional> \
    --state <state value>
```

### Operation PlatformTokenRefreshV3

```sh
$ build/install/cli/bin/cli iam platformTokenRefreshV3 \
    --platformId <platformId value> \
    --platformToken <platform_token value>
```

### Operation PublicGetInputValidations

```sh
$ build/install/cli/bin/cli iam publicGetInputValidations \
    --defaultOnEmpty <defaultOnEmpty value - optional> \
    --languageCode <languageCode value - optional>
```

### Operation PublicGetInputValidationByField

```sh
$ build/install/cli/bin/cli iam publicGetInputValidationByField \
    --field <field value>
```

### Operation PublicGetCountryAgeRestrictionV3

```sh
$ build/install/cli/bin/cli iam publicGetCountryAgeRestrictionV3 \
    --countryCode <countryCode value> \
    --namespace <namespace value>
```

### Operation PublicGetConfigValueV3

```sh
$ build/install/cli/bin/cli iam publicGetConfigValueV3 \
    --configKey <configKey value> \
    --namespace <namespace value>
```

### Operation PublicGetCountryListV3

```sh
$ build/install/cli/bin/cli iam publicGetCountryListV3 \
    --namespace <namespace value>
```

### Operation RetrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3

```sh
$ build/install/cli/bin/cli iam retrieveAllActiveThirdPartyLoginPlatformCredentialPublicV3 \
    --namespace <namespace value>
```

### Operation RetrieveActiveOIDCClientsPublicV3

```sh
$ build/install/cli/bin/cli iam retrieveActiveOIDCClientsPublicV3 \
    --namespace <namespace value> \
    --clientId <clientId value>
```

### Operation PublicGetProfileUpdateStrategyV3

```sh
$ build/install/cli/bin/cli iam publicGetProfileUpdateStrategyV3 \
    --namespace <namespace value> \
    --field <field value - optional>
```

### Operation PublicGetAsyncStatus

```sh
$ build/install/cli/bin/cli iam publicGetAsyncStatus \
    --namespace <namespace value> \
    --requestId <requestId value>
```

### Operation PublicSearchUserV3

```sh
$ build/install/cli/bin/cli iam publicSearchUserV3 \
    --namespace <namespace value> \
    --by <by value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --platformBy <platformBy value - optional> \
    --platformId <platformId value - optional> \
    --query <query value - optional>
```

### Operation PublicCreateUserV3

```sh
$ build/install/cli/bin/cli iam publicCreateUserV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CheckUserAvailability

```sh
$ build/install/cli/bin/cli iam checkUserAvailability \
    --namespace <namespace value> \
    --field <field value> \
    --query <query value>
```

### Operation PublicSendRegistrationCode

```sh
$ build/install/cli/bin/cli iam publicSendRegistrationCode \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicVerifyRegistrationCode

```sh
$ build/install/cli/bin/cli iam publicVerifyRegistrationCode \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicForgotPasswordV3

```sh
$ build/install/cli/bin/cli iam publicForgotPasswordV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicValidateUserInput

```sh
$ build/install/cli/bin/cli iam publicValidateUserInput \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetAdminInvitationV3

```sh
$ build/install/cli/bin/cli iam getAdminInvitationV3 \
    --invitationId <invitationId value> \
    --namespace <namespace value>
```

### Operation CreateUserFromInvitationV3

```sh
$ build/install/cli/bin/cli iam createUserFromInvitationV3 \
    --invitationId <invitationId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateUserV3

```sh
$ build/install/cli/bin/cli iam updateUserV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicPartialUpdateUserV3

```sh
$ build/install/cli/bin/cli iam publicPartialUpdateUserV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicSendVerificationCodeV3

```sh
$ build/install/cli/bin/cli iam publicSendVerificationCodeV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicUserVerificationV3

```sh
$ build/install/cli/bin/cli iam publicUserVerificationV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicUpgradeHeadlessAccountV3

```sh
$ build/install/cli/bin/cli iam publicUpgradeHeadlessAccountV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicVerifyHeadlessAccountV3

```sh
$ build/install/cli/bin/cli iam publicVerifyHeadlessAccountV3 \
    --namespace <namespace value> \
    --needVerificationCode <needVerificationCode value - optional> \
    --body <json string for request body>
```

### Operation PublicUpdatePasswordV3

```sh
$ build/install/cli/bin/cli iam publicUpdatePasswordV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicCreateJusticeUser

```sh
$ build/install/cli/bin/cli iam publicCreateJusticeUser \
    --namespace <namespace value> \
    --targetNamespace <targetNamespace value>
```

### Operation PublicPlatformLinkV3

```sh
$ build/install/cli/bin/cli iam publicPlatformLinkV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --redirectUri <redirectUri value - optional> \
    --ticket <ticket value>
```

### Operation PublicPlatformUnlinkAllV3

```sh
$ build/install/cli/bin/cli iam publicPlatformUnlinkAllV3 \
    --namespace <namespace value> \
    --platformId <platformId value>
```

### Operation PublicForcePlatformLinkV3

```sh
$ build/install/cli/bin/cli iam publicForcePlatformLinkV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --ticket <ticket value>
```

### Operation PublicWebLinkPlatform

```sh
$ build/install/cli/bin/cli iam publicWebLinkPlatform \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --clientId <clientId value - optional> \
    --redirectUri <redirectUri value - optional>
```

### Operation PublicWebLinkPlatformEstablish

```sh
$ build/install/cli/bin/cli iam publicWebLinkPlatformEstablish \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --code <code value - optional> \
    --state <state value>
```

### Operation PublicProcessWebLinkPlatformV3

```sh
$ build/install/cli/bin/cli iam publicProcessWebLinkPlatformV3 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --code <code value - optional> \
    --state <state value>
```

### Operation PublicGetUsersPlatformInfosV3

```sh
$ build/install/cli/bin/cli iam publicGetUsersPlatformInfosV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation ResetPasswordV3

```sh
$ build/install/cli/bin/cli iam resetPasswordV3 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetUserBanHistoryV3

```sh
$ build/install/cli/bin/cli iam publicGetUserBanHistoryV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --activeOnly <activeOnly value - optional> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation PublicListUserAllPlatformAccountsDistinctV3

```sh
$ build/install/cli/bin/cli iam publicListUserAllPlatformAccountsDistinctV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicGetUserInformationV3

```sh
$ build/install/cli/bin/cli iam publicGetUserInformationV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicGetUserLoginHistoriesV3

```sh
$ build/install/cli/bin/cli iam publicGetUserLoginHistoriesV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation PublicGetUserPlatformAccountsV3

```sh
$ build/install/cli/bin/cli iam publicGetUserPlatformAccountsV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional> \
    --platformId <platformId value - optional>
```

### Operation PublicListJusticePlatformAccountsV3

```sh
$ build/install/cli/bin/cli iam publicListJusticePlatformAccountsV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicLinkPlatformAccount

```sh
$ build/install/cli/bin/cli iam publicLinkPlatformAccount \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicForceLinkPlatformWithProgression

```sh
$ build/install/cli/bin/cli iam publicForceLinkPlatformWithProgression \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetPublisherUserV3

```sh
$ build/install/cli/bin/cli iam publicGetPublisherUserV3 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicValidateUserByUserIDAndPasswordV3

```sh
$ build/install/cli/bin/cli iam publicValidateUserByUserIDAndPasswordV3 \
    --namespace <namespace value> \
    --userId <userId value> \
    --password <password value>
```

### Operation PublicGetRolesV3

```sh
$ build/install/cli/bin/cli iam publicGetRolesV3 \
    --after <after value - optional> \
    --before <before value - optional> \
    --isWildcard <isWildcard value - optional> \
    --limit <limit value - optional>
```

### Operation PublicGetRoleV3

```sh
$ build/install/cli/bin/cli iam publicGetRoleV3 \
    --roleId <roleId value>
```

### Operation PublicForgotPasswordWithoutNamespaceV3

```sh
$ build/install/cli/bin/cli iam publicForgotPasswordWithoutNamespaceV3 \
    --body <json string for request body>
```

### Operation PublicGetMyUserV3

```sh
$ build/install/cli/bin/cli iam publicGetMyUserV3 \
    --includeAllPlatforms <includeAllPlatforms value - optional>
```

### Operation PublicSendCodeForwardV3

```sh
$ build/install/cli/bin/cli iam publicSendCodeForwardV3 \
    --body <json string for request body>
```

### Operation PublicGetLinkHeadlessAccountToMyAccountConflictV3

```sh
$ build/install/cli/bin/cli iam publicGetLinkHeadlessAccountToMyAccountConflictV3 \
    --oneTimeLinkCode <oneTimeLinkCode value>
```

### Operation LinkHeadlessAccountToMyAccountV3

```sh
$ build/install/cli/bin/cli iam linkHeadlessAccountToMyAccountV3 \
    --body <json string for request body>
```

### Operation PublicGetMyRedirectionAfterLinkV3

```sh
$ build/install/cli/bin/cli iam publicGetMyRedirectionAfterLinkV3 \
    --oneTimeLinkCode <oneTimeLinkCode value>
```

### Operation PublicGetMyProfileAllowUpdateStatusV3

```sh
$ build/install/cli/bin/cli iam publicGetMyProfileAllowUpdateStatusV3
```

### Operation PublicSendVerificationLinkV3

```sh
$ build/install/cli/bin/cli iam publicSendVerificationLinkV3 \
    --body <json string for request body>
```

### Operation PublicGetOpenidUserInfoV3

```sh
$ build/install/cli/bin/cli iam publicGetOpenidUserInfoV3
```

### Operation PublicVerifyUserByLinkV3

```sh
$ build/install/cli/bin/cli iam publicVerifyUserByLinkV3 \
    --code <code value - optional>
```

### Operation PlatformAuthenticateSAMLV3Handler

```sh
$ build/install/cli/bin/cli iam platformAuthenticateSAMLV3Handler \
    --platformId <platformId value> \
    --code <code value - optional> \
    --error <error value - optional> \
    --state <state value>
```

### Operation LoginSSOClient

```sh
$ build/install/cli/bin/cli iam loginSSOClient \
    --platformId <platformId value> \
    --payload <payload value - optional>
```

### Operation LogoutSSOClient

```sh
$ build/install/cli/bin/cli iam logoutSSOClient \
    --platformId <platformId value>
```

### Operation RequestTargetTokenResponseV3

```sh
$ build/install/cli/bin/cli iam requestTargetTokenResponseV3 \
    --additionalData <additionalData value - optional> \
    --code <code value>
```

### Operation UpgradeAndAuthenticateForwardV3

```sh
$ build/install/cli/bin/cli iam upgradeAndAuthenticateForwardV3 \
    --clientId <client_id value> \
    --upgradeSuccessToken <upgrade_success_token value>
```

### Operation AdminListInvitationHistoriesV4

```sh
$ build/install/cli/bin/cli iam adminListInvitationHistoriesV4 \
    --limit <limit value - optional> \
    --namespace <namespace value - optional> \
    --offset <offset value - optional>
```

### Operation AdminGetDevicesByUserV4

```sh
$ build/install/cli/bin/cli iam adminGetDevicesByUserV4 \
    --namespace <namespace value> \
    --userId <userId value - optional>
```

### Operation AdminGetBannedDevicesV4

```sh
$ build/install/cli/bin/cli iam adminGetBannedDevicesV4 \
    --namespace <namespace value> \
    --deviceType <deviceType value - optional> \
    --endDate <endDate value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --startDate <startDate value - optional>
```

### Operation AdminGetUserDeviceBansV4

```sh
$ build/install/cli/bin/cli iam adminGetUserDeviceBansV4 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminBanDeviceV4

```sh
$ build/install/cli/bin/cli iam adminBanDeviceV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetDeviceBanV4

```sh
$ build/install/cli/bin/cli iam adminGetDeviceBanV4 \
    --banId <banId value> \
    --namespace <namespace value>
```

### Operation AdminUpdateDeviceBanV4

```sh
$ build/install/cli/bin/cli iam adminUpdateDeviceBanV4 \
    --banId <banId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGenerateReportV4

```sh
$ build/install/cli/bin/cli iam adminGenerateReportV4 \
    --namespace <namespace value> \
    --endDate <endDate value - optional> \
    --startDate <startDate value - optional> \
    --deviceType <deviceType value>
```

### Operation AdminGetDeviceTypesV4

```sh
$ build/install/cli/bin/cli iam adminGetDeviceTypesV4 \
    --namespace <namespace value>
```

### Operation AdminGetDeviceBansV4

```sh
$ build/install/cli/bin/cli iam adminGetDeviceBansV4 \
    --deviceId <deviceId value> \
    --namespace <namespace value>
```

### Operation AdminUnbanDeviceV4

```sh
$ build/install/cli/bin/cli iam adminUnbanDeviceV4 \
    --deviceId <deviceId value> \
    --namespace <namespace value>
```

### Operation AdminGetUsersByDeviceV4

```sh
$ build/install/cli/bin/cli iam adminGetUsersByDeviceV4 \
    --deviceId <deviceId value> \
    --namespace <namespace value>
```

### Operation AdminGetNamespaceInvitationHistoryV4

```sh
$ build/install/cli/bin/cli iam adminGetNamespaceInvitationHistoryV4 \
    --namespace <namespace value>
```

### Operation AdminGetNamespaceUserInvitationHistoryV4

```sh
$ build/install/cli/bin/cli iam adminGetNamespaceUserInvitationHistoryV4 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminCreateTestUsersV4

```sh
$ build/install/cli/bin/cli iam adminCreateTestUsersV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminCreateUserV4

```sh
$ build/install/cli/bin/cli iam adminCreateUserV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminBulkUpdateUserAccountTypeV4

```sh
$ build/install/cli/bin/cli iam adminBulkUpdateUserAccountTypeV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminBulkCheckValidUserIDV4

```sh
$ build/install/cli/bin/cli iam adminBulkCheckValidUserIDV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminUpdateUserV4

```sh
$ build/install/cli/bin/cli iam adminUpdateUserV4 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminUpdateUserEmailAddressV4

```sh
$ build/install/cli/bin/cli iam adminUpdateUserEmailAddressV4 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminDisableUserMFAV4

```sh
$ build/install/cli/bin/cli iam adminDisableUserMFAV4 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetUserMFAStatusV4

```sh
$ build/install/cli/bin/cli iam adminGetUserMFAStatusV4 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminListUserRolesV4

```sh
$ build/install/cli/bin/cli iam adminListUserRolesV4 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminUpdateUserRoleV4

```sh
$ build/install/cli/bin/cli iam adminUpdateUserRoleV4 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminAddUserRoleV4

```sh
$ build/install/cli/bin/cli iam adminAddUserRoleV4 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminRemoveUserRoleV4

```sh
$ build/install/cli/bin/cli iam adminRemoveUserRoleV4 \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation AdminGetRolesV4

```sh
$ build/install/cli/bin/cli iam adminGetRolesV4 \
    --adminRole <adminRole value - optional> \
    --isWildcard <isWildcard value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminCreateRoleV4

```sh
$ build/install/cli/bin/cli iam adminCreateRoleV4 \
    --body <json string for request body>
```

### Operation AdminGetRoleV4

```sh
$ build/install/cli/bin/cli iam adminGetRoleV4 \
    --roleId <roleId value>
```

### Operation AdminDeleteRoleV4

```sh
$ build/install/cli/bin/cli iam adminDeleteRoleV4 \
    --roleId <roleId value>
```

### Operation AdminUpdateRoleV4

```sh
$ build/install/cli/bin/cli iam adminUpdateRoleV4 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminUpdateRolePermissionsV4

```sh
$ build/install/cli/bin/cli iam adminUpdateRolePermissionsV4 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminAddRolePermissionsV4

```sh
$ build/install/cli/bin/cli iam adminAddRolePermissionsV4 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminDeleteRolePermissionsV4

```sh
$ build/install/cli/bin/cli iam adminDeleteRolePermissionsV4 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminListAssignedUsersV4

```sh
$ build/install/cli/bin/cli iam adminListAssignedUsersV4 \
    --roleId <roleId value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional>
```

### Operation AdminAssignUserToRoleV4

```sh
$ build/install/cli/bin/cli iam adminAssignUserToRoleV4 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminRevokeUserFromRoleV4

```sh
$ build/install/cli/bin/cli iam adminRevokeUserFromRoleV4 \
    --roleId <roleId value> \
    --body <json string for request body>
```

### Operation AdminInviteUserNewV4

```sh
$ build/install/cli/bin/cli iam adminInviteUserNewV4 \
    --body <json string for request body>
```

### Operation AdminUpdateMyUserV4

```sh
$ build/install/cli/bin/cli iam adminUpdateMyUserV4 \
    --body <json string for request body>
```

### Operation AdminDisableMyAuthenticatorV4

```sh
$ build/install/cli/bin/cli iam adminDisableMyAuthenticatorV4 \
    --body <json string for request body>
```

### Operation AdminEnableMyAuthenticatorV4

```sh
$ build/install/cli/bin/cli iam adminEnableMyAuthenticatorV4 \
    --code <code value>
```

### Operation AdminGenerateMyAuthenticatorKeyV4

```sh
$ build/install/cli/bin/cli iam adminGenerateMyAuthenticatorKeyV4
```

### Operation AdminDisableMyBackupCodesV4

```sh
$ build/install/cli/bin/cli iam adminDisableMyBackupCodesV4 \
    --body <json string for request body>
```

### Operation AdminGetBackupCodesV4

```sh
$ build/install/cli/bin/cli iam adminGetBackupCodesV4 \
    --languageTag <languageTag value - optional>
```

### Operation AdminGenerateBackupCodesV4

```sh
$ build/install/cli/bin/cli iam adminGenerateBackupCodesV4 \
    --languageTag <languageTag value - optional>
```

### Operation AdminEnableBackupCodesV4

```sh
$ build/install/cli/bin/cli iam adminEnableBackupCodesV4 \
    --languageTag <languageTag value - optional>
```

### Operation AdminChallengeMyMFAV4

```sh
$ build/install/cli/bin/cli iam adminChallengeMyMFAV4 \
    --code <code value - optional> \
    --factor <factor value - optional>
```

### Operation AdminSendMyMFAEmailCodeV4

```sh
$ build/install/cli/bin/cli iam adminSendMyMFAEmailCodeV4 \
    --action <action value - optional> \
    --languageTag <languageTag value - optional>
```

### Operation AdminDisableMyEmailV4

```sh
$ build/install/cli/bin/cli iam adminDisableMyEmailV4 \
    --body <json string for request body>
```

### Operation AdminEnableMyEmailV4

```sh
$ build/install/cli/bin/cli iam adminEnableMyEmailV4 \
    --code <code value>
```

### Operation AdminGetMyEnabledFactorsV4

```sh
$ build/install/cli/bin/cli iam adminGetMyEnabledFactorsV4
```

### Operation AdminMakeFactorMyDefaultV4

```sh
$ build/install/cli/bin/cli iam adminMakeFactorMyDefaultV4 \
    --factor <factor value>
```

### Operation AdminGetMyOwnMFAStatusV4

```sh
$ build/install/cli/bin/cli iam adminGetMyOwnMFAStatusV4
```

### Operation AuthenticationWithPlatformLinkV4

```sh
$ build/install/cli/bin/cli iam authenticationWithPlatformLinkV4 \
    --extendExp <extend_exp value - optional> \
    --clientId <client_id value> \
    --linkingToken <linkingToken value> \
    --password <password value> \
    --username <username value>
```

### Operation GenerateTokenByNewHeadlessAccountV4

```sh
$ build/install/cli/bin/cli iam generateTokenByNewHeadlessAccountV4 \
    --additionalData <additionalData value - optional> \
    --extendExp <extend_exp value - optional> \
    --linkingToken <linkingToken value>
```

### Operation Verify2faCodeV4

```sh
$ build/install/cli/bin/cli iam verify2faCodeV4 \
    --code <code value> \
    --factor <factor value> \
    --mfaToken <mfaToken value> \
    --rememberDevice <rememberDevice value>
```

### Operation PlatformTokenGrantV4

```sh
$ build/install/cli/bin/cli iam platformTokenGrantV4 \
    --platformId <platformId value> \
    --codeChallenge <code_challenge value - optional> \
    --codeChallengeMethod <code_challenge_method value - optional> \
    --additionalData <additionalData value - optional> \
    --clientId <client_id value - optional> \
    --createHeadless <createHeadless value - optional> \
    --deviceId <device_id value - optional> \
    --macAddress <macAddress value - optional> \
    --platformToken <platform_token value - optional> \
    --serviceLabel <serviceLabel value - optional> \
    --skipSetCookie <skipSetCookie value - optional>
```

### Operation SimultaneousLoginV4

```sh
$ build/install/cli/bin/cli iam simultaneousLoginV4 \
    --codeChallenge <code_challenge value - optional> \
    --codeChallengeMethod <code_challenge_method value - optional> \
    --simultaneousPlatform <simultaneousPlatform value - optional> \
    --simultaneousTicket <simultaneousTicket value - optional> \
    --nativePlatform <nativePlatform value> \
    --nativePlatformTicket <nativePlatformTicket value>
```

### Operation TokenGrantV4

```sh
$ build/install/cli/bin/cli iam tokenGrantV4 \
    --codeChallenge <code_challenge value - optional> \
    --codeChallengeMethod <code_challenge_method value - optional> \
    --additionalData <additionalData value - optional> \
    --clientId <client_id value - optional> \
    --clientSecret <client_secret value - optional> \
    --code <code value - optional> \
    --codeVerifier <code_verifier value - optional> \
    --extendNamespace <extendNamespace value - optional> \
    --extendExp <extend_exp value - optional> \
    --loginQueueTicket <login_queue_ticket value - optional> \
    --password <password value - optional> \
    --redirectUri <redirect_uri value - optional> \
    --refreshToken <refresh_token value - optional> \
    --scope <scope value - optional> \
    --username <username value - optional> \
    --grantType <grant_type value>
```

### Operation RequestTargetTokenResponseV4

```sh
$ build/install/cli/bin/cli iam requestTargetTokenResponseV4 \
    --additionalData <additionalData value - optional> \
    --code <code value>
```

### Operation PublicListUserIDByPlatformUserIDsV4

```sh
$ build/install/cli/bin/cli iam publicListUserIDByPlatformUserIDsV4 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --rawPUID <rawPUID value - optional> \
    --body <json string for request body>
```

### Operation PublicGetUserByPlatformUserIDV4

```sh
$ build/install/cli/bin/cli iam publicGetUserByPlatformUserIDV4 \
    --namespace <namespace value> \
    --platformId <platformId value> \
    --platformUserId <platformUserId value>
```

### Operation PublicCreateTestUserV4

```sh
$ build/install/cli/bin/cli iam publicCreateTestUserV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicCreateUserV4

```sh
$ build/install/cli/bin/cli iam publicCreateUserV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateUserFromInvitationV4

```sh
$ build/install/cli/bin/cli iam createUserFromInvitationV4 \
    --invitationId <invitationId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicUpdateUserV4

```sh
$ build/install/cli/bin/cli iam publicUpdateUserV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicUpdateUserEmailAddressV4

```sh
$ build/install/cli/bin/cli iam publicUpdateUserEmailAddressV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicUpgradeHeadlessAccountWithVerificationCodeV4

```sh
$ build/install/cli/bin/cli iam publicUpgradeHeadlessAccountWithVerificationCodeV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicUpgradeHeadlessAccountV4

```sh
$ build/install/cli/bin/cli iam publicUpgradeHeadlessAccountV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicDisableMyAuthenticatorV4

```sh
$ build/install/cli/bin/cli iam publicDisableMyAuthenticatorV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicEnableMyAuthenticatorV4

```sh
$ build/install/cli/bin/cli iam publicEnableMyAuthenticatorV4 \
    --namespace <namespace value> \
    --code <code value>
```

### Operation PublicGenerateMyAuthenticatorKeyV4

```sh
$ build/install/cli/bin/cli iam publicGenerateMyAuthenticatorKeyV4 \
    --namespace <namespace value>
```

### Operation PublicDisableMyBackupCodesV4

```sh
$ build/install/cli/bin/cli iam publicDisableMyBackupCodesV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetBackupCodesV4

```sh
$ build/install/cli/bin/cli iam publicGetBackupCodesV4 \
    --namespace <namespace value> \
    --languageTag <languageTag value - optional>
```

### Operation PublicGenerateBackupCodesV4

```sh
$ build/install/cli/bin/cli iam publicGenerateBackupCodesV4 \
    --namespace <namespace value> \
    --languageTag <languageTag value - optional>
```

### Operation PublicEnableBackupCodesV4

```sh
$ build/install/cli/bin/cli iam publicEnableBackupCodesV4 \
    --namespace <namespace value> \
    --languageTag <languageTag value - optional>
```

### Operation PublicChallengeMyMFAV4

```sh
$ build/install/cli/bin/cli iam publicChallengeMyMFAV4 \
    --namespace <namespace value> \
    --code <code value - optional> \
    --factor <factor value - optional>
```

### Operation PublicRemoveTrustedDeviceV4

```sh
$ build/install/cli/bin/cli iam publicRemoveTrustedDeviceV4 \
    --namespace <namespace value> \
    --deviceToken <device_token value>
```

### Operation PublicSendMyMFAEmailCodeV4

```sh
$ build/install/cli/bin/cli iam publicSendMyMFAEmailCodeV4 \
    --namespace <namespace value> \
    --action <action value - optional> \
    --languageTag <languageTag value - optional>
```

### Operation PublicDisableMyEmailV4

```sh
$ build/install/cli/bin/cli iam publicDisableMyEmailV4 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicEnableMyEmailV4

```sh
$ build/install/cli/bin/cli iam publicEnableMyEmailV4 \
    --namespace <namespace value> \
    --code <code value>
```

### Operation PublicGetMyEnabledFactorsV4

```sh
$ build/install/cli/bin/cli iam publicGetMyEnabledFactorsV4 \
    --namespace <namespace value>
```

### Operation PublicMakeFactorMyDefaultV4

```sh
$ build/install/cli/bin/cli iam publicMakeFactorMyDefaultV4 \
    --namespace <namespace value> \
    --factor <factor value>
```

### Operation PublicGetMyOwnMFAStatusV4

```sh
$ build/install/cli/bin/cli iam publicGetMyOwnMFAStatusV4 \
    --namespace <namespace value>
```

### Operation PublicGetUserPublicInfoByUserIdV4

```sh
$ build/install/cli/bin/cli iam publicGetUserPublicInfoByUserIdV4 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicInviteUserV4

```sh
$ build/install/cli/bin/cli iam publicInviteUserV4 \
    --body <json string for request body>
```

### Operation PublicUpgradeHeadlessWithCodeV4Forward

```sh
$ build/install/cli/bin/cli iam publicUpgradeHeadlessWithCodeV4Forward \
    --body <json string for request body>
```

