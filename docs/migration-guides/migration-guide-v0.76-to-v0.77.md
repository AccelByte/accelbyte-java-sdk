<a name="v0.77.0"></a>
## [v0.77.0] - 2025-10-29

### BREAKING CHANGE

### Legal
The following operations have been updated:
  - Operation `net.accelbyte.sdk.api.legal.operations.agreement.RetrieveAcceptedAgreements` is renamed to `net.accelbyte.sdk.api.legal.operations.agreement.OldRetrieveAcceptedAgreements`
  - Operation `net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.RetrieveAcceptedAgreements1` is renamed to `net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.RetrieveAcceptedAgreements`
   
  - Operation `net.accelbyte.sdk.api.legal.operations.agreement.RetrieveAllUsersByPolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.agreement.OldRetrieveAllUsersByPolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.RetrieveAllUsersByPolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.agreement_with_namespace.RetrieveAllUsersByPolicyVersion`

  - Operation `net.accelbyte.sdk.api.legal.operations.agreement.ChangePreferenceConsent1` is renamed to `net.accelbyte.sdk.api.legal.operations.agreement.PublicChangePreferenceConsent`

  - Operation `net.accelbyte.sdk.api.legal.operations.agreement.IndirectBulkAcceptVersionedPolicy1` is renamed to `net.accelbyte.sdk.api.legal.operations.agreement.PublicIndirectBulkAcceptVersionedPolicy`

  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies.CreatePolicy` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldCreatePolicy`
  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.CreatePolicy1` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.CreatePolicy`

  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies.PartialUpdatePolicy` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldPartialUpdatePolicy`
  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.PartialUpdatePolicy1` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.PartialUpdatePolicy`
  
  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies.RetrieveAllPolicyTypes` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldRetrieveAllPolicyTypes`
  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.RetrieveAllPolicyTypes1` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.RetrieveAllPolicyTypes`

  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies.RetrievePolicyCountry` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldRetrievePolicyCountry`
  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.RetrievePolicyCountry1` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.RetrievePolicyCountry`

  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies.RetrieveSinglePolicy` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies.OldRetrieveSinglePolicy`
  - Operation `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.RetrieveSinglePolicy1` is renamed to `net.accelbyte.sdk.api.legal.operations.base_legal_policies_with_namespace.RetrieveSinglePolicy`

  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.CreateLocalizedPolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldCreateLocalizedPolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.CreateLocalizedPolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.CreateLocalizedPolicyVersion`

  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.RetrieveSingleLocalizedPolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldRetrieveSingleLocalizedPolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.RetrieveSingleLocalizedPolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.RetrieveSingleLocalizedPolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.RetrieveSingleLocalizedPolicyVersion2` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldPublicRetrieveSingleLocalizedPolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.RetrieveSingleLocalizedPolicyVersion3` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.PublicRetrieveSingleLocalizedPolicyVersion`

  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.RetrieveLocalizedPolicyVersions` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldRetrieveLocalizedPolicyVersions`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.RetrieveLocalizedPolicyVersions1` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.RetrieveLocalizedPolicyVersions`

  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.RequestPresignedURL` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldRequestPresignedURL`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.RequestPresignedURL1` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.RequestPresignedURL`

  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.UpdateLocalizedPolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldUpdateLocalizedPolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.UpdateLocalizedPolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.UpdateLocalizedPolicyVersion`

  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.SetDefaultPolicy` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions.OldSetDefaultLocalizedPolicy`
  - Operation `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.SetDefaultPolicy1` is renamed to `net.accelbyte.sdk.api.legal.operations.localized_policy_versions_with_namespace.SetDefaultLocalizedPolicy`
  - Operation `net.accelbyte.sdk.api.legal.operations.policies.SetDefaultPolicy2` is renamed to `net.accelbyte.sdk.api.legal.operations.policies.OldSetDefaultPolicy`
  - Operation `net.accelbyte.sdk.api.legal.operations.policies_with_namespace.SetDefaultPolicy3` is renamed to `net.accelbyte.sdk.api.legal.operations.policies_with_namespace.SetDefaultPolicy`

  - Operation `net.accelbyte.sdk.api.legal.operations.policies.UpdatePolicy` is renamed to `net.accelbyte.sdk.api.legal.operations.policies.OldUpdatePolicy`
  - Operation `net.accelbyte.sdk.api.legal.operations.policies_with_namespace.UpdatePolicy1` is renamed to `net.accelbyte.sdk.api.legal.operations.policies_with_namespace.UpdatePolicy`

  - Operation `net.accelbyte.sdk.api.legal.operations.policies.RetrieveLatestPoliciesByNamespaceAndCountryPublic` is renamed to `net.accelbyte.sdk.api.legal.operations.policies.OldRetrieveLatestPoliciesByNamespaceAndCountryPublic`
  - Operation `net.accelbyte.sdk.api.legal.operations.policies_with_namespace_v2.RetrieveLatestPoliciesByNamespaceAndCountryPublic1` is renamed to `net.accelbyte.sdk.api.legal.operations.policies_with_namespace_v2.RetrieveLatestPoliciesByNamespaceAndCountryPublic`

  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions.CreatePolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions.OldCreatePolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.CreatePolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.CreatePolicyVersion`
  
  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions.PublishPolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions.OldPublishPolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.PublishPolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.PublishPolicyVersion`

  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions.RetrieveSinglePolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions.OldRetrieveSinglePolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.RetrieveSinglePolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.RetrieveSinglePolicyVersion`

  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions.UpdatePolicyVersion` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions.OldUpdatePolicyVersion`
  - Operation `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.UpdatePolicyVersion1` is renamed to `net.accelbyte.sdk.api.legal.operations.policy_versions_with_namespace.UpdatePolicyVersion`
  
