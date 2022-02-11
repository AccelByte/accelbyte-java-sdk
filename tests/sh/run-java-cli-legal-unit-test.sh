#!/bin/bash

#Meta:
#- random seed: 256
#- template file: java-cli-unit-test.j2

#Instructions:
#- Run the Justice SDK Mock Server first before running this script.

MODULE_PATH="${MODULE_PATH:-../../samples/cli}"
JAR_PATH="${MODULE_PATH}/build/libs/cli.jar"
TEMP_FILE='file.tmp'

OPERATIONS_COUNT=41

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

#- 1 RetrieveAcceptedAgreements
java -jar ${JAR_PATH} legal retrieveAcceptedAgreements \
    --userId 'FtBxyZcD' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAcceptedAgreements'
delete_file $TEMP_FILE

#- 2 RetrieveAllUsersByPolicyVersion
java -jar ${JAR_PATH} legal retrieveAllUsersByPolicyVersion \
    --policyVersionId 'XBpGlsQu' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllUsersByPolicyVersion'
delete_file $TEMP_FILE

#- 3 RetrieveAllLegalPolicies
java -jar ${JAR_PATH} legal retrieveAllLegalPolicies \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllLegalPolicies'
delete_file $TEMP_FILE

#- 4 CreatePolicy
java -jar ${JAR_PATH} legal createPolicy \
    --body '{"affectedClientIds": ["Ju8vMf0I"], "affectedCountries": ["sJkTrd8I"], "basePolicyName": "DcV2zXnT", "description": "KjXY1bPq", "namespace": "amiBxx9C", "tags": ["s18EY84e"], "typeId": "kItqRzHU"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePolicy'
delete_file $TEMP_FILE

#- 5 RetrieveSinglePolicy
java -jar ${JAR_PATH} legal retrieveSinglePolicy \
    --basePolicyId '1oh570KQ' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSinglePolicy'
delete_file $TEMP_FILE

#- 6 PartialUpdatePolicy
java -jar ${JAR_PATH} legal partialUpdatePolicy \
    --basePolicyId 'BVaewc72' \
    --body '{"affectedClientIds": ["krSha68n"], "affectedCountries": ["3Ynozp1C"], "basePolicyName": "2KmIQTuB", "description": "dNEUsxFb", "namespace": "8CJ17M7D", "tags": ["JZaMSxEC"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'PartialUpdatePolicy'
delete_file $TEMP_FILE

#- 7 RetrievePolicyCountry
java -jar ${JAR_PATH} legal retrievePolicyCountry \
    --basePolicyId 'bZbygyoa' \
    --countryCode 'rORoeNHS' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicyCountry'
delete_file $TEMP_FILE

#- 8 RetrieveLocalizedPolicyVersions
java -jar ${JAR_PATH} legal retrieveLocalizedPolicyVersions \
    --policyVersionId 'b8Rh3kgs' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLocalizedPolicyVersions'
delete_file $TEMP_FILE

#- 9 CreateLocalizedPolicyVersion
java -jar ${JAR_PATH} legal createLocalizedPolicyVersion \
    --policyVersionId '9qqJbnQs' \
    --body '{"contentType": "oBgiVpP8", "description": "Cm3yvASU", "localeCode": "oxdxxFqm"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 10 RetrieveSingleLocalizedPolicyVersion
java -jar ${JAR_PATH} legal retrieveSingleLocalizedPolicyVersion \
    --localizedPolicyVersionId 'AGTJ8IEd' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSingleLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 11 UpdateLocalizedPolicyVersion
java -jar ${JAR_PATH} legal updateLocalizedPolicyVersion \
    --localizedPolicyVersionId 'agEtp4w2' \
    --body '{"attachmentChecksum": "9KOu9c19", "attachmentLocation": "R6XDqWHk", "attachmentVersionIdentifier": "kP8npLEK", "contentType": "MfjiX7jp", "description": "kVZk3IaQ"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateLocalizedPolicyVersion'
delete_file $TEMP_FILE

#- 12 RequestPresignedURL
java -jar ${JAR_PATH} legal requestPresignedURL \
    --localizedPolicyVersionId 'YEmqGodO' \
    --body '{"contentMD5": "EGt9gPOj", "contentType": "0c6i0Jkv"}' \
    >$TEMP_FILE 2>&1
update_status $? 'RequestPresignedURL'
delete_file $TEMP_FILE

#- 13 SetDefaultPolicy
java -jar ${JAR_PATH} legal setDefaultPolicy \
    --localizedPolicyVersionId 'Ias73ucY' \
    >$TEMP_FILE 2>&1
update_status $? 'SetDefaultPolicy'
delete_file $TEMP_FILE

#- 14 IndirectBulkAcceptVersionedPolicy
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicy \
    --namespace "test" \
    --userId 'nFAJ3DK5' \
    --clientId 'T4Eogg0Y' \
    --countryCode '39UoYlpv' \
    --body '[{"isAccepted": false, "localizedPolicyVersionId": "VAgtsDhU", "policyId": "TDUscbQD", "policyVersionId": "jbTQuPMz"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 15 AdminRetrieveEligibilities
java -jar ${JAR_PATH} legal adminRetrieveEligibilities \
    --namespace "test" \
    --userId '2PTRlkyU' \
    --clientId '89ZPOw6z' \
    --countryCode 'PFJ42cwm' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminRetrieveEligibilities'
delete_file $TEMP_FILE

#- 16 RetrievePolicies
java -jar ${JAR_PATH} legal retrievePolicies \
    --countryCode 'zBBSMNco' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicies'
delete_file $TEMP_FILE

#- 17 UpdatePolicyVersion
java -jar ${JAR_PATH} legal updatePolicyVersion \
    --policyVersionId 'AAOjKNjf' \
    --body '{"description": "cYHm093a", "displayVersion": "YgBU1sqj", "isCommitted": true}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePolicyVersion'
delete_file $TEMP_FILE

#- 18 PublishPolicyVersion
java -jar ${JAR_PATH} legal publishPolicyVersion \
    --policyVersionId 'K0XH45Pa' \
    >$TEMP_FILE 2>&1
update_status $? 'PublishPolicyVersion'
delete_file $TEMP_FILE

#- 19 UpdatePolicy
java -jar ${JAR_PATH} legal updatePolicy \
    --policyId 'RSOFQBtu' \
    --body '{"description": "23REZ8hR", "isDefaultOpted": true, "isMandatory": true, "policyName": "dYiQS9i7", "readableId": "mV1C91pj", "shouldNotifyOnUpdate": false}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePolicy'
delete_file $TEMP_FILE

#- 20 SetDefaultPolicy1
java -jar ${JAR_PATH} legal setDefaultPolicy1 \
    --policyId 'pxL6ycTQ' \
    >$TEMP_FILE 2>&1
update_status $? 'SetDefaultPolicy1'
delete_file $TEMP_FILE

#- 21 RetrieveSinglePolicyVersion
java -jar ${JAR_PATH} legal retrieveSinglePolicyVersion \
    --policyId 'dvln2LAu' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSinglePolicyVersion'
delete_file $TEMP_FILE

#- 22 CreatePolicyVersion
java -jar ${JAR_PATH} legal createPolicyVersion \
    --policyId 'SQWEXL6L' \
    --body '{"description": "FE1YHo9m", "displayVersion": "126ZWc8h", "isCommitted": true}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreatePolicyVersion'
delete_file $TEMP_FILE

#- 23 RetrieveAllPolicyTypes
java -jar ${JAR_PATH} legal retrieveAllPolicyTypes \
    --limit '97' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAllPolicyTypes'
delete_file $TEMP_FILE

#- 24 GetUserInfoStatus
java -jar ${JAR_PATH} legal getUserInfoStatus \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserInfoStatus'
delete_file $TEMP_FILE

#- 25 SyncUserInfo
java -jar ${JAR_PATH} legal syncUserInfo \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'SyncUserInfo'
delete_file $TEMP_FILE

#- 26 InvalidateUserInfoCache
java -jar ${JAR_PATH} legal invalidateUserInfoCache \
    >$TEMP_FILE 2>&1
update_status $? 'InvalidateUserInfoCache'
delete_file $TEMP_FILE

#- 27 AnonymizeUserAgreement
java -jar ${JAR_PATH} legal anonymizeUserAgreement \
    --userId 'vbNYqgUq' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeUserAgreement'
delete_file $TEMP_FILE

#- 28 ChangePreferenceConsent
java -jar ${JAR_PATH} legal changePreferenceConsent \
    --body '[{"isAccepted": true, "localizedPolicyVersionId": "lArFPiHU", "policyId": "IvaCv8kU", "policyVersionId": "9dBBpdsJ"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'ChangePreferenceConsent'
delete_file $TEMP_FILE

#- 29 AcceptVersionedPolicy
java -jar ${JAR_PATH} legal acceptVersionedPolicy \
    --localizedPolicyVersionId 'LhsVyExr' \
    >$TEMP_FILE 2>&1
update_status $? 'AcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 30 RetrieveAgreementsPublic
java -jar ${JAR_PATH} legal retrieveAgreementsPublic \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveAgreementsPublic'
delete_file $TEMP_FILE

#- 31 BulkAcceptVersionedPolicy
java -jar ${JAR_PATH} legal bulkAcceptVersionedPolicy \
    --body '[{"isAccepted": false, "localizedPolicyVersionId": "xoot0B7W", "policyId": "OfercZdp", "policyVersionId": "Mci37Ds7"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'BulkAcceptVersionedPolicy'
delete_file $TEMP_FILE

#- 32 IndirectBulkAcceptVersionedPolicyV2
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicyV2 \
    --clientId 'YSfExaI3' \
    --countryCode 'uzLteMbF' \
    --namespace "test" \
    --userId 'Alt4hr7H' \
    --body '[{"isAccepted": false, "localizedPolicyVersionId": "OYiBA5lt", "policyId": "AOXmlG6e", "policyVersionId": "h1dTdoTF"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicyV2'
delete_file $TEMP_FILE

#- 33 IndirectBulkAcceptVersionedPolicy1
java -jar ${JAR_PATH} legal indirectBulkAcceptVersionedPolicy1 \
    --userId 'pBIcuC1d' \
    --body '[{"isAccepted": false, "localizedPolicyVersionId": "J6Te9vD8", "policyId": "ldz7Hu8A", "policyVersionId": "D79kdWun"}]' \
    >$TEMP_FILE 2>&1
update_status $? 'IndirectBulkAcceptVersionedPolicy1'
delete_file $TEMP_FILE

#- 34 RetrieveEligibilitiesPublic
java -jar ${JAR_PATH} legal retrieveEligibilitiesPublic \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveEligibilitiesPublic'
delete_file $TEMP_FILE

#- 35 RetrieveEligibilitiesPublicIndirect
java -jar ${JAR_PATH} legal retrieveEligibilitiesPublicIndirect \
    --clientId 'vizU0q1p' \
    --countryCode 'HyhhERoG' \
    --namespace "test" \
    --userId 'gdrysMiz' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveEligibilitiesPublicIndirect'
delete_file $TEMP_FILE

#- 36 RetrieveSingleLocalizedPolicyVersion1
java -jar ${JAR_PATH} legal retrieveSingleLocalizedPolicyVersion1 \
    --localizedPolicyVersionId 'BGSRdP2l' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveSingleLocalizedPolicyVersion1'
delete_file $TEMP_FILE

#- 37 RetrievePolicyVersions
java -jar ${JAR_PATH} legal retrievePolicyVersions \
    >$TEMP_FILE 2>&1
update_status $? 'RetrievePolicyVersions'
delete_file $TEMP_FILE

#- 38 RetrieveLatestPolicies
java -jar ${JAR_PATH} legal retrieveLatestPolicies \
    --countryCode '7DNSZ8Aq' \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLatestPolicies'
delete_file $TEMP_FILE

#- 39 RetrieveLatestPoliciesPublic
java -jar ${JAR_PATH} legal retrieveLatestPoliciesPublic \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLatestPoliciesPublic'
delete_file $TEMP_FILE

#- 40 RetrieveLatestPoliciesByNamespaceAndCountryPublic
java -jar ${JAR_PATH} legal retrieveLatestPoliciesByNamespaceAndCountryPublic \
    --countryCode '0XiPLQXS' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'RetrieveLatestPoliciesByNamespaceAndCountryPublic'
delete_file $TEMP_FILE

#- 41 CheckReadiness
java -jar ${JAR_PATH} legal checkReadiness \
    >$TEMP_FILE 2>&1
update_status $? 'CheckReadiness'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT