<a name="v0.70.0"></a>
## [v0.70.0] - 2025-02-07

### BREAKING CHANGE

### AMS

The following have been updated:

- Model `net.accelbyte.sdk.api.ams.models.ApiInstanceTypeForNamespaceResponse` is renamed to `net.accelbyte.sdk.api.ams.models.ApiInstanceType`
- Model `net.accelbyte.sdk.api.ams.models.ApiInstanceTypesForNamespaceResponse` is renamed to `net.accelbyte.sdk.api.ams.models.ApiInstanceTypesResponse`

### Challenge

- Operation `net.accelbyte.sdk.api.challenge.models.ModelCreateGoalRequest`
    - field `Schedule` type is changed from `net.accelbyte.sdk.api.ams.models.ModelGoalSchedule` to `net.accelbyte.sdk.api.ams.models.ModelGoalScheduleRequest`
- Operation `net.accelbyte.sdk.api.challenge.models.ModelUpdateGoalRequest`
    - field `Schedule` type is changed from `net.accelbyte.sdk.api.ams.models.ModelGoalSchedule` to `net.accelbyte.sdk.api.ams.models.ModelGoalScheduleRequest`

### GDPR

- Operation `net.accelbyte.sdk.api.gdpr.operations.data_retrieval.AdminGeneratePersonalDataURL`
    - parameter `password` is changed from required to optional.

### IAM

- Operation `net.accelbyte.sdk.api.gdpr.operations.data_retrieval.PublicUpgradeHeadlessWithCodeV4Forward`
    - request body type changed from `AccountUpgradeHeadlessAccountWithVerificationCodeRequestV4 ` to `AccountUpgradeHeadlessAccountWithVerificationCodeForwardRequestV4`
