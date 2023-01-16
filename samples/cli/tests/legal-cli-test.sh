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
    --userId 'ZAphEfK7' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "mFYGGB5E", "policyId": "52Z9gTz9", "policyVersionId": "x9kqOW2e"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "EpBgYd7V", "policyId": "IgeyTySg", "policyVersionId": "VcYGI81B"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "NTwGWlF8", "policyId": "T9c7yTrF", "policyVersionId": "msloXzn5"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'g9Q8pwtf' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'yYyjhMHW' \
    --limit '23' \
    --offset '48' \
    --policyVersionId 'RCdgH9Uy' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["33xVZa7U", "AR5G81ql", "R85qXV69"], "affectedCountries": ["XthxqwT5", "agtZI4LJ", "fxFJJVZi"], "basePolicyName": "yN9S4UFC", "description": "bexGIIvf", "namespace": "YWgymGXN", "tags": ["xt9CthdS", "lpNAEXsB", "NO6Kd0QB"], "typeId": "LM0d82wd"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'wHkxzWOi' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'N3HPuSyM' \
    --body '{"affectedClientIds": ["9dAOSQ8H", "UaYK9Eop", "dx6HTrof"], "affectedCountries": ["IoMUvv0R", "0KD0Zq3Y", "MpzmPXbu"], "basePolicyName": "j5anRPo9", "description": "RhsxTDGz", "namespace": "x3DzMKOq", "tags": ["R6g5PWWr", "84XibaTW", "a58LgTaw"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'JFFMeQ14' \
    --countryCode 'lcmJa2ZO' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'JQduYY06' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'qkNuo4Pr' \
    --body '{"contentType": "qeggtVh4", "description": "anYh5rPg", "localeCode": "dLBJXmUN"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'OurJEMhe' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId '4gsJBIp3' \
    --body '{"attachmentChecksum": "G1asZGoV", "attachmentLocation": "tmszGNLz", "attachmentVersionIdentifier": "eAYOJUwU", "contentType": "NkB1fRDW", "description": "N43zvycF"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'sOpSQQKF' \
    --body '{"contentMD5": "EGZE0bfF", "contentType": "EP0iTttr"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'Zparygxl' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'IAwaxOZR' \
    --publisherUserId 'hn9s1ptD' \
    --clientId 'hdhMGZnZ' \
    --countryCode 'EoQFVo7T' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "I8dRQavl", "policyId": "tlcIdRmi", "policyVersionId": "KWEd9iBu"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "2aPbMHmf", "policyId": "2Vzt9KeF", "policyVersionId": "zeEQtoGj"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "zT1Qhvfv", "policyId": "zsORSNYZ", "policyVersionId": "r02QaM38"}]' \
    > test.out 2>&1
eval_tap $? 16 'IndirectBulkAcceptVersionedPolicy' test.out

#- 17 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'yrHdIkOD' \
    --publisherUserId 'h0F8teEZ' \
    --clientId 'Usa0ufCQ' \
    --countryCode 'JCHXoqxF' \
    > test.out 2>&1
eval_tap $? 17 'AdminRetrieveEligibilities' test.out

#- 18 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode '6lh2j8ML' \
    > test.out 2>&1
eval_tap $? 18 'RetrievePolicies' test.out

#- 19 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'J0zy9NCv' \
    --body '{"description": "d5rGXnNT", "displayVersion": "OoYe0tDA", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdatePolicyVersion' test.out

#- 20 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'vIsaD7Q8' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 20 'PublishPolicyVersion' test.out

#- 21 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'pytxXQnJ' \
    --body '{"description": "uVlCdL4x", "isDefaultOpted": false, "isMandatory": false, "policyName": "0kYm7P14", "readableId": "4Ev43Coj", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePolicy' test.out

#- 22 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --policyId 'ce4la8rb' \
    > test.out 2>&1
eval_tap $? 22 'SetDefaultPolicy1' test.out

#- 23 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId '3uqHm84V' \
    --versionId 'PByrlSHV' \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicyVersion' test.out

#- 24 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'zoXjRdAi' \
    --body '{"description": "xw2AZ3vJ", "displayVersion": "OYwkbUjY", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreatePolicyVersion' test.out

#- 25 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '12' \
    --limit '11' \
    > test.out 2>&1
eval_tap $? 25 'RetrieveAllPolicyTypes' test.out

#- 26 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'sazAgarx' \
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
    --userId '1BKcdErl' \
    > test.out 2>&1
eval_tap $? 29 'AnonymizeUserAgreement' test.out

#- 30 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "OPRcS7i0", "policyId": "MG8lXMVT", "policyVersionId": "EeQncC6O"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "0k3U0RyF", "policyId": "LKIPSuUm", "policyVersionId": "iCY4dg3U"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "k1QhD0xi", "policyId": "IaOimihz", "policyVersionId": "NvKCwwyP"}]' \
    > test.out 2>&1
eval_tap $? 30 'ChangePreferenceConsent1' test.out

#- 31 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'giPWkkkM' \
    > test.out 2>&1
eval_tap $? 31 'AcceptVersionedPolicy' test.out

#- 32 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 32 'RetrieveAgreementsPublic' test.out

#- 33 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "cW1c35j1", "policyId": "Duk9Sczi", "policyVersionId": "8KN6HFTq"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "L7MZpkz4", "policyId": "BzipF1AL", "policyVersionId": "AYUdwnk9"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "KsYD8Tnl", "policyId": "iONq9yxQ", "policyVersionId": "i7tOin0g"}]' \
    > test.out 2>&1
eval_tap $? 33 'BulkAcceptVersionedPolicy' test.out

#- 34 IndirectBulkAcceptVersionedPolicyV2
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'ZYQOtS9T' \
    --countryCode 'FhCvJhiW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dlhIprKa' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "CZrGZdgY", "policyId": "zoJ8ucWl", "policyVersionId": "T7CptPrD"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "JOjoU2Pm", "policyId": "VGzJWccK", "policyVersionId": "Im2IjIXm"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "xNIcJIAX", "policyId": "uZ3yRxeK", "policyVersionId": "ODCScel7"}]' \
    > test.out 2>&1
eval_tap $? 34 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 35 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'gApAODEa' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "CevpOE2b", "policyId": "KZzbWhLt", "policyVersionId": "FykWBBN7"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "fHbv7dM1", "policyId": "xZLdmP6S", "policyVersionId": "f8FEXVVR"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "ToC4dxbx", "policyId": "rnPQoEpd", "policyVersionId": "syLi1mWI"}]' \
    > test.out 2>&1
eval_tap $? 35 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 36 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RetrieveEligibilitiesPublic' test.out

#- 37 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'hu6aZ35S' \
    --countryCode 'g4IzrcB1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kP5uWjah' \
    > test.out 2>&1
eval_tap $? 37 'RetrieveEligibilitiesPublicIndirect' test.out

#- 38 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId '1ugXrRUV' \
    > test.out 2>&1
eval_tap $? 38 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 39 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'yXRYKYwg' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'hVJptW7L' \
    > test.out 2>&1
eval_tap $? 39 'RetrieveLatestPolicies' test.out

#- 40 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'YfCCfAQZ' \
    > test.out 2>&1
eval_tap $? 40 'RetrieveLatestPoliciesPublic' test.out

#- 41 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode '018uCeSE' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'XcvDOUlj' \
    > test.out 2>&1
eval_tap $? 41 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 42 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 42 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE