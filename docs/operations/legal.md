# Legal Service Index

&nbsp;  

## Operations

### Agreement Wrapper:  [Agreement](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/Agreement.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/agreements/localized-policy-versions/preferences/namespaces/{namespace}/userId/{userId}` | PATCH | ChangePreferenceConsent | [ChangePreferenceConsent](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/ChangePreferenceConsent.java) | [ChangePreferenceConsent](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/ChangePreferenceConsent.java) |
| `/agreement/admin/agreements/policies/users/{userId}` | GET | RetrieveAcceptedAgreements | [RetrieveAcceptedAgreements](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/RetrieveAcceptedAgreements.java) | [RetrieveAcceptedAgreements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/RetrieveAcceptedAgreements.java) |
| `/agreement/admin/agreements/policy-versions/users` | GET | RetrieveAllUsersByPolicyVersion | [RetrieveAllUsersByPolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/RetrieveAllUsersByPolicyVersion.java) | [RetrieveAllUsersByPolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/RetrieveAllUsersByPolicyVersion.java) |
| `/agreement/public/agreements/localized-policy-versions/preferences` | PATCH | ChangePreferenceConsent1 | [ChangePreferenceConsent1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/ChangePreferenceConsent1.java) | [ChangePreferenceConsent1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/ChangePreferenceConsent1.java) |
| `/agreement/public/agreements/localized-policy-versions/{localizedPolicyVersionId}` | POST | AcceptVersionedPolicy | [AcceptVersionedPolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/AcceptVersionedPolicy.java) | [AcceptVersionedPolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/AcceptVersionedPolicy.java) |
| `/agreement/public/agreements/policies` | GET | RetrieveAgreementsPublic | [RetrieveAgreementsPublic](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/RetrieveAgreementsPublic.java) | [RetrieveAgreementsPublic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/RetrieveAgreementsPublic.java) |
| `/agreement/public/agreements/policies` | POST | BulkAcceptVersionedPolicy | [BulkAcceptVersionedPolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/BulkAcceptVersionedPolicy.java) | [BulkAcceptVersionedPolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/BulkAcceptVersionedPolicy.java) |
| `/agreement/public/agreements/policies/namespaces/{namespace}/countries/{countryCode}/clients/{clientId}/users/{userId}` | POST | IndirectBulkAcceptVersionedPolicyV2 | [IndirectBulkAcceptVersionedPolicyV2](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/IndirectBulkAcceptVersionedPolicyV2.java) | [IndirectBulkAcceptVersionedPolicyV2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/IndirectBulkAcceptVersionedPolicyV2.java) |
| `/agreement/public/agreements/policies/users/{userId}` | POST | IndirectBulkAcceptVersionedPolicy1 | [IndirectBulkAcceptVersionedPolicy1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement/IndirectBulkAcceptVersionedPolicy1.java) | [IndirectBulkAcceptVersionedPolicy1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement/IndirectBulkAcceptVersionedPolicy1.java) |

### Base Legal Policies Wrapper:  [BaseLegalPolicies](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/BaseLegalPolicies.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/base-policies` | GET | RetrieveAllLegalPolicies | [RetrieveAllLegalPolicies](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies/RetrieveAllLegalPolicies.java) | [RetrieveAllLegalPolicies](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies/RetrieveAllLegalPolicies.java) |
| `/agreement/admin/base-policies` | POST | CreatePolicy | [CreatePolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies/CreatePolicy.java) | [CreatePolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies/CreatePolicy.java) |
| `/agreement/admin/base-policies/{basePolicyId}` | GET | RetrieveSinglePolicy | [RetrieveSinglePolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies/RetrieveSinglePolicy.java) | [RetrieveSinglePolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies/RetrieveSinglePolicy.java) |
| `/agreement/admin/base-policies/{basePolicyId}` | PATCH | PartialUpdatePolicy | [PartialUpdatePolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies/PartialUpdatePolicy.java) | [PartialUpdatePolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies/PartialUpdatePolicy.java) |
| `/agreement/admin/base-policies/{basePolicyId}/countries/{countryCode}` | GET | RetrievePolicyCountry | [RetrievePolicyCountry](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies/RetrievePolicyCountry.java) | [RetrievePolicyCountry](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies/RetrievePolicyCountry.java) |
| `/agreement/admin/policy-types` | GET | RetrieveAllPolicyTypes | [RetrieveAllPolicyTypes](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies/RetrieveAllPolicyTypes.java) | [RetrieveAllPolicyTypes](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies/RetrieveAllPolicyTypes.java) |

### Localized Policy Versions Wrapper:  [LocalizedPolicyVersions](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/LocalizedPolicyVersions.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/localized-policy-versions/versions/{policyVersionId}` | GET | RetrieveLocalizedPolicyVersions | [RetrieveLocalizedPolicyVersions](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions/RetrieveLocalizedPolicyVersions.java) | [RetrieveLocalizedPolicyVersions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions/RetrieveLocalizedPolicyVersions.java) |
| `/agreement/admin/localized-policy-versions/versions/{policyVersionId}` | POST | CreateLocalizedPolicyVersion | [CreateLocalizedPolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions/CreateLocalizedPolicyVersion.java) | [CreateLocalizedPolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions/CreateLocalizedPolicyVersion.java) |
| `/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}` | GET | RetrieveSingleLocalizedPolicyVersion | [RetrieveSingleLocalizedPolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions/RetrieveSingleLocalizedPolicyVersion.java) | [RetrieveSingleLocalizedPolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions/RetrieveSingleLocalizedPolicyVersion.java) |
| `/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}` | PUT | UpdateLocalizedPolicyVersion | [UpdateLocalizedPolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions/UpdateLocalizedPolicyVersion.java) | [UpdateLocalizedPolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions/UpdateLocalizedPolicyVersion.java) |
| `/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}/attachments` | POST | RequestPresignedURL | [RequestPresignedURL](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions/RequestPresignedURL.java) | [RequestPresignedURL](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions/RequestPresignedURL.java) |
| `/agreement/admin/localized-policy-versions/{localizedPolicyVersionId}/default` | PATCH | SetDefaultPolicy | [SetDefaultPolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions/SetDefaultPolicy.java) | [SetDefaultPolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions/SetDefaultPolicy.java) |
| `/agreement/public/localized-policy-versions/{localizedPolicyVersionId}` | GET | RetrieveSingleLocalizedPolicyVersion2 | [RetrieveSingleLocalizedPolicyVersion2](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions/RetrieveSingleLocalizedPolicyVersion2.java) | [RetrieveSingleLocalizedPolicyVersion2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions/RetrieveSingleLocalizedPolicyVersion2.java) |

### Agreement With Namespace Wrapper:  [AgreementWithNamespace](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/AgreementWithNamespace.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/namespaces/{namespace}/agreements` | POST | RetrieveAcceptedAgreementsForMultiUsers | [RetrieveAcceptedAgreementsForMultiUsers](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement_with_namespace/RetrieveAcceptedAgreementsForMultiUsers.java) | [RetrieveAcceptedAgreementsForMultiUsers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement_with_namespace/RetrieveAcceptedAgreementsForMultiUsers.java) |
| `/agreement/admin/namespaces/{namespace}/agreements/policies/users/{userId}` | GET | RetrieveAcceptedAgreements1 | [RetrieveAcceptedAgreements1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement_with_namespace/RetrieveAcceptedAgreements1.java) | [RetrieveAcceptedAgreements1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement_with_namespace/RetrieveAcceptedAgreements1.java) |
| `/agreement/admin/namespaces/{namespace}/agreements/policy-versions/users` | GET | RetrieveAllUsersByPolicyVersion1 | [RetrieveAllUsersByPolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/agreement_with_namespace/RetrieveAllUsersByPolicyVersion1.java) | [RetrieveAllUsersByPolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/agreement_with_namespace/RetrieveAllUsersByPolicyVersion1.java) |

### Base Legal Policies With Namespace Wrapper:  [BaseLegalPoliciesWithNamespace](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/BaseLegalPoliciesWithNamespace.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/namespaces/{namespace}/base-policies` | GET | RetrieveAllLegalPoliciesByNamespace | [RetrieveAllLegalPoliciesByNamespace](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies_with_namespace/RetrieveAllLegalPoliciesByNamespace.java) | [RetrieveAllLegalPoliciesByNamespace](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies_with_namespace/RetrieveAllLegalPoliciesByNamespace.java) |
| `/agreement/admin/namespaces/{namespace}/base-policies` | POST | CreatePolicy1 | [CreatePolicy1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies_with_namespace/CreatePolicy1.java) | [CreatePolicy1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies_with_namespace/CreatePolicy1.java) |
| `/agreement/admin/namespaces/{namespace}/base-policies/{basePolicyId}` | GET | RetrieveSinglePolicy1 | [RetrieveSinglePolicy1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies_with_namespace/RetrieveSinglePolicy1.java) | [RetrieveSinglePolicy1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies_with_namespace/RetrieveSinglePolicy1.java) |
| `/agreement/admin/namespaces/{namespace}/base-policies/{basePolicyId}` | PATCH | PartialUpdatePolicy1 | [PartialUpdatePolicy1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies_with_namespace/PartialUpdatePolicy1.java) | [PartialUpdatePolicy1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies_with_namespace/PartialUpdatePolicy1.java) |
| `/agreement/admin/namespaces/{namespace}/base-policies/{basePolicyId}/countries/{countryCode}` | GET | RetrievePolicyCountry1 | [RetrievePolicyCountry1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies_with_namespace/RetrievePolicyCountry1.java) | [RetrievePolicyCountry1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies_with_namespace/RetrievePolicyCountry1.java) |
| `/agreement/admin/namespaces/{namespace}/policy-types` | GET | RetrieveAllPolicyTypes1 | [RetrieveAllPolicyTypes1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/base_legal_policies_with_namespace/RetrieveAllPolicyTypes1.java) | [RetrieveAllPolicyTypes1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/base_legal_policies_with_namespace/RetrieveAllPolicyTypes1.java) |

### Localized Policy Versions With Namespace Wrapper:  [LocalizedPolicyVersionsWithNamespace](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/LocalizedPolicyVersionsWithNamespace.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/namespaces/{namespace}/localized-policy-versions/versions/{policyVersionId}` | GET | RetrieveLocalizedPolicyVersions1 | [RetrieveLocalizedPolicyVersions1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions_with_namespace/RetrieveLocalizedPolicyVersions1.java) | [RetrieveLocalizedPolicyVersions1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions_with_namespace/RetrieveLocalizedPolicyVersions1.java) |
| `/agreement/admin/namespaces/{namespace}/localized-policy-versions/versions/{policyVersionId}` | POST | CreateLocalizedPolicyVersion1 | [CreateLocalizedPolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions_with_namespace/CreateLocalizedPolicyVersion1.java) | [CreateLocalizedPolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions_with_namespace/CreateLocalizedPolicyVersion1.java) |
| `/agreement/admin/namespaces/{namespace}/localized-policy-versions/{localizedPolicyVersionId}` | GET | RetrieveSingleLocalizedPolicyVersion1 | [RetrieveSingleLocalizedPolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions_with_namespace/RetrieveSingleLocalizedPolicyVersion1.java) | [RetrieveSingleLocalizedPolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions_with_namespace/RetrieveSingleLocalizedPolicyVersion1.java) |
| `/agreement/admin/namespaces/{namespace}/localized-policy-versions/{localizedPolicyVersionId}` | PUT | UpdateLocalizedPolicyVersion1 | [UpdateLocalizedPolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions_with_namespace/UpdateLocalizedPolicyVersion1.java) | [UpdateLocalizedPolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions_with_namespace/UpdateLocalizedPolicyVersion1.java) |
| `/agreement/admin/namespaces/{namespace}/localized-policy-versions/{localizedPolicyVersionId}/attachments` | POST | RequestPresignedURL1 | [RequestPresignedURL1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions_with_namespace/RequestPresignedURL1.java) | [RequestPresignedURL1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions_with_namespace/RequestPresignedURL1.java) |
| `/agreement/admin/namespaces/{namespace}/localized-policy-versions/{localizedPolicyVersionId}/default` | PATCH | SetDefaultPolicy1 | [SetDefaultPolicy1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions_with_namespace/SetDefaultPolicy1.java) | [SetDefaultPolicy1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions_with_namespace/SetDefaultPolicy1.java) |
| `/agreement/public/namespaces/{namespace}/localized-policy-versions/{localizedPolicyVersionId}` | GET | RetrieveSingleLocalizedPolicyVersion3 | [RetrieveSingleLocalizedPolicyVersion3](../../src/main/java/net/accelbyte/sdk/api/legal/operations/localized_policy_versions_with_namespace/RetrieveSingleLocalizedPolicyVersion3.java) | [RetrieveSingleLocalizedPolicyVersion3](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/localized_policy_versions_with_namespace/RetrieveSingleLocalizedPolicyVersion3.java) |

### Policy Versions With Namespace Wrapper:  [PolicyVersionsWithNamespace](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/PolicyVersionsWithNamespace.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/namespaces/{namespace}/policies/versions/{policyVersionId}` | PATCH | UpdatePolicyVersion1 | [UpdatePolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions_with_namespace/UpdatePolicyVersion1.java) | [UpdatePolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions_with_namespace/UpdatePolicyVersion1.java) |
| `/agreement/admin/namespaces/{namespace}/policies/versions/{policyVersionId}/latest` | PATCH | PublishPolicyVersion1 | [PublishPolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions_with_namespace/PublishPolicyVersion1.java) | [PublishPolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions_with_namespace/PublishPolicyVersion1.java) |
| `/agreement/admin/namespaces/{namespace}/policies/{policyId}/versions` | GET | RetrieveSinglePolicyVersion1 | [RetrieveSinglePolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions_with_namespace/RetrieveSinglePolicyVersion1.java) | [RetrieveSinglePolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions_with_namespace/RetrieveSinglePolicyVersion1.java) |
| `/agreement/admin/namespaces/{namespace}/policies/{policyId}/versions` | POST | CreatePolicyVersion1 | [CreatePolicyVersion1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions_with_namespace/CreatePolicyVersion1.java) | [CreatePolicyVersion1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions_with_namespace/CreatePolicyVersion1.java) |

### Policies With Namespace Wrapper:  [PoliciesWithNamespace](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/PoliciesWithNamespace.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/namespaces/{namespace}/policies/{policyId}` | PATCH | UpdatePolicy1 | [UpdatePolicy1](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies_with_namespace/UpdatePolicy1.java) | [UpdatePolicy1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies_with_namespace/UpdatePolicy1.java) |
| `/agreement/admin/namespaces/{namespace}/policies/{policyId}/default` | PATCH | SetDefaultPolicy3 | [SetDefaultPolicy3](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies_with_namespace/SetDefaultPolicy3.java) | [SetDefaultPolicy3](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies_with_namespace/SetDefaultPolicy3.java) |

### Admin User Agreement Wrapper:  [AdminUserAgreement](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/AdminUserAgreement.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/namespaces/{namespace}/users/{userId}/agreements/policies` | POST | IndirectBulkAcceptVersionedPolicy | [IndirectBulkAcceptVersionedPolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/admin_user_agreement/IndirectBulkAcceptVersionedPolicy.java) | [IndirectBulkAcceptVersionedPolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/admin_user_agreement/IndirectBulkAcceptVersionedPolicy.java) |

### Admin User Eligibilities Wrapper:  [AdminUserEligibilities](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/AdminUserEligibilities.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/namespaces/{namespace}/users/{userId}/eligibilities` | GET | AdminRetrieveEligibilities | [AdminRetrieveEligibilities](../../src/main/java/net/accelbyte/sdk/api/legal/operations/admin_user_eligibilities/AdminRetrieveEligibilities.java) | [AdminRetrieveEligibilities](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/admin_user_eligibilities/AdminRetrieveEligibilities.java) |

### Policies Wrapper:  [Policies](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/Policies.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/policies/countries/{countryCode}` | GET | RetrievePolicies | [RetrievePolicies](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies/RetrievePolicies.java) | [RetrievePolicies](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies/RetrievePolicies.java) |
| `/agreement/admin/policies/{policyId}` | PATCH | UpdatePolicy | [UpdatePolicy](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies/UpdatePolicy.java) | [UpdatePolicy](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies/UpdatePolicy.java) |
| `/agreement/admin/policies/{policyId}/default` | PATCH | SetDefaultPolicy2 | [SetDefaultPolicy2](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies/SetDefaultPolicy2.java) | [SetDefaultPolicy2](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies/SetDefaultPolicy2.java) |
| `/agreement/public/policies/countries/{countryCode}` | GET | RetrieveLatestPolicies | [RetrieveLatestPolicies](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies/RetrieveLatestPolicies.java) | [RetrieveLatestPolicies](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies/RetrieveLatestPolicies.java) |
| `/agreement/public/policies/namespaces/{namespace}` | GET | RetrieveLatestPoliciesPublic | [RetrieveLatestPoliciesPublic](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies/RetrieveLatestPoliciesPublic.java) | [RetrieveLatestPoliciesPublic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies/RetrieveLatestPoliciesPublic.java) |
| `/agreement/public/policies/namespaces/{namespace}/countries/{countryCode}` | GET | RetrieveLatestPoliciesByNamespaceAndCountryPublic | [RetrieveLatestPoliciesByNamespaceAndCountryPublic](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policies/RetrieveLatestPoliciesByNamespaceAndCountryPublic.java) | [RetrieveLatestPoliciesByNamespaceAndCountryPublic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policies/RetrieveLatestPoliciesByNamespaceAndCountryPublic.java) |

### Policy Versions Wrapper:  [PolicyVersions](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/PolicyVersions.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/policies/versions/{policyVersionId}` | PATCH | UpdatePolicyVersion | [UpdatePolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions/UpdatePolicyVersion.java) | [UpdatePolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions/UpdatePolicyVersion.java) |
| `/agreement/admin/policies/versions/{policyVersionId}/latest` | PATCH | PublishPolicyVersion | [PublishPolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions/PublishPolicyVersion.java) | [PublishPolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions/PublishPolicyVersion.java) |
| `/agreement/admin/policies/{policyId}/versions` | GET | RetrieveSinglePolicyVersion | [RetrieveSinglePolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions/RetrieveSinglePolicyVersion.java) | [RetrieveSinglePolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions/RetrieveSinglePolicyVersion.java) |
| `/agreement/admin/policies/{policyId}/versions` | POST | CreatePolicyVersion | [CreatePolicyVersion](../../src/main/java/net/accelbyte/sdk/api/legal/operations/policy_versions/CreatePolicyVersion.java) | [CreatePolicyVersion](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/policy_versions/CreatePolicyVersion.java) |

### UserInfo Wrapper:  [UserInfo](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/UserInfo.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/userInfo` | GET | GetUserInfoStatus | [GetUserInfoStatus](../../src/main/java/net/accelbyte/sdk/api/legal/operations/user_info/GetUserInfoStatus.java) | [GetUserInfoStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/user_info/GetUserInfoStatus.java) |
| `/agreement/admin/userInfo` | PUT | SyncUserInfo | [SyncUserInfo](../../src/main/java/net/accelbyte/sdk/api/legal/operations/user_info/SyncUserInfo.java) | [SyncUserInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/user_info/SyncUserInfo.java) |
| `/agreement/admin/userInfo` | DELETE | InvalidateUserInfoCache | [InvalidateUserInfoCache](../../src/main/java/net/accelbyte/sdk/api/legal/operations/user_info/InvalidateUserInfoCache.java) | [InvalidateUserInfoCache](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/user_info/InvalidateUserInfoCache.java) |

### Anonymization Wrapper:  [Anonymization](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/Anonymization.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/admin/users/{userId}/anonymization/agreements` | DELETE | AnonymizeUserAgreement | [AnonymizeUserAgreement](../../src/main/java/net/accelbyte/sdk/api/legal/operations/anonymization/AnonymizeUserAgreement.java) | [AnonymizeUserAgreement](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/anonymization/AnonymizeUserAgreement.java) |

### Eligibilities Wrapper:  [Eligibilities](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/Eligibilities.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/public/eligibilities/namespaces/{namespace}` | GET | RetrieveEligibilitiesPublic | [RetrieveEligibilitiesPublic](../../src/main/java/net/accelbyte/sdk/api/legal/operations/eligibilities/RetrieveEligibilitiesPublic.java) | [RetrieveEligibilitiesPublic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/eligibilities/RetrieveEligibilitiesPublic.java) |
| `/agreement/public/eligibilities/namespaces/{namespace}/countries/{countryCode}/clients/{clientId}/users/{userId}` | GET | RetrieveEligibilitiesPublicIndirect | [RetrieveEligibilitiesPublicIndirect](../../src/main/java/net/accelbyte/sdk/api/legal/operations/eligibilities/RetrieveEligibilitiesPublicIndirect.java) | [RetrieveEligibilitiesPublicIndirect](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/eligibilities/RetrieveEligibilitiesPublicIndirect.java) |

### Utility Wrapper:  [Utility](../../src/main/java/net/accelbyte/sdk/api/legal/wrappers/Utility.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/agreement/public/readiness` | GET | CheckReadiness | [CheckReadiness](../../src/main/java/net/accelbyte/sdk/api/legal/operations/utility/CheckReadiness.java) | [CheckReadiness](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/legal/utility/CheckReadiness.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `AcceptAgreementRequest` | [AcceptAgreementRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/AcceptAgreementRequest.java) |
| `AcceptAgreementResponse` | [AcceptAgreementResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/AcceptAgreementResponse.java) |
| `CreateBasePolicyRequest` | [CreateBasePolicyRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/CreateBasePolicyRequest.java) |
| `CreateBasePolicyRequestV2` | [CreateBasePolicyRequestV2](../../src/main/java/net/accelbyte/sdk/api/legal/models/CreateBasePolicyRequestV2.java) |
| `CreateBasePolicyResponse` | [CreateBasePolicyResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/CreateBasePolicyResponse.java) |
| `CreateLocalizedPolicyVersionRequest` | [CreateLocalizedPolicyVersionRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/CreateLocalizedPolicyVersionRequest.java) |
| `CreateLocalizedPolicyVersionResponse` | [CreateLocalizedPolicyVersionResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/CreateLocalizedPolicyVersionResponse.java) |
| `CreatePolicyVersionRequest` | [CreatePolicyVersionRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/CreatePolicyVersionRequest.java) |
| `CreatePolicyVersionResponse` | [CreatePolicyVersionResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/CreatePolicyVersionResponse.java) |
| `ErrorEntity` | [ErrorEntity](../../src/main/java/net/accelbyte/sdk/api/legal/models/ErrorEntity.java) |
| `FieldValidationError` | [FieldValidationError](../../src/main/java/net/accelbyte/sdk/api/legal/models/FieldValidationError.java) |
| `LegalReadinessStatusResponse` | [LegalReadinessStatusResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/LegalReadinessStatusResponse.java) |
| `LocalizedPolicyVersionObject` | [LocalizedPolicyVersionObject](../../src/main/java/net/accelbyte/sdk/api/legal/models/LocalizedPolicyVersionObject.java) |
| `PagedRetrieveUserAcceptedAgreementResponse` | [PagedRetrieveUserAcceptedAgreementResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/PagedRetrieveUserAcceptedAgreementResponse.java) |
| `Paging` | [Paging](../../src/main/java/net/accelbyte/sdk/api/legal/models/Paging.java) |
| `PolicyObject` | [PolicyObject](../../src/main/java/net/accelbyte/sdk/api/legal/models/PolicyObject.java) |
| `PolicyVersionObject` | [PolicyVersionObject](../../src/main/java/net/accelbyte/sdk/api/legal/models/PolicyVersionObject.java) |
| `PolicyVersionWithLocalizedVersionObject` | [PolicyVersionWithLocalizedVersionObject](../../src/main/java/net/accelbyte/sdk/api/legal/models/PolicyVersionWithLocalizedVersionObject.java) |
| `RetrieveAcceptedAgreementResponse` | [RetrieveAcceptedAgreementResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveAcceptedAgreementResponse.java) |
| `RetrieveBasePolicyResponse` | [RetrieveBasePolicyResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveBasePolicyResponse.java) |
| `RetrieveLocalizedPolicyVersionPublicResponse` | [RetrieveLocalizedPolicyVersionPublicResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveLocalizedPolicyVersionPublicResponse.java) |
| `RetrieveLocalizedPolicyVersionResponse` | [RetrieveLocalizedPolicyVersionResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveLocalizedPolicyVersionResponse.java) |
| `RetrievePolicyPublicResponse` | [RetrievePolicyPublicResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrievePolicyPublicResponse.java) |
| `RetrievePolicyResponse` | [RetrievePolicyResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrievePolicyResponse.java) |
| `RetrievePolicyTypeResponse` | [RetrievePolicyTypeResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrievePolicyTypeResponse.java) |
| `RetrievePolicyVersionResponse` | [RetrievePolicyVersionResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrievePolicyVersionResponse.java) |
| `RetrieveUserAcceptedAgreementResponse` | [RetrieveUserAcceptedAgreementResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveUserAcceptedAgreementResponse.java) |
| `RetrieveUserEligibilitiesIndirectResponse` | [RetrieveUserEligibilitiesIndirectResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveUserEligibilitiesIndirectResponse.java) |
| `RetrieveUserEligibilitiesResponse` | [RetrieveUserEligibilitiesResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveUserEligibilitiesResponse.java) |
| `RetrieveUserInfoCacheStatusResponse` | [RetrieveUserInfoCacheStatusResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/RetrieveUserInfoCacheStatusResponse.java) |
| `UpdateBasePolicyRequest` | [UpdateBasePolicyRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdateBasePolicyRequest.java) |
| `UpdateBasePolicyRequestV2` | [UpdateBasePolicyRequestV2](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdateBasePolicyRequestV2.java) |
| `UpdateBasePolicyResponse` | [UpdateBasePolicyResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdateBasePolicyResponse.java) |
| `UpdateLocalizedPolicyVersionRequest` | [UpdateLocalizedPolicyVersionRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdateLocalizedPolicyVersionRequest.java) |
| `UpdateLocalizedPolicyVersionResponse` | [UpdateLocalizedPolicyVersionResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdateLocalizedPolicyVersionResponse.java) |
| `UpdatePolicyRequest` | [UpdatePolicyRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdatePolicyRequest.java) |
| `UpdatePolicyVersionRequest` | [UpdatePolicyVersionRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdatePolicyVersionRequest.java) |
| `UpdatePolicyVersionResponse` | [UpdatePolicyVersionResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/UpdatePolicyVersionResponse.java) |
| `UploadLocalizedPolicyVersionAttachmentResponse` | [UploadLocalizedPolicyVersionAttachmentResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/UploadLocalizedPolicyVersionAttachmentResponse.java) |
| `UploadPolicyVersionAttachmentRequest` | [UploadPolicyVersionAttachmentRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/UploadPolicyVersionAttachmentRequest.java) |
| `UserAgreementsResponse` | [UserAgreementsResponse](../../src/main/java/net/accelbyte/sdk/api/legal/models/UserAgreementsResponse.java) |
| `UsersAgreementsRequest` | [UsersAgreementsRequest](../../src/main/java/net/accelbyte/sdk/api/legal/models/UsersAgreementsRequest.java) |
| `ValidationErrorEntity` | [ValidationErrorEntity](../../src/main/java/net/accelbyte/sdk/api/legal/models/ValidationErrorEntity.java) |
