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
    --userId 'KDgfKvtE' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "ae6SxaiH", "policyId": "tLzOMvvT", "policyVersionId": "ujdadtYg"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "7V4kKudu", "policyId": "okoVBmQu", "policyVersionId": "pA1kjktI"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "cpJUSRUH", "policyId": "UokEUoPa", "policyVersionId": "HS3KWbRD"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'eV1NKqHc' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword '62G5eYNc' \
    --limit '100' \
    --offset '5' \
    --policyVersionId 'aven7dUs' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["hvnfus4U", "7p88MN1L", "mKM90k52"], "affectedCountries": ["kisjsMBu", "kQi92iZR", "egAjuXpP"], "basePolicyName": "tB7RAyPK", "description": "VnwZz98P", "namespace": "dylNsKRw", "tags": ["zR2ez3Xo", "lfH37sxd", "A5DvM6hr"], "typeId": "OtYwRl8o"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'PXwT4UDM' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'M6JjAcaS' \
    --body '{"affectedClientIds": ["xJtskLi1", "Oh11y18P", "os9CNnHr"], "affectedCountries": ["g0GBh0OE", "ptNnY0GM", "Lug7tLHq"], "basePolicyName": "JxIuwmtQ", "description": "Tu8ydOHy", "namespace": "JTcFSiwU", "tags": ["fxeFZXNu", "jiLRfxor", "r5n2SJIa"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'q59cGyiM' \
    --countryCode 'GDDIU0eB' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'T5ACUgMr' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'w8OVbzQp' \
    --body '{"contentType": "mOnFtnHb", "description": "WYTtYySB", "localeCode": "gYVvDSrc"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'GNBWY5q0' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'rymvdSa8' \
    --body '{"attachmentChecksum": "yPQ2GueL", "attachmentLocation": "PqYLZrPR", "attachmentVersionIdentifier": "f6QTXpN7", "contentType": "n18Uz4Ml", "description": "g1salIdy"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'FyCblLET' \
    --body '{"contentMD5": "Cc5feSoj", "contentType": "wUvgZUYw"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'sX85OL0o' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'CLi3011N' \
    --publisherUserId 'TJCC5XNy' \
    --clientId 'YfEz0WPT' \
    --countryCode 'wsteobkC' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "PfSTncDG", "policyId": "p3ArRyJ1", "policyVersionId": "D10vrnxD"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "IyUy0rFQ", "policyId": "dVKgiM71", "policyVersionId": "Ooc5f95d"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "Z7bGeeyb", "policyId": "2far29hL", "policyVersionId": "JKBLjyEb"}]' \
    > test.out 2>&1
eval_tap $? 16 'IndirectBulkAcceptVersionedPolicy' test.out

#- 17 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId '83okdim8' \
    --publisherUserId 'G0xiKjN1' \
    --clientId 'zX6gz9VE' \
    --countryCode 'wTGI5MWI' \
    > test.out 2>&1
eval_tap $? 17 'AdminRetrieveEligibilities' test.out

#- 18 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'NXAjFeF3' \
    > test.out 2>&1
eval_tap $? 18 'RetrievePolicies' test.out

#- 19 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'bWDv5zq8' \
    --body '{"description": "tK4BxSJg", "displayVersion": "DjfSwDSc", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdatePolicyVersion' test.out

#- 20 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'ljDlOZ3T' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 20 'PublishPolicyVersion' test.out

#- 21 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'qaX3lbz5' \
    --body '{"description": "VDBvEyoS", "isDefaultOpted": false, "isMandatory": false, "policyName": "p4VnTGwW", "readableId": "x79X5lpF", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePolicy' test.out

#- 22 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --policyId 'WQv6nDuF' \
    > test.out 2>&1
eval_tap $? 22 'SetDefaultPolicy1' test.out

#- 23 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId '2Loey8wd' \
    --versionId 'vUZ27zZC' \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicyVersion' test.out

#- 24 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId '5Lx5vynm' \
    --body '{"description": "CMHSLjrr", "displayVersion": "tONvtfFK", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreatePolicyVersion' test.out

#- 25 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '52' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 25 'RetrieveAllPolicyTypes' test.out

#- 26 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces '7aPzwzSj' \
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
    --userId 'PulU6o4c' \
    > test.out 2>&1
eval_tap $? 29 'AnonymizeUserAgreement' test.out

#- 30 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "NB6iclbF", "policyId": "8D35w76q", "policyVersionId": "13Zczg0g"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "RSxlaSmA", "policyId": "JohZrXXc", "policyVersionId": "frZVs3k0"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "pbVfONIz", "policyId": "0Spfq1AT", "policyVersionId": "bhcQzYpC"}]' \
    > test.out 2>&1
eval_tap $? 30 'ChangePreferenceConsent1' test.out

#- 31 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'jrfB1gqS' \
    > test.out 2>&1
eval_tap $? 31 'AcceptVersionedPolicy' test.out

#- 32 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 32 'RetrieveAgreementsPublic' test.out

#- 33 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "DNJicIAk", "policyId": "Ij3WpvJy", "policyVersionId": "DC92ZN3q"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "eZ11QkZt", "policyId": "lIntU0iT", "policyVersionId": "nGaDaCz6"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "hpiLZE7d", "policyId": "IXyrWqNg", "policyVersionId": "sxhVwIuA"}]' \
    > test.out 2>&1
eval_tap $? 33 'BulkAcceptVersionedPolicy' test.out

#- 34 IndirectBulkAcceptVersionedPolicyV2
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'LIbAaZe7' \
    --countryCode 'B4Tk2MPc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PBBAGkDl' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "0AQ388Ds", "policyId": "uBI60NS2", "policyVersionId": "JHITCu2g"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "yRuEXJLS", "policyId": "1Nyly8kw", "policyVersionId": "5mlESMCc"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "D07cffw3", "policyId": "zTXAZsuN", "policyVersionId": "gNm73RH0"}]' \
    > test.out 2>&1
eval_tap $? 34 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 35 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId '09IGxPJ5' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "JWfZv5RH", "policyId": "zFfPKajs", "policyVersionId": "n5zw1Mj8"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "kda4BGys", "policyId": "KiSapXw2", "policyVersionId": "GIp3kHju"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "7dQrjKzf", "policyId": "7EbmIHOu", "policyVersionId": "ZM9pA1OJ"}]' \
    > test.out 2>&1
eval_tap $? 35 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 36 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RetrieveEligibilitiesPublic' test.out

#- 37 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'yHGUqTXm' \
    --countryCode 'rv8EoIh8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cX469pVY' \
    > test.out 2>&1
eval_tap $? 37 'RetrieveEligibilitiesPublicIndirect' test.out

#- 38 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'OEt2mB8w' \
    > test.out 2>&1
eval_tap $? 38 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 39 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'GXJF0oFU' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'HpLjw9NN' \
    > test.out 2>&1
eval_tap $? 39 'RetrieveLatestPolicies' test.out

#- 40 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '7zymrZio' \
    > test.out 2>&1
eval_tap $? 40 'RetrieveLatestPoliciesPublic' test.out

#- 41 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'S1YotA0a' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'SChvw15k' \
    > test.out 2>&1
eval_tap $? 41 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 42 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 42 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE