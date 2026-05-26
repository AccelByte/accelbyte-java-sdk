<a name="v0.81.0"></a>
## [v0.81.0] - 2026-05-26

### BREAKING CHANGE

#### Following changes in OpenAPI spec:

1. Challenge Service
   - Operation `net.accelbyte.sdk.api.challenge.operations.challenge_configuration.AdminDeleteTiedChallenge`
     - Constructor signature changed: added parameter `safeDelete` (String). Old: `AdminDeleteTiedChallenge(String challengeCode, String namespace)`. New: `AdminDeleteTiedChallenge(String challengeCode, String namespace, String safeDelete)`.

2. Platform Service
   - Operation `net.accelbyte.sdk.api.platform.operations.payment_station.PublicGetQRCode`
     - `parseResponse` return type changed from `BinarySchema` to `InputStream`. The `BinarySchema` model class has been removed.
     - Wrapper method `net.accelbyte.sdk.api.platform.wrappers.PaymentStation.publicGetQRCode` return type changed from `BinarySchema` to `InputStream`.
   - Operation `net.accelbyte.sdk.api.platform.operations.wallet.CheckBalance`
     - Method changed: previously `handleEmptyResponse` (void), now `parseResponse` returning `CheckBalanceResponse`.
     - Wrapper method `net.accelbyte.sdk.api.platform.wrappers.Wallet.checkBalance` return type changed from `void` to `CheckBalanceResponse`.

3. Session Service
   - Operation `net.accelbyte.sdk.api.session.operations.game_session.JoinGameSession`
     - Constructor signature changed: added required parameter `body` (ApimodelsJoinSessionRequest). Old: `JoinGameSession(String namespace, String sessionId)`. New: `JoinGameSession(String namespace, String sessionId, ApimodelsJoinSessionRequest body)`.
   - Operation `net.accelbyte.sdk.api.session.operations.party.PublicPartyJoin`
     - Constructor signature changed: added required parameter `body` (ApimodelsJoinSessionRequest). Old: `PublicPartyJoin(String namespace, String partyId)`. New: `PublicPartyJoin(String namespace, String partyId, ApimodelsJoinSessionRequest body)`.

### DEPRECATION

The following operations are deprecated and will be removed in a future version:

1. Inventory Service
   - `net.accelbyte.sdk.api.inventory.operations.admin_chaining_operations.AdminCreateChainingOperations`

2. Legal Service
   - `net.accelbyte.sdk.api.legal.operations.agreement.OldRetrieveAcceptedAgreements`
   - `net.accelbyte.sdk.api.legal.operations.agreement.OldRetrieveAllUsersByPolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldCreatePolicy`
   - `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldPartialUpdatePolicy`
   - `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldRetrieveAllPolicyTypes`
   - `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldRetrievePolicyCountry`
   - `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldRetrieveSinglePolicy`
   - `net.accelbyte.sdk.api.legal.operations.base_legal_policies.RetrieveAllLegalPolicies`
   - `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldCreateLocalizedPolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldRequestPresignedURL`
   - `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldRetrieveLocalizedPolicyVersions`
   - `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldRetrieveSingleLocalizedPolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldSetDefaultLocalizedPolicy`
   - `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldUpdateLocalizedPolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.policies.OldSetDefaultPolicy`
   - `net.accelbyte.sdk.api.legal.operations.policies.OldUpdatePolicy`
   - `net.accelbyte.sdk.api.legal.operations.policies.RetrievePolicies`
   - `net.accelbyte.sdk.api.legal.operations.policy_versions.OldCreatePolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.policy_versions.OldPublishPolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.policy_versions.OldRetrieveSinglePolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.policy_versions.OldUpdatePolicyVersion`
   - `net.accelbyte.sdk.api.legal.operations.user_info.GetUserInfoStatus`

### NEW OPERATIONS

1. Achievement Service
   - `net.accelbyte.sdk.api.achievement.operations.user_achievements.AdminBatchQueryUserAchievements`

2. CSM Service
   - `net.accelbyte.sdk.api.csm.operations.app_ui.CreateAppUI`
   - `net.accelbyte.sdk.api.csm.operations.app_ui.DeleteAppUI`
   - `net.accelbyte.sdk.api.csm.operations.app_ui.ListAppUI`
   - `net.accelbyte.sdk.api.csm.operations.app_ui.UploadAppUIFile`
   - `net.accelbyte.sdk.api.csm.operations.app_v2.ApplyAppConfigV2`
   - `net.accelbyte.sdk.api.csm.operations.extend_files.GetExtendFile`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources.CreateNewNoSQLDatabaseCredentialV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.CreateKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.CreateKeyValueCredentialV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.DeleteKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.GetIntegrationAppKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.GetKeyValueClusterLimitConfigV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.GetKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.GetListIntegratedAppKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.IntegrateAppKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.ListKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.RemoveIntegrationAppKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_key_value.UpdateKeyValueClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.CreateSQLClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.CreateSQLDatabaseCredentialV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.CreateSQLDatabaseV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.DeleteSQLClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.DeleteSQLDatabaseV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.GetSQLAppListV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.GetSQLClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.GetSQLDatabaseV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.StartSQLClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.StopSQLClusterV2`
   - `net.accelbyte.sdk.api.csm.operations.managed_resources_sql.UpdateSQLClusterV2`

3. IAM Service
   - `net.accelbyte.sdk.api.iam.operations.clients_config_v3.AdminUpdateModulePackage`
   - `net.accelbyte.sdk.api.iam.operations.input_validations.AdminGetNamespaceScopedInputValidations`
   - `net.accelbyte.sdk.api.iam.operations.input_validations.AdminResetNamespaceScopedInputValidations`
   - `net.accelbyte.sdk.api.iam.operations.input_validations.AdminUpdateNamespaceScopedInputValidations`
   - `net.accelbyte.sdk.api.iam.operations.input_validations.PublicGetNamespaceScopedInputValidationByField`
   - `net.accelbyte.sdk.api.iam.operations.input_validations.PublicGetNamespaceScopedInputValidations`
   - `net.accelbyte.sdk.api.iam.operations.o_auth2_0.GetAuthorizationServerMetadataWithNamespace`
   - `net.accelbyte.sdk.api.iam.operations.o_auth2_0.OAuthDynamicClientRegisterWithNamespaceV3`
   - `net.accelbyte.sdk.api.iam.operations.third_party_credential.GetThirdPartyLoginPlatformDefaultsV3`

4. Platform Service
   - `net.accelbyte.sdk.api.platform.operations.iap.AdminSyncTwitchDropsEntitlement`

5. Session Service
   - `net.accelbyte.sdk.api.session.operations.game_session.PublicGetGameSessionPassword`
   - `net.accelbyte.sdk.api.session.operations.game_session.PublicUpdateGameSessionPassword`
   - `net.accelbyte.sdk.api.session.operations.party.PublicGetPartyPassword`
   - `net.accelbyte.sdk.api.session.operations.party.PublicUpdatePartyPassword`
   - `net.accelbyte.sdk.api.session.operations.session_storage.PublicReplaceSessionStorageLeaderV2`
   - `net.accelbyte.sdk.api.session.operations.session_storage.PublicReplaceSessionStorageUserV2`
   - `net.accelbyte.sdk.api.session.operations.session_storage.PublicUpdateInsertSessionStorageLeaderV2`
   - `net.accelbyte.sdk.api.session.operations.session_storage.PublicUpdateInsertSessionStorageUserV2`
