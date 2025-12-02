## Java Extend SDK CLI Sample App Operation Index for Legal service

### Operation ChangePreferenceConsent

```sh
$ build/install/cli/bin/cli legal changePreferenceConsent \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation OldRetrieveAcceptedAgreements

```sh
$ build/install/cli/bin/cli legal oldRetrieveAcceptedAgreements \
    --userId <userId value>
```

### Operation OldRetrieveAllUsersByPolicyVersion

```sh
$ build/install/cli/bin/cli legal oldRetrieveAllUsersByPolicyVersion \
    --keyword <keyword value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --policyVersionId <policyVersionId value>
```

### Operation RetrieveAllLegalPolicies

```sh
$ build/install/cli/bin/cli legal retrieveAllLegalPolicies \
    --visibleOnly <visibleOnly value - optional>
```

### Operation OldCreatePolicy

```sh
$ build/install/cli/bin/cli legal oldCreatePolicy \
    --body <json string for request body>
```

### Operation OldRetrieveSinglePolicy

```sh
$ build/install/cli/bin/cli legal oldRetrieveSinglePolicy \
    --basePolicyId <basePolicyId value>
```

### Operation OldPartialUpdatePolicy

```sh
$ build/install/cli/bin/cli legal oldPartialUpdatePolicy \
    --basePolicyId <basePolicyId value> \
    --body <json string for request body>
```

### Operation OldRetrievePolicyCountry

```sh
$ build/install/cli/bin/cli legal oldRetrievePolicyCountry \
    --basePolicyId <basePolicyId value> \
    --countryCode <countryCode value>
```

### Operation OldRetrieveLocalizedPolicyVersions

```sh
$ build/install/cli/bin/cli legal oldRetrieveLocalizedPolicyVersions \
    --policyVersionId <policyVersionId value>
```

### Operation OldCreateLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal oldCreateLocalizedPolicyVersion \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation OldRetrieveSingleLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal oldRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value>
```

### Operation OldUpdateLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal oldUpdateLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --body <json string for request body>
```

### Operation OldRequestPresignedURL

```sh
$ build/install/cli/bin/cli legal oldRequestPresignedURL \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --body <json string for request body>
```

### Operation OldSetDefaultLocalizedPolicy

```sh
$ build/install/cli/bin/cli legal oldSetDefaultLocalizedPolicy \
    --localizedPolicyVersionId <localizedPolicyVersionId value>
```

### Operation RetrieveAcceptedAgreementsForMultiUsers

```sh
$ build/install/cli/bin/cli legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RetrieveAcceptedAgreements

```sh
$ build/install/cli/bin/cli legal retrieveAcceptedAgreements \
    --namespace <namespace value> \
    --userId <userId value> \
    --excludeOtherNamespacesPolicies <excludeOtherNamespacesPolicies value - optional>
```

### Operation RetrieveAllUsersByPolicyVersion

```sh
$ build/install/cli/bin/cli legal retrieveAllUsersByPolicyVersion \
    --namespace <namespace value> \
    --convertGameUserId <convertGameUserId value - optional> \
    --keyword <keyword value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --policyVersionId <policyVersionId value>
```

### Operation DownloadExportedAgreementsInCSV

```sh
$ build/install/cli/bin/cli legal downloadExportedAgreementsInCSV \
    --namespace <namespace value> \
    --exportId <exportId value>
```

### Operation InitiateExportAgreementsToCSV

```sh
$ build/install/cli/bin/cli legal initiateExportAgreementsToCSV \
    --namespace <namespace value> \
    --end <end value - optional> \
    --policyVersionId <policyVersionId value> \
    --start <start value>
```

### Operation RetrieveAllLegalPoliciesByNamespace

```sh
$ build/install/cli/bin/cli legal retrieveAllLegalPoliciesByNamespace \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --visibleOnly <visibleOnly value - optional>
```

### Operation CreatePolicy

```sh
$ build/install/cli/bin/cli legal createPolicy \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RetrieveSinglePolicy

```sh
$ build/install/cli/bin/cli legal retrieveSinglePolicy \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value>
```

### Operation DeleteBasePolicy

```sh
$ build/install/cli/bin/cli legal deleteBasePolicy \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value>
```

### Operation PartialUpdatePolicy

```sh
$ build/install/cli/bin/cli legal partialUpdatePolicy \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RetrievePolicyCountry

```sh
$ build/install/cli/bin/cli legal retrievePolicyCountry \
    --basePolicyId <basePolicyId value> \
    --countryCode <countryCode value> \
    --namespace <namespace value>
```

### Operation RetrieveAllPoliciesFromBasePolicy

```sh
$ build/install/cli/bin/cli legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value>
```

### Operation CreatePolicyUnderBasePolicy

```sh
$ build/install/cli/bin/cli legal createPolicyUnderBasePolicy \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteLocalizedPolicy

```sh
$ build/install/cli/bin/cli legal deleteLocalizedPolicy \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value>
```

### Operation RetrieveLocalizedPolicyVersions

```sh
$ build/install/cli/bin/cli legal retrieveLocalizedPolicyVersions \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value>
```

### Operation CreateLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal createLocalizedPolicyVersion \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation RetrieveSingleLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value>
```

### Operation UpdateLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RequestPresignedURL

```sh
$ build/install/cli/bin/cli legal requestPresignedURL \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SetDefaultLocalizedPolicy

```sh
$ build/install/cli/bin/cli legal setDefaultLocalizedPolicy \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value>
```

### Operation DeletePolicyVersion

```sh
$ build/install/cli/bin/cli legal deletePolicyVersion \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value>
```

### Operation UpdatePolicyVersion

```sh
$ build/install/cli/bin/cli legal updatePolicyVersion \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation PublishPolicyVersion

```sh
$ build/install/cli/bin/cli legal publishPolicyVersion \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value> \
    --shouldNotify <shouldNotify value - optional>
```

### Operation UnpublishPolicyVersion

```sh
$ build/install/cli/bin/cli legal unpublishPolicyVersion \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value>
```

### Operation DeletePolicy

```sh
$ build/install/cli/bin/cli legal deletePolicy \
    --namespace <namespace value> \
    --policyId <policyId value>
```

### Operation UpdatePolicy

```sh
$ build/install/cli/bin/cli legal updatePolicy \
    --namespace <namespace value> \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation SetDefaultPolicy

```sh
$ build/install/cli/bin/cli legal setDefaultPolicy \
    --namespace <namespace value> \
    --policyId <policyId value>
```

### Operation RetrieveSinglePolicyVersion

```sh
$ build/install/cli/bin/cli legal retrieveSinglePolicyVersion \
    --namespace <namespace value> \
    --policyId <policyId value> \
    --versionId <versionId value - optional>
```

### Operation CreatePolicyVersion

```sh
$ build/install/cli/bin/cli legal createPolicyVersion \
    --namespace <namespace value> \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation RetrieveAllPolicyTypes

```sh
$ build/install/cli/bin/cli legal retrieveAllPolicyTypes \
    --namespace <namespace value> \
    --offset <offset value - optional> \
    --limit <limit value>
```

### Operation IndirectBulkAcceptVersionedPolicy

```sh
$ build/install/cli/bin/cli legal indirectBulkAcceptVersionedPolicy \
    --namespace <namespace value> \
    --userId <userId value> \
    --publisherUserId <publisherUserId value - optional> \
    --clientId <clientId value> \
    --countryCode <countryCode value> \
    --body <json string for request body>
```

### Operation AdminRetrieveEligibilities

```sh
$ build/install/cli/bin/cli legal adminRetrieveEligibilities \
    --namespace <namespace value> \
    --userId <userId value> \
    --publisherUserId <publisherUserId value - optional> \
    --clientId <clientId value> \
    --countryCode <countryCode value>
```

### Operation RetrievePolicies

```sh
$ build/install/cli/bin/cli legal retrievePolicies \
    --countryCode <countryCode value>
```

### Operation OldUpdatePolicyVersion

```sh
$ build/install/cli/bin/cli legal oldUpdatePolicyVersion \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation OldPublishPolicyVersion

```sh
$ build/install/cli/bin/cli legal oldPublishPolicyVersion \
    --policyVersionId <policyVersionId value> \
    --shouldNotify <shouldNotify value - optional>
```

### Operation OldUpdatePolicy

```sh
$ build/install/cli/bin/cli legal oldUpdatePolicy \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation OldSetDefaultPolicy

```sh
$ build/install/cli/bin/cli legal oldSetDefaultPolicy \
    --policyId <policyId value>
```

### Operation OldRetrieveSinglePolicyVersion

```sh
$ build/install/cli/bin/cli legal oldRetrieveSinglePolicyVersion \
    --policyId <policyId value> \
    --versionId <versionId value - optional>
```

### Operation OldCreatePolicyVersion

```sh
$ build/install/cli/bin/cli legal oldCreatePolicyVersion \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation OldRetrieveAllPolicyTypes

```sh
$ build/install/cli/bin/cli legal oldRetrieveAllPolicyTypes \
    --offset <offset value - optional> \
    --limit <limit value>
```

### Operation GetUserInfoStatus

```sh
$ build/install/cli/bin/cli legal getUserInfoStatus \
    --namespaces <namespaces value - optional>
```

### Operation AnonymizeUserAgreement

```sh
$ build/install/cli/bin/cli legal anonymizeUserAgreement \
    --userId <userId value>
```

### Operation PublicChangePreferenceConsent

```sh
$ build/install/cli/bin/cli legal publicChangePreferenceConsent \
    --body <json string for request body>
```

### Operation AcceptVersionedPolicy

```sh
$ build/install/cli/bin/cli legal acceptVersionedPolicy \
    --localizedPolicyVersionId <localizedPolicyVersionId value>
```

### Operation RetrieveAgreementsPublic

```sh
$ build/install/cli/bin/cli legal retrieveAgreementsPublic
```

### Operation BulkAcceptVersionedPolicy

```sh
$ build/install/cli/bin/cli legal bulkAcceptVersionedPolicy \
    --body <json string for request body>
```

### Operation RetrieveEligibilitiesPublic

```sh
$ build/install/cli/bin/cli legal retrieveEligibilitiesPublic \
    --namespace <namespace value>
```

### Operation RetrieveEligibilitiesPublicIndirect

```sh
$ build/install/cli/bin/cli legal retrieveEligibilitiesPublicIndirect \
    --clientId <clientId value> \
    --countryCode <countryCode value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation OldPublicRetrieveSingleLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal oldPublicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value>
```

### Operation PublicRetrieveSingleLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal publicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value>
```

### Operation RetrieveCountryListWithPolicies

```sh
$ build/install/cli/bin/cli legal retrieveCountryListWithPolicies
```

### Operation RetrieveLatestPolicies

```sh
$ build/install/cli/bin/cli legal retrieveLatestPolicies \
    --countryCode <countryCode value> \
    --defaultOnEmpty <defaultOnEmpty value - optional> \
    --policyType <policyType value - optional> \
    --tags <tags value - optional> \
    --visibleOnly <visibleOnly value - optional>
```

### Operation RetrieveLatestPoliciesPublic

```sh
$ build/install/cli/bin/cli legal retrieveLatestPoliciesPublic \
    --namespace <namespace value> \
    --alwaysIncludeDefault <alwaysIncludeDefault value - optional> \
    --defaultOnEmpty <defaultOnEmpty value - optional> \
    --policyType <policyType value - optional> \
    --tags <tags value - optional> \
    --visibleOnly <visibleOnly value - optional>
```

### Operation OldRetrieveLatestPoliciesByNamespaceAndCountryPublic

```sh
$ build/install/cli/bin/cli legal oldRetrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode <countryCode value> \
    --namespace <namespace value> \
    --alwaysIncludeDefault <alwaysIncludeDefault value - optional> \
    --defaultOnEmpty <defaultOnEmpty value - optional> \
    --policyType <policyType value - optional> \
    --tags <tags value - optional> \
    --visibleOnly <visibleOnly value - optional>
```

### Operation CheckReadiness

```sh
$ build/install/cli/bin/cli legal checkReadiness
```

### Operation RetrieveLatestPoliciesByNamespaceAndCountryPublic

```sh
$ build/install/cli/bin/cli legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode <countryCode value> \
    --namespace <namespace value> \
    --clientId <clientId value>
```

