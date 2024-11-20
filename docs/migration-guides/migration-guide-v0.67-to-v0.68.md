<a name="v0.68.0"></a>
## [v0.68.0] - 2024-11-21

### BREAKING CHANGE

### AMS
The following have been updated:
- Operation `net.accelbyte.sdk.api.ams.operations.account.AdminAccountLinkTokenPost` is renamed to `net.accelbyte.sdk.api.ams.operations.account.AdminAccountLink`
- Model `net.accelbyte.sdk.api.ams.models.ApiAvailableInstanceType` is renamed to `net.accelbyte.sdk.api.ams.models.ApiInstanceTypeForNamespaceResponse`.
- Model `net.accelbyte.sdk.api.ams.models.ApiAvailableInstanceTypesResponse` is renamed to `net.accelbyte.sdk.api.ams.models.ApiInstanceTypesForNamespaceResponse`
- Model `net.accelbyte.sdk.api.ams.models`
  - Field `coredump` type is changed from `net.accelbyte.sdk.api.ams.models.ApiArtifactTypeSamplingRules` to `net.accelbyte.sdk.api.ams.models.ApiCoredumpSamplingRules`

### Session
The following have been updated:
- Operation `net.accelbyte.sdk.api.session.operations.certificate.HandleUploadXboxPFXCertificate` is renamed to `net.accelbyte.sdk.api.session.operations.certificate.AdminUploadXBoxCertificate`

### Social
The following operation(s) has been updated.
- Operation `net.accelbyte.sdk.api.social.operations.stat_configuration.CreateStat`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.stat_configuration.CreateStat1`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.stat_configuration.UpdateStat`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.stat_cycle_configuration.BulkAddStats`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.stat_cycle_configuration.BulkGetStatCycle`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.stat_cycle_configuration.BulkGetStatCycle1`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.stat_cycle_configuration.CreateStatCycle`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.stat_cycle_configuration.UpdateStatCycle`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkCreateUserStatItems`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkGetOrDefaultByUserId`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkIncUserStatItem`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkIncUserStatItem1`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkIncUserStatItemValue`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkIncUserStatItemValue1`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkIncUserStatItemValue2`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkResetUserStatItem`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkResetUserStatItem1`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkResetUserStatItem2`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkResetUserStatItem3`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkResetUserStatItemValues`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkUpdateUserStatItem`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkUpdateUserStatItem1`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkUpdateUserStatItem2`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.BulkUpdateUserStatItemV2`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.IncUserStatItemValue`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.PublicBulkCreateUserStatItems`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.PublicBulkIncUserStatItem`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.PublicBulkIncUserStatItem1`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.PublicBulkIncUserStatItemValue`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.PublicIncUserStatItem`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.PublicIncUserStatItemValue`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.ResetUserStatItemValue`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.UpdateUserStatItemValue`
    - Body is now required.
- Operation `net.accelbyte.sdk.api.social.operations.user_statistic.UpdateUserStatItemValue1`
    - Body is now required.
