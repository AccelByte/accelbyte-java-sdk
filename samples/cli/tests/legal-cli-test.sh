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
    --userId 'sm3Yaujd' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "jKqHdeFS", "policyId": "2JviMzY3", "policyVersionId": "vorvGTGK"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "4homll7b", "policyId": "7wvr5l6u", "policyVersionId": "6k1jR1Mb"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "eoFZPSFY", "policyId": "RomEiDjF", "policyVersionId": "eu8OsbMN"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements \
    --userId 'OXE3aHIB' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion \
    --keyword 'fmKrzA5K' \
    --limit '37' \
    --offset '67' \
    --policyVersionId 'ZSlS4ctJ' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
./ng net.accelbyte.sdk.cli.Main legal createPolicy \
    --body '{"affectedClientIds": ["AQmsXmhU", "lFhQTFDm", "iQIytOcP"], "affectedCountries": ["l1SitPwi", "E33jYEbm", "KNj9imLa"], "basePolicyName": "2mXnfSpm", "description": "mdvX8xIJ", "namespace": "uVM7DTvI", "tags": ["TJXEwnLW", "m5KZdfEt", "eZy0iOtm"], "typeId": "JlY0dcoe"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy \
    --basePolicyId 'KzlC4G1V' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy \
    --basePolicyId 'JmnXh5w4' \
    --body '{"affectedClientIds": ["mEQtAfej", "XaggLPIt", "cngWKqn6"], "affectedCountries": ["MrucWULs", "cBBT47Xy", "oGzRnlWW"], "basePolicyName": "bvdf9QZX", "description": "x3doeVTf", "namespace": "tSWwDY62", "tags": ["D4yABkN4", "VEUlpVIn", "7j9cUdW4"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry \
    --basePolicyId 'gVJ2Dc0f' \
    --countryCode 'FEsgE29t' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'nY0IMvAA' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion \
    --policyVersionId '1Jf33eEl' \
    --body '{"contentType": "h4Jse3o1", "description": "snrbL7yo", "localeCode": "RfrTLTLh"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'IFZW2xQ9' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'XDv3xZCv' \
    --body '{"attachmentChecksum": "TGljxr5D", "attachmentLocation": "T0orp2jL", "attachmentVersionIdentifier": "C3YnKzrV", "contentType": "xccfWdUA", "description": "Wbtl6vKe"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL \
    --localizedPolicyVersionId 'ph8mczQD' \
    --body '{"contentMD5": "CPHNBMxU", "contentType": "wcJTQXj5"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy \
    --localizedPolicyVersionId 'KGFccS9k' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 RetrieveAcceptedAgreements1
./ng net.accelbyte.sdk.cli.Main legal retrieveAcceptedAgreements1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2g1uq90Q' \
    > test.out 2>&1
eval_tap $? 16 'RetrieveAcceptedAgreements1' test.out

#- 17 RetrieveAllUsersByPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllUsersByPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --keyword 'uhxfsagS' \
    --limit '21' \
    --offset '46' \
    --policyVersionId '7Ac63B1y' \
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
    --body '{"affectedClientIds": ["xKukqJPO", "w6CCQSnp", "UFnR7LYA"], "affectedCountries": ["uGy8wtXb", "heRzbb8O", "RgDHGGJk"], "basePolicyName": "GCabcRpt", "description": "HZ8FZpEZ", "tags": ["fjPH5qhl", "TruSvtcR", "LVk4k9FG"], "typeId": "08jO3zrJ"}' \
    > test.out 2>&1
eval_tap $? 19 'CreatePolicy1' test.out

#- 20 RetrieveSinglePolicy1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicy1 \
    --basePolicyId 'rtWO2yVa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'RetrieveSinglePolicy1' test.out

#- 21 PartialUpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal partialUpdatePolicy1 \
    --basePolicyId 'IM9aJWcP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"affectedClientIds": ["GDlF9Qif", "ru74dJJp", "90itZkwL"], "affectedCountries": ["S4xu0Z2O", "6j779VBc", "pAvYOrGP"], "basePolicyName": "VFAinocO", "description": "DnCud3Pu", "tags": ["qmDVHaJg", "xbSf5rBP", "YlqmbKOs"]}' \
    > test.out 2>&1
eval_tap $? 21 'PartialUpdatePolicy1' test.out

#- 22 RetrievePolicyCountry1
./ng net.accelbyte.sdk.cli.Main legal retrievePolicyCountry1 \
    --basePolicyId 'WR8MjUhn' \
    --countryCode 'ERj9CrW8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'RetrievePolicyCountry1' test.out

#- 23 RetrieveLocalizedPolicyVersions1
./ng net.accelbyte.sdk.cli.Main legal retrieveLocalizedPolicyVersions1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'ewaTFrAr' \
    > test.out 2>&1
eval_tap $? 23 'RetrieveLocalizedPolicyVersions1' test.out

#- 24 CreateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createLocalizedPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId '8LS14WOS' \
    --body '{"contentType": "qiKFrksN", "description": "ICkKZis3", "localeCode": "5YoRJnT1"}' \
    > test.out 2>&1
eval_tap $? 24 'CreateLocalizedPolicyVersion1' test.out

#- 25 RetrieveSingleLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId '8SIubODy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 26 UpdateLocalizedPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updateLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'y9sIBjiu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attachmentChecksum": "S3XdMdT7", "attachmentLocation": "qHknDgUO", "attachmentVersionIdentifier": "whDYcyqJ", "contentType": "WSqysp7l", "description": "xion6BF3"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateLocalizedPolicyVersion1' test.out

#- 27 RequestPresignedURL1
./ng net.accelbyte.sdk.cli.Main legal requestPresignedURL1 \
    --localizedPolicyVersionId 'T7nBAL7E' \
    --namespace "$AB_NAMESPACE" \
    --body '{"contentMD5": "xiuqEeUO", "contentType": "FNmPMCkX"}' \
    > test.out 2>&1
eval_tap $? 27 'RequestPresignedURL1' test.out

#- 28 SetDefaultPolicy1
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy1 \
    --localizedPolicyVersionId 'KoSz8rmd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'SetDefaultPolicy1' test.out

#- 29 UpdatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'qGUUZk5x' \
    --body '{"description": "hgWMIGd0", "displayVersion": "FWIesXah", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 29 'UpdatePolicyVersion1' test.out

#- 30 PublishPolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyVersionId 'W9QkJ5PQ' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 30 'PublishPolicyVersion1' test.out

#- 31 UpdatePolicy1
./ng net.accelbyte.sdk.cli.Main legal updatePolicy1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'V5owJ1KD' \
    --body '{"description": "DGc8gcnM", "isDefaultOpted": false, "isMandatory": true, "policyName": "4LROtvvG", "readableId": "4xQ6ijSy", "shouldNotifyOnUpdate": true}' \
    > test.out 2>&1
eval_tap $? 31 'UpdatePolicy1' test.out

#- 32 SetDefaultPolicy3
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy3 \
    --namespace "$AB_NAMESPACE" \
    --policyId '5O8Joq2m' \
    > test.out 2>&1
eval_tap $? 32 'SetDefaultPolicy3' test.out

#- 33 RetrieveSinglePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'EdWC4WYh' \
    --versionId 'HH03bTIR' \
    > test.out 2>&1
eval_tap $? 33 'RetrieveSinglePolicyVersion1' test.out

#- 34 CreatePolicyVersion1
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion1 \
    --namespace "$AB_NAMESPACE" \
    --policyId 'EzPK8IHE' \
    --body '{"description": "cErpJ6WK", "displayVersion": "X9Dnz93Z", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 34 'CreatePolicyVersion1' test.out

#- 35 RetrieveAllPolicyTypes1
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes1 \
    --namespace "$AB_NAMESPACE" \
    --offset '26' \
    --limit '100' \
    > test.out 2>&1
eval_tap $? 35 'RetrieveAllPolicyTypes1' test.out

#- 36 IndirectBulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'bte82qNQ' \
    --publisherUserId 'IUXAOwuu' \
    --clientId '7S3TBtyU' \
    --countryCode 'y1DKuznw' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "eTh3FIWj", "policyId": "7bNMrBQi", "policyVersionId": "sUMzK4vu"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "rdIdnkBx", "policyId": "2UqzfPBM", "policyVersionId": "O2yHyTNC"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "RIzxlRey", "policyId": "eGiuHKQ1", "policyVersionId": "dBuf2bMx"}]' \
    > test.out 2>&1
eval_tap $? 36 'IndirectBulkAcceptVersionedPolicy' test.out

#- 37 AdminRetrieveEligibilities
./ng net.accelbyte.sdk.cli.Main legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'l1NBXVqG' \
    --publisherUserId 'MpqPuLat' \
    --clientId 'rNgsZ9gz' \
    --countryCode 't0v59Fd1' \
    > test.out 2>&1
eval_tap $? 37 'AdminRetrieveEligibilities' test.out

#- 38 RetrievePolicies
./ng net.accelbyte.sdk.cli.Main legal retrievePolicies \
    --countryCode 'job0ibGW' \
    > test.out 2>&1
eval_tap $? 38 'RetrievePolicies' test.out

#- 39 UpdatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal updatePolicyVersion \
    --policyVersionId 'HyfYT0Es' \
    --body '{"description": "6kauWc3Q", "displayVersion": "3E5K1oLt", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 39 'UpdatePolicyVersion' test.out

#- 40 PublishPolicyVersion
./ng net.accelbyte.sdk.cli.Main legal publishPolicyVersion \
    --policyVersionId 'rj2sUwsV' \
    --shouldNotify  \
    > test.out 2>&1
eval_tap $? 40 'PublishPolicyVersion' test.out

#- 41 UpdatePolicy
./ng net.accelbyte.sdk.cli.Main legal updatePolicy \
    --policyId 'tjsLBcVD' \
    --body '{"description": "2W2snOIk", "isDefaultOpted": true, "isMandatory": false, "policyName": "HTPQ6KZq", "readableId": "vq1tLXBY", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePolicy' test.out

#- 42 SetDefaultPolicy2
./ng net.accelbyte.sdk.cli.Main legal setDefaultPolicy2 \
    --policyId 'VFCs8fcs' \
    > test.out 2>&1
eval_tap $? 42 'SetDefaultPolicy2' test.out

#- 43 RetrieveSinglePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal retrieveSinglePolicyVersion \
    --policyId 'IyOmE9NS' \
    --versionId 'Q29YO4Uj' \
    > test.out 2>&1
eval_tap $? 43 'RetrieveSinglePolicyVersion' test.out

#- 44 CreatePolicyVersion
./ng net.accelbyte.sdk.cli.Main legal createPolicyVersion \
    --policyId 'Ptvm2ru2' \
    --body '{"description": "vCt4mYl0", "displayVersion": "gHf08Dc1", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 44 'CreatePolicyVersion' test.out

#- 45 RetrieveAllPolicyTypes
./ng net.accelbyte.sdk.cli.Main legal retrieveAllPolicyTypes \
    --offset '94' \
    --limit '50' \
    > test.out 2>&1
eval_tap $? 45 'RetrieveAllPolicyTypes' test.out

#- 46 GetUserInfoStatus
./ng net.accelbyte.sdk.cli.Main legal getUserInfoStatus \
    --namespaces 'ZBUaVuSY' \
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
    --userId 'IrUDwk57' \
    > test.out 2>&1
eval_tap $? 49 'AnonymizeUserAgreement' test.out

#- 50 ChangePreferenceConsent1
./ng net.accelbyte.sdk.cli.Main legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "LZJ7HckL", "policyId": "gW9xEwtm", "policyVersionId": "wkvynw76"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "jRMzS5tL", "policyId": "KWlzobQW", "policyVersionId": "G2ccd3IQ"}, {"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "eev7HXHm", "policyId": "z0jfgxe4", "policyVersionId": "kxS66YfG"}]' \
    > test.out 2>&1
eval_tap $? 50 'ChangePreferenceConsent1' test.out

#- 51 AcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'hpPLNy6a' \
    > test.out 2>&1
eval_tap $? 51 'AcceptVersionedPolicy' test.out

#- 52 RetrieveAgreementsPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 52 'RetrieveAgreementsPublic' test.out

#- 53 BulkAcceptVersionedPolicy
./ng net.accelbyte.sdk.cli.Main legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Df29afcZ", "policyId": "k0uExljd", "policyVersionId": "T4Yw6zeN"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "pYDIzCQK", "policyId": "jmakbbRu", "policyVersionId": "4ewHdB9t"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "IvxWp0VU", "policyId": "CJPPNgXv", "policyVersionId": "hM8E04Ox"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkAcceptVersionedPolicy' test.out

#- 54 IndirectBulkAcceptVersionedPolicyV2
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'QZJ6qUS6' \
    --countryCode 'ZI3J1f7P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sOLfsOZB' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "tVNSVDzl", "policyId": "62tNDXNl", "policyVersionId": "aBtcMNgG"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "iRFkPluD", "policyId": "PQJmoauW", "policyVersionId": "9xijfXWX"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "9IiqwFri", "policyId": "fSkemGwP", "policyVersionId": "NaKqYqAQ"}]' \
    > test.out 2>&1
eval_tap $? 54 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 55 IndirectBulkAcceptVersionedPolicy1
./ng net.accelbyte.sdk.cli.Main legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'sumdCWV4' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "H6vMedNn", "policyId": "WRGz2Dpy", "policyVersionId": "ThRor96b"}, {"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "4bZF4QEl", "policyId": "XeSFbcCp", "policyVersionId": "vGj5GpV0"}, {"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "78pxDFkr", "policyId": "OPYNLVi5", "policyVersionId": "0P7qmC2k"}]' \
    > test.out 2>&1
eval_tap $? 55 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 56 RetrieveEligibilitiesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RetrieveEligibilitiesPublic' test.out

#- 57 RetrieveEligibilitiesPublicIndirect
./ng net.accelbyte.sdk.cli.Main legal retrieveEligibilitiesPublicIndirect \
    --clientId 'CRassv2Z' \
    --countryCode 't0DcS9wK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XbeJoDOF' \
    > test.out 2>&1
eval_tap $? 57 'RetrieveEligibilitiesPublicIndirect' test.out

#- 58 RetrieveSingleLocalizedPolicyVersion2
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion2 \
    --localizedPolicyVersionId '7Kgv0GKW' \
    > test.out 2>&1
eval_tap $? 58 'RetrieveSingleLocalizedPolicyVersion2' test.out

#- 59 RetrieveSingleLocalizedPolicyVersion3
./ng net.accelbyte.sdk.cli.Main legal retrieveSingleLocalizedPolicyVersion3 \
    --localizedPolicyVersionId 'GUkQoTup' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'RetrieveSingleLocalizedPolicyVersion3' test.out

#- 60 RetrieveLatestPolicies
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPolicies \
    --countryCode 'HcI3SIF4' \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'gehn3jBC' \
    > test.out 2>&1
eval_tap $? 60 'RetrieveLatestPolicies' test.out

#- 61 RetrieveLatestPoliciesPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'LEGAL_DOCUMENT_TYPE' \
    --tags 'h84Jb5N2' \
    > test.out 2>&1
eval_tap $? 61 'RetrieveLatestPoliciesPublic' test.out

#- 62 RetrieveLatestPoliciesByNamespaceAndCountryPublic
./ng net.accelbyte.sdk.cli.Main legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'qeUBtLPl' \
    --namespace "$AB_NAMESPACE" \
    --alwaysIncludeDefault  \
    --defaultOnEmpty  \
    --policyType 'MARKETING_PREFERENCE_TYPE' \
    --tags 'sL8hCB3I' \
    > test.out 2>&1
eval_tap $? 62 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 63 CheckReadiness
./ng net.accelbyte.sdk.cli.Main legal checkReadiness \
    > test.out 2>&1
eval_tap $? 63 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE