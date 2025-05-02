## Java Extend SDK CLI Sample App Operation Index for Gdpr service

### Operation AdminGetListDeletionDataRequest

```sh
$ build/install/cli/bin/cli gdpr adminGetListDeletionDataRequest \
    --namespace <namespace value> \
    --after <after value - optional> \
    --before <before value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --requestDate <requestDate value - optional>
```

### Operation GetAdminEmailConfiguration

```sh
$ build/install/cli/bin/cli gdpr getAdminEmailConfiguration \
    --namespace <namespace value>
```

### Operation UpdateAdminEmailConfiguration

```sh
$ build/install/cli/bin/cli gdpr updateAdminEmailConfiguration \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SaveAdminEmailConfiguration

```sh
$ build/install/cli/bin/cli gdpr saveAdminEmailConfiguration \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteAdminEmailConfiguration

```sh
$ build/install/cli/bin/cli gdpr deleteAdminEmailConfiguration \
    --namespace <namespace value> \
    --emails <emails value>
```

### Operation AdminGetPlatformAccountClosureClients

```sh
$ build/install/cli/bin/cli gdpr adminGetPlatformAccountClosureClients \
    --namespace <namespace value>
```

### Operation AdminValidateXboxBPCertFile

```sh
$ build/install/cli/bin/cli gdpr adminValidateXboxBPCertFile \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminGetPlatformAccountClosureClient

```sh
$ build/install/cli/bin/cli gdpr adminGetPlatformAccountClosureClient \
    --namespace <namespace value> \
    --platform <platform value>
```

### Operation AdminUpdatePlatformAccountClosureClient

```sh
$ build/install/cli/bin/cli gdpr adminUpdatePlatformAccountClosureClient \
    --namespace <namespace value> \
    --platform <platform value> \
    --body <json string for request body>
```

### Operation AdminDeletePlatformAccountClosureClient

```sh
$ build/install/cli/bin/cli gdpr adminDeletePlatformAccountClosureClient \
    --namespace <namespace value> \
    --platform <platform value>
```

### Operation AdminMockPlatformAccountClosureData

```sh
$ build/install/cli/bin/cli gdpr adminMockPlatformAccountClosureData \
    --namespace <namespace value> \
    --platform <platform value> \
    --body <json string for request body>
```

### Operation AdminGetListPersonalDataRequest

```sh
$ build/install/cli/bin/cli gdpr adminGetListPersonalDataRequest \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --requestDate <requestDate value - optional>
```

### Operation AdminGetServicesConfiguration

```sh
$ build/install/cli/bin/cli gdpr adminGetServicesConfiguration \
    --namespace <namespace value>
```

### Operation AdminUpdateServicesConfiguration

```sh
$ build/install/cli/bin/cli gdpr adminUpdateServicesConfiguration \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminResetServicesConfiguration

```sh
$ build/install/cli/bin/cli gdpr adminResetServicesConfiguration \
    --namespace <namespace value>
```

### Operation AdminGetPlatformAccountClosureServicesConfiguration

```sh
$ build/install/cli/bin/cli gdpr adminGetPlatformAccountClosureServicesConfiguration \
    --namespace <namespace value>
```

### Operation AdminUpdatePlatformAccountClosureServicesConfiguration

```sh
$ build/install/cli/bin/cli gdpr adminUpdatePlatformAccountClosureServicesConfiguration \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AdminResetPlatformAccountClosureServicesConfiguration

```sh
$ build/install/cli/bin/cli gdpr adminResetPlatformAccountClosureServicesConfiguration \
    --namespace <namespace value>
```

### Operation AdminGetUserPlatformAccountClosureHistories

```sh
$ build/install/cli/bin/cli gdpr adminGetUserPlatformAccountClosureHistories \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --platform <platform value - optional> \
    --userId <userId value - optional>
```

### Operation AdminGetUserAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr adminGetUserAccountDeletionRequest \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminSubmitUserAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr adminSubmitUserAccountDeletionRequest \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminCancelUserAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr adminCancelUserAccountDeletionRequest \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AdminGetUserPersonalDataRequests

```sh
$ build/install/cli/bin/cli gdpr adminGetUserPersonalDataRequests \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminRequestDataRetrieval

```sh
$ build/install/cli/bin/cli gdpr adminRequestDataRetrieval \
    --namespace <namespace value> \
    --userId <userId value> \
    --password <password value - optional>
```

### Operation AdminCancelUserPersonalDataRequest

```sh
$ build/install/cli/bin/cli gdpr adminCancelUserPersonalDataRequest \
    --namespace <namespace value> \
    --requestDate <requestDate value> \
    --userId <userId value>
```

### Operation AdminGeneratePersonalDataURL

```sh
$ build/install/cli/bin/cli gdpr adminGeneratePersonalDataURL \
    --namespace <namespace value> \
    --requestDate <requestDate value> \
    --userId <userId value> \
    --password <password value - optional>
```

### Operation PublicSubmitUserAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr publicSubmitUserAccountDeletionRequest \
    --namespace <namespace value> \
    --userId <userId value> \
    --languageTag <languageTag value - optional> \
    --password <password value>
```

### Operation PublicCancelUserAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr publicCancelUserAccountDeletionRequest \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicGetUserAccountDeletionStatus

```sh
$ build/install/cli/bin/cli gdpr publicGetUserAccountDeletionStatus \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation PublicGetUserPersonalDataRequests

```sh
$ build/install/cli/bin/cli gdpr publicGetUserPersonalDataRequests \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation PublicRequestDataRetrieval

```sh
$ build/install/cli/bin/cli gdpr publicRequestDataRetrieval \
    --namespace <namespace value> \
    --userId <userId value> \
    --languageTag <languageTag value - optional> \
    --password <password value>
```

### Operation PublicCancelUserPersonalDataRequest

```sh
$ build/install/cli/bin/cli gdpr publicCancelUserPersonalDataRequest \
    --namespace <namespace value> \
    --requestDate <requestDate value> \
    --userId <userId value>
```

### Operation PublicGeneratePersonalDataURL

```sh
$ build/install/cli/bin/cli gdpr publicGeneratePersonalDataURL \
    --namespace <namespace value> \
    --requestDate <requestDate value> \
    --userId <userId value> \
    --password <password value>
```

### Operation PublicSubmitMyAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr publicSubmitMyAccountDeletionRequest \
    --platformId <platformId value> \
    --platformToken <platformToken value>
```

### Operation PublicCancelMyAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr publicCancelMyAccountDeletionRequest
```

### Operation PublicGetMyAccountDeletionStatus

```sh
$ build/install/cli/bin/cli gdpr publicGetMyAccountDeletionStatus
```

### Operation S2SGetListFinishedAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr s2sGetListFinishedAccountDeletionRequest \
    --namespace <namespace value> \
    --end <end value> \
    --start <start value>
```

### Operation S2SGetListFinishedPersonalDataRequest

```sh
$ build/install/cli/bin/cli gdpr s2sGetListFinishedPersonalDataRequest \
    --namespace <namespace value> \
    --end <end value> \
    --start <start value>
```

### Operation S2SGetDataRequestByRequestID

```sh
$ build/install/cli/bin/cli gdpr s2sGetDataRequestByRequestID \
    --namespace <namespace value> \
    --requestId <requestId value>
```

### Operation S2SSubmitUserAccountDeletionRequest

```sh
$ build/install/cli/bin/cli gdpr s2sSubmitUserAccountDeletionRequest \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation S2SRequestDataRetrieval

```sh
$ build/install/cli/bin/cli gdpr s2sRequestDataRetrieval \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation S2SGeneratePersonalDataURL

```sh
$ build/install/cli/bin/cli gdpr s2sGeneratePersonalDataURL \
    --namespace <namespace value> \
    --requestDate <requestDate value> \
    --userId <userId value>
```

