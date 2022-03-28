#!/bin/bash

#Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
#This is licensed software from AccelByte Inc, for limitations
#and restrictions contact your company contract manager.

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

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
    --body '[{"isAccepted": true, "localizedPolicyVersionId": "pGlsQuJu", "policyId": "8vMf0IsJ", "policyVersionId": "kTrd8IDc"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'ChangePreferenceConsent'
delete_file $TEMP_FILE

#- 2 RetrieveAcceptedAgreements
java -jar ${JAR_PATH} legal retrieveAcceptedAgreements \
    --userId 'V2zXnTKj' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAcceptedAgreements'
delete_file $TEMP_FILE

#- 3 RetrieveAllUsersByPolicyVersion
java -jar ${JAR_PATH} legal retrieveAllUsersByPolicyVersion \
    --policyVersionId 'XY1bPqam' \
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
    --body '{"affectedClientIds": ["iBxx9Cs1"], "affectedCountries": ["8EY84ekI"], "basePolicyName": "tqRzHU1o", "description": "h570KQBV", "namespace": "aewc72kr", "tags": ["Sha68n3Y"], "typeId": "nozp1C2K"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePolicy'
delete_file $TEMP_FILE

#- 6 RetrieveSinglePolicy
java -jar ${JAR_PATH} legal retrieveSinglePolicy \
    --basePolicyId 'mIQTuBdN' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSinglePolicy'
delete_file $TEMP_FILE

#- 7 PartialUpdatePolicy
java -jar ${JAR_PATH} legal partialUpdatePolicy \
    --basePolicyId 'EUsxFb8C' \
    --body '{"affectedClientIds": ["J17M7DJZ"], "affectedCountries": ["aMSxECbZ"], "basePolicyName": "bygyoarO", "description": "RoeNHSb8", "namespace": "Rh3kgs9q", "tags": ["qJbnQsoB"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'PartialUpdatePolicy'
delete_file $TEMP_FILE

#- 8 RetrievePolicyCountry
java -jar ${JAR_PATH} legal retrievePolicyCountry \
    --basePolicyId 'giVpP8Cm' \
    --countryCode '3yvASUox' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicyCountry'
delete_file $TEMP_FILE

#- 9 RetrieveLocalizedPolicyVersions
java -jar ${JAR_PATH} legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'dxxFqmAG' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLocalizedPolicyVersions'
delete_file $TEMP_FILE

#- 10 CreateLocalizedPolicyVersion
java -jar ${JAR_PATH} legal createLocalizedPolicyVersion \
    --policyVersionId 'TJ8IEdag' \
    --body '{"contentType": "Etp4w29K", "description": "Ou9c19R6", "localeCode": "XDqWHkkP"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 11 RetrieveSingleLocalizedPolicyVersion
java -jar ${JAR_PATH} legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId '8npLEKMf' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSingleLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 12 UpdateLocalizedPolicyVersion
java -jar ${JAR_PATH} legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'jiX7jpkV' \
    --body '{"attachmentChecksum": "Zk3IaQYE", "attachmentLocation": "mqGodOEG", "attachmentVersionIdentifier": "t9gPOj0c", "contentType": "6i0JkvIa", "description": "s73ucYnF"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 13 RequestPresignedURL
java -jar ${JAR_PATH} legal requestPresignedURL \
    --localizedPolicyVersionId 'AJ3DK5T4' \
    --body '{"contentMD5": "Eogg0Y39", "contentType": "UoYlpv5b"}' \
    >$TEMP_FILE 2>&1
update_status $? 'RequestPresignedURL'
delete_file $TEMP_FILE

#- 14 SetDefaultPolicy
java -jar ${JAR_PATH} legal setDefaultPolicy \
    --localizedPolicyVersionId 'VAgtsDhU' \
    >$TEMP_FILE 2>&1
update_status $? 'SetDefaultPolicy'
delete_file $TEMP_FILE

#- 15 IndirectBulkAcceptVersionedPolicy
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicy \
    --namespace "test" \
    --userId 'TDUscbQD' \
    --clientId 'jbTQuPMz' \
    --countryCode '2PTRlkyU' \
    --body '[{"isAccepted": true, "localizedPolicyVersionId": "6zPFJ42c", "policyId": "wmzBBSMN", "policyVersionId": "coAAOjKN"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 16 AdminRetrieveEligibilities
java -jar ${JAR_PATH} legal adminRetrieveEligibilities \
    --namespace "test" \
    --userId 'jfcYHm09' \
    --clientId '3aYgBU1s' \
    --countryCode 'qjyK0XH4' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRetrieveEligibilities'
delete_file $TEMP_FILE

#- 17 RetrievePolicies
java -jar ${JAR_PATH} legal retrievePolicies \
    --countryCode '5PaRSOFQ' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicies'
delete_file $TEMP_FILE

#- 18 UpdatePolicyVersion
java -jar ${JAR_PATH} legal updatePolicyVersion \
    --policyVersionId 'Btu23REZ' \
    --body '{"description": "8hRVX7LG", "displayVersion": "OvDdYiQS", "isCommitted": false}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePolicyVersion'
delete_file $TEMP_FILE

#- 19 PublishPolicyVersion
java -jar ${JAR_PATH} legal publishPolicyVersion \
    --policyVersionId '7mV1C91p' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishPolicyVersion'
delete_file $TEMP_FILE

#- 20 UpdatePolicy
java -jar ${JAR_PATH} legal updatePolicy \
    --policyId 'jG9gpxL6' \
    --body '{"description": "ycTQdvln", "isDefaultOpted": true, "isMandatory": true, "policyName": "SQWEXL6L", "readableId": "FE1YHo9m", "shouldNotifyOnUpdate": false}' \
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
    --body '[{"isAccepted": true, "localizedPolicyVersionId": "0B7WOfer", "policyId": "cZdpMci3", "policyVersionId": "7Ds7YSfE"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'ChangePreferenceConsent1'
delete_file $TEMP_FILE

#- 30 AcceptVersionedPolicy
java -jar ${JAR_PATH} legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'xaI3uzLt' \
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
    --body '[{"isAccepted": false, "localizedPolicyVersionId": "MbFAlt4h", "policyId": "r7HmOYiB", "policyVersionId": "A5ltAOXm"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkAcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 33 IndirectBulkAcceptVersionedPolicyV2
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'lG6eh1dT' \
    --countryCode 'doTFpBIc' \
    --namespace "test" \
    --userId 'uC1dQY93' \
    --body '[{"isAccepted": false, "localizedPolicyVersionId": "J6Te9vD8", "policyId": "ldz7Hu8A", "policyVersionId": "D79kdWun"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicyV2'
delete_file $TEMP_FILE

#- 34 IndirectBulkAcceptVersionedPolicy1
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'vizU0q1p' \
    --body '[{"isAccepted": true, "localizedPolicyVersionId": "hhERoGgd", "policyId": "rysMizBG", "policyVersionId": "SRdP2l7D"}]' \
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
    --clientId 'NSZ8Aq0X' \
    --countryCode 'iPLQXSe0' \
    --namespace "test" \
    --userId '7ZddOGTM' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveEligibilitiesPublicIndirect'
delete_file $TEMP_FILE

#- 37 RetrieveSingleLocalizedPolicyVersion1
java -jar ${JAR_PATH} legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'lJjBwj9H' \
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
    --countryCode 'JHQKseEd' \
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
    --countryCode 'SXRDSvgu' \
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