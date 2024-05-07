<a name="v0.62.0"></a>
## [v0.62.0] - 2024-05-07

### BREAKING CHANGE

### Basic
The following operations are moved to a different package and the corresponding wrapper methods follows.
```
- net.accelbyte.sdk.api.basic.{ equ8_config -> config }.DeleteConfig
```

The following operation(s) has been updated.
- Operation `net.accelbyte.sdk.api.basic.operations.config.GetConfig1`
    - renamed to `GetConfig`
- Operation `net.accelbyte.sdk.api.basic.operations.config.UpdateConfig1`
    - renamed to `UpdateConfig`

All operation(s) under `net.accelbyte.sdk.api.basic.operations.user_action` have been removed.
All operation(s) under `net.accelbyte.sdk.api.basic.operations.equ8_config` have been removed.

### Legal

The following operation(s) has been updated.
- Operation `net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.DownloadExportedAgreementsInCSV`
    - parameter `policyVersionId` is removed
- Operation `net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.InitiateExportAgreementsToCSV`
    - parameter `policyVersionId` is removed