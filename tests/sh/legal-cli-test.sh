#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

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

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..43"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ChangePreferenceConsent
java -jar "${CLI_JAR}" legal changePreferenceConsent \
    --namespace "$AB_NAMESPACE" \
    --userId 'FtBxyZcD' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "GlsQuJu8", "policyId": "vMf0IsJk", "policyVersionId": "Trd8IDcV"}]' \
    > test.out 2>&1
eval_tap $? 2 'ChangePreferenceConsent' test.out

#- 3 RetrieveAcceptedAgreements
java -jar "${CLI_JAR}" legal retrieveAcceptedAgreements \
    --userId '2zXnTKjX' \
    > test.out 2>&1
eval_tap $? 3 'RetrieveAcceptedAgreements' test.out

#- 4 RetrieveAllUsersByPolicyVersion
java -jar "${CLI_JAR}" legal retrieveAllUsersByPolicyVersion \
    --policyVersionId 'Y1bPqami' \
    > test.out 2>&1
eval_tap $? 4 'RetrieveAllUsersByPolicyVersion' test.out

#- 5 RetrieveAllLegalPolicies
java -jar "${CLI_JAR}" legal retrieveAllLegalPolicies \
    > test.out 2>&1
eval_tap $? 5 'RetrieveAllLegalPolicies' test.out

#- 6 CreatePolicy
java -jar "${CLI_JAR}" legal createPolicy \
    --body '{"affectedClientIds": ["Bxx9Cs18"], "affectedCountries": ["EY84ekIt"], "basePolicyName": "qRzHU1oh", "description": "570KQBVa", "namespace": "ewc72krS", "tags": ["ha68n3Yn"], "typeId": "ozp1C2Km"}' \
    > test.out 2>&1
eval_tap $? 6 'CreatePolicy' test.out

#- 7 RetrieveSinglePolicy
java -jar "${CLI_JAR}" legal retrieveSinglePolicy \
    --basePolicyId 'IQTuBdNE' \
    > test.out 2>&1
eval_tap $? 7 'RetrieveSinglePolicy' test.out

#- 8 PartialUpdatePolicy
java -jar "${CLI_JAR}" legal partialUpdatePolicy \
    --basePolicyId 'UsxFb8CJ' \
    --body '{"affectedClientIds": ["17M7DJZa"], "affectedCountries": ["MSxECbZb"], "basePolicyName": "ygyoarOR", "description": "oeNHSb8R", "namespace": "h3kgs9qq", "tags": ["JbnQsoBg"]}' \
    > test.out 2>&1
eval_tap $? 8 'PartialUpdatePolicy' test.out

#- 9 RetrievePolicyCountry
java -jar "${CLI_JAR}" legal retrievePolicyCountry \
    --basePolicyId 'iVpP8Cm3' \
    --countryCode 'yvASUoxd' \
    > test.out 2>&1
eval_tap $? 9 'RetrievePolicyCountry' test.out

#- 10 RetrieveLocalizedPolicyVersions
java -jar "${CLI_JAR}" legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'xxFqmAGT' \
    > test.out 2>&1
eval_tap $? 10 'RetrieveLocalizedPolicyVersions' test.out

#- 11 CreateLocalizedPolicyVersion
java -jar "${CLI_JAR}" legal createLocalizedPolicyVersion \
    --policyVersionId 'J8IEdagE' \
    --body '{"contentType": "tp4w29KO", "description": "u9c19R6X", "localeCode": "DqWHkkP8"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateLocalizedPolicyVersion' test.out

#- 12 RetrieveSingleLocalizedPolicyVersion
java -jar "${CLI_JAR}" legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'npLEKMfj' \
    > test.out 2>&1
eval_tap $? 12 'RetrieveSingleLocalizedPolicyVersion' test.out

#- 13 UpdateLocalizedPolicyVersion
java -jar "${CLI_JAR}" legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'iX7jpkVZ' \
    --body '{"attachmentChecksum": "k3IaQYEm", "attachmentLocation": "qGodOEGt", "attachmentVersionIdentifier": "9gPOj0c6", "contentType": "i0JkvIas", "description": "73ucYnFA"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateLocalizedPolicyVersion' test.out

#- 14 RequestPresignedURL
java -jar "${CLI_JAR}" legal requestPresignedURL \
    --localizedPolicyVersionId 'J3DK5T4E' \
    --body '{"contentMD5": "ogg0Y39U", "contentType": "oYlpv5bV"}' \
    > test.out 2>&1
eval_tap $? 14 'RequestPresignedURL' test.out

#- 15 SetDefaultPolicy
java -jar "${CLI_JAR}" legal setDefaultPolicy \
    --localizedPolicyVersionId 'AgtsDhUT' \
    > test.out 2>&1
eval_tap $? 15 'SetDefaultPolicy' test.out

#- 16 IndirectBulkAcceptVersionedPolicy
java -jar "${CLI_JAR}" legal indirectBulkAcceptVersionedPolicy \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUscbQDj' \
    --clientId 'bTQuPMz2' \
    --countryCode 'PTRlkyU8' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "PFJ42cwm", "policyId": "zBBSMNco", "policyVersionId": "AAOjKNjf"}]' \
    > test.out 2>&1
eval_tap $? 16 'IndirectBulkAcceptVersionedPolicy' test.out

#- 17 AdminRetrieveEligibilities
java -jar "${CLI_JAR}" legal adminRetrieveEligibilities \
    --namespace "$AB_NAMESPACE" \
    --userId 'cYHm093a' \
    --clientId 'YgBU1sqj' \
    --countryCode 'yK0XH45P' \
    > test.out 2>&1
eval_tap $? 17 'AdminRetrieveEligibilities' test.out

#- 18 RetrievePolicies
java -jar "${CLI_JAR}" legal retrievePolicies \
    --countryCode 'aRSOFQBt' \
    > test.out 2>&1
eval_tap $? 18 'RetrievePolicies' test.out

#- 19 UpdatePolicyVersion
java -jar "${CLI_JAR}" legal updatePolicyVersion \
    --policyVersionId 'u23REZ8h' \
    --body '{"description": "RVX7LGOv", "displayVersion": "DdYiQS9i", "isCommitted": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdatePolicyVersion' test.out

#- 20 PublishPolicyVersion
java -jar "${CLI_JAR}" legal publishPolicyVersion \
    --policyVersionId 'V1C91pjG' \
    > test.out 2>&1
eval_tap $? 20 'PublishPolicyVersion' test.out

#- 21 UpdatePolicy
java -jar "${CLI_JAR}" legal updatePolicy \
    --policyId '9gpxL6yc' \
    --body '{"description": "TQdvln2L", "isDefaultOpted": true, "isMandatory": true, "policyName": "SQWEXL6L", "readableId": "FE1YHo9m", "shouldNotifyOnUpdate": false}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePolicy' test.out

#- 22 SetDefaultPolicy1
java -jar "${CLI_JAR}" legal setDefaultPolicy1 \
    --policyId '8hHtWvbN' \
    > test.out 2>&1
eval_tap $? 22 'SetDefaultPolicy1' test.out

#- 23 RetrieveSinglePolicyVersion
java -jar "${CLI_JAR}" legal retrieveSinglePolicyVersion \
    --policyId 'YqgUqslA' \
    > test.out 2>&1
eval_tap $? 23 'RetrieveSinglePolicyVersion' test.out

#- 24 CreatePolicyVersion
java -jar "${CLI_JAR}" legal createPolicyVersion \
    --policyId 'rFPiHUIv' \
    --body '{"description": "aCv8kU9d", "displayVersion": "BBpdsJLh", "isCommitted": true}' \
    > test.out 2>&1
eval_tap $? 24 'CreatePolicyVersion' test.out

#- 25 RetrieveAllPolicyTypes
java -jar "${CLI_JAR}" legal retrieveAllPolicyTypes \
    --limit '95' \
    > test.out 2>&1
eval_tap $? 25 'RetrieveAllPolicyTypes' test.out

#- 26 GetUserInfoStatus
java -jar "${CLI_JAR}" legal getUserInfoStatus \
    > test.out 2>&1
eval_tap $? 26 'GetUserInfoStatus' test.out

#- 27 SyncUserInfo
java -jar "${CLI_JAR}" legal syncUserInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'SyncUserInfo' test.out

#- 28 InvalidateUserInfoCache
java -jar "${CLI_JAR}" legal invalidateUserInfoCache \
    > test.out 2>&1
eval_tap $? 28 'InvalidateUserInfoCache' test.out

#- 29 AnonymizeUserAgreement
java -jar "${CLI_JAR}" legal anonymizeUserAgreement \
    --userId 'yExrkxoo' \
    > test.out 2>&1
eval_tap $? 29 'AnonymizeUserAgreement' test.out

#- 30 ChangePreferenceConsent1
java -jar "${CLI_JAR}" legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "7WOfercZ", "policyId": "dpMci37D", "policyVersionId": "s7YSfExa"}]' \
    > test.out 2>&1
eval_tap $? 30 'ChangePreferenceConsent1' test.out

#- 31 AcceptVersionedPolicy
java -jar "${CLI_JAR}" legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'I3uzLteM' \
    > test.out 2>&1
eval_tap $? 31 'AcceptVersionedPolicy' test.out

#- 32 RetrieveAgreementsPublic
java -jar "${CLI_JAR}" legal retrieveAgreementsPublic \
    > test.out 2>&1
eval_tap $? 32 'RetrieveAgreementsPublic' test.out

#- 33 BulkAcceptVersionedPolicy
java -jar "${CLI_JAR}" legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Alt4hr7H", "policyId": "mOYiBA5l", "policyVersionId": "tAOXmlG6"}]' \
    > test.out 2>&1
eval_tap $? 33 'BulkAcceptVersionedPolicy' test.out

#- 34 IndirectBulkAcceptVersionedPolicyV2
java -jar "${CLI_JAR}" legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'eh1dTdoT' \
    --countryCode 'FpBIcuC1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dQY93OJn' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "D8ldz7Hu", "policyId": "8AD79kdW", "policyVersionId": "unvizU0q"}]' \
    > test.out 2>&1
eval_tap $? 34 'IndirectBulkAcceptVersionedPolicyV2' test.out

#- 35 IndirectBulkAcceptVersionedPolicy1
java -jar "${CLI_JAR}" legal indirectBulkAcceptVersionedPolicy1 \
    --userId '1pHyhhER' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "drysMizB", "policyId": "GSRdP2l7", "policyVersionId": "DNSZ8Aq0"}]' \
    > test.out 2>&1
eval_tap $? 35 'IndirectBulkAcceptVersionedPolicy1' test.out

#- 36 RetrieveEligibilitiesPublic
java -jar "${CLI_JAR}" legal retrieveEligibilitiesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'RetrieveEligibilitiesPublic' test.out

#- 37 RetrieveEligibilitiesPublicIndirect
java -jar "${CLI_JAR}" legal retrieveEligibilitiesPublicIndirect \
    --clientId 'XiPLQXSe' \
    --countryCode '07ZddOGT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MlJjBwj9' \
    > test.out 2>&1
eval_tap $? 37 'RetrieveEligibilitiesPublicIndirect' test.out

#- 38 RetrieveSingleLocalizedPolicyVersion1
java -jar "${CLI_JAR}" legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'HJHQKseE' \
    > test.out 2>&1
eval_tap $? 38 'RetrieveSingleLocalizedPolicyVersion1' test.out

#- 39 RetrievePolicyVersions
java -jar "${CLI_JAR}" legal retrievePolicyVersions \
    > test.out 2>&1
eval_tap $? 39 'RetrievePolicyVersions' test.out

#- 40 RetrieveLatestPolicies
java -jar "${CLI_JAR}" legal retrieveLatestPolicies \
    --countryCode 'dSXRDSvg' \
    > test.out 2>&1
eval_tap $? 40 'RetrieveLatestPolicies' test.out

#- 41 RetrieveLatestPoliciesPublic
java -jar "${CLI_JAR}" legal retrieveLatestPoliciesPublic \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'RetrieveLatestPoliciesPublic' test.out

#- 42 RetrieveLatestPoliciesByNamespaceAndCountryPublic
java -jar "${CLI_JAR}" legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'uauw1xT7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'RetrieveLatestPoliciesByNamespaceAndCountryPublic' test.out

#- 43 CheckReadiness
java -jar "${CLI_JAR}" legal checkReadiness \
    > test.out 2>&1
eval_tap $? 43 'CheckReadiness' test.out


rm -f "tmp.dat"

exit $EXIT_CODE