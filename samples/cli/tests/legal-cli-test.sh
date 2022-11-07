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
echo "1..42"

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
    --userId '35DjZc6T' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "2s9RNe8T", "policyId": "gK7U15eA", "policyVersionId": "P9P1mnRp"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "23ojHa8p", "policyId": "OUXZ3Wxm", "policyVersionId": "56RiVPJk"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "MmtBitH0", "policyId": "5XR4VwNR", "policyVersionId": "JNnZdoMm"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'uAN3Wes5' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'DyiNzHa6' \
    --limit '5' \
    --offset '0' \
    --policyVersionId 'p0gLhJ8P' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["mAr1GgDE", "UZzerJiN", "aErEyzcp"], "affectedCountries": ["umSm6ztZ", "evThccMh", "XELsjhIf"], "basePolicyName": "b5IalaUP", "description": "w4I7JDAY", "namespace": "W0meibZd", "tags": ["4w61DsSM", "f9dWc7Ua", "pcTgVclm"], "typeId": "IA5uGOHQ"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'pS9E8LF7' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'sWyGIMX3' \
    --body '{"affectedClientIds": ["prczcA3D", "52yK5Cec", "cjzKmWWl"], "affectedCountries": ["QbWk6ih6", "EV1LzHdl", "VZJmOjeZ"], "basePolicyName": "mzXl1oQu", "description": "nxMroGaQ", "namespace": "OuA0ro2n", "tags": ["z6zfFkfK", "fNuOl2zG", "Oc6iBvIN"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'woSfpRLx' \
    --countryCode 'xDrpBFfH' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'oXj0P74U' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId '9aIEi2lo' \
    --body '{"contentType": "yMeNusZ4", "description": "Glcq1vuK", "localeCode": "4Oek7fOL"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'DWcJgGU7' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'c9CkMiyQ' \
    --body '{"attachmentChecksum": "qsW3qB1V", "attachmentLocation": "jC5o4wjK", "attachmentVersionIdentifier": "GhWjfJSZ", "contentType": "lAYfjHIu", "description": "QyPdtKaf"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId '5z3Z27tq' \
    --body '{"contentMD5": "cA9tjc0s", "contentType": "LtSGfpjH"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'Z1FanfMd' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId '54Rclkmy' \
    --publisherUserId 'W2jZ4Dhs' \
    --clientId 'OcVwVgyS' \
    --countryCode 'pFpRii36' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "NpClWQKC", "policyId": "UO8pyKHJ", "policyVersionId": "lu2ZwTVV"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "r6P4obgi", "policyId": "1812e0gN", "policyVersionId": "xPKarEGT"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "K0aGw1Fr", "policyId": "gFXuTlYA", "policyVersionId": "U565DgQg"}]' \
    > test.out 2>&1
eval_tap $? 16 'IndirectBulkAcceptVersionedPolicy' test.out

#- 17 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhilrrOx' \
    --publisherUserId 'Ukm9rsn8' \
    --clientId 'ZSvOsGXd' \
    --countryCode '8DOHjtw9' \
    > test.out 2>&1
eval_tap $? 17 'AdminRetrieveEligibilities' test.out

#- 18 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode '5yC0dRxP' \
    > test.out 2>&1
eval_tap $? 18 'RetrievePolicies' test.out

#- 19 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'NaYWN3GU' \
    --body '{"description": "x5SssmiY", "displayVersion": "JlSrzoin", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdatePolicyVersion' test.out

#- 20 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'Iscf09Qc' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 20 'PublishPolicyVersion' test.out

#- 21 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'G4kg4e6W' \
    --body '{"description": "mOvf0LZA", "isDefaultOpted": false, "isMandatory": false, "policyName": "PqJziqEn", "readableId": "XzIxGOGx", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePolicy' test.out

#- 22 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --policyId 'WrEoyUyi' \
    > test.out 2>&1
eval_tap $? 22 'SetDefaultPolicy1' test.out

#- 23 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'z5ALY4PV' \
    --versionId 'cqoficu4' \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicyVersion' test.out

#- 24 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId '3lXsD9Z5' \
    --body '{"description": "NXgyjtVX", "displayVersion": "0RrdIY4L", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreatePolicyVersion' test.out

#- 25 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '12' \
    --limit '77' \
    > test.out 2>&1
eval_tap $? 25 'RetrieveAllPolicyTypes' test.out

#- 26 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces '39bKY7pC' \
    > test.out 2>&1
eval_tap $? 26 'GetUserInfoStatus' test.out

#- 27 SyncUserInfo
./ng net.accelbyte.sdk.cli.Main legal syncUserInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'SyncUserInfo' test.out

#- 28 InvalidateUserInfoCache
./ng net.accelbyte.sdk.cli.Main legal invalidateUserInfoCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'InvalidateUserInfoCache' test.out

#- 29 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId '0rCLYn4S' \
    > test.out 2>&1
eval_tap $? 29 'AnonymizeUserAgreement' test.out

#- 30 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "gcSdbQJL", "policyId": "vQNutaBM", "policyVersionId": "JWOfL6sp"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Wu5Gn1bS", "policyId": "pNPbu6CH", "policyVersionId": "gXHyUceN"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "cGw888n1", "policyId": "GwKmrSIE", "policyVersionId": "eFphiwyp"}]' \
    > test.out 2>&1
eval_tap $? 30 'ChangePreferenceConsent1' test.out

#- 31 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'UwwopS2a' \
    > test.out 2>&1
eval_tap $? 31 'AcceptVersionedPolicy' test.out

#- 32 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 32 'RetrieveAgreementsPublic' test.out

#- 33 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "q1K8MIoV", "policyId": "I33OhQsJ", "policyVersionId": "FabdqCbf"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "PVD5v5xK", "policyId": "eBhbvdkr", "policyVersionId": "k5PjiKws"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "5xcZXLnY", "policyId": "fJFRuAzx", "policyVersionId": "ISCIzLOV"}]' \
    > test.out 2>&1
eval_tap $? 33 'BulkAcceptVersionedPolicy' test.out

#- 34 IndirectBulkAcceptVersionedPolicyV2
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'YPGMuKcF' \
    --countryCode '5hzCiinz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S29XvV0G' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "j2ZBxaaY", "policyId": "5qEOpUYK", "policyVersionId": "QMDyY2GA"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "9aziUNAC", "policyId": "M9wgP1t9", "policyVersionId": "vIKThjRa"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "oINYmWBD", "policyId": "p4VAyxG7", "policyVersionId": "vOAJzz1r"}]' \
    > test.out 2>&1
eval_tap $? 34 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 35 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'W4lLTUAk' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "TLCGR1RH", "policyId": "gNOOxV3c", "policyVersionId": "3z93AlxR"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "CObR6Xbd", "policyId": "LMZaK2g7", "policyVersionId": "DBtn1pul"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "EN5gwRkM", "policyId": "ddhwIO7I", "policyVersionId": "KAer2Mbg"}]' \
    > test.out 2>&1
eval_tap $? 35 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 36 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RetrieveEligibilitiesPublic' test.out

#- 37 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId '5q0BVb39' \
    --countryCode '3lNSJ9Mx' \
    --namespace "$AB_NAMESPACE" \
    --userId '3LqFuiFb' \
    > test.out 2>&1
eval_tap $? 37 'RetrieveEligibilitiesPublicIndirect' test.out

#- 38 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'Knq1ysro' \
    > test.out 2>&1
eval_tap $? 38 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 39 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'vDuWsH9h' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'PekijmJR' \
    > test.out 2>&1
eval_tap $? 39 'RetrieveLatestPolicies' test.out

#- 40 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'y0kgfzLP' \
    > test.out 2>&1
eval_tap $? 40 'RetrieveLatestPoliciesPublic' test.out

#- 41 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'lkenStYC' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'jKtSv3Tn' \
    > test.out 2>&1
eval_tap $? 41 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 42 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 42 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE