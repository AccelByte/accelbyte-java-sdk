#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: cli_test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=42

FINISHED_COUNT=0
SUCCESS_COUNT=0
FAILED_COUNT=0

export AB_BASE_URL="http://0.0.0.0:8080"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

get_current_year() { echo $(date +'%Y'); }
get_adult_birthday() { echo "$(( $(get_current_year) - 22))-01-01"; }

get_random_int() { echo $(( $1 + ( RANDOM % (($2 - $1)) ) )); }
get_random_bool() { ( (( (RANDOM % 2) == 1)) && echo "true" ) || ( echo "false" ) }
get_random_element() { declare -a a=("$@"); r=$((RANDOM % ${#a[@]})); echo ${a[$r]}; }

create_file() {
    touch $1
}

delete_file() {
    [ ! -e $1 ] || rm $1
}

update_status() {
    return_code=$1
    operation_name=$2

    FINISHED_COUNT=$(( $FINISHED_COUNT + 1 ))

    if [ $return_code == 0 ]
    then
        SUCCESS_COUNT=$(( $SUCCESS_COUNT + 1 ))
        echo "ok $FINISHED_COUNT $operation_name"
    else
        FAILED_COUNT=$(( $FAILED_COUNT + 1 ))
        echo "not ok $FINISHED_COUNT - $operation_name"
        echo '  ---'
        echo '  error: |-'
        while read line; do
          echo "    $line" | tr '\n' ' '
        echo $line
        done < $TEMP_FILE
    fi
}

create_file 'tmp.dat'

echo 'TAP version 13'
echo "1..$OPERATIONS_COUNT"

java -jar ${JAR_PATH} loginClient

#- 1 ChangePreferenceConsent
java -jar ${JAR_PATH} legal changePreferenceConsent \
    --namespace "test" \
    --userId 'FtBxyZcD' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "GlsQuJu8", "policyId": "vMf0IsJk", "policyVersionId": "Trd8IDcV"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'ChangePreferenceConsent'
delete_file $TEMP_FILE

#- 2 RetrieveAcceptedAgreements
java -jar ${JAR_PATH} legal retrieveAcceptedAgreements \
    --userId '2zXnTKjX' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAcceptedAgreements'
delete_file $TEMP_FILE

#- 3 RetrieveAllUsersByPolicyVersion
java -jar ${JAR_PATH} legal retrieveAllUsersByPolicyVersion \
    --policyVersionId 'Y1bPqami' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllUsersByPolicyVersion'
delete_file $TEMP_FILE

#- 4 RetrieveAllLegalPolicies
java -jar ${JAR_PATH} legal retrieveAllLegalPolicies \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllLegalPolicies'
delete_file $TEMP_FILE

#- 5 CreatePolicy
java -jar ${JAR_PATH} legal createPolicy \
    --body '{"affectedClientIds": ["Bxx9Cs18"], "affectedCountries": ["EY84ekIt"], "basePolicyName": "qRzHU1oh", "description": "570KQBVa", "namespace": "ewc72krS", "tags": ["ha68n3Yn"], "typeId": "ozp1C2Km"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePolicy'
delete_file $TEMP_FILE

#- 6 RetrieveSinglePolicy
java -jar ${JAR_PATH} legal retrieveSinglePolicy \
    --basePolicyId 'IQTuBdNE' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSinglePolicy'
delete_file $TEMP_FILE

#- 7 PartialUpdatePolicy
java -jar ${JAR_PATH} legal partialUpdatePolicy \
    --basePolicyId 'UsxFb8CJ' \
    --body '{"affectedClientIds": ["17M7DJZa"], "affectedCountries": ["MSxECbZb"], "basePolicyName": "ygyoarOR", "description": "oeNHSb8R", "namespace": "h3kgs9qq", "tags": ["JbnQsoBg"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'PartialUpdatePolicy'
delete_file $TEMP_FILE

#- 8 RetrievePolicyCountry
java -jar ${JAR_PATH} legal retrievePolicyCountry \
    --basePolicyId 'iVpP8Cm3' \
    --countryCode 'yvASUoxd' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicyCountry'
delete_file $TEMP_FILE

#- 9 RetrieveLocalizedPolicyVersions
java -jar ${JAR_PATH} legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'xxFqmAGT' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLocalizedPolicyVersions'
delete_file $TEMP_FILE

#- 10 CreateLocalizedPolicyVersion
java -jar ${JAR_PATH} legal createLocalizedPolicyVersion \
    --policyVersionId 'J8IEdagE' \
    --body '{"contentType": "tp4w29KO", "description": "u9c19R6X", "localeCode": "DqWHkkP8"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 11 RetrieveSingleLocalizedPolicyVersion
java -jar ${JAR_PATH} legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'npLEKMfj' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSingleLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 12 UpdateLocalizedPolicyVersion
java -jar ${JAR_PATH} legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'iX7jpkVZ' \
    --body '{"attachmentChecksum": "k3IaQYEm", "attachmentLocation": "qGodOEGt", "attachmentVersionIdentifier": "9gPOj0c6", "contentType": "i0JkvIas", "description": "73ucYnFA"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 13 RequestPresignedURL
java -jar ${JAR_PATH} legal requestPresignedURL \
    --localizedPolicyVersionId 'J3DK5T4E' \
    --body '{"contentMD5": "ogg0Y39U", "contentType": "oYlpv5bV"}' \
    >$TEMP_FILE 2>&1
update_status $? 'RequestPresignedURL'
delete_file $TEMP_FILE

#- 14 SetDefaultPolicy
java -jar ${JAR_PATH} legal setDefaultPolicy \
    --localizedPolicyVersionId 'AgtsDhUT' \
    >$TEMP_FILE 2>&1
update_status $? 'SetDefaultPolicy'
delete_file $TEMP_FILE

#- 15 IndirectBulkAcceptVersionedPolicy
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicy \
    --namespace "test" \
    --userId 'DUscbQDj' \
    --clientId 'bTQuPMz2' \
    --countryCode 'PTRlkyU8' \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "PFJ42cwm", "policyId": "zBBSMNco", "policyVersionId": "AAOjKNjf"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 16 AdminRetrieveEligibilities
java -jar ${JAR_PATH} legal adminRetrieveEligibilities \
    --namespace "test" \
    --userId 'cYHm093a' \
    --clientId 'YgBU1sqj' \
    --countryCode 'yK0XH45P' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRetrieveEligibilities'
delete_file $TEMP_FILE

#- 17 RetrievePolicies
java -jar ${JAR_PATH} legal retrievePolicies \
    --countryCode 'aRSOFQBt' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicies'
delete_file $TEMP_FILE

#- 18 UpdatePolicyVersion
java -jar ${JAR_PATH} legal updatePolicyVersion \
    --policyVersionId 'u23REZ8h' \
    --body '{"description": "RVX7LGOv", "displayVersion": "DdYiQS9i", "isCommitted": false}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePolicyVersion'
delete_file $TEMP_FILE

#- 19 PublishPolicyVersion
java -jar ${JAR_PATH} legal publishPolicyVersion \
    --policyVersionId 'V1C91pjG' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishPolicyVersion'
delete_file $TEMP_FILE

#- 20 UpdatePolicy
java -jar ${JAR_PATH} legal updatePolicy \
    --policyId '9gpxL6yc' \
    --body '{"description": "TQdvln2L", "isDefaultOpted": true, "isMandatory": true, "policyName": "SQWEXL6L", "readableId": "FE1YHo9m", "shouldNotifyOnUpdate": false}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePolicy'
delete_file $TEMP_FILE

#- 21 SetDefaultPolicy1
java -jar ${JAR_PATH} legal setDefaultPolicy1 \
    --policyId '8hHtWvbN' \
    >$TEMP_FILE 2>&1
update_status $? 'SetDefaultPolicy1'
delete_file $TEMP_FILE

#- 22 RetrieveSinglePolicyVersion
java -jar ${JAR_PATH} legal retrieveSinglePolicyVersion \
    --policyId 'YqgUqslA' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSinglePolicyVersion'
delete_file $TEMP_FILE

#- 23 CreatePolicyVersion
java -jar ${JAR_PATH} legal createPolicyVersion \
    --policyId 'rFPiHUIv' \
    --body '{"description": "aCv8kU9d", "displayVersion": "BBpdsJLh", "isCommitted": true}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePolicyVersion'
delete_file $TEMP_FILE

#- 24 RetrieveAllPolicyTypes
java -jar ${JAR_PATH} legal retrieveAllPolicyTypes \
    --limit '95' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllPolicyTypes'
delete_file $TEMP_FILE

#- 25 GetUserInfoStatus
java -jar ${JAR_PATH} legal getUserInfoStatus \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserInfoStatus'
delete_file $TEMP_FILE

#- 26 SyncUserInfo
java -jar ${JAR_PATH} legal syncUserInfo \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SyncUserInfo'
delete_file $TEMP_FILE

#- 27 InvalidateUserInfoCache
java -jar ${JAR_PATH} legal invalidateUserInfoCache \
    >$TEMP_FILE 2>&1
update_status $? 'InvalidateUserInfoCache'
delete_file $TEMP_FILE

#- 28 AnonymizeUserAgreement
java -jar ${JAR_PATH} legal anonymizeUserAgreement \
    --userId 'yExrkxoo' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeUserAgreement'
delete_file $TEMP_FILE

#- 29 ChangePreferenceConsent1
java -jar ${JAR_PATH} legal changePreferenceConsent1 \
    --body '[{"isAccepted": true, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "7WOfercZ", "policyId": "dpMci37D", "policyVersionId": "s7YSfExa"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'ChangePreferenceConsent1'
delete_file $TEMP_FILE

#- 30 AcceptVersionedPolicy
java -jar ${JAR_PATH} legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'I3uzLteM' \
    >$TEMP_FILE 2>&1
update_status $? 'AcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 31 RetrieveAgreementsPublic
java -jar ${JAR_PATH} legal retrieveAgreementsPublic \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAgreementsPublic'
delete_file $TEMP_FILE

#- 32 BulkAcceptVersionedPolicy
java -jar ${JAR_PATH} legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "Alt4hr7H", "policyId": "mOYiBA5l", "policyVersionId": "tAOXmlG6"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkAcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 33 IndirectBulkAcceptVersionedPolicyV2
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'eh1dTdoT' \
    --countryCode 'FpBIcuC1' \
    --namespace "test" \
    --userId 'dQY93OJn' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": true, "localizedPolicyVersionId": "D8ldz7Hu", "policyId": "8AD79kdW", "policyVersionId": "unvizU0q"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicyV2'
delete_file $TEMP_FILE

#- 34 IndirectBulkAcceptVersionedPolicy1
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicy1 \
    --userId '1pHyhhER' \
    --body '[{"isAccepted": false, "isNeedToSendEventMarketing": false, "localizedPolicyVersionId": "drysMizB", "policyId": "GSRdP2l7", "policyVersionId": "DNSZ8Aq0"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicy1'
delete_file $TEMP_FILE

#- 35 RetrieveEligibilitiesPublic
java -jar ${JAR_PATH} legal retrieveEligibilitiesPublic \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveEligibilitiesPublic'
delete_file $TEMP_FILE

#- 36 RetrieveEligibilitiesPublicIndirect
java -jar ${JAR_PATH} legal retrieveEligibilitiesPublicIndirect \
    --clientId 'XiPLQXSe' \
    --countryCode '07ZddOGT' \
    --namespace "test" \
    --userId 'MlJjBwj9' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveEligibilitiesPublicIndirect'
delete_file $TEMP_FILE

#- 37 RetrieveSingleLocalizedPolicyVersion1
java -jar ${JAR_PATH} legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'HJHQKseE' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSingleLocalizedPolicyVersion1'
delete_file $TEMP_FILE

#- 38 RetrievePolicyVersions
java -jar ${JAR_PATH} legal retrievePolicyVersions \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicyVersions'
delete_file $TEMP_FILE

#- 39 RetrieveLatestPolicies
java -jar ${JAR_PATH} legal retrieveLatestPolicies \
    --countryCode 'dSXRDSvg' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLatestPolicies'
delete_file $TEMP_FILE

#- 40 RetrieveLatestPoliciesPublic
java -jar ${JAR_PATH} legal retrieveLatestPoliciesPublic \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLatestPoliciesPublic'
delete_file $TEMP_FILE

#- 41 RetrieveLatestPoliciesByNamespaceAndCountryPublic
java -jar ${JAR_PATH} legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode 'uauw1xT7' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLatestPoliciesByNamespaceAndCountryPublic'
delete_file $TEMP_FILE

#- 42 CheckReadiness
java -jar ${JAR_PATH} legal checkReadiness \
    >$TEMP_FILE 2>&1
update_status $? 'CheckReadiness'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT