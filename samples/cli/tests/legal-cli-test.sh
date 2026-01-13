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
    --body '{"affectedClientIds": ["diRilZ7oFgx4c8Ou", "su8XfqlqNiTvB6Sd", "mKtPDKJDXn7Z4U68"], "affectedCountries": ["AdIhUDrwoZ5MecdK", "i5r6QEa1ysLEzth6", "mXhzkzWkFeZSoEAc"], "basePolicyName": "BdW19m4eu6d5tA5j", "countryGroupName": "UmiTqpyhPFdxLzFQ", "countryType": "COUNTRY", "description": "5MYzYiKWe5dNRljv", "isHidden": true, "isHiddenPublic": false, "namespace": "DQQRgat0SevkLGMS", "tags": ["LmCVuHOPlLlkvR8s", "0lyuI9a2I9u6Vpbs", "x5w8hqUI06UpOXGS"], "typeId": "KgnuRkgghGoYupD3"}' \
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
    --body '{"affectedClientIds": ["s9Q0mPVo3twu0Mes", "TCf9x4rt69lna7qx", "NeIxPz6MbwL6IY69"], "affectedCountries": ["z1UaLqYSYWytLPzi", "ZMdjxcBZufQxGiHP", "llG4cYEzfTD1ZBm3"], "basePolicyName": "MqHcUmLZZbSqb8Rw", "countryGroupName": "Nmn9HrNQy4uZAAiE", "countryType": "COUNTRY_GROUP", "description": "mit9RGCCHYzUOcEd", "isHidden": true, "isHiddenPublic": false, "namespace": "i9gwQYv7t1o7TTr1", "tags": ["DmrhZv15T7quIOvB", "McaYmvCkGZ5dAgqx", "pBFmaLoxozr6wfNP"]}' \
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
    --body '{"currentPublishedOnly": false, "userIds": ["BHqaTHeKtW18iGeU", "lc9d9sogWa24CKNS", "0GqVvUfHQvsHXNUN"]}' \
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
    --limit '31' \
    --offset '59' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 21 'RetrieveAllLegalPoliciesByNamespace' test.out

#- 22 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["2ncYAHdNzDmeIP6r", "JFfRByjlBiuFM3FI", "OvDz9KOsb392k6Ym"], "affectedCountries": ["MiVi10sG6vxkfUcm", "oVk8T3GpAnkCmBUq", "g2SCnqntX9y1aZSW"], "basePolicyName": "qRRbceJ5i0EeDxOg", "countryGroupName": "BnhhqElIaDml48wd", "countryType": "COUNTRY_GROUP", "description": "m5T50x9WT0GfH2rt", "isHidden": false, "isHiddenPublic": false, "tags": ["Yt4SqYUTLDx9gIiD", "andpGT2t24aOMh5e", "msRE2w1yEkLgh3tI"], "typeId": "C3IHeHSKLCa3xreN"}' \
    > test.out 2>&1
eval_tap $? 22 'CreatePolicy' test.out

#- 23 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'DUWehwH3q31A806D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicy' test.out

#- 24 DeleteBasePolicy
./ng net.accelbyte.sdk.cli.Main legal deleteBasePolicy \
    --basePolicyId 'Jgas4b6z3LNUj7fd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteBasePolicy' test.out

#- 25 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'gLA84Z8YYk6QEgJj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["iI07A68eaqC2J9jy", "cf80zfFyabWAgIUX", "BbEDoNf3n0hEoRCA"], "affectedCountries": ["a13lk1dQBHO86IlB", "EW6GLbc0NaKDUL3s", "hnetU4RwTqUXlTDB"], "basePolicyName": "zOuYsaZA2yyd4mbq", "countryGroupName": "oOfADMMAXFaY9eKa", "countryType": "COUNTRY_GROUP", "description": "9bRVhyaKwwrAP2aM", "isHidden": false, "isHiddenPublic": true, "tags": ["bfoMm5cTtFWbotQy", "4TxodenSrUTvfqU0", "XJRcQWsmqPNs92ep"]}' \
    > test.out 2>&1
eval_tap $? 25 'PartialUpdatePolicy' test.out

#- 26 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'xk0i8VxsZNereSvf' \
    --countryCode '9699mCEHThUJkETA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'RetrievePolicyCountry' test.out

#- 27 RetrieveAllPoliciesFromBasePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPoliciesFromBasePolicy \
    --basePolicyId 'sSp7gh4TeUTkOkAY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'RetrieveAllPoliciesFromBasePolicy' test.out

#- 28 CreatePolicyUnderBasePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicyUnderBasePolicy \
    --basePolicyId 'fJB8AT9t4Tv207Y2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": ["v8ZGF7uYnGzpipND", "QD3oD5fLCr3OOlXV", "igNJma1MbqqZtfNW"], "countryCode": "ql4nmwAft4gqkNNl", "countryGroupName": "WkD9eOziYRFOn0jJ", "countryType": "COUNTRY", "description": "HC9LxhvNXTwGBCto", "isDefaultSelection": false, "isMandatory": false, "policyName": "tl9Zuhytm5UDrT6Q", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 28 'CreatePolicyUnderBasePolicy' test.out

#- 29 DeleteLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal deleteLocalizedPolicy \
    --localizedPolicyVersionId 'RKLRkb738HGS6rDg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'DeleteLocalizedPolicy' test.out

#- 30 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'MdIIlhS1fSiM9331' \
    > test.out 2>&1
eval_tap $? 30 'RetrieveLocalizedPolicyVersions' test.out

#- 31 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'm7Ta1PsKc50Kv6ec' \
    --body '{"contentType": "nEevcAx2K2zkRenm", "description": "PZnGBt4P7WnbdSJt", "localeCode": "jX7ZshZyZl5x4bRX"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateLocalizedPolicyVersion' test.out

#- 32 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'BHUTrDzZSKscfOcY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 33 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'u3dpCROYqUiGKXVF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "Cmpo6sPwVOEDSJsE", "attachmentLocation": "K5QpNhlI2iS5EpGh", "attachmentVersionIdentifier": "hvXYck0upMzUYnb7", "contentType": "6tFkEORV3bu1bNCt", "description": "X7W40V6Do5sYadCC"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateLocalizedPolicyVersion' test.out

#- 34 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'FrHHC3DpZxkrQDXu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "NFviMarv8mnfHK8C", "contentType": "CmE2lPnsbD3SGEdl"}' \
    > test.out 2>&1
eval_tap $? 34 'RequestPresignedURL' test.out

#- 35 SetDefaultLocalizedPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultLocalizedPolicy \
    --localizedPolicyVersionId 'wuUccE536ugBp3HB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'SetDefaultLocalizedPolicy' test.out

#- 36 DeletePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal deletePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'vepnDCjgyJlXe36m' \
    > test.out 2>&1
eval_tap $? 36 'DeletePolicyVersion' test.out

#- 37 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'gWjLfFmteue9nzJ6' \
    --body '{"description": "fH24T805tVg8JqU0", "displayVersion": "jZpjvsugAOS7u8Ri", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePolicyVersion' test.out

#- 38 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'yerCSa8SRgwsAj1i' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 38 'PublishPolicyVersion' test.out

#- 39 UnpublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal unpublishPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'k1jglaDXTvKCWwNT' \
    > test.out 2>&1
eval_tap $? 39 'UnpublishPolicyVersion' test.out

#- 40 DeletePolicy
./ng net.accelbyte.sdk.cli.Main legal deletePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'Ahd2wrS0uPdjhdin' \
    > test.out 2>&1
eval_tap $? 40 'DeletePolicy' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'png5BLy8wbhMssAH' \
    --body '{"countries": ["VrjfGXZnqAQUoY1G", "ZNR88YbCtmKy8M9z", "japIkY9Rf4wP57dB"], "countryGroupName": "jlIIk0iKoTTS1j02", "description": "o7JjTXAQN0qdskdQ", "isDefaultOpted": true, "isMandatory": false, "policyName": "I8EFnmDbxIxi4YKl", "readableId": "ONk2Q5Y4Jvaizwii", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --namespace "$AB_NAMESPACE" \
    --policyId 'ekp18lOC3mNqF7Bl' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId '0LcghVHfPEspxwhR' \
    --versionId 'ON0bc1eMbEIjowLq' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --namespace "$AB_NAMESPACE" \
    --policyId 'c3ecjXJbZDKKoxLE' \
    --body '{"description": "1Y3Dymtj3giPg4x4", "displayVersion": "yiPX6ues1Hhhkg1y", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --namespace "$AB_NAMESPACE" \
    --offset '2' \
    --limit '5' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'LFzHEP8cM4NTwr0K' \
    --publisherUserId 'HaAsmTej52WKi6tA' \
    --clientId 'rAURt9plCSVq8PdH' \
    --countryCode '6hJPUAc0RVwXgAgn' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "CuaXBWQi6BqPg4xr", "policyId": "0lCancUZGCHsZYoL", "policyVersionId": "fR1KtOv7Zy0b65uv"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "Nuy0ytZQ7M6Nzy1a", "policyId": "dnSKOLFKx1dX4LuW", "policyVersionId": "Ju3pDMUAeeZ97SBR"}, {"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "YuG6XqP6oo7G73zd", "policyId": "xTgOfnwIdlNa29fD", "policyVersionId": "Lh741IslKHzGlLKW"}]' \
    > test.out 2>&1
eval_tap $? 46 'IndirectBulkAcceptVersionedPolicy' test.out

#- 47 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'UtDQs61OQAoxyyQp' \
    --publisherUserId 'RWCiiPDGQhNPEwiJ' \
    --clientId 'Cf2XJVrlzqQls1oz' \
    --countryCode 'hLVA3kE8jKvgatOE' \
    > test.out 2>&1
eval_tap $? 47 'AdminRetrieveEligibilities' test.out

#- 48 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'BM70TdlNBJYOmpu1' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePolicies' test.out

#- 49 OldUpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicyVersion \
    --policyVersionId 'VCarzBsV6xnZ5Jrz' \
    --body '{"description": "zjrcaug6CWVG8SWP", "displayVersion": "3glU6muswVJnNnN7", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 49 'OldUpdatePolicyVersion' test.out

#- 50 OldPublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublishPolicyVersion \
    --policyVersionId 'iTrjyEgarAdNJOIG' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 50 'OldPublishPolicyVersion' test.out

#- 51 OldUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal oldUpdatePolicy \
    --policyId '36I6tRbRcrEveMdA' \
    --body '{"countries": ["bsPheTH26IUJNvYu", "diPKDUVSC00PYeDc", "agginxnFIna3yddc"], "countryGroupName": "GRUvpZaHCuESOiIZ", "description": "sMfB4ZH3mtgWgU4p", "isDefaultOpted": true, "isMandatory": true, "policyName": "TIIJM9XsYIIZxiXN", "readableId": "MR9BgaWcFX3SUBhy", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 51 'OldUpdatePolicy' test.out

#- 52 OldSetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal oldSetDefaultPolicy \
    --policyId 'o5JJTUVmb8GEXFTl' \
    > test.out 2>&1
eval_tap $? 52 'OldSetDefaultPolicy' test.out

#- 53 OldRetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveSinglePolicyVersion \
    --policyId 'EMEsFzYqwgK1Np5n' \
    --versionId 'odqpLm7FhJBNXzAF' \
    > test.out 2>&1
eval_tap $? 53 'OldRetrieveSinglePolicyVersion' test.out

#- 54 OldCreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldCreatePolicyVersion \
    --policyId 'dO0Khqf6kiTdSGv2' \
    --body '{"description": "LFjAKY7CbgsWqFWZ", "displayVersion": "X7kPBom8F9GLLTG8", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 54 'OldCreatePolicyVersion' test.out

#- 55 OldRetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveAllPolicyTypes \
    --offset '58' \
    --limit '14' \
    > test.out 2>&1
eval_tap $? 55 'OldRetrieveAllPolicyTypes' test.out

#- 56 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'jtuzFMbAG9YI89hm' \
    > test.out 2>&1
eval_tap $? 56 'GetUserInfoStatus' test.out

#- 57 SyncUserInfo
eval_tap 0 57 'SyncUserInfo # SKIP deprecated' test.out

#- 58 InvalidateUserInfoCache
eval_tap 0 58 'InvalidateUserInfoCache # SKIP deprecated' test.out

#- 59 AnonymizeUserAgreement
./ng net.accelbyte.sdk.cli.Main legal anonymizeUserAgreement \
    --userId 'guB8FOTjMLo4b9rI' \
    > test.out 2>&1
eval_tap $? 59 'AnonymizeUserAgreement' test.out

#- 60 PublicChangePreferenceConsent
./ng net.accelbyte.sdk.cli.Main legal publicChangePreferenceConsent \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "qYkEpstyVTBcrM8r", "policyId": "G0rH0zcswwVeMK6M", "policyVersionId": "bGIVIu8vvwLc7KY3"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "oVeJIePF8ZrQzP4z", "policyId": "vtdxdbZUpd6FJtHJ", "policyVersionId": "1pyVwyKQLY6FEO65"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "6ghP1y4Zi7s7QBlk", "policyId": "44Z44B1GZgKg4uKx", "policyVersionId": "aCgcGLuC3brWdTYC"}]' \
    > test.out 2>&1
eval_tap $? 60 'PublicChangePreferenceConsent' test.out

#- 61 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'fHkIySok5DiXZtLW' \
    > test.out 2>&1
eval_tap $? 61 'AcceptVersionedPolicy' test.out

#- 62 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 62 'RetrieveAgreementsPublic' test.out

#- 63 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "rGysryod3dNQrmsA", "policyId": "pRA6HX3RwrKt2eco", "policyVersionId": "zL0TOg54vCE48L5o"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "4lNa4JUMSHNgqRqC", "policyId": "V7usamANkZlOX9Sf", "policyVersionId": "o95HgXqKhTPkwfLM"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "0LZ5njN86Hl8kUXz", "policyId": "t6bSc6bWvgpVyW9d", "policyVersionId": "D1kOmvrAejcq2Lgk"}]' \
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
    --clientId 'QuaS7RBx3vim02jB' \
    --countryCode 'OxrZDyvpcLYOWA8N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jxOnaEok4nOOCzfs' \
    > test.out 2>&1
eval_tap $? 67 'RetrieveEligibilitiesPublicIndirect' test.out

#- 68 OldPublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal oldPublicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'flhjbngJOUn18G5M' \
    > test.out 2>&1
eval_tap $? 68 'OldPublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 69 PublicRetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publicRetrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'lfDTk8aG40Nlncce' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'PublicRetrieveSingleLocalizedPolicyVersion' test.out

#- 70 RetrieveCountryListWithPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveCountryListWithPolicies \
    > test.out 2>&1
eval_tap $? 70 'RetrieveCountryListWithPolicies' test.out

#- 71 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'IZSwgAIkgzh4pTU0' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'Ajci0V3tBf2jnHGK' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 71 'RetrieveLatestPolicies' test.out

#- 72 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'phn50c9tNLDljhZ2' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 72 'RetrieveLatestPoliciesPublic' test.out

#- 73 OldRetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal oldRetrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'jxLRX3z46OCaGBeM' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'cu2s6w3VifnKqmTS' \
    --visibleOnly  \
    > test.out 2>&1
eval_tap $? 73 'OldRetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 74 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 74 'CheckReadiness' test.out

#- 75 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'oGH1XEfY6QAYn6WQ' \
    --namespace "$AB_NAMESPACE" \
    --clientId '5UBEU1QAOHfZiGhx' \
    > test.out 2>&1
eval_tap $? 75 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out


rm -f "tmp.dat"

exit $EXIT_CODE