## Java Extend SDK CLI Sample App Operation Index for Basic service

### Operation GetNamespaces

```sh
$ build/install/cli/bin/cli basic getNamespaces \
    --activeOnly <activeOnly value - optional>
```

### Operation CreateNamespace

```sh
$ build/install/cli/bin/cli basic createNamespace \
    --body <json string for request body>
```

### Operation GetNamespace

```sh
$ build/install/cli/bin/cli basic getNamespace \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional>
```

### Operation DeleteNamespace

```sh
$ build/install/cli/bin/cli basic deleteNamespace \
    --namespace <namespace value>
```

### Operation UpdateNamespace

```sh
$ build/install/cli/bin/cli basic updateNamespace \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetChildNamespaces

```sh
$ build/install/cli/bin/cli basic getChildNamespaces \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional>
```

### Operation CreateConfig

```sh
$ build/install/cli/bin/cli basic createConfig \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetConfig

```sh
$ build/install/cli/bin/cli basic getConfig \
    --configKey <configKey value> \
    --namespace <namespace value>
```

### Operation DeleteConfig

```sh
$ build/install/cli/bin/cli basic deleteConfig \
    --configKey <configKey value> \
    --namespace <namespace value>
```

### Operation UpdateConfig

```sh
$ build/install/cli/bin/cli basic updateConfig \
    --configKey <configKey value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetNamespaceContext

```sh
$ build/install/cli/bin/cli basic getNamespaceContext \
    --namespace <namespace value> \
    --refreshOnCacheMiss <refreshOnCacheMiss value - optional>
```

### Operation GeneratedUploadUrl

```sh
$ build/install/cli/bin/cli basic generatedUploadUrl \
    --folder <folder value> \
    --namespace <namespace value> \
    --fileType <fileType value>
```

### Operation GetGameNamespaces

```sh
$ build/install/cli/bin/cli basic getGameNamespaces \
    --namespace <namespace value> \
    --activeOnly <activeOnly value - optional>
```

### Operation GetCountryGroups

```sh
$ build/install/cli/bin/cli basic getCountryGroups \
    --namespace <namespace value> \
    --groupCode <groupCode value - optional>
```

### Operation AddCountryGroup

```sh
$ build/install/cli/bin/cli basic addCountryGroup \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateCountryGroup

```sh
$ build/install/cli/bin/cli basic updateCountryGroup \
    --countryGroupCode <countryGroupCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteCountryGroup

```sh
$ build/install/cli/bin/cli basic deleteCountryGroup \
    --countryGroupCode <countryGroupCode value> \
    --namespace <namespace value>
```

### Operation GetLanguages

```sh
$ build/install/cli/bin/cli basic getLanguages \
    --namespace <namespace value>
```

### Operation GetTimeZones

```sh
$ build/install/cli/bin/cli basic getTimeZones \
    --namespace <namespace value>
```

### Operation GetUserProfileInfoByPublicId

```sh
$ build/install/cli/bin/cli basic getUserProfileInfoByPublicId \
    --namespace <namespace value> \
    --publicId <publicId value>
```

### Operation AdminGetUserProfilePublicInfoByIds

```sh
$ build/install/cli/bin/cli basic adminGetUserProfilePublicInfoByIds \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetNamespacePublisher

```sh
$ build/install/cli/bin/cli basic getNamespacePublisher \
    --namespace <namespace value>
```

### Operation GetPublisherConfig

```sh
$ build/install/cli/bin/cli basic getPublisherConfig \
    --configKey <configKey value> \
    --namespace <namespace value>
```

### Operation ChangeNamespaceStatus

```sh
$ build/install/cli/bin/cli basic changeNamespaceStatus \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AnonymizeUserProfile

```sh
$ build/install/cli/bin/cli basic anonymizeUserProfile \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GeneratedUserUploadContentUrl

```sh
$ build/install/cli/bin/cli basic generatedUserUploadContentUrl \
    --namespace <namespace value> \
    --userId <userId value> \
    --category <category value - optional> \
    --fileType <fileType value>
```

### Operation GetUserProfileInfo

```sh
$ build/install/cli/bin/cli basic getUserProfileInfo \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateUserProfile

```sh
$ build/install/cli/bin/cli basic updateUserProfile \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation DeleteUserProfile

```sh
$ build/install/cli/bin/cli basic deleteUserProfile \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetCustomAttributesInfo

```sh
$ build/install/cli/bin/cli basic getCustomAttributesInfo \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdateCustomAttributesPartially

```sh
$ build/install/cli/bin/cli basic updateCustomAttributesPartially \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation GetPrivateCustomAttributesInfo

```sh
$ build/install/cli/bin/cli basic getPrivateCustomAttributesInfo \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation UpdatePrivateCustomAttributesPartially

```sh
$ build/install/cli/bin/cli basic updatePrivateCustomAttributesPartially \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation UpdateUserProfileStatus

```sh
$ build/install/cli/bin/cli basic updateUserProfileStatus \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetTime

```sh
$ build/install/cli/bin/cli basic publicGetTime
```

### Operation PublicGetNamespaces

```sh
$ build/install/cli/bin/cli basic publicGetNamespaces \
    --activeOnly <activeOnly value - optional>
```

### Operation GetNamespace1

```sh
$ build/install/cli/bin/cli basic getNamespace1 \
    --namespace <namespace value>
```

### Operation PublicGeneratedUploadUrl

```sh
$ build/install/cli/bin/cli basic publicGeneratedUploadUrl \
    --folder <folder value> \
    --namespace <namespace value> \
    --fileType <fileType value>
```

### Operation PublicGetLanguages

```sh
$ build/install/cli/bin/cli basic publicGetLanguages \
    --namespace <namespace value>
```

### Operation PublicGetTimeZones

```sh
$ build/install/cli/bin/cli basic publicGetTimeZones \
    --namespace <namespace value>
```

### Operation PublicGetUserProfilePublicInfoByIds

```sh
$ build/install/cli/bin/cli basic publicGetUserProfilePublicInfoByIds \
    --namespace <namespace value> \
    --userIds <userIds value>
```

### Operation PublicBulkGetUserProfilePublicInfo

```sh
$ build/install/cli/bin/cli basic publicBulkGetUserProfilePublicInfo \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation PublicGetUserProfileInfoByPublicId

```sh
$ build/install/cli/bin/cli basic publicGetUserProfileInfoByPublicId \
    --namespace <namespace value> \
    --publicId <publicId value>
```

### Operation PublicGetNamespacePublisher

```sh
$ build/install/cli/bin/cli basic publicGetNamespacePublisher \
    --namespace <namespace value>
```

### Operation GetMyProfileInfo

```sh
$ build/install/cli/bin/cli basic getMyProfileInfo \
    --namespace <namespace value>
```

### Operation UpdateMyProfile

```sh
$ build/install/cli/bin/cli basic updateMyProfile \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation CreateMyProfile

```sh
$ build/install/cli/bin/cli basic createMyProfile \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetMyPrivateCustomAttributesInfo

```sh
$ build/install/cli/bin/cli basic getMyPrivateCustomAttributesInfo \
    --namespace <namespace value>
```

### Operation UpdateMyPrivateCustomAttributesPartially

```sh
$ build/install/cli/bin/cli basic updateMyPrivateCustomAttributesPartially \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetMyZipCode

```sh
$ build/install/cli/bin/cli basic getMyZipCode \
    --namespace <namespace value>
```

### Operation UpdateMyZipCode

```sh
$ build/install/cli/bin/cli basic updateMyZipCode \
    --namespace <namespace value> \
    --userZipCodeUpdate <json string for request body>
```

### Operation PublicGeneratedUserUploadContentUrl

```sh
$ build/install/cli/bin/cli basic publicGeneratedUserUploadContentUrl \
    --namespace <namespace value> \
    --userId <userId value> \
    --category <category value - optional> \
    --fileType <fileType value>
```

### Operation PublicGetUserProfileInfo

```sh
$ build/install/cli/bin/cli basic publicGetUserProfileInfo \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicUpdateUserProfile

```sh
$ build/install/cli/bin/cli basic publicUpdateUserProfile \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicCreateUserProfile

```sh
$ build/install/cli/bin/cli basic publicCreateUserProfile \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetCustomAttributesInfo

```sh
$ build/install/cli/bin/cli basic publicGetCustomAttributesInfo \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicUpdateCustomAttributesPartially

```sh
$ build/install/cli/bin/cli basic publicUpdateCustomAttributesPartially \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation PublicGetUserProfilePublicInfo

```sh
$ build/install/cli/bin/cli basic publicGetUserProfilePublicInfo \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicUpdateUserProfileStatus

```sh
$ build/install/cli/bin/cli basic publicUpdateUserProfileStatus \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

