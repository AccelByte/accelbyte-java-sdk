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
echo "1..64"

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
    --userId 'EAxcVpFr' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "6LZrkq6D", "policyId": "c09nIW0O", "policyVersionId": "aiw9B0D7"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "HpzSn3ZP", "policyId": "Udc0qh4n", "policyVersionId": "8mzZ0m8S"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "MTwE6I56", "policyId": "IaRDBXxy", "policyVersionId": "aNoMR6hk"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'spInrAip' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword '6lyzSxwE' \
    --limit '24' \
    --offset '52' \
    --policyVersionId 'FHHdgs21' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["NmKJfh5p", "Jub74CUk", "UkHODpoM"], "affectedCountries": ["F78NY4Yk", "Hs1cnz1J", "SDgY1TXp"], "basePolicyName": "38zsCTCr", "description": "bCbPOyNQ", "namespace": "kT7NvyE3", "tags": ["SrjJW2OQ", "cwyALczN", "IicXm7ag"], "typeId": "NOs1PXhT"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId '5FvdiRil' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'Z7oFgx4c' \
    --body '{"affectedClientIds": ["8OumKtPD", "U68su8Xf", "KJDXn7Z4"], "affectedCountries": ["qlqNiTvB", "6SdAdIhU", "DrwoZ5Me"], "basePolicyName": "cdKi5r6Q", "description": "Ea1ysLEz", "namespace": "th6mXhzk", "tags": ["m4eu6d5t", "EAcBdW19", "zWkFeZSo"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'A5jUmiTq' \
    --countryCode 'pyhPFdxL' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'zFQN05MY' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'zYiKWe5d' \
    --body '{"contentType": "NRljv7IP", "description": "rDQQRgat", "localeCode": "0SevkLGM"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'S0lyuI9a' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId '2I9u6Vpb' \
    --body '{"attachmentChecksum": "sx5w8hqU", "attachmentLocation": "I06UpOXG", "attachmentVersionIdentifier": "SLmCVuHO", "contentType": "PlLlkvR8", "description": "sKgnuRkg"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'ghGoYupD' \
    --body '{"contentMD5": "391C2qtP", "contentType": "YokahFjk"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'QsfCaTmt' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["goNm03VL", "o3td6TC6", "isV6zwPu"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I3lMjGSW' \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements1' test.out

#- 18 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --keyword 'N2laRlxf' \
    --limit '5' \
    --offset '10' \
    --policyVersionId 'jHfYakUC' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion1' test.out

#- 19 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 20 CreatePolicy1
./ng net.accelbyte.sdk.cli.Main legal createPolicy1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["TqGkE7wc", "qGAXQ0yY", "WfDslpJS"], "affectedCountries": ["5TAQ6iiP", "oNRKd3IL", "lSC2uE4o"], "basePolicyName": "5Vwdo3fe", "description": "PqIJA8IH", "tags": ["l5BYNtIu", "DDWVAla2", "trkmu0hp"], "typeId": "S5S5XUdj"}' \
    > test.out 2>&1
eval_tap $? 20 'CreatePolicy1' test.out

#- 21 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId 'soqwGyzz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'RetrieveSinglePolicy1' test.out

#- 22 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'Wi9gwQYv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["7t1o7TTr", "1DmrhZv1", "5T7quIOv"], "affectedCountries": ["kGZ5dAgq", "BMcaYmvC", "xpBFmaLo"], "basePolicyName": "xozr6wfN", "description": "PX2bOItR", "tags": ["ZZPYGu0r", "MvqtlB2j", "JCSQT279"]}' \
    > test.out 2>&1
eval_tap $? 22 'PartialUpdatePolicy1' test.out

#- 23 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId 'dlgdWyOt' \
    --countryCode 'Xi3choQr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrievePolicyCountry1' test.out

#- 24 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'pOsDBU5S' \
    > test.out 2>&1
eval_tap $? 24 'RetrieveLocalizedPolicyVersions1' test.out

#- 25 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'epjChB3V' \
    --body '{"contentType": "0v52Dlym", "description": "6puQ23xo", "localeCode": "J8aeCnaL"}' \
    > test.out 2>&1
eval_tap $? 25 'CreateLocalizedPolicyVersion1' test.out

#- 26 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'pUKp44YU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 27 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'DjasWIPU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "vmEejtGe", "attachmentLocation": "oyIPa8ZR", "attachmentVersionIdentifier": "rvjj7il3", "contentType": "5MXbN9oC", "description": "MNqq98Sj"}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateLocalizedPolicyVersion1' test.out

#- 28 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'TvhZNkSQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "70D0H6BX", "contentType": "ksUC9b6i"}' \
    > test.out 2>&1
eval_tap $? 28 'RequestPresignedURL1' test.out

#- 29 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId '5lZC9xv3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'SetDefaultPolicy1' test.out

#- 30 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '2e8c5csS' \
    --body '{"description": "ovoqsZNB", "displayVersion": "dte9NDUP", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 30 'UpdatePolicyVersion1' test.out

#- 31 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'f6c2Z0QZ' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 31 'PublishPolicyVersion1' test.out

#- 32 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'xfgPubTD' \
    --body '{"description": "IHrvqATh", "isDefaultOpted": true, "isMandatory": false, "policyName": "wjRHpKKT", "readableId": "lmVr9Xuo", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePolicy1' test.out

#- 33 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'bRFQSKVP' \
    > test.out 2>&1
eval_tap $? 33 'SetDefaultPolicy3' test.out

#- 34 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Hbn4Xxtu' \
    --versionId '7LQRENjE' \
    > test.out 2>&1
eval_tap $? 34 'RetrieveSinglePolicyVersion1' test.out

#- 35 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Eztx1WsY' \
    --body '{"description": "SiZqan0n", "displayVersion": "SBJroav9", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 35 'CreatePolicyVersion1' test.out

#- 36 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '66' \
    --limit '94' \
    > test.out 2>&1
eval_tap $? 36 'RetrieveAllPolicyTypes1' test.out

#- 37 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'XlvPG6bF' \
    --publisherUserId 'YReVHQip' \
    --clientId 'cCx9Zw5D' \
    --countryCode '2L7vIYhG' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "HQvsHXNU", "policyId": "Ne4mhgo5", "policyVersionId": "QB65lSAi"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "pflxqMrj", "policyId": "3oZk03QX", "policyVersionId": "cKMDYDDx"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "lNFSrUEi", "policyId": "rnjX9fDm", "policyVersionId": "IbeZxzfT"}]' \
    > test.out 2>&1
eval_tap $? 37 'IndirectBulkAcceptVersionedPolicy' test.out

#- 38 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'cyiuATus' \
    --publisherUserId '9hsfpFDc' \
    --clientId 'SDG8aMVG' \
    --countryCode 'LiBNrDjq' \
    > test.out 2>&1
eval_tap $? 38 'AdminRetrieveEligibilities' test.out

#- 39 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'oxcwgGLX' \
    > test.out 2>&1
eval_tap $? 39 'RetrievePolicies' test.out

#- 40 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'pUL4pp2n' \
    --body '{"description": "cYAHdNzD", "displayVersion": "meIP6rOv", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 40 'UpdatePolicyVersion' test.out

#- 41 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'cJcHm3SZ' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 41 'PublishPolicyVersion' test.out

#- 42 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'LxoRDFuu' \
    --body '{"description": "uySj29a9", "isDefaultOpted": true, "isMandatory": false, "policyName": "oVk8T3Gp", "readableId": "AnkCmBUq", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePolicy' test.out

#- 43 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId '1UskYs4Y' \
    > test.out 2>&1
eval_tap $? 43 'SetDefaultPolicy2' test.out

#- 44 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'w20DOqOB' \
    --versionId 'SC2DKHRu' \
    > test.out 2>&1
eval_tap $? 44 'RetrieveSinglePolicyVersion' test.out

#- 45 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'PMMWH8Yb' \
    --body '{"description": "33T5UBJC", "displayVersion": "jfcnLRfx", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 45 'CreatePolicyVersion' test.out

#- 46 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '26' \
    --limit '59' \
    > test.out 2>&1
eval_tap $? 46 'RetrieveAllPolicyTypes' test.out

#- 47 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'hhqElIaD' \
    > test.out 2>&1
eval_tap $? 47 'GetUserInfoStatus' test.out

#- 48 SyncUserInfo
./ng net.accelbyte.sdk.cli.Main legal syncUserInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'SyncUserInfo' test.out

#- 49 InvalidateUserInfoCache
./ng net.accelbyte.sdk.cli.Main legal invalidateUserInfoCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'InvalidateUserInfoCache' test.out

#- 50 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'ml48wdNF' \
    > test.out 2>&1
eval_tap $? 50 'AnonymizeUserAgreement' test.out

#- 51 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "duat2vQR", "policyId": "3biBfsu4", "policyVersionId": "jmsRE2w1"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "QAk4mqrx", "policyId": "zTtuLl4X", "policyVersionId": "lbGL8QOx"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "jzm8y2wN", "policyId": "hmwoYZyI", "policyVersionId": "4EFZKBcY"}]' \
    > test.out 2>&1
eval_tap $? 51 'ChangePreferenceConsent1' test.out

#- 52 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'rCEAE7WI' \
    > test.out 2>&1
eval_tap $? 52 'AcceptVersionedPolicy' test.out

#- 53 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 53 'RetrieveAgreementsPublic' test.out

#- 54 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "ehwH3q31", "policyId": "A806DJga", "policyVersionId": "s4b6z3LN"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "oKFeIaFQ", "policyId": "CYoDPICp", "policyVersionId": "nduEEQlU"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "Jz4mnRBk", "policyId": "MNxvvKgA", "policyVersionId": "T8mJrYq6"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkAcceptVersionedPolicy' test.out

#- 55 IndirectBulkAcceptVersionedPolicyV2
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'hRkloqxM' \
    --countryCode '3gpwxcfM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'y9XzjjI5' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "aKDUL3sa", "policyId": "13lk1dQB", "policyVersionId": "HO86IlBh"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "etU4RwTq", "policyId": "UXlTDBzO", "policyVersionId": "uYsaZA2y"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "3snn2ZkP", "policyId": "7cFdP43e", "policyVersionId": "5dC9XIBu"}]' \
    > test.out 2>&1
eval_tap $? 55 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 56 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'dfZgrbHD' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "AP2aMlu7", "policyId": "WtjCtoYe", "policyVersionId": "tOO847g8"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Mm5cTtFW", "policyId": "botQyXJR", "policyVersionId": "cQWsmqPN"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "92epxk0i", "policyId": "8VxsZNer", "policyVersionId": "eSvf9699"}]' \
    > test.out 2>&1
eval_tap $? 56 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 57 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'RetrieveEligibilitiesPublic' test.out

#- 58 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'mCEHThUJ' \
    --countryCode 'kETAsSp7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gh4TeUTk' \
    > test.out 2>&1
eval_tap $? 58 'RetrieveEligibilitiesPublicIndirect' test.out

#- 59 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId 'OkAYfJB8' \
    > test.out 2>&1
eval_tap $? 59 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 60 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'AT9t4Tv2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 61 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode '07Y2QD3o' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags '1qlYB1RS' \
    > test.out 2>&1
eval_tap $? 61 'RetrieveLatestPolicies' test.out

#- 62 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 's6gQxC3G' \
    > test.out 2>&1
eval_tap $? 62 'RetrieveLatestPoliciesPublic' test.out

#- 63 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'b7S0o4zG' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags '7KQI1AeF' \
    > test.out 2>&1
eval_tap $? 63 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 64 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 64 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE