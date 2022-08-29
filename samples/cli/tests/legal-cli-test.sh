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
    --userId 'Hg8qE13t' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "WHoxuk3b", "policyId": "SuSYOEne", "policyVersionId": "lZwuNerV"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "w7JHshPn", "policyId": "BxSYYcZ3", "policyVersionId": "KI6aFk2A"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "S02Ncs1Y", "policyId": "3bYFVm6V", "policyVersionId": "n5mfVnij"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'hMKakS01' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'ZnB9AVAk' \
    --limit '100' \
    --offset '59' \
    --policyVersionId 'aBKKf1KB' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["dgQZAA5h", "o2AIMKHe", "lXU9EAK6"], "affectedCountries": ["y2lZ8cnc", "qkHhWJ4d", "y0QDJnHU"], "basePolicyName": "xljVF6LS", "description": "HiXMoMVm", "namespace": "Nqlc3wix", "tags": ["ghHdoAg4", "tNfhVWyJ", "mgLKO1II"], "typeId": "dOlrv1Px"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId '8lMbi687' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'PEUipABQ' \
    --body '{"affectedClientIds": ["1FF7IULv", "hZRoVuAX", "OGaDr28S"], "affectedCountries": ["oU4bELyn", "ynGabCYh", "MnwrMtwZ"], "basePolicyName": "MW7AM3Cn", "description": "pr32aWMP", "namespace": "pKWbqNDG", "tags": ["XwwJrm6X", "X1wSindK", "BZuGCYc5"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'h8r0SpgY' \
    --countryCode 'abmKNbEw' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'ck3tJWxA' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'iKFvDJBx' \
    --body '{"contentType": "csyo5Q6t", "description": "tZVstAtS", "localeCode": "oS6qwNUm"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'TLOxArWo' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'NhBeh6QL' \
    --body '{"attachmentChecksum": "HT14YEnD", "attachmentLocation": "VNNL2Rh9", "attachmentVersionIdentifier": "OaKLzKbl", "contentType": "xns9GvTl", "description": "gQbtavn1"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'N7BytyQr' \
    --body '{"contentMD5": "VXECkrij", "contentType": "ng1glhgV"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'UScDm5bG' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'o3MCQNra' \
    --publisherUserId 'wlVqeBDk' \
    --clientId 'ViRy7cQc' \
    --countryCode 've2J17WB' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "PBXnYc9K", "policyId": "QeHcMOnK", "policyVersionId": "HovoFpSf"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "tLyWvlYR", "policyId": "7GobNYJo", "policyVersionId": "VAICpaNG"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "gOqq4w4t", "policyId": "aBTerZKX", "policyVersionId": "XB6XItxQ"}]' \
    > test.out 2>&1
eval_tap $? 16 'IndirectBulkAcceptVersionedPolicy' test.out

#- 17 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'jMhUeENw' \
    --publisherUserId 'w33LKJNC' \
    --clientId 'WMQ7hgY9' \
    --countryCode '0PdNLuQy' \
    > test.out 2>&1
eval_tap $? 17 'AdminRetrieveEligibilities' test.out

#- 18 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'Pm9sLYKH' \
    > test.out 2>&1
eval_tap $? 18 'RetrievePolicies' test.out

#- 19 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'aSFxuTRQ' \
    --body '{"description": "kMSUMbHc", "displayVersion": "tLtf84pI", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdatePolicyVersion' test.out

#- 20 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'hR3dKAiO' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 20 'PublishPolicyVersion' test.out

#- 21 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'kGdWNsBm' \
    --body '{"description": "XhVBDPm5", "isDefaultOpted": true, "isMandatory": false, "policyName": "rRFKlY1l", "readableId": "l8U6DsSe", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePolicy' test.out

#- 22 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --policyId 'mVGvcjeO' \
    > test.out 2>&1
eval_tap $? 22 'SetDefaultPolicy1' test.out

#- 23 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'fdraita0' \
    --versionId 'bBVp5dX5' \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicyVersion' test.out

#- 24 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'iujxDzCK' \
    --body '{"description": "TVExqxHv", "displayVersion": "nLuOhMZ6", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 24 'CreatePolicyVersion' test.out

#- 25 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '38' \
    --limit '70' \
    > test.out 2>&1
eval_tap $? 25 'RetrieveAllPolicyTypes' test.out

#- 26 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'Q4R8AmlZ' \
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
    --userId 'Sv60WA9g' \
    > test.out 2>&1
eval_tap $? 29 'AnonymizeUserAgreement' test.out

#- 30 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Wozva5YM", "policyId": "swo5msvJ", "policyVersionId": "MVI0QdRP"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "uA9Su3dF", "policyId": "iYSoj2NB", "policyVersionId": "euWVmvVv"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "2gSJpn6m", "policyId": "A1XJRQak", "policyVersionId": "vGhIUJSv"}]' \
    > test.out 2>&1
eval_tap $? 30 'ChangePreferenceConsent1' test.out

#- 31 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'd6VzMXQt' \
    > test.out 2>&1
eval_tap $? 31 'AcceptVersionedPolicy' test.out

#- 32 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 32 'RetrieveAgreementsPublic' test.out

#- 33 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "D7jlQ719", "policyId": "NWnzbE7O", "policyVersionId": "WedsZleo"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "NmejVUho", "policyId": "BFOCtAYU", "policyVersionId": "9Jk9mq2p"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "v215p4SZ", "policyId": "TJPWaKm1", "policyVersionId": "uyGzLGpi"}]' \
    > test.out 2>&1
eval_tap $? 33 'BulkAcceptVersionedPolicy' test.out

#- 34 IndirectBulkAcceptVersionedPolicyV2
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'mJ9qyiO2' \
    --countryCode 'QSxNi5rq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'r6DEi0yX' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "XUPlPvO1", "policyId": "PWyqab9J", "policyVersionId": "WSdsqKew"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "r6biR5xl", "policyId": "yMOL4m3r", "policyVersionId": "EtlMLG6t"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "agsabbZh", "policyId": "IMqYw9a1", "policyVersionId": "sBA9W4CU"}]' \
    > test.out 2>&1
eval_tap $? 34 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 35 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'iUQCsUAQ' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "U2nXt9h0", "policyId": "rJCUu8zk", "policyVersionId": "ovGOsvPy"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "G92NkAwV", "policyId": "FZcvC0Ca", "policyVersionId": "XYjcLe8E"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "P9DrgS9J", "policyId": "IHXbUVyQ", "policyVersionId": "q2yG5tWe"}]' \
    > test.out 2>&1
eval_tap $? 35 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 36 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RetrieveEligibilitiesPublic' test.out

#- 37 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'OBAx1uvX' \
    --countryCode '9gyW2TrJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZR6G1zf9' \
    > test.out 2>&1
eval_tap $? 37 'RetrieveEligibilitiesPublicIndirect' test.out

#- 38 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'uAwc5YsV' \
    > test.out 2>&1
eval_tap $? 38 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 39 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'xkkF6qob' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'KhFczSbZ' \
    > test.out 2>&1
eval_tap $? 39 'RetrieveLatestPolicies' test.out

#- 40 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'FMpxDUOC' \
    > test.out 2>&1
eval_tap $? 40 'RetrieveLatestPoliciesPublic' test.out

#- 41 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode '4QnJihCP' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags '8h4xGqyf' \
    > test.out 2>&1
eval_tap $? 41 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 42 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 42 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE