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
    --userId 'EAxcVpFrttufHIRd' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "UzVRiXbqlAw7r6W2", "policyId": "ktQG0h5JAav5kRa6", "policyVersionId": "2WopBJHPtcDs8bBZ"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "Lx8bbgorQeFbQ1g7", "policyId": "qbPngUNB1vRodwpz", "policyVersionId": "S6DaDpv8N7ZQVqGj"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "KJfh5pUkHODpoMF7", "policyId": "8NY4YkHs1cnz1JSD", "policyVersionId": "gY1TXp38zsCTCrbC"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'bPOyNQkT7NvyE3cw' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'yALczNIicXm7agSr' \
    --limit '19' \
    --offset '49' \
    --policyVersionId 'JW2OQNOs1PXhT5Fv' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["su8XfqlqNiTvB6Sd", "mKtPDKJDXn7Z4U68", "diRilZ7oFgx4c8Ou"], "affectedCountries": ["AdIhUDrwoZ5MecdK", "i5r6QEa1ysLEzth6", "mXhzkzWkFeZSoEAc"], "basePolicyName": "BdW19m4eu6d5tA5j", "description": "UmiTqpyhPFdxLzFQ", "namespace": "N05MYzYiKWe5dNRl", "tags": ["vkLGMS0lyuI9a2I9", "u6Vpbsx5w8hqUI06", "jv7IPrDQQRgat0Se"], "typeId": "UpOXGSLmCVuHOPlL"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'lkvR8sKgnuRkgghG' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'oYupD391C2qtPYok' \
    --body '{"affectedClientIds": ["wu0MesTCf9x4rt69", "7FXGk2s9Q0mPVo3t", "ahFjkQsfCaTmt1d6"], "affectedCountries": ["lna7qxNeIxPz6Mbw", "L6IY69z1UaLqYSYW", "ytLPziZMdjxcBZuf"], "basePolicyName": "QxGiHPllG4cYEzfT", "description": "D1ZBm3MqHcUmLZZb", "namespace": "Sqb8RwNmn9HrNQy4", "tags": ["YzUOcEdscKHPEqgA", "uZAAiE0mit9RGCCH", "8yu7Vk6Jt4Ymos9J"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'cdos4fYcTVU6RBt0' \
    --countryCode 'zYoMcHyCUEXlAvxJ' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'MdalwSyliWMNW5Ny' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId 'Lu0M3VHh2EI8JlDb' \
    --body '{"contentType": "PWbQ6Q9lNmqRBaAk", "description": "LnvxkT1X68cmDc3f", "localeCode": "xU8MyKrQpM4hkkK6"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'KKXNB3Gv0IqmF51T' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'khjYnaq6foWvXa3b' \
    --body '{"attachmentChecksum": "MrXsDr6kILsSSyDd", "attachmentLocation": "mykmoPYgc2L4jk4L", "attachmentVersionIdentifier": "o0LSP0pf4IxjUkl5", "contentType": "35X3ateEKDpADz1x", "description": "3poD3Qgb3boLQQ1M"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'zH7Qm8bwbmXgdAPh' \
    --body '{"contentMD5": "1EThG96gAFKK2WDg", "contentType": "CcxvONZm3EeERmDn"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'yeFoF7VSZ6pf3vne' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": true, "userIds": ["0nSBJroav91GXlvP", "jEEztx1WsYSiZqan", "VPHbn4Xxtu7LQREN"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G6bFYReVHQipcCx9' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements1' test.out

#- 18 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'Zw5D2L7vIYhGGSyE' \
    --limit '100' \
    --offset '44' \
    --policyVersionId '4ZJJ42d3PBddN8S4' \
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
    --body '{"affectedClientIds": ["SZjtqXyJ58f7Gc26", "8l9lyNApflxqMrj3", "oZk03QXcKMDYDDxH"], "affectedCountries": ["FHyPLtI8ilbyDPUI", "UZNmTBcvrbYCwZtx", "SaiGVkydwYWQG26y"], "basePolicyName": "j88cekdqCt81P1kt", "description": "fIovmv9gsR5cJcHm", "tags": ["9a9LJE8HoRS1X2PF", "AAMwzHPxB1UskYs4", "3SZLxoRDFuuuySj2"], "typeId": "Yw20DOqOBSC2DKHR"}' \
    > test.out 2>&1
eval_tap $? 20 'CreatePolicy1' test.out

#- 21 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId 'uPMMWH8Yb33T5UBJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'RetrieveSinglePolicy1' test.out

#- 22 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'CjfcnLRfxeCSz9WE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["i8KlloeH0JT1ydua", "t2vQR3biBfsu4jms", "RE2w1yEkLgh3tIYt"], "affectedCountries": ["IHeHSKLCa3xreNDU", "4SqYUTLDx9gIiDan", "dpGT2t24aOMh5eC3"], "basePolicyName": "WehwH3q31A806DJg", "description": "as4b6z3LNUj7fdgL", "tags": ["80zfFyabWAgIUXiI", "EDoNf3n0hEoRCAcf", "A84Z8YYk6QEgJjBb"]}' \
    > test.out 2>&1
eval_tap $? 22 'PartialUpdatePolicy1' test.out

#- 23 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId '07A68eaqC2J9jyEW' \
    --countryCode '6GLbc0NaKDUL3sa1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrievePolicyCountry1' test.out

#- 24 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '3lk1dQBHO86IlBhn' \
    > test.out 2>&1
eval_tap $? 24 'RetrieveLocalizedPolicyVersions1' test.out

#- 25 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'etU4RwTqUXlTDBzO' \
    --body '{"contentType": "uYsaZA2yyd4mbqoO", "description": "fADMMAXFaY9eKa69", "localeCode": "9bRVhyaKwwrAP2aM"}' \
    > test.out 2>&1
eval_tap $? 25 'CreateLocalizedPolicyVersion1' test.out

#- 26 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'lu7WtjCtoYetOO84' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 27 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId '7g8OudOfjnCuHZ3c' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "46IjGa23YvYmmDg7", "attachmentLocation": "VYPXIuvUYTZBRujI", "attachmentVersionIdentifier": "UE1Tq5jyAZvkRCMN", "contentType": "FIurjh2imdb4rbkX", "description": "j0ZwsVC0gL97ZVJS"}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateLocalizedPolicyVersion1' test.out

#- 28 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'PqJiwv1qlYB1RSKs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "6gQxC3Gb7S0o4zGY", "contentType": "Y7KQI1AeFgPqaOkv"}' \
    > test.out 2>&1
eval_tap $? 28 'RequestPresignedURL1' test.out

#- 29 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId 'o1aolB4lkKB4EYOk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'SetDefaultPolicy1' test.out

#- 30 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'Q1jMD3cym8xIfkOV' \
    --body '{"description": "W2grREOLx0KOww3H", "displayVersion": "ICQLfl7MUBG7qtPu", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 30 'UpdatePolicyVersion1' test.out

#- 31 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '4yAtURKLRkb738HG' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 31 'PublishPolicyVersion1' test.out

#- 32 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'S6rDgMdIIlhS1fSi' \
    --body '{"description": "M9331m7Ta1PsKc50", "isDefaultOpted": true, "isMandatory": true, "policyName": "2GcyomQoIXimBJeh", "readableId": "yxlNsjUgxBkF6wFP", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePolicy1' test.out

#- 33 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'SJtjX7ZshZyZl5x4' \
    > test.out 2>&1
eval_tap $? 33 'SetDefaultPolicy3' test.out

#- 34 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'bRXBHUTrDzZSKscf' \
    --versionId 'OcYu3dpCROYqUiGK' \
    > test.out 2>&1
eval_tap $? 34 'RetrieveSinglePolicyVersion1' test.out

#- 35 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'XVFCmpo6sPwVOEDS' \
    --body '{"description": "JsEK5QpNhlI2iS5E", "displayVersion": "pGhhvXYck0upMzUY", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 35 'CreatePolicyVersion1' test.out

#- 36 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '79' \
    --limit '3' \
    > test.out 2>&1
eval_tap $? 36 'RetrieveAllPolicyTypes1' test.out

#- 37 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'A9ORxpzwLR2AK6eX' \
    --publisherUserId 'UGPJsw1fiP80G9Pc' \
    --clientId 'lxcft2ulIJzPyrVE' \
    --countryCode 'iOG4UcqsuGKHhMRW' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "d3DlhLuIpomM8sm1", "policyId": "MiaI1mX2tJoARtdb", "policyVersionId": "Be7udsMrok0WvGYY"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "jLfFmteue9nzJ6fH", "policyId": "24T805tVg8JqU0jZ", "policyVersionId": "pjvsugAOS7u8RiWy"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "L4bTxBmZjdrrIxsB", "policyId": "0NRsB1fPqqRRulpq", "policyVersionId": "pymDkQhtrHWwRVnw"}]' \
    > test.out 2>&1
eval_tap $? 37 'IndirectBulkAcceptVersionedPolicy' test.out

#- 38 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'VBOqOHi8pWGd1juY' \
    --publisherUserId 'hiqjRJOqB5F93zFQ' \
    --clientId 'bJndUDpdONneAczb' \
    --countryCode 'BdHb2slt71B1SmZp' \
    > test.out 2>&1
eval_tap $? 38 'AdminRetrieveEligibilities' test.out

#- 39 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode '2JZp50CnPb71ORYc' \
    > test.out 2>&1
eval_tap $? 39 'RetrievePolicies' test.out

#- 40 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'mQbTU5JX8ccLjMXJ' \
    --body '{"description": "Rk0eaKQDOJvrTefg", "displayVersion": "lSs6g4iY9u02aCNY", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 40 'UpdatePolicyVersion' test.out

#- 41 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'Wekp18lOC3mNqF7B' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 41 'PublishPolicyVersion' test.out

#- 42 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'l0LcghVHfPEspxwh' \
    --body '{"description": "RON0bc1eMbEIjowL", "isDefaultOpted": true, "isMandatory": false, "policyName": "esKoELCpobBEG8X6", "readableId": "45xpdXpai0rYaT5h", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePolicy' test.out

#- 43 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId 'Pjaf3H0tYighU0VU' \
    > test.out 2>&1
eval_tap $? 43 'SetDefaultPolicy2' test.out

#- 44 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'fcYHJbBfAKSiPW3V' \
    --versionId 'gsZXiR1DJ7HVWqMk' \
    > test.out 2>&1
eval_tap $? 44 'RetrieveSinglePolicyVersion' test.out

#- 45 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'NSawQUWDFJvJBWic' \
    --body '{"description": "7UkBeIXuqDuAXI66", "displayVersion": "bQ71w0deoV9Lx5RD", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 45 'CreatePolicyVersion' test.out

#- 46 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '13' \
    --limit '24' \
    > test.out 2>&1
eval_tap $? 46 'RetrieveAllPolicyTypes' test.out

#- 47 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'xr0lCancUZGCHsZY' \
    > test.out 2>&1
eval_tap $? 47 'GetUserInfoStatus' test.out

#- 48 SyncUserInfo
eval_tap 0 48 'SyncUserInfo # SKIP deprecated' test.out

#- 49 InvalidateUserInfoCache
eval_tap 0 49 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 50 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'oLfR1KtOv7Zy0b65' \
    > test.out 2>&1
eval_tap $? 50 'AnonymizeUserAgreement' test.out

#- 51 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "vuKNuy0ytZQ7M6Nz", "policyId": "y1adnSKOLFKx1dX4", "policyVersionId": "LuWJu3pDMUAeeZ97"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "PYuG6XqP6oo7G73z", "policyId": "dxTgOfnwIdlNa29f", "policyVersionId": "DLh741IslKHzGlLK"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "cl5LLLOexL4fZvWt", "policyId": "ND2tcBFpX8lNtFEJ", "policyVersionId": "7tnkY6Mca5afj12K"}]' \
    > test.out 2>&1
eval_tap $? 51 'ChangePreferenceConsent1' test.out

#- 52 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId '2IzrBvvWm4udE0OX' \
    > test.out 2>&1
eval_tap $? 52 'AcceptVersionedPolicy' test.out

#- 53 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 53 'RetrieveAgreementsPublic' test.out

#- 54 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "TdlNBJYOmpu1VCar", "policyId": "zBsV6xnZ5Jrzzjrc", "policyVersionId": "aug6CWVG8SWP3glU"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "uswVJnNnN7kAa7j0", "policyId": "riFc5HTHQIoVsGo7", "policyVersionId": "dwV9DBqFKHQkETJy"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "rwDTnoujQD4IEiH9", "policyId": "Z5qXn3aoRtlqOECo", "policyVersionId": "hViHA5CzgFSy8X1A"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkAcceptVersionedPolicy' test.out

#- 55 IndirectBulkAcceptVersionedPolicyV2
eval_tap 0 55 'IndirectBulkAcceptVersionedPolicyV2 # SKIP deprecated' test.out

#- 56 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId '3PrIfapq5AAeMe4L' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "gWgU4pCAKxeE70Ca", "policyId": "unQNxot371W9G4Av", "policyVersionId": "QkqsGnmyo5JJTUVm"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "GEXFTlEMEsFzYqwg", "policyId": "K1Np5nodqpLm7FhJ", "policyVersionId": "BNXzAFdO0Khqf6ki"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "v2LFjAKY7CbgsWqF", "policyId": "WZX7kPBom8F9GLLT", "policyVersionId": "G8phc3n4iLoIllKl"}]' \
    > test.out 2>&1
eval_tap $? 56 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 57 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'RetrieveEligibilitiesPublic' test.out

#- 58 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'pO2pqiXJF3WGRaoQ' \
    --countryCode 'omSJC4DdrKF7SUQP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LG59e0k5ZtX6wK7P' \
    > test.out 2>&1
eval_tap $? 58 'RetrieveEligibilitiesPublicIndirect' test.out

#- 59 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId 'pUlcIW32iK7MGt1i' \
    > test.out 2>&1
eval_tap $? 59 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 60 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'xY5rA1WoVeJIePF8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 61 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'ZrQzP4zvtdxdbZUp' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'WCYzo8yO2KTK9tmm' \
    > test.out 2>&1
eval_tap $? 61 'RetrieveLatestPolicies' test.out

#- 62 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'FEO65Rb3z7CYLM8I' \
    > test.out 2>&1
eval_tap $? 62 'RetrieveLatestPoliciesPublic' test.out

#- 63 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'lsHqffnrfsGlfPaZ' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'g4uKxaCgcGLuC3br' \
    > test.out 2>&1
eval_tap $? 63 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 64 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 64 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE