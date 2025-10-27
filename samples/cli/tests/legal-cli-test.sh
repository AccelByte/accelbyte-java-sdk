#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 256
# - template file: cli_test.j2

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..75"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent \
    --namespace "$AB_NAMESPACE" \
    --userId 'EAxcVpFrttufHIRd' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "UzVRiXbqlAw7r6W2", "policyId": "ktQG0h5JAav5kRa6", "policyVersionId": "2WopBJHPtcDs8bBZ"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "Lx8bbgorQeFbQ1g7", "policyId": "qbPngUNB1vRodwpz", "policyVersionId": "S6DaDpv8N7ZQVqGj"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "KJfh5pUkHODpoMF7", "policyId": "8NY4YkHs1cnz1JSD", "policyVersionId": "gY1TXp38zsCTCrbC"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 OldRetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAcceptedAgreements \
    --userId 'bPOyNQkT7NvyE3cw' \
    > test.out 2>&1
eval_tap $? 3 'OldRetrieveAcceptedAgreements' test.out

#- 4 OldRetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllUsersByPolicyVersion \
    --keyword 'yALczNIicXm7agSr' \
    --limit '19' \
    --offset '49' \
    --policyVersionId 'JW2OQNOs1PXhT5Fv' \
    > test.out 2>&1
eval_tap $? 4 'OldRetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 OldCreatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicy \
    --body '{"affectedClientIds": ["diRilZ7oFgx4c8Ou", "su8XfqlqNiTvB6Sd", "mKtPDKJDXn7Z4U68"], "affectedCountries": ["AdIhUDrwoZ5MecdK", "i5r6QEa1ysLEzth6", "mXhzkzWkFeZSoEAc"], "basePolicyName": "BdW19m4eu6d5tA5j", "countryGroupName": "UmiTqpyhPFdxLzFQ", "countryType": "COUNTRY", "description": "5MYzYiKWe5dNRljv", "isHidden": true, "isHiddenPublic": false, "namespace": "DQQRgat0SevkLGMS", "tags": ["x5w8hqUI06UpOXGS", "0lyuI9a2I9u6Vpbs", "LmCVuHOPlLlkvR8s"], "typeId": "KgnuRkgghGoYupD3"}' \
    > test.out 2>&1
eval_tap $? 6 'OldCreatePolicy' test.out

#- 7 OldRetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicy \
    --basePolicyId '91C2qtPYokahFjkQ' \
    > test.out 2>&1
eval_tap $? 7 'OldRetrieveSinglePolicy' test.out

#- 8 OldPartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldPartialUpdatePolicy \
    --basePolicyId 'sfCaTmt1d67FXGk2' \
    --body '{"affectedClientIds": ["s9Q0mPVo3twu0Mes", "TCf9x4rt69lna7qx", "NeIxPz6MbwL6IY69"], "affectedCountries": ["z1UaLqYSYWytLPzi", "ZMdjxcBZufQxGiHP", "llG4cYEzfTD1ZBm3"], "basePolicyName": "MqHcUmLZZbSqb8Rw", "countryGroupName": "Nmn9HrNQy4uZAAiE", "countryType": "COUNTRY_GROUP", "description": "mit9RGCCHYzUOcEd", "isHidden": true, "isHiddenPublic": false, "namespace": "i9gwQYv7t1o7TTr1", "tags": ["pBFmaLoxozr6wfNP", "DmrhZv15T7quIOvB", "McaYmvCkGZ5dAgqx"]}' \
    > test.out 2>&1
eval_tap $? 8 'OldPartialUpdatePolicy' test.out

#- 9 OldRetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal oldRetrievePolicyCountry \
    --basePolicyId 'X2bOItRMvqtlB2jJ' \
    --countryCode 'CSQT279ZZPYGu0rd' \
    > test.out 2>&1
eval_tap $? 9 'OldRetrievePolicyCountry' test.out

#- 10 OldRetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLocalizedPolicyVersions \
    --policyVersionId 'lgdWyOtXi3choQrp' \
    > test.out 2>&1
eval_tap $? 10 'OldRetrieveLocalizedPolicyVersions' test.out

#- 11 OldCreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreateLocalizedPolicyVersion \
    --policyVersionId 'OsDBU5SepjChB3V0' \
    --body '{"contentType": "v52Dlym6puQ23xoJ", "description": "8aeCnaLpUKp44YUD", "localeCode": "jasWIPUvmEejtGeo"}' \
    > test.out 2>&1
eval_tap $? 11 'OldCreateLocalizedPolicyVersion' test.out

#- 12 OldRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'yIPa8ZRrvjj7il35' \
    > test.out 2>&1
eval_tap $? 12 'OldRetrieveSingleLocalizedPolicyVersion' test.out

#- 13 OldUpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'MXbN9oCMNqq98SjT' \
    --body '{"attachmentChecksum": "vhZNkSQ70D0H6BXk", "attachmentLocation": "sUC9b6i5lZC9xv32", "attachmentVersionIdentifier": "e8c5csSovoqsZNBd", "contentType": "te9NDUPVJf6c2Z0Q", "description": "ZxfgPubTDIHrvqAT"}' \
    > test.out 2>&1
eval_tap $? 13 'OldUpdateLocalizedPolicyVersion' test.out

#- 14 OldRequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal oldRequestPresignedURL \
    --localizedPolicyVersionId 'huwjRHpKKTlmVr9X' \
    --body '{"contentMD5": "uoJbRFQSKVPHbn4X", "contentType": "xtu7LQRENjEEztx1"}' \
    > test.out 2>&1
eval_tap $? 14 'OldRequestPresignedURL' test.out

#- 15 OldSetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'WsYSiZqan0nSBJro' \
    > test.out 2>&1
eval_tap $? 15 'OldSetDefaultLocalizedPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["0GqVvUfHQvsHXNUN", "lc9d9sogWa24CKNS", "BHqaTHeKtW18iGeU"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --namespace "$AB_NAMESPACE" \
    --userId 'e4mhgo5QB65lSAiY' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements' test.out

#- 18 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'nNjkfZrQvGgbLdLs' \
    --limit '65' \
    --offset '5' \
    --policyVersionId 'zHkBMr1yrOMlNFSr' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'UEirnjX9fDmIbeZx' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'zfTcyiuATus9hsfp' \
    --policyVersionId 'FDcSDG8aMVGLiBNr' \
    --start 'DjqoxcwgGLXpUL4p' \
    > test.out 2>&1
eval_tap $? 20 'InitiateExportAgreementsToCSV' test.out

#- 21 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["mJFfRByjlBiuFM3F", "rOvDz9KOsb392k6Y", "p2ncYAHdNzDmeIP6"], "affectedCountries": ["IoVk8T3GpAnkCmBU", "qg2SCnqntX9y1aZS", "WMiVi10sG6vxkfUc"], "basePolicyName": "mqRRbceJ5i0EeDxO", "countryGroupName": "gBnhhqElIaDml48w", "countryType": "COUNTRY", "description": "0JT1yduat2vQR3bi", "isHidden": true, "isHiddenPublic": false, "tags": ["2rtOa4EXsXzOXQAk", "4mqrxzTtuLl4XlbG", "L8QOxtjzm8y2wNhm"], "typeId": "woYZyI4EFZKBcYrC"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy' test.out

#- 23 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'EAE7WIsfmx40NLRc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId '6m8heKnWhzfe2Nub' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'eoKFeIaFQCYoDPIC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["pnduEEQlULdJz4mn", "RBkMNxvvKgAT8mJr", "Yq6hRkloqxM3gpwx"], "affectedCountries": ["t0VWn3CO39PXDNxt", "cfMy9XzjjI5YbsKo", "ADkzJEN2VHzih3bi"], "basePolicyName": "XgeO3FgkXhjDzaQY", "countryGroupName": "3snn2ZkP7cFdP43e", "countryType": "COUNTRY", "description": "eKa699bRVhyaKwwr", "isHidden": true, "isHiddenPublic": false, "tags": ["OO847g8OudOfjnCu", "HZ3c46IjGa23YvYm", "P2aMlu7WtjCtoYet"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy' test.out

#- 26 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'mDg7VYPXIuvUYTZB' \
    --countryCode 'RujIUE1Tq5jyAZvk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'RCMNFIurjh2imdb4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'rbkXj0ZwsVC0gL97' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["4zGYY7KQI1AeFgPq", "ZVJSPqJiwv1qlYB1", "RSKs6gQxC3Gb7S0o"], "countryCode": "aOkvo1aolB4lkKB4", "countryGroupName": "EYOkQ1jMD3cym8xI", "countryType": "COUNTRY", "description": "On0jJLHC9LxhvNXT", "isDefaultSelection": true, "isMandatory": true, "policyName": "GBCtohLtl9Zuhytm", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId 'DrT6QXCs5SPBbRPZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'TF6oQAXVG7tnsZg5' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions' test.out

#- 31 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'QgXjvyGJPN4eXbJE' \
    --body '{"contentType": "5Vs2GcyomQoIXimB", "description": "JehyxlNsjUgxBkF6", "localeCode": "wFPoJeQediogEhhM"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '2rIizGdKvOPdq5xr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 33 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'gxSmy1DN9LFkYW5D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "Qyj4bj5Ro2ogaKt2", "attachmentLocation": "ujQSa3Zdb65UXmy0", "attachmentVersionIdentifier": "Zp6iIaTIKUkmkk9Q", "contentType": "M0NBMA9ORxpzwLR2", "description": "AK6eXUGPJsw1fiP8"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion' test.out

#- 34 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId '0G9Pclxcft2ulIJz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "PyrVEiOG4UcqsuGK", "contentType": "HhMRWLVd3DlhLuIp"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL' test.out

#- 35 SetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'omM8sm1MiaI1mX2t' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultLocalizedPolicy' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'JoARtdbBe7udsMro' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'k0WvGYYnx4V709xb' \
    --body '{"description": "nGezKsDwG2omOR2n", "displayVersion": "vYI9TVqJdvzcWbfU", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion' test.out

#- 38 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'S7u8RiWyerCSa8SR' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'gwsAj1ik1jglaDXT' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'vKCWwNTAhd2wrS0u' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Pdjhdinpng5BLy8w' \
    --body '{"countries": ["bhMssAHjapIkY9Rf", "4wP57dBZNR88YbCt", "mKy8M9zVrjfGXZnq"], "countryGroupName": "AQUoY1GjlIIk0iKo", "description": "TTS1j02o7JjTXAQN", "isDefaultOpted": true, "isMandatory": false, "policyName": "ccLjMXJRk0eaKQDO", "readableId": "JvrTefglSs6g4iY9", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'JvaizwiilatuUjjt' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId '9lIMGql5ElEa9EII' \
    --versionId 'lGcHB3CfR3ncDlwi' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId '3v3MFFJ1KesKoELC' \
    --body '{"description": "pobBEG8X645xpdXp", "displayVersion": "ai0rYaT5hOPjaf3H", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --namespace "$AB_NAMESPACE" \
    --offset '69' \
    --limit '15' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'ighU0VUfcYHJbBfA' \
    --publisherUserId 'KSiPW3VgsZXiR1DJ' \
    --clientId '7HVWqMkNSawQUWDF' \
    --countryCode 'JvJBWic7UkBeIXuq' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "VwXgAgntLMCuaXBW", "policyId": "Qi6BqPg4xr0lCanc", "policyVersionId": "UZGCHsZYoLfR1KtO"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "y0b65uvuKNuy0ytZ", "policyId": "Q7M6Nzy1adnSKOLF", "policyVersionId": "Kx1dX4LuWJu3pDMU"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "4czz0QKFlAVmVLu4", "policyId": "AOec0z8eBeeoip68", "policyVersionId": "J1nsv4W2OJhtafxM"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'SJlHeb34sZKHcl5L' \
    --publisherUserId 'LLOexL4fZvWtND2t' \
    --clientId 'cBFpX8lNtFEJ7tnk' \
    --countryCode 'Y6Mca5afj12K2Izr' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'BvvWm4udE0OXudXg' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePolicies' test.out

#- 49 OldUpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicyVersion \
    --policyVersionId 'Nne8kJATwlc6esUp' \
    --body '{"description": "6Sw1I98jeZQ7hfxn", "displayVersion": "hLd3Knaknoed9DHh", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 49 'OldUpdatePolicyVersion' test.out

#- 50 OldPublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublishPolicyVersion \
    --policyVersionId 'OqQGhCUr6iTrjyEg' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 50 'OldPublishPolicyVersion' test.out

#- 51 OldUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicy \
    --policyId 'arAdNJOIG36I6tRb' \
    --body '{"countries": ["RcrEveMdAdiPKDUV", "FIna3yddcbsPheTH", "SC00PYeDcagginxn"], "countryGroupName": "26IUJNvYuGRUvpZa", "description": "HCuESOiIZsMfB4ZH", "isDefaultOpted": false, "isMandatory": true, "policyName": "mDWORBVXTIIJM9Xs", "readableId": "YIIZxiXNMR9BgaWc", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 51 'OldUpdatePolicy' test.out

#- 52 OldSetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultPolicy \
    --policyId '3SUBhyoTsMWPAxUM' \
    > test.out 2>&1
eval_tap $? 52 'OldSetDefaultPolicy' test.out

#- 53 OldRetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicyVersion \
    --policyId 'kawaGpAyrIwMif3B' \
    --versionId 'OdkocVTd4BxqGWV6' \
    > test.out 2>&1
eval_tap $? 53 'OldRetrieveSinglePolicyVersion' test.out

#- 54 OldCreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicyVersion \
    --policyId 'mTJ0sQs6XNbjvqhn' \
    --body '{"description": "UVLWu8olKdxL6ozR", "displayVersion": "mDD0jJvlfV5OemPY", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 54 'OldCreatePolicyVersion' test.out

#- 55 OldRetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllPolicyTypes \
    --offset '66' \
    --limit '78' \
    > test.out 2>&1
eval_tap $? 55 'OldRetrieveAllPolicyTypes' test.out

#- 56 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'T7DROCjtuzFMbAG9' \
    > test.out 2>&1
eval_tap $? 56 'GetUserInfoStatus' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'YI89hmguB8FOTjML' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 PublicChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal publicChangePreferenceConsent \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "4b9rIzqYkEpstyVT", "policyId": "BcrM8rG0rH0zcsww", "policyVersionId": "VeMK6MbGIVIu8vvw"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "xY5rA1WoVeJIePF8", "policyId": "ZrQzP4zvtdxdbZUp", "policyVersionId": "d6FJtHJ1pyVwyKQL"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "nOpas6ghP1y4Zi7s", "policyId": "7QBlk44Z44B1GZgK", "policyVersionId": "g4uKxaCgcGLuC3br"}]' \
    > test.out 2>&1
eval_tap $? 60 'PublicChangePreferenceConsent' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'WdTYCfHkIySok5Di' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "87rGysryod3dNQrm", "policyId": "sApRA6HX3RwrKt2e", "policyVersionId": "cozL0TOg54vCE48L"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "HMA2rG3nakopAywe", "policyId": "lu01nryEJ0NqoTow", "policyVersionId": "0qiOiC4j0iktm0ZP"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "fLM9uSybRzWek2gZ", "policyId": "vRrvr0n9d9lvccKM", "policyVersionId": "LhrTrcBE2ItBS3Kt"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkAcceptVersionedPolicy' test.out

#- 64 IndirectBulkAcceptVersionedPolicyV2
eval_tap 0 64 'IndirectBulkAcceptVersionedPolicyV2 # SKIP deprecated' test.out

#- 65 PublicIndirectBulkAcceptVersionedPolicy
eval_tap 0 65 'PublicIndirectBulkAcceptVersionedPolicy # SKIP deprecated' test.out

#- 66 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'RetrieveEligibilitiesPublic' test.out

#- 67 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'KZWe8aoFzAyBME74' \
    --countryCode 'HUtipUWYhWV1qx8C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zPML52faXUr9Sk4l' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 OldPublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'q2faBcAXXKlhvyH8' \
    > test.out 2>&1
eval_tap $? 68 'OldPublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 69 PublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'paOJtxqMPpcVfRwN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'PublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'j547fH0XrKEDpEY8' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'nocGAjci0V3tBf2j' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '3sWCqQpQ2FbKPFMy' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 OldRetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'cMSQ4qfAacR0LgB5' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'GBeMfPlNos4yBRjr' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'OldRetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'ERHEonAZR8GmEu0q' \
    --namespace "$AB_NAMESPACE" \
    --clientId '1p6QCyY6vSkVFWds' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out


rm -f "tmp.dat"

exit $EXIT_CODE