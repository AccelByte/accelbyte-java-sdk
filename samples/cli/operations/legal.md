## Java Extend SDK CLI Sample App Operation Index for Legal service

### Operation ChangePreferenceConsent

```sh
$ build/install/cli/bin/cli legal changePreferenceConsent \
    --namespace <namespace value> \
    --userId <userId value> \
    --body <json string for request body>
```

### Operation RetrieveAcceptedAgreements

```sh
$ build/install/cli/bin/cli legal retrieveAcceptedAgreements \
    --userId <userId value>
```

### Operation RetrieveAllUsersByPolicyVersion

```sh
$ build/install/cli/bin/cli legal retrieveAllUsersByPolicyVersion \
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

### Operation CreatePolicy

```sh
$ build/install/cli/bin/cli legal createPolicy \
    --body <json string for request body>
```

### Operation RetrieveSinglePolicy

```sh
$ build/install/cli/bin/cli legal retrieveSinglePolicy \
    --basePolicyId <basePolicyId value>
```

### Operation PartialUpdatePolicy

```sh
$ build/install/cli/bin/cli legal partialUpdatePolicy \
    --basePolicyId <basePolicyId value> \
    --body <json string for request body>
```

### Operation RetrievePolicyCountry

```sh
$ build/install/cli/bin/cli legal retrievePolicyCountry \
    --basePolicyId <basePolicyId value> \
    --countryCode <countryCode value>
```

### Operation RetrieveLocalizedPolicyVersions

```sh
$ build/install/cli/bin/cli legal retrieveLocalizedPolicyVersions \
    --policyVersionId <policyVersionId value>
```

### Operation CreateLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal createLocalizedPolicyVersion \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation RetrieveSingleLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value>
```

### Operation UpdateLocalizedPolicyVersion

```sh
$ build/install/cli/bin/cli legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --body <json string for request body>
```

### Operation RequestPresignedURL

```sh
$ build/install/cli/bin/cli legal requestPresignedURL \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --body <json string for request body>
```

### Operation SetDefaultPolicy

```sh
$ build/install/cli/bin/cli legal setDefaultPolicy \
    --localizedPolicyVersionId <localizedPolicyVersionId value>
```

### Operation RetrieveAcceptedAgreementsForMultiUsers

```sh
$ build/install/cli/bin/cli legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RetrieveAcceptedAgreements1

```sh
$ build/install/cli/bin/cli legal retrieveAcceptedAgreements1 \
    --namespace <namespace value> \
    --userId <userId value> \
    --excludeOtherNamespacesPolicies <excludeOtherNamespacesPolicies value - optional>
```

### Operation RetrieveAllUsersByPolicyVersion1

```sh
$ build/install/cli/bin/cli legal retrieveAllUsersByPolicyVersion1 \
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
    --visibleOnly <visibleOnly value - optional>
```

### Operation CreatePolicy1

```sh
$ build/install/cli/bin/cli legal createPolicy1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RetrieveSinglePolicy1

```sh
$ build/install/cli/bin/cli legal retrieveSinglePolicy1 \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value>
```

### Operation DeleteBasePolicy

```sh
$ build/install/cli/bin/cli legal deleteBasePolicy \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value>
```

### Operation PartialUpdatePolicy1

```sh
$ build/install/cli/bin/cli legal partialUpdatePolicy1 \
    --basePolicyId <basePolicyId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RetrievePolicyCountry1

```sh
$ build/install/cli/bin/cli legal retrievePolicyCountry1 \
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

### Operation RetrieveLocalizedPolicyVersions1

```sh
$ build/install/cli/bin/cli legal retrieveLocalizedPolicyVersions1 \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value>
```

### Operation CreateLocalizedPolicyVersion1

```sh
$ build/install/cli/bin/cli legal createLocalizedPolicyVersion1 \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation RetrieveSingleLocalizedPolicyVersion1

```sh
$ build/install/cli/bin/cli legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value>
```

### Operation UpdateLocalizedPolicyVersion1

```sh
$ build/install/cli/bin/cli legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation RequestPresignedURL1

```sh
$ build/install/cli/bin/cli legal requestPresignedURL1 \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation SetDefaultPolicy1

```sh
$ build/install/cli/bin/cli legal setDefaultPolicy1 \
    --localizedPolicyVersionId <localizedPolicyVersionId value> \
    --namespace <namespace value>
```

### Operation DeletePolicyVersion

```sh
$ build/install/cli/bin/cli legal deletePolicyVersion \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value>
```

### Operation UpdatePolicyVersion1

```sh
$ build/install/cli/bin/cli legal updatePolicyVersion1 \
    --namespace <namespace value> \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation PublishPolicyVersion1

```sh
$ build/install/cli/bin/cli legal publishPolicyVersion1 \
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

### Operation UpdatePolicy1

```sh
$ build/install/cli/bin/cli legal updatePolicy1 \
    --namespace <namespace value> \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation SetDefaultPolicy3

```sh
$ build/install/cli/bin/cli legal setDefaultPolicy3 \
    --namespace <namespace value> \
    --policyId <policyId value>
```

### Operation RetrieveSinglePolicyVersion1

```sh
$ build/install/cli/bin/cli legal retrieveSinglePolicyVersion1 \
    --namespace <namespace value> \
    --policyId <policyId value> \
    --versionId <versionId value - optional>
```

### Operation CreatePolicyVersion1

```sh
$ build/install/cli/bin/cli legal createPolicyVersion1 \
    --namespace <namespace value> \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation RetrieveAllPolicyTypes1

```sh
$ build/install/cli/bin/cli legal retrieveAllPolicyTypes1 \
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

### Operation UpdatePolicyVersion

```sh
$ build/install/cli/bin/cli legal updatePolicyVersion \
    --policyVersionId <policyVersionId value> \
    --body <json string for request body>
```

### Operation PublishPolicyVersion

```sh
$ build/install/cli/bin/cli legal publishPolicyVersion \
    --policyVersionId <policyVersionId value> \
    --shouldNotify <shouldNotify value - optional>
```

### Operation UpdatePolicy

```sh
$ build/install/cli/bin/cli legal updatePolicy \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation SetDefaultPolicy2

```sh
$ build/install/cli/bin/cli legal setDefaultPolicy2 \
    --policyId <policyId value>
```

### Operation RetrieveSinglePolicyVersion

```sh
$ build/install/cli/bin/cli legal retrieveSinglePolicyVersion \
    --policyId <policyId value> \
    --versionId <versionId value - optional>
```

### Operation CreatePolicyVersion

```sh
$ build/install/cli/bin/cli legal createPolicyVersion \
    --policyId <policyId value> \
    --body <json string for request body>
```

### Operation RetrieveAllPolicyTypes

```sh
$ build/install/cli/bin/cli legal retrieveAllPolicyTypes \
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

### Operation ChangePreferenceConsent1

```sh
$ build/install/cli/bin/cli legal changePreferenceConsent1 \
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

### Operation RetrieveSingleLocalizedPolicyVersion2

```sh
$ build/install/cli/bin/cli legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId <localizedPolicyVersionId value>
```

### Operation RetrieveSingleLocalizedPolicyVersion3

```sh
$ build/install/cli/bin/cli legal retrieveSingleLocalizedPolicyVersion3 \
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

### Operation RetrieveLatestPoliciesByNamespaceAndCountryPublic

```sh
$ build/install/cli/bin/cli legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
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

### Operation RetrieveLatestPoliciesByNamespaceAndCountryPublic1

```sh
$ build/install/cli/bin/cli legal retrieveLatestPoliciesByNamespaceAndCountryPublic1 \
    --countryCode <countryCode value> \
    --namespace <namespace value> \
    --clientId <clientId value>
```

