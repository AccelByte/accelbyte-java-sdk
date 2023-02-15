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
echo "1..63"

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
    --userId 'Lsmfavn9' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "MeYAyyHg", "policyId": "RxiJQwtV", "policyVersionId": "yh1uwPmO"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "wyqoZued", "policyId": "kuQlNZ3Q", "policyVersionId": "zIVACmrN"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "o0oUBplr", "policyId": "7dd5yftW", "policyVersionId": "kT5jAh3y"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'SwQnSxeA' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'qpadNlyF' \
    --limit '13' \
    --offset '11' \
    --policyVersionId 'Xh1HvDgo' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["P9ol0hZN", "u0zB0ZwM", "LAu537KE"], "affectedCountries": ["7dq7pTL7", "Y5wpyYK7", "UFsZlb5h"], "basePolicyName": "9IWcow3G", "description": "XQo6s05h", "namespace": "0vsuvW25", "tags": ["Df8rAD9w", "13nrkLFt", "X9K5Xz4K"], "typeId": "83grrBd3"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'qg4euw53' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'W2CYSP86' \
    --body '{"affectedClientIds": ["11N7jTl9", "2TRwnZT4", "vzpV3du7"], "affectedCountries": ["CbzGFTP4", "48twnhnD", "mt10t9Qg"], "basePolicyName": "oz6o39bo", "description": "0YBP1XMI", "namespace": "E8mQNqiP", "tags": ["ugLLHSc5", "YivKiyPu", "L7LLMzOA"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'K4eG2352' \
    --countryCode 'etaWcXnD' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'jMK58tFb' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'Jbc0LMzm' \
    --body '{"contentType": "cWQVJww3", "description": "cnI5OLix", "localeCode": "sD3RQ8rg"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'yqcGWrxB' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'LpwBV9m6' \
    --body '{"attachmentChecksum": "3IiYeg5t", "attachmentLocation": "6odulhJa", "attachmentVersionIdentifier": "epAn7BvK", "contentType": "1hxHgzoL", "description": "pTs2Mjfh"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'ZjUdEyDL' \
    --body '{"contentMD5": "bM52XbJp", "contentType": "e8Cr26Ut"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'oCZE4Vwx' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'msfSqHfV' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreements1' test.out

#- 17 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --keyword 'tgIh9h0e' \
    --limit '75' \
    --offset '12' \
    --policyVersionId 'yBe40xOD' \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAllUsersByPolicyVersion1' test.out

#- 18 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 19 CreatePolicy1
./ng net.accelbyte.sdk.cli.Main legal createPolicy1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["JbP4NCtF", "0YmmngxP", "O9IswTIG"], "affectedCountries": ["CGzNK0lR", "C46zPS94", "TZgaYu4x"], "basePolicyName": "nVBX1LFr", "description": "8GzB1GGX", "tags": ["seUywwOu", "8NsYwvWn", "pzGxptHT"], "typeId": "Y5nW4CDj"}' \
    > test.out 2>&1
eval_tap $? 19 'CreatePolicy1' test.out

#- 20 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId 'Q3AzBE7Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'RetrieveSinglePolicy1' test.out

#- 21 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'GJpPsHAF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["Rmj2AAz0", "uvsxZ1sB", "XBvDwlfp"], "affectedCountries": ["bkqDJUmA", "xzW1aItl", "C0tlpxP2"], "basePolicyName": "Cb75alUF", "description": "5p0E6XBX", "tags": ["DGyIYbds", "QaqdqgtN", "boYfmFtg"]}' \
    > test.out 2>&1
eval_tap $? 21 'PartialUpdatePolicy1' test.out

#- 22 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId 'L2a9uThF' \
    --countryCode 'jsLpf8ms' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'RetrievePolicyCountry1' test.out

#- 23 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'jK0YJdNh' \
    > test.out 2>&1
eval_tap $? 23 'RetrieveLocalizedPolicyVersions1' test.out

#- 24 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'Fwv8Ivhu' \
    --body '{"contentType": "dAD8wBmm", "description": "VOS9LAgF", "localeCode": "szgKWekD"}' \
    > test.out 2>&1
eval_tap $? 24 'CreateLocalizedPolicyVersion1' test.out

#- 25 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'VKQtJLdv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 26 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId '1pdrGOD0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "EeRsgbRV", "attachmentLocation": "VC98IXHr", "attachmentVersionIdentifier": "iygZgvsP", "contentType": "5YlAlq01", "description": "6a8IM7cK"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateLocalizedPolicyVersion1' test.out

#- 27 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'dnKUKusS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "yvmXawCo", "contentType": "Xq0m4XZR"}' \
    > test.out 2>&1
eval_tap $? 27 'RequestPresignedURL1' test.out

#- 28 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId '2fCsr5JJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SetDefaultPolicy1' test.out

#- 29 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'hYNbhoiO' \
    --body '{"description": "FIthOGuf", "displayVersion": "yM7Z8Dbg", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdatePolicyVersion1' test.out

#- 30 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'LBJUuiN7' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 30 'PublishPolicyVersion1' test.out

#- 31 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'g06Zy4oU' \
    --body '{"description": "jB1vvLNN", "isDefaultOpted": false, "isMandatory": false, "policyName": "i38nUpXm", "readableId": "WdKJTigP", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePolicy1' test.out

#- 32 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'NpyBiKjB' \
    > test.out 2>&1
eval_tap $? 32 'SetDefaultPolicy3' test.out

#- 33 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'e71mrSh2' \
    --versionId 'GR3oB7WX' \
    > test.out 2>&1
eval_tap $? 33 'RetrieveSinglePolicyVersion1' test.out

#- 34 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId '2l25jEFq' \
    --body '{"description": "6Nvyl4IK", "displayVersion": "ZfEaricR", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 34 'CreatePolicyVersion1' test.out

#- 35 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '21' \
    --limit '93' \
    > test.out 2>&1
eval_tap $? 35 'RetrieveAllPolicyTypes1' test.out

#- 36 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 's114ZK4W' \
    --publisherUserId 'v1X4V4Qt' \
    --clientId 'hSuqFVVC' \
    --countryCode 'N6qEZE5t' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "yRWgs9LM", "policyId": "1KaqxJqw", "policyVersionId": "nPd8Jc0z"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "Hyfks3RL", "policyId": "8pP084b2", "policyVersionId": "mcZ5NszL"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "bn95eKAg", "policyId": "iOOUDMOJ", "policyVersionId": "ely44C4h"}]' \
    > test.out 2>&1
eval_tap $? 36 'IndirectBulkAcceptVersionedPolicy' test.out

#- 37 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'ItS8rdAX' \
    --publisherUserId 'iBF0V4UU' \
    --clientId 'Pzxgyj2Y' \
    --countryCode 'mTxnbOxu' \
    > test.out 2>&1
eval_tap $? 37 'AdminRetrieveEligibilities' test.out

#- 38 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'fSwoLd3Z' \
    > test.out 2>&1
eval_tap $? 38 'RetrievePolicies' test.out

#- 39 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'okwzb8bf' \
    --body '{"description": "PWmznsv5", "displayVersion": "GIv6zw4D", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 39 'UpdatePolicyVersion' test.out

#- 40 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId '4gmLg7nk' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 40 'PublishPolicyVersion' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId '5XdbN6zn' \
    --body '{"description": "ZayYK3GX", "isDefaultOpted": true, "isMandatory": true, "policyName": "QfuyZDdK", "readableId": "5fEeV5Ks", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId 'Ai3WgsAp' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy2' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'tZtE8dSs' \
    --versionId 'ezfrSJQy' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'VB8t9zgE' \
    --body '{"description": "eUdXShKk", "displayVersion": "YiNk902x", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '27' \
    --limit '34' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'PljmqDBh' \
    > test.out 2>&1
eval_tap $? 46 'GetUserInfoStatus' test.out

#- 47 SyncUserInfo
./ng net.accelbyte.sdk.cli.Main legal syncUserInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'SyncUserInfo' test.out

#- 48 InvalidateUserInfoCache
./ng net.accelbyte.sdk.cli.Main legal invalidateUserInfoCache \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'InvalidateUserInfoCache' test.out

#- 49 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'b9cupXt8' \
    > test.out 2>&1
eval_tap $? 49 'AnonymizeUserAgreement' test.out

#- 50 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Qa5v9G2w", "policyId": "8Y7pMbl2", "policyVersionId": "ta0YzsFa"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "WkeTB1aD", "policyId": "3NPZdWEk", "policyVersionId": "5oLGACsZ"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "OlvegBcD", "policyId": "nNpby5jH", "policyVersionId": "2UQ8hKPB"}]' \
    > test.out 2>&1
eval_tap $? 50 'ChangePreferenceConsent1' test.out

#- 51 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'PjfZHVgY' \
    > test.out 2>&1
eval_tap $? 51 'AcceptVersionedPolicy' test.out

#- 52 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 52 'RetrieveAgreementsPublic' test.out

#- 53 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "LVSllURS", "policyId": "Ziv9YxHU", "policyVersionId": "zF1o3XUi"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "TfWi4fnZ", "policyId": "tlUtTQJi", "policyVersionId": "JlFYCXwR"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "pxck3NIk", "policyId": "5rEzURut", "policyVersionId": "cu36i0GO"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkAcceptVersionedPolicy' test.out

#- 54 IndirectBulkAcceptVersionedPolicyV2
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'o5cuPSpA' \
    --countryCode 'PqEERFEg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0wvQ8e9' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "l4x6JT50", "policyId": "ctCpQwgr", "policyVersionId": "5sw9yNZ2"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "xf0zF6M5", "policyId": "z0tVwnnr", "policyVersionId": "YZKHK3YU"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "IUGDiSto", "policyId": "wT50fDnU", "policyVersionId": "vIGPvJOT"}]' \
    > test.out 2>&1
eval_tap $? 54 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 55 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'h0XWMsUE' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "sEBM8ZJJ", "policyId": "6I34cJYr", "policyVersionId": "p6lCluUK"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "uBz3L7sy", "policyId": "fmH2BXDP", "policyVersionId": "RZ9vyUtr"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "oxrSjUnb", "policyId": "7QoPhtLt", "policyVersionId": "V7GQ8Kva"}]' \
    > test.out 2>&1
eval_tap $? 55 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 56 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RetrieveEligibilitiesPublic' test.out

#- 57 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'U3xQxGNQ' \
    --countryCode 'Pu9qCQqm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RD48FcOK' \
    > test.out 2>&1
eval_tap $? 57 'RetrieveEligibilitiesPublicIndirect' test.out

#- 58 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId 'MrsJ7yWr' \
    > test.out 2>&1
eval_tap $? 58 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 59 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'N457Dcqk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 60 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'KGuuBqIT' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'Bte9nzRw' \
    > test.out 2>&1
eval_tap $? 60 'RetrieveLatestPolicies' test.out

#- 61 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'QKWt6s7z' \
    > test.out 2>&1
eval_tap $? 61 'RetrieveLatestPoliciesPublic' test.out

#- 62 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'ttjXzGky' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'W9hu9kbV' \
    > test.out 2>&1
eval_tap $? 62 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 63 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 63 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE