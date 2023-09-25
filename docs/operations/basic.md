# Basic Service Index

&nbsp;  

## Operations

### Namespace Wrapper:  [Namespace](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/Namespace.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/basic/v1/admin/namespaces` | GET | GetNamespaces | [GetNamespaces](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/GetNamespaces.java) | [GetNamespaces](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/GetNamespaces.java) |
| `/basic/v1/admin/namespaces` | POST | CreateNamespace | [CreateNamespace](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/CreateNamespace.java) | [CreateNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/CreateNamespace.java) |
| `/basic/v1/admin/namespaces/{namespace}` | GET | GetNamespace | [GetNamespace](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/GetNamespace.java) | [GetNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/GetNamespace.java) |
| `/basic/v1/admin/namespaces/{namespace}` | DELETE | DeleteNamespace | [DeleteNamespace](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/DeleteNamespace.java) | [DeleteNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/DeleteNamespace.java) |
| `/basic/v1/admin/namespaces/{namespace}/basic` | PATCH | UpdateNamespace | [UpdateNamespace](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/UpdateNamespace.java) | [UpdateNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/UpdateNamespace.java) |
| `/basic/v1/admin/namespaces/{namespace}/game` | GET | GetGameNamespaces | [GetGameNamespaces](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/GetGameNamespaces.java) | [GetGameNamespaces](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/GetGameNamespaces.java) |
| `/basic/v1/admin/namespaces/{namespace}/publisher` | GET | GetNamespacePublisher | [GetNamespacePublisher](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/GetNamespacePublisher.java) | [GetNamespacePublisher](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/GetNamespacePublisher.java) |
| `/basic/v1/admin/namespaces/{namespace}/status` | PATCH | ChangeNamespaceStatus | [ChangeNamespaceStatus](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/ChangeNamespaceStatus.java) | [ChangeNamespaceStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/ChangeNamespaceStatus.java) |
| `/basic/v1/public/namespaces` | GET | PublicGetNamespaces | [PublicGetNamespaces](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/PublicGetNamespaces.java) | [PublicGetNamespaces](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/PublicGetNamespaces.java) |
| `/basic/v1/public/namespaces/{namespace}/publisher` | GET | PublicGetNamespacePublisher | [PublicGetNamespacePublisher](../../src/main/java/net/accelbyte/sdk/api/basic/operations/namespace/PublicGetNamespacePublisher.java) | [PublicGetNamespacePublisher](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/namespace/PublicGetNamespacePublisher.java) |

### UserAction Wrapper:  [UserAction](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/UserAction.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/basic/v1/admin/namespaces/{namespace}/actions` | GET | GetActions | [GetActions](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_action/GetActions.java) | [GetActions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_action/GetActions.java) |
| `/basic/v1/admin/namespaces/{namespace}/actions/ban` | POST | BanUsers | [BanUsers](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_action/BanUsers.java) | [BanUsers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_action/BanUsers.java) |
| `/basic/v1/admin/namespaces/{namespace}/actions/banned` | GET | GetBannedUsers | [GetBannedUsers](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_action/GetBannedUsers.java) | [GetBannedUsers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_action/GetBannedUsers.java) |
| `/basic/v1/admin/namespaces/{namespace}/actions/report` | POST | ReportUser | [ReportUser](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_action/ReportUser.java) | [ReportUser](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_action/ReportUser.java) |
| `/basic/v1/admin/namespaces/{namespace}/actions/status` | GET | GetUserStatus | [GetUserStatus](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_action/GetUserStatus.java) | [GetUserStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_action/GetUserStatus.java) |
| `/basic/v1/admin/namespaces/{namespace}/actions/unban` | POST | UnBanUsers | [UnBanUsers](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_action/UnBanUsers.java) | [UnBanUsers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_action/UnBanUsers.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/actions/report` | POST | PublicReportUser | [PublicReportUser](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_action/PublicReportUser.java) | [PublicReportUser](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_action/PublicReportUser.java) |

### Config Wrapper:  [Config](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/Config.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/basic/v1/admin/namespaces/{namespace}/configs` | POST | CreateConfig | [CreateConfig](../../src/main/java/net/accelbyte/sdk/api/basic/operations/config/CreateConfig.java) | [CreateConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/config/CreateConfig.java) |
| `/basic/v1/admin/namespaces/{namespace}/configs/{configKey}` | GET | GetConfig1 | [GetConfig1](../../src/main/java/net/accelbyte/sdk/api/basic/operations/config/GetConfig1.java) | [GetConfig1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/config/GetConfig1.java) |
| `/basic/v1/admin/namespaces/{namespace}/configs/{configKey}` | DELETE | DeleteConfig1 | [DeleteConfig1](../../src/main/java/net/accelbyte/sdk/api/basic/operations/config/DeleteConfig1.java) | [DeleteConfig1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/config/DeleteConfig1.java) |
| `/basic/v1/admin/namespaces/{namespace}/configs/{configKey}` | PATCH | UpdateConfig1 | [UpdateConfig1](../../src/main/java/net/accelbyte/sdk/api/basic/operations/config/UpdateConfig1.java) | [UpdateConfig1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/config/UpdateConfig1.java) |
| `/basic/v1/admin/namespaces/{namespace}/publisher/configs/{configKey}` | GET | GetPublisherConfig | [GetPublisherConfig](../../src/main/java/net/accelbyte/sdk/api/basic/operations/config/GetPublisherConfig.java) | [GetPublisherConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/config/GetPublisherConfig.java) |

### EQU8Config Wrapper:  [EQU8Config](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/EQU8Config.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/basic/v1/admin/namespaces/{namespace}/equ8/config` | GET | GetConfig | [GetConfig](../../src/main/java/net/accelbyte/sdk/api/basic/operations/equ8_config/GetConfig.java) | [GetConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/equ8_config/GetConfig.java) |
| `/basic/v1/admin/namespaces/{namespace}/equ8/config` | DELETE | DeleteConfig | [DeleteConfig](../../src/main/java/net/accelbyte/sdk/api/basic/operations/equ8_config/DeleteConfig.java) | [DeleteConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/equ8_config/DeleteConfig.java) |
| `/basic/v1/admin/namespaces/{namespace}/equ8/config` | PATCH | UpdateConfig | [UpdateConfig](../../src/main/java/net/accelbyte/sdk/api/basic/operations/equ8_config/UpdateConfig.java) | [UpdateConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/equ8_config/UpdateConfig.java) |

### FileUpload Wrapper:  [FileUpload](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/FileUpload.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/basic/v1/admin/namespaces/{namespace}/folders/{folder}/files` | POST | GeneratedUploadUrl | [GeneratedUploadUrl](../../src/main/java/net/accelbyte/sdk/api/basic/operations/file_upload/GeneratedUploadUrl.java) | [GeneratedUploadUrl](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/file_upload/GeneratedUploadUrl.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/files` | POST | GeneratedUserUploadContentUrl | [GeneratedUserUploadContentUrl](../../src/main/java/net/accelbyte/sdk/api/basic/operations/file_upload/GeneratedUserUploadContentUrl.java) | [GeneratedUserUploadContentUrl](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/file_upload/GeneratedUserUploadContentUrl.java) |
| `/basic/v1/public/namespaces/{namespace}/folders/{folder}/files` | POST | PublicGeneratedUploadUrl | [PublicGeneratedUploadUrl](../../src/main/java/net/accelbyte/sdk/api/basic/operations/file_upload/PublicGeneratedUploadUrl.java) | [PublicGeneratedUploadUrl](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/file_upload/PublicGeneratedUploadUrl.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/files` | POST | PublicGeneratedUserUploadContentUrl | [PublicGeneratedUserUploadContentUrl](../../src/main/java/net/accelbyte/sdk/api/basic/operations/file_upload/PublicGeneratedUserUploadContentUrl.java) | [PublicGeneratedUserUploadContentUrl](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/file_upload/PublicGeneratedUserUploadContentUrl.java) |

### Misc Wrapper:  [Misc](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/Misc.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| [DEPRECATED] `/basic/v1/admin/namespaces/{namespace}/misc/countries` | GET | GetCountries | [GetCountries](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/GetCountries.java) | [GetCountries](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/GetCountries.java) |
| `/basic/v1/admin/namespaces/{namespace}/misc/countrygroups` | GET | GetCountryGroups | [GetCountryGroups](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/GetCountryGroups.java) | [GetCountryGroups](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/GetCountryGroups.java) |
| `/basic/v1/admin/namespaces/{namespace}/misc/countrygroups` | POST | AddCountryGroup | [AddCountryGroup](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/AddCountryGroup.java) | [AddCountryGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/AddCountryGroup.java) |
| `/basic/v1/admin/namespaces/{namespace}/misc/countrygroups/{countryGroupCode}` | PUT | UpdateCountryGroup | [UpdateCountryGroup](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/UpdateCountryGroup.java) | [UpdateCountryGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/UpdateCountryGroup.java) |
| `/basic/v1/admin/namespaces/{namespace}/misc/countrygroups/{countryGroupCode}` | DELETE | DeleteCountryGroup | [DeleteCountryGroup](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/DeleteCountryGroup.java) | [DeleteCountryGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/DeleteCountryGroup.java) |
| `/basic/v1/admin/namespaces/{namespace}/misc/languages` | GET | GetLanguages | [GetLanguages](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/GetLanguages.java) | [GetLanguages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/GetLanguages.java) |
| `/basic/v1/admin/namespaces/{namespace}/misc/timezones` | GET | GetTimeZones | [GetTimeZones](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/GetTimeZones.java) | [GetTimeZones](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/GetTimeZones.java) |
| `/basic/v1/public/misc/time` | GET | PublicGetTime | [PublicGetTime](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/PublicGetTime.java) | [PublicGetTime](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/PublicGetTime.java) |
| [DEPRECATED] `/basic/v1/public/namespaces/{namespace}/misc/countries` | GET | PublicGetCountries | [PublicGetCountries](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/PublicGetCountries.java) | [PublicGetCountries](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/PublicGetCountries.java) |
| `/basic/v1/public/namespaces/{namespace}/misc/languages` | GET | PublicGetLanguages | [PublicGetLanguages](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/PublicGetLanguages.java) | [PublicGetLanguages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/PublicGetLanguages.java) |
| `/basic/v1/public/namespaces/{namespace}/misc/timezones` | GET | PublicGetTimeZones | [PublicGetTimeZones](../../src/main/java/net/accelbyte/sdk/api/basic/operations/misc/PublicGetTimeZones.java) | [PublicGetTimeZones](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/misc/PublicGetTimeZones.java) |

### UserProfile Wrapper:  [UserProfile](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/UserProfile.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/basic/v1/admin/namespaces/{namespace}/profiles/byPublicId` | GET | GetUserProfileInfoByPublicId | [GetUserProfileInfoByPublicId](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/GetUserProfileInfoByPublicId.java) | [GetUserProfileInfoByPublicId](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/GetUserProfileInfoByPublicId.java) |
| `/basic/v1/admin/namespaces/{namespace}/profiles/public` | POST | AdminGetUserProfilePublicInfoByIds | [AdminGetUserProfilePublicInfoByIds](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/AdminGetUserProfilePublicInfoByIds.java) | [AdminGetUserProfilePublicInfoByIds](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/AdminGetUserProfilePublicInfoByIds.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles` | GET | GetUserProfileInfo | [GetUserProfileInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/GetUserProfileInfo.java) | [GetUserProfileInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/GetUserProfileInfo.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles` | PUT | UpdateUserProfile | [UpdateUserProfile](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/UpdateUserProfile.java) | [UpdateUserProfile](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/UpdateUserProfile.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles` | DELETE | DeleteUserProfile | [DeleteUserProfile](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/DeleteUserProfile.java) | [DeleteUserProfile](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/DeleteUserProfile.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles/customAttributes` | GET | GetCustomAttributesInfo | [GetCustomAttributesInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/GetCustomAttributesInfo.java) | [GetCustomAttributesInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/GetCustomAttributesInfo.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles/customAttributes` | PUT | UpdateCustomAttributesPartially | [UpdateCustomAttributesPartially](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/UpdateCustomAttributesPartially.java) | [UpdateCustomAttributesPartially](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/UpdateCustomAttributesPartially.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles/privateCustomAttributes` | GET | GetPrivateCustomAttributesInfo | [GetPrivateCustomAttributesInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/GetPrivateCustomAttributesInfo.java) | [GetPrivateCustomAttributesInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/GetPrivateCustomAttributesInfo.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles/privateCustomAttributes` | PUT | UpdatePrivateCustomAttributesPartially | [UpdatePrivateCustomAttributesPartially](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/UpdatePrivateCustomAttributesPartially.java) | [UpdatePrivateCustomAttributesPartially](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/UpdatePrivateCustomAttributesPartially.java) |
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/profiles/status` | PATCH | UpdateUserProfileStatus | [UpdateUserProfileStatus](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/UpdateUserProfileStatus.java) | [UpdateUserProfileStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/UpdateUserProfileStatus.java) |
| `/basic/v1/public/namespaces/{namespace}/profiles/public` | GET | PublicGetUserProfilePublicInfoByIds | [PublicGetUserProfilePublicInfoByIds](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicGetUserProfilePublicInfoByIds.java) | [PublicGetUserProfilePublicInfoByIds](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicGetUserProfilePublicInfoByIds.java) |
| `/basic/v1/public/namespaces/{namespace}/profiles/public/byPublicId` | GET | PublicGetUserProfileInfoByPublicId | [PublicGetUserProfileInfoByPublicId](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicGetUserProfileInfoByPublicId.java) | [PublicGetUserProfileInfoByPublicId](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicGetUserProfileInfoByPublicId.java) |
| `/basic/v1/public/namespaces/{namespace}/users/me/profiles` | GET | GetMyProfileInfo | [GetMyProfileInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/GetMyProfileInfo.java) | [GetMyProfileInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/GetMyProfileInfo.java) |
| `/basic/v1/public/namespaces/{namespace}/users/me/profiles` | PUT | UpdateMyProfile | [UpdateMyProfile](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/UpdateMyProfile.java) | [UpdateMyProfile](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/UpdateMyProfile.java) |
| `/basic/v1/public/namespaces/{namespace}/users/me/profiles` | POST | CreateMyProfile | [CreateMyProfile](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/CreateMyProfile.java) | [CreateMyProfile](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/CreateMyProfile.java) |
| `/basic/v1/public/namespaces/{namespace}/users/me/profiles/privateCustomAttributes` | GET | GetMyPrivateCustomAttributesInfo | [GetMyPrivateCustomAttributesInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/GetMyPrivateCustomAttributesInfo.java) | [GetMyPrivateCustomAttributesInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/GetMyPrivateCustomAttributesInfo.java) |
| `/basic/v1/public/namespaces/{namespace}/users/me/profiles/privateCustomAttributes` | PUT | UpdateMyPrivateCustomAttributesPartially | [UpdateMyPrivateCustomAttributesPartially](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/UpdateMyPrivateCustomAttributesPartially.java) | [UpdateMyPrivateCustomAttributesPartially](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/UpdateMyPrivateCustomAttributesPartially.java) |
| `/basic/v1/public/namespaces/{namespace}/users/me/profiles/zipCode` | GET | GetMyZipCode | [GetMyZipCode](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/GetMyZipCode.java) | [GetMyZipCode](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/GetMyZipCode.java) |
| `/basic/v1/public/namespaces/{namespace}/users/me/profiles/zipCode` | PATCH | UpdateMyZipCode | [UpdateMyZipCode](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/UpdateMyZipCode.java) | [UpdateMyZipCode](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/UpdateMyZipCode.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles` | GET | PublicGetUserProfileInfo | [PublicGetUserProfileInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicGetUserProfileInfo.java) | [PublicGetUserProfileInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicGetUserProfileInfo.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles` | PUT | PublicUpdateUserProfile | [PublicUpdateUserProfile](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicUpdateUserProfile.java) | [PublicUpdateUserProfile](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicUpdateUserProfile.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles` | POST | PublicCreateUserProfile | [PublicCreateUserProfile](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicCreateUserProfile.java) | [PublicCreateUserProfile](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicCreateUserProfile.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles/customAttributes` | GET | PublicGetCustomAttributesInfo | [PublicGetCustomAttributesInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicGetCustomAttributesInfo.java) | [PublicGetCustomAttributesInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicGetCustomAttributesInfo.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles/customAttributes` | PUT | PublicUpdateCustomAttributesPartially | [PublicUpdateCustomAttributesPartially](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicUpdateCustomAttributesPartially.java) | [PublicUpdateCustomAttributesPartially](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicUpdateCustomAttributesPartially.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles/public` | GET | PublicGetUserProfilePublicInfo | [PublicGetUserProfilePublicInfo](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicGetUserProfilePublicInfo.java) | [PublicGetUserProfilePublicInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicGetUserProfilePublicInfo.java) |
| `/basic/v1/public/namespaces/{namespace}/users/{userId}/profiles/status` | PATCH | PublicUpdateUserProfileStatus | [PublicUpdateUserProfileStatus](../../src/main/java/net/accelbyte/sdk/api/basic/operations/user_profile/PublicUpdateUserProfileStatus.java) | [PublicUpdateUserProfileStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/user_profile/PublicUpdateUserProfileStatus.java) |

### Anonymization Wrapper:  [Anonymization](../../src/main/java/net/accelbyte/sdk/api/basic/wrappers/Anonymization.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/basic/v1/admin/namespaces/{namespace}/users/{userId}/anonymization/profiles` | DELETE | AnonymizeUserProfile | [AnonymizeUserProfile](../../src/main/java/net/accelbyte/sdk/api/basic/operations/anonymization/AnonymizeUserProfile.java) | [AnonymizeUserProfile](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/basic/anonymization/AnonymizeUserProfile.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `A DTO for unban user API call.` | [ADTOForUnbanUserAPICall](../../src/main/java/net/accelbyte/sdk/api/basic/models/ADTOForUnbanUserAPICall.java) |
| `A DTO for update equ8 config API call.` | [ADTOForUpdateEqu8ConfigAPICall](../../src/main/java/net/accelbyte/sdk/api/basic/models/ADTOForUpdateEqu8ConfigAPICall.java) |
| `A DTO object for equ8 user ban status` | [ADTOObjectForEqu8UserBanStatus](../../src/main/java/net/accelbyte/sdk/api/basic/models/ADTOObjectForEqu8UserBanStatus.java) |
| `A DTO object for equ8 user status` | [ADTOObjectForEqu8UserStatus](../../src/main/java/net/accelbyte/sdk/api/basic/models/ADTOObjectForEqu8UserStatus.java) |
| `Action` | [Action](../../src/main/java/net/accelbyte/sdk/api/basic/models/Action.java) |
| `AddCountryGroupRequest` | [AddCountryGroupRequest](../../src/main/java/net/accelbyte/sdk/api/basic/models/AddCountryGroupRequest.java) |
| `AddCountryGroupResponse` | [AddCountryGroupResponse](../../src/main/java/net/accelbyte/sdk/api/basic/models/AddCountryGroupResponse.java) |
| `ConfigCreate` | [ConfigCreate](../../src/main/java/net/accelbyte/sdk/api/basic/models/ConfigCreate.java) |
| `ConfigInfo` | [ConfigInfo](../../src/main/java/net/accelbyte/sdk/api/basic/models/ConfigInfo.java) |
| `ConfigUpdate` | [ConfigUpdate](../../src/main/java/net/accelbyte/sdk/api/basic/models/ConfigUpdate.java) |
| `CountryGroupObject` | [CountryGroupObject](../../src/main/java/net/accelbyte/sdk/api/basic/models/CountryGroupObject.java) |
| `CountryObject` | [CountryObject](../../src/main/java/net/accelbyte/sdk/api/basic/models/CountryObject.java) |
| `Equ8Config` | [Equ8Config](../../src/main/java/net/accelbyte/sdk/api/basic/models/Equ8Config.java) |
| `ErrorEntity` | [ErrorEntity](../../src/main/java/net/accelbyte/sdk/api/basic/models/ErrorEntity.java) |
| `FieldValidationError` | [FieldValidationError](../../src/main/java/net/accelbyte/sdk/api/basic/models/FieldValidationError.java) |
| `FileUploadUrlInfo` | [FileUploadUrlInfo](../../src/main/java/net/accelbyte/sdk/api/basic/models/FileUploadUrlInfo.java) |
| `NamespaceCreate` | [NamespaceCreate](../../src/main/java/net/accelbyte/sdk/api/basic/models/NamespaceCreate.java) |
| `NamespaceInfo` | [NamespaceInfo](../../src/main/java/net/accelbyte/sdk/api/basic/models/NamespaceInfo.java) |
| `NamespacePublisherInfo` | [NamespacePublisherInfo](../../src/main/java/net/accelbyte/sdk/api/basic/models/NamespacePublisherInfo.java) |
| `NamespaceStatusUpdate` | [NamespaceStatusUpdate](../../src/main/java/net/accelbyte/sdk/api/basic/models/NamespaceStatusUpdate.java) |
| `NamespaceUpdate` | [NamespaceUpdate](../../src/main/java/net/accelbyte/sdk/api/basic/models/NamespaceUpdate.java) |
| `RetrieveCountryGroupResponse` | [RetrieveCountryGroupResponse](../../src/main/java/net/accelbyte/sdk/api/basic/models/RetrieveCountryGroupResponse.java) |
| `RetrieveTimeResponse` | [RetrieveTimeResponse](../../src/main/java/net/accelbyte/sdk/api/basic/models/RetrieveTimeResponse.java) |
| `UpdateCountryGroupRequest` | [UpdateCountryGroupRequest](../../src/main/java/net/accelbyte/sdk/api/basic/models/UpdateCountryGroupRequest.java) |
| `UserBanRequest` | [UserBanRequest](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserBanRequest.java) |
| `UserProfileAdmin` | [UserProfileAdmin](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfileAdmin.java) |
| `UserProfileBulkRequest` | [UserProfileBulkRequest](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfileBulkRequest.java) |
| `UserProfileCreate` | [UserProfileCreate](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfileCreate.java) |
| `UserProfileInfo` | [UserProfileInfo](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfileInfo.java) |
| `UserProfilePrivateCreate` | [UserProfilePrivateCreate](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfilePrivateCreate.java) |
| `UserProfilePrivateInfo` | [UserProfilePrivateInfo](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfilePrivateInfo.java) |
| `UserProfilePublicInfo` | [UserProfilePublicInfo](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfilePublicInfo.java) |
| `UserProfileStatusUpdate` | [UserProfileStatusUpdate](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfileStatusUpdate.java) |
| `UserProfileUpdate` | [UserProfileUpdate](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserProfileUpdate.java) |
| `UserReportRequest` | [UserReportRequest](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserReportRequest.java) |
| `UserZipCode` | [UserZipCode](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserZipCode.java) |
| `UserZipCodeUpdate` | [UserZipCodeUpdate](../../src/main/java/net/accelbyte/sdk/api/basic/models/UserZipCodeUpdate.java) |
| `ValidationErrorEntity` | [ValidationErrorEntity](../../src/main/java/net/accelbyte/sdk/api/basic/models/ValidationErrorEntity.java) |
