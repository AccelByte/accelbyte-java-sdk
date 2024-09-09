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
echo "1..67"

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
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["mKtPDKJDXn7Z4U68", "diRilZ7oFgx4c8Ou", "su8XfqlqNiTvB6Sd"], "affectedCountries": ["AdIhUDrwoZ5MecdK", "i5r6QEa1ysLEzth6", "mXhzkzWkFeZSoEAc"], "basePolicyName": "BdW19m4eu6d5tA5j", "description": "UmiTqpyhPFdxLzFQ", "isHidden": false, "isHiddenPublic": true, "namespace": "MYzYiKWe5dNRljv7", "tags": ["IPrDQQRgat0SevkL", "GMS0lyuI9a2I9u6V", "pbsx5w8hqUI06UpO"], "typeId": "XGSLmCVuHOPlLlkv"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'R8sKgnuRkgghGoYu' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'pD391C2qtPYokahF' \
    --body '{"affectedClientIds": ["jkQsfCaTmt1d67FX", "MesTCf9x4rt69lna", "Gk2s9Q0mPVo3twu0"], "affectedCountries": ["7qxNeIxPz6MbwL6I", "Y69z1UaLqYSYWytL", "PziZMdjxcBZufQxG"], "basePolicyName": "iHPllG4cYEzfTD1Z", "description": "Bm3MqHcUmLZZbSqb", "isHidden": true, "isHiddenPublic": true, "namespace": "hpDDWVAla2l5BYNt", "tags": ["zzWi9gwQYv7t1o7T", "Tr1DmrhZv15T7quI", "IuS5S5XUdjsoqwGy"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'OvBMcaYmvCkGZ5dA' \
    --countryCode 'gqxpBFmaLoxozr6w' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'fNPX2bOItRMvqtlB' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId '2jJCSQT279ZZPYGu' \
    --body '{"contentType": "0rdlgdWyOtXi3cho", "description": "QrpOsDBU5SepjChB", "localeCode": "3V0v52Dlym6puQ23"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'xoJ8aeCnaLpUKp44' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'YUDjasWIPUvmEejt' \
    --body '{"attachmentChecksum": "GeoyIPa8ZRrvjj7i", "attachmentLocation": "l35MXbN9oCMNqq98", "attachmentVersionIdentifier": "SjTvhZNkSQ70D0H6", "contentType": "BXksUC9b6i5lZC9x", "description": "v32e8c5csSovoqsZ"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'NBdte9NDUPVJf6c2' \
    --body '{"contentMD5": "Z0QZxfgPubTDIHrv", "contentType": "qAThuwjRHpKKTlmV"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'r9XuoJbRFQSKVPHb' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreementsForMultiUsers
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreementsForMultiUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"currentPublishedOnly": false, "userIds": ["YE3p4lSck0ZHn5GI", "g7mSQUhAEtrmjqU6", "39YBHqaTHeKtW18i"]}' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreementsForMultiUsers' test.out

#- 17 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GeUlc9d9sogWa24C' \
    --excludeOtherNamespacesPolicies  \
    > test.out 2>&1
eval_tap $? 17 'RetrieveAcceptedAgreements1' test.out

#- 18 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --convertGameUserId  \
    --keyword 'KNS0GqVvUfHQvsHX' \
    --limit '81' \
    --offset '95' \
    --policyVersionId '2d3PBddN8S48l9ly' \
    > test.out 2>&1
eval_tap $? 18 'RetrieveAllUsersByPolicyVersion1' test.out

#- 19 DownloadExportedAgreementsInCSV
./ng net.accelbyte.sdk.cli.Main legal downloadExportedAgreementsInCSV \
    --namespace "$AB_NAMESPACE" \
    --exportId 'NApflxqMrj3oZk03' \
    > test.out 2>&1
eval_tap $? 19 'DownloadExportedAgreementsInCSV' test.out

#- 20 InitiateExportAgreementsToCSV
./ng net.accelbyte.sdk.cli.Main legal initiateExportAgreementsToCSV \
    --namespace "$AB_NAMESPACE" \
    --end 'QXcKMDYDDxHSZjtq' \
    --policyVersionId 'XyJ58f7Gc26SaiGV' \
    --start 'kydwYWQG26yUZNmT' \
    > test.out 2>&1
eval_tap $? 20 'InitiateExportAgreementsToCSV' test.out

#- 21 RetrieveAllLegalPoliciesByNamespace
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPoliciesByNamespace \
    --namespace "$AB_NAMESPACE" \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy1
./ng net.accelbyte.sdk.cli.Main legal createPolicy1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["kdqCt81P1ktfIovm", "tI8ilbyDPUIj88ce", "BcvrbYCwZtxFHyPL"], "affectedCountries": ["E8HoRS1X2PFAAMwz", "v9gsR5cJcHm3SZLx", "oRDFuuuySj29a9LJ"], "basePolicyName": "HPxB1UskYs4Yw20D", "description": "OqOBSC2DKHRuPMMW", "isHidden": false, "isHiddenPublic": false, "tags": ["0JT1yduat2vQR3bi", "b33T5UBJCjfcnLRf", "xeCSz9WEi8KlloeH"], "typeId": "Bfsu4jmsRE2w1yEk"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy1' test.out

#- 23 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId 'Lgh3tIYt4SqYUTLD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy1' test.out

#- 24 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'x9gIiDandpGT2t24' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["aOMh5eC3IHeHSKLC", "a3xreNDUWehwH3q3", "1A806DJgas4b6z3L"], "affectedCountries": ["6QEgJjBbEDoNf3n0", "hEoRCAcf80zfFyab", "NUj7fdgLA84Z8YYk"], "basePolicyName": "WAgIUXiI07A68eaq", "description": "C2J9jyEW6GLbc0Na", "isHidden": false, "isHiddenPublic": true, "tags": ["ADkzJEN2VHzih3bi", "XgeO3FgkXhjDzaQY", "t0VWn3CO39PXDNxt"]}' \
    > test.out 2>&1
eval_tap $? 24 'PartialUpdatePolicy1' test.out

#- 25 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId '3snn2ZkP7cFdP43e' \
    --countryCode '5dC9XIBudfZgrbHD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'RetrievePolicyCountry1' test.out

#- 26 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'IDm4hMzF4TxodenS' \
    > test.out 2>&1
eval_tap $? 26 'RetrieveLocalizedPolicyVersions1' test.out

#- 27 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'rUTvfqU0bfoMm5cT' \
    --body '{"contentType": "tFWbotQyXJRcQWsm", "description": "qPNs92epxk0i8Vxs", "localeCode": "ZNereSvf9699mCEH"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateLocalizedPolicyVersion1' test.out

#- 28 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'ThUJkETAsSp7gh4T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 29 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'eUTkOkAYfJB8AT9t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "4Tv207Y2QD3oD5fL", "attachmentLocation": "Cr3OOlXVv8ZGF7uY", "attachmentVersionIdentifier": "nGzpipNDigNJma1M", "contentType": "bqqZtfNWql4nmwAf", "description": "t4gqkNNlWkD9eOzi"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateLocalizedPolicyVersion1' test.out

#- 30 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'YRFOn0jJLHC9Lxhv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "NXTwGBCtohLtl9Zu", "contentType": "hytm5UDrT6QXCs5S"}' \
    > test.out 2>&1
eval_tap $? 30 'RequestPresignedURL1' test.out

#- 31 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId 'PBbRPZTF6oQAXVG7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'SetDefaultPolicy1' test.out

#- 32 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'tnsZg5QgXjvyGJPN' \
    --body '{"description": "4eXbJE5Vs2GcyomQ", "displayVersion": "oIXimBJehyxlNsjU", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 32 'UpdatePolicyVersion1' test.out

#- 33 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'Bt4P7WnbdSJtjX7Z' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 33 'PublishPolicyVersion1' test.out

#- 34 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'shZyZl5x4bRXBHUT' \
    --body '{"description": "rDzZSKscfOcYu3dp", "isDefaultOpted": true, "isMandatory": false, "policyName": "ROYqUiGKXVFCmpo6", "readableId": "sPwVOEDSJsEK5QpN", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 34 'UpdatePolicy1' test.out

#- 35 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Xmy0Zp6iIaTIKUkm' \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultPolicy3' test.out

#- 36 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'kk9QM0NBMA9ORxpz' \
    --versionId 'wLR2AK6eXUGPJsw1' \
    > test.out 2>&1
eval_tap $? 36 'RetrieveSinglePolicyVersion1' test.out

#- 37 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'fiP80G9Pclxcft2u' \
    --body '{"description": "lIJzPyrVEiOG4Ucq", "displayVersion": "suGKHhMRWLVd3Dlh", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 37 'CreatePolicyVersion1' test.out

#- 38 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '41' \
    --limit '38' \
    > test.out 2>&1
eval_tap $? 38 'RetrieveAllPolicyTypes1' test.out

#- 39 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'IpomM8sm1MiaI1mX' \
    --publisherUserId '2tJoARtdbBe7udsM' \
    --clientId 'rok0WvGYYnx4V709' \
    --countryCode 'xbnGezKsDwG2omOR' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "Vg8JqU0jZpjvsugA", "policyId": "OS7u8RiWyerCSa8S", "policyVersionId": "RgwsAj1ik1jglaDX"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "PqqRRulpqpymDkQh", "policyId": "trHWwRVnwVBOqOHi", "policyVersionId": "8pWGd1juYhiqjRJO"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "B5F93zFQbJndUDpd", "policyId": "ONneAczbBdHb2slt", "policyVersionId": "71B1SmZp2JZp50Cn"}]' \
    > test.out 2>&1
eval_tap $? 39 'IndirectBulkAcceptVersionedPolicy' test.out

#- 40 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pb71ORYcmQbTU5JX' \
    --publisherUserId '8ccLjMXJRk0eaKQD' \
    --clientId 'OJvrTefglSs6g4iY' \
    --countryCode '9u02aCNYIWekp18l' \
    > test.out 2>&1
eval_tap $? 40 'AdminRetrieveEligibilities' test.out

#- 41 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'OC3mNqF7Bl0LcghV' \
    > test.out 2>&1
eval_tap $? 41 'RetrievePolicies' test.out

#- 42 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'HfPEspxwhRON0bc1' \
    --body '{"description": "eMbEIjowLqc3ecjX", "displayVersion": "JbZDKKoxLE1Y3Dym", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePolicyVersion' test.out

#- 43 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'pai0rYaT5hOPjaf3' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 43 'PublishPolicyVersion' test.out

#- 44 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'H0tYighU0VUfcYHJ' \
    --body '{"description": "bBfAKSiPW3VgsZXi", "isDefaultOpted": false, "isMandatory": true, "policyName": "ej52WKi6tArAURt9", "readableId": "plCSVq8PdH6hJPUA", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 44 'UpdatePolicy' test.out

#- 45 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId 'qDuAXI66bQ71w0de' \
    > test.out 2>&1
eval_tap $? 45 'SetDefaultPolicy2' test.out

#- 46 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'oV9Lx5RDA1l2Xcrc' \
    --versionId 'iYNEzvSZIPkhSgOR' \
    > test.out 2>&1
eval_tap $? 46 'RetrieveSinglePolicyVersion' test.out

#- 47 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'cz5S5BvmgBLxh4ij' \
    --body '{"description": "FnE3Tam69qSZ7PC6", "displayVersion": "f6QkmZXElW9YfRSs", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 47 'CreatePolicyVersion' test.out

#- 48 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '32' \
    --limit '54' \
    > test.out 2>&1
eval_tap $? 48 'RetrieveAllPolicyTypes' test.out

#- 49 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'DMUAeeZ97SBROPYu' \
    > test.out 2>&1
eval_tap $? 49 'GetUserInfoStatus' test.out

#- 50 SyncUserInfo
eval_tap 0 50 'SyncUserInfo # SKIP deprecated' test.out

#- 51 InvalidateUserInfoCache
eval_tap 0 51 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 52 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'G6XqP6oo7G73zdxT' \
    > test.out 2>&1
eval_tap $? 52 'AnonymizeUserAgreement' test.out

#- 53 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "OfnwIdlNa29fDLh7", "policyId": "41IslKHzGlLKWUtD", "policyVersionId": "Qs61OQAoxyyQpRWC"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "iPDGQhNPEwiJCf2X", "policyId": "JVrlzqQls1ozhLVA", "policyVersionId": "3kE8jKvgatOEBM70"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "lNBJYOmpu1VCarzB", "policyId": "sV6xnZ5Jrzzjrcau", "policyVersionId": "g6CWVG8SWP3glU6m"}]' \
    > test.out 2>&1
eval_tap $? 53 'ChangePreferenceConsent1' test.out

#- 54 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'uswVJnNnN7kAa7j0' \
    > test.out 2>&1
eval_tap $? 54 'AcceptVersionedPolicy' test.out

#- 55 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 55 'RetrieveAgreementsPublic' test.out

#- 56 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "iFc5HTHQIoVsGo7d", "policyId": "wV9DBqFKHQkETJyT", "policyVersionId": "lUrwDTnoujQD4IEi"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "qXn3aoRtlqOECohV", "policyId": "iHA5CzgFSy8X1A3P", "policyVersionId": "rIfapq5AAeMe4L3m"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "ORBVXTIIJM9XsYII", "policyId": "ZxiXNMR9BgaWcFX3", "policyVersionId": "SUBhyoTsMWPAxUMk"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkAcceptVersionedPolicy' test.out

#- 57 IndirectBulkAcceptVersionedPolicyV2
eval_tap 0 57 'IndirectBulkAcceptVersionedPolicyV2 # SKIP deprecated' test.out

#- 58 IndirectBulkAcceptVersionedPolicy1
eval_tap 0 58 'IndirectBulkAcceptVersionedPolicy1 # SKIP deprecated' test.out

#- 59 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'RetrieveEligibilitiesPublic' test.out

#- 60 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'awaGpAyrIwMif3BO' \
    --countryCode 'dkocVTd4BxqGWV6m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJ0sQs6XNbjvqhnU' \
    > test.out 2>&1
eval_tap $? 60 'RetrieveEligibilitiesPublicIndirect' test.out

#- 61 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId 'VLWu8olKdxL6ozRm' \
    > test.out 2>&1
eval_tap $? 61 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 62 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'DD0jJvlfV5OemPYd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 63 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 63 'RetrieveCountryListWithPolicies' test.out

#- 64 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'YT7DROCjtuzFMbAG' \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'YI89hmguB8FOTjML' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 64 'RetrieveLatestPolicies' test.out

#- 65 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'oQomSJC4DdrKF7SU' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 65 'RetrieveLatestPoliciesPublic' test.out

#- 66 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'QPLG59e0k5ZtX6wK' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'pUlcIW32iK7MGt1i' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 66 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 67 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 67 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE