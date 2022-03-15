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

OPERATIONS_COUNT=57

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

#- 1 GetNamespaces
java -jar ${JAR_PATH} basic getNamespaces \
    >$TEMP_FILE 2>&1
update_status $? 'GetNamespaces'
delete_file $TEMP_FILE

#- 2 CreateNamespace
java -jar ${JAR_PATH} basic createNamespace \
    --body '{"displayName": "FtBxyZcD", "namespace": "XBpGlsQu"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateNamespace'
delete_file $TEMP_FILE

#- 3 GetNamespace
java -jar ${JAR_PATH} basic getNamespace \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetNamespace'
delete_file $TEMP_FILE

#- 4 DeleteNamespace
java -jar ${JAR_PATH} basic deleteNamespace \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteNamespace'
delete_file $TEMP_FILE

#- 5 GetActions
java -jar ${JAR_PATH} basic getActions \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetActions'
delete_file $TEMP_FILE

#- 6 BanUsers
java -jar ${JAR_PATH} basic banUsers \
    --namespace "test" \
    --body '{"actionId": 71, "comment": "u8vMf0Is", "userIds": ["JkTrd8ID"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'BanUsers'
delete_file $TEMP_FILE

#- 7 GetBannedUsers
java -jar ${JAR_PATH} basic getBannedUsers \
    --namespace "test" \
    --userIds '["cV2zXnTK"]' \
    >$TEMP_FILE 2>&1
update_status $? 'GetBannedUsers'
delete_file $TEMP_FILE

#- 8 ReportUser
java -jar ${JAR_PATH} basic reportUser \
    --namespace "test" \
    --body '{"category": "jXY1bPqa", "description": "miBxx9Cs", "gameSessionId": "18EY84ek", "subcategory": "ItqRzHU1", "userId": "oh570KQB"}' \
    >$TEMP_FILE 2>&1
update_status $? 'ReportUser'
delete_file $TEMP_FILE

#- 9 GetUserStatus
java -jar ${JAR_PATH} basic getUserStatus \
    --namespace "test" \
    --userId 'Vaewc72k' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserStatus'
delete_file $TEMP_FILE

#- 10 UnBanUsers
java -jar ${JAR_PATH} basic unBanUsers \
    --namespace "test" \
    --body '{"comment": "rSha68n3", "userIds": ["Ynozp1C2"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'UnBanUsers'
delete_file $TEMP_FILE

#- 11 UpdateNamespace
java -jar ${JAR_PATH} basic updateNamespace \
    --namespace "test" \
    --body '{"displayName": "KmIQTuBd"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateNamespace'
delete_file $TEMP_FILE

#- 12 GetConfig
java -jar ${JAR_PATH} basic getConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetConfig'
delete_file $TEMP_FILE

#- 13 DeleteConfig
java -jar ${JAR_PATH} basic deleteConfig \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteConfig'
delete_file $TEMP_FILE

#- 14 UpdateConfig
java -jar ${JAR_PATH} basic updateConfig \
    --namespace "test" \
    --body '{"apiKey": "NEUsxFb8"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateConfig'
delete_file $TEMP_FILE

#- 15 GeneratedUploadUrl
java -jar ${JAR_PATH} basic generatedUploadUrl \
    --folder 'CJ17M7DJ' \
    --namespace "test" \
    --fileType 'ZaMSxECb' \
    >$TEMP_FILE 2>&1
update_status $? 'GeneratedUploadUrl'
delete_file $TEMP_FILE

#- 16 GetCountries
java -jar ${JAR_PATH} basic getCountries \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCountries'
delete_file $TEMP_FILE

#- 17 GetCountryGroups
java -jar ${JAR_PATH} basic getCountryGroups \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetCountryGroups'
delete_file $TEMP_FILE

#- 18 AddCountryGroup
java -jar ${JAR_PATH} basic addCountryGroup \
    --namespace "test" \
    --body '{"countries": [{"code": "Zbygyoar", "name": "ORoeNHSb"}], "countryGroupCode": "8Rh3kgs9", "countryGroupName": "qqJbnQso"}' \
    >$TEMP_FILE 2>&1
update_status $? 'AddCountryGroup'
delete_file $TEMP_FILE

#- 19 UpdateCountryGroup
java -jar ${JAR_PATH} basic updateCountryGroup \
    --countryGroupCode 'BgiVpP8C' \
    --namespace "test" \
    --body '{"countries": [{"code": "m3yvASUo", "name": "xdxxFqmA"}], "countryGroupName": "GTJ8IEda"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateCountryGroup'
delete_file $TEMP_FILE

#- 20 DeleteCountryGroup
java -jar ${JAR_PATH} basic deleteCountryGroup \
    --countryGroupCode 'gEtp4w29' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteCountryGroup'
delete_file $TEMP_FILE

#- 21 GetLanguages
java -jar ${JAR_PATH} basic getLanguages \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetLanguages'
delete_file $TEMP_FILE

#- 22 GetTimeZones
java -jar ${JAR_PATH} basic getTimeZones \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetTimeZones'
delete_file $TEMP_FILE

#- 23 AdminGetUserProfilePublicInfoByIds
java -jar ${JAR_PATH} basic adminGetUserProfilePublicInfoByIds \
    --namespace "test" \
    --body '{"userIds": ["KOu9c19R"]}' \
    >$TEMP_FILE 2>&1
update_status $? 'AdminGetUserProfilePublicInfoByIds'
delete_file $TEMP_FILE

#- 24 GetNamespacePublisher
java -jar ${JAR_PATH} basic getNamespacePublisher \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetNamespacePublisher'
delete_file $TEMP_FILE

#- 25 ChangeNamespaceStatus
java -jar ${JAR_PATH} basic changeNamespaceStatus \
    --namespace "test" \
    --body '{"status": "INACTIVE"}' \
    >$TEMP_FILE 2>&1
update_status $? 'ChangeNamespaceStatus'
delete_file $TEMP_FILE

#- 26 AnonymizeUserProfile
java -jar ${JAR_PATH} basic anonymizeUserProfile \
    --namespace "test" \
    --userId 'qWHkkP8n' \
    >$TEMP_FILE 2>&1
update_status $? 'AnonymizeUserProfile'
delete_file $TEMP_FILE

#- 27 GeneratedUserUploadContentUrl
java -jar ${JAR_PATH} basic generatedUserUploadContentUrl \
    --namespace "test" \
    --userId 'pLEKMfji' \
    --fileType 'X7jpkVZk' \
    >$TEMP_FILE 2>&1
update_status $? 'GeneratedUserUploadContentUrl'
delete_file $TEMP_FILE

#- 28 GetUserProfileInfo
java -jar ${JAR_PATH} basic getUserProfileInfo \
    --namespace "test" \
    --userId '3IaQYEmq' \
    >$TEMP_FILE 2>&1
update_status $? 'GetUserProfileInfo'
delete_file $TEMP_FILE

#- 29 UpdateUserProfile
java -jar ${JAR_PATH} basic updateUserProfile \
    --namespace "test" \
    --userId 'GodOEGt9' \
    --body '{"avatarLargeUrl": "gPOj0c6i", "avatarSmallUrl": "0JkvIas7", "avatarUrl": "3ucYnFAJ", "customAttributes": {"3DK5T4Eo": {}}, "dateOfBirth": "1323-10-31", "firstName": "gtsDhUTD", "language": "SCBq_tqUp_uz", "lastName": "POw6zPFJ", "status": "ACTIVE", "timeZone": "wmzBBSMN", "zipCode": "coAAOjKN"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserProfile'
delete_file $TEMP_FILE

#- 30 DeleteUserProfile
java -jar ${JAR_PATH} basic deleteUserProfile \
    --namespace "test" \
    --userId 'jfcYHm09' \
    >$TEMP_FILE 2>&1
update_status $? 'DeleteUserProfile'
delete_file $TEMP_FILE

#- 31 GetCustomAttributesInfo
java -jar ${JAR_PATH} basic getCustomAttributesInfo \
    --namespace "test" \
    --userId '3aYgBU1s' \
    >$TEMP_FILE 2>&1
update_status $? 'GetCustomAttributesInfo'
delete_file $TEMP_FILE

#- 32 UpdateCustomAttributesPartially
java -jar ${JAR_PATH} basic updateCustomAttributesPartially \
    --namespace "test" \
    --userId 'qjyK0XH4' \
    --body '{"5PaRSOFQ": {}}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateCustomAttributesPartially'
delete_file $TEMP_FILE

#- 33 GetPrivateCustomAttributesInfo
java -jar ${JAR_PATH} basic getPrivateCustomAttributesInfo \
    --namespace "test" \
    --userId 'Btu23REZ' \
    >$TEMP_FILE 2>&1
update_status $? 'GetPrivateCustomAttributesInfo'
delete_file $TEMP_FILE

#- 34 UpdatePrivateCustomAttributesPartially
java -jar ${JAR_PATH} basic updatePrivateCustomAttributesPartially \
    --namespace "test" \
    --userId '8hRVX7LG' \
    --body '{"OvDdYiQS": {}}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdatePrivateCustomAttributesPartially'
delete_file $TEMP_FILE

#- 35 UpdateUserProfileStatus
java -jar ${JAR_PATH} basic updateUserProfileStatus \
    --namespace "test" \
    --userId '9i7mV1C9' \
    --body '{"status": "ACTIVE"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateUserProfileStatus'
delete_file $TEMP_FILE

#- 36 PublicGetTime
java -jar ${JAR_PATH} basic publicGetTime \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetTime'
delete_file $TEMP_FILE

#- 37 PublicGetNamespaces
java -jar ${JAR_PATH} basic publicGetNamespaces \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetNamespaces'
delete_file $TEMP_FILE

#- 38 PublicGeneratedUploadUrl
java -jar ${JAR_PATH} basic publicGeneratedUploadUrl \
    --folder 'jG9gpxL6' \
    --namespace "test" \
    --fileType 'ycTQdvln' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGeneratedUploadUrl'
delete_file $TEMP_FILE

#- 39 PublicGetCountries
java -jar ${JAR_PATH} basic publicGetCountries \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCountries'
delete_file $TEMP_FILE

#- 40 PublicGetLanguages
java -jar ${JAR_PATH} basic publicGetLanguages \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetLanguages'
delete_file $TEMP_FILE

#- 41 PublicGetTimeZones
java -jar ${JAR_PATH} basic publicGetTimeZones \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetTimeZones'
delete_file $TEMP_FILE

#- 42 PublicGetUserProfilePublicInfoByIds
java -jar ${JAR_PATH} basic publicGetUserProfilePublicInfoByIds \
    --namespace "test" \
    --userIds '2LAuSQWE' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserProfilePublicInfoByIds'
delete_file $TEMP_FILE

#- 43 PublicGetNamespacePublisher
java -jar ${JAR_PATH} basic publicGetNamespacePublisher \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetNamespacePublisher'
delete_file $TEMP_FILE

#- 44 GetMyProfileInfo
java -jar ${JAR_PATH} basic getMyProfileInfo \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetMyProfileInfo'
delete_file $TEMP_FILE

#- 45 UpdateMyProfile
java -jar ${JAR_PATH} basic updateMyProfile \
    --namespace "test" \
    --body '{"avatarLargeUrl": "XL6LFE1Y", "avatarSmallUrl": "Ho9m126Z", "avatarUrl": "Wc8hHtWv", "customAttributes": {"bNYqgUqs": {}}, "dateOfBirth": "6472-10-22", "firstName": "U9dBBpds", "language": "lHSv-RKXO", "lastName": "t0B7WOfe", "privateCustomAttributes": {"rcZdpMci": {}}, "timeZone": "37Ds7YSf", "zipCode": "ExaI3uzL"}' \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateMyProfile'
delete_file $TEMP_FILE

#- 46 CreateMyProfile
java -jar ${JAR_PATH} basic createMyProfile \
    --namespace "test" \
    --body '{"avatarLargeUrl": "teMbFAlt", "avatarSmallUrl": "4hr7HmOY", "avatarUrl": "iBA5ltAO", "customAttributes": {"XmlG6eh1": {}}, "dateOfBirth": "0373-12-06", "firstName": "C1dQY93O", "language": "NjtE-DZhU-wU", "lastName": "nvizU0q1", "privateCustomAttributes": {"pHyhhERo": {}}, "timeZone": "GgdrysMi"}' \
    >$TEMP_FILE 2>&1
update_status $? 'CreateMyProfile'
delete_file $TEMP_FILE

#- 47 GetMyZipCode
java -jar ${JAR_PATH} basic getMyZipCode \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'GetMyZipCode'
delete_file $TEMP_FILE

#- 48 UpdateMyZipCode
java -jar ${JAR_PATH} basic updateMyZipCode \
    --userZipCodeUpdate '{"zipCode": "zBGSRdP2"}' \
    --namespace "test" \
    >$TEMP_FILE 2>&1
update_status $? 'UpdateMyZipCode'
delete_file $TEMP_FILE

#- 49 PublicReportUser
java -jar ${JAR_PATH} basic publicReportUser \
    --namespace "test" \
    --userId 'l7DNSZ8A' \
    --body '{"category": "q0XiPLQX", "description": "Se07ZddO", "gameSessionId": "GTMlJjBw", "subcategory": "j9HJHQKs", "userId": "eEdSXRDS"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicReportUser'
delete_file $TEMP_FILE

#- 50 PublicGeneratedUserUploadContentUrl
java -jar ${JAR_PATH} basic publicGeneratedUserUploadContentUrl \
    --namespace "test" \
    --userId 'vguauw1x' \
    --fileType 'T7eMwSl9' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGeneratedUserUploadContentUrl'
delete_file $TEMP_FILE

#- 51 PublicGetUserProfileInfo
java -jar ${JAR_PATH} basic publicGetUserProfileInfo \
    --namespace "test" \
    --userId 'MLH0NnTJ' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserProfileInfo'
delete_file $TEMP_FILE

#- 52 PublicUpdateUserProfile
java -jar ${JAR_PATH} basic publicUpdateUserProfile \
    --namespace "test" \
    --userId '2ulNzBvw' \
    --body '{"avatarLargeUrl": "JaQa547J", "avatarSmallUrl": "llvA8RWS", "avatarUrl": "pabUt7xk", "customAttributes": {"6QxyWhfq": {}}, "dateOfBirth": "1853-05-28", "firstName": "zT7NXmWD", "language": "xS_SnoL_As", "lastName": "bnsuLCgT", "timeZone": "oxuVTekJ", "zipCode": "gvg6h5HI"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserProfile'
delete_file $TEMP_FILE

#- 53 PublicCreateUserProfile
java -jar ${JAR_PATH} basic publicCreateUserProfile \
    --namespace "test" \
    --userId 'pH0Dvipl' \
    --body '{"avatarLargeUrl": "Ek4vj3LD", "avatarSmallUrl": "p4yqDt8Q", "avatarUrl": "UZDpxlHa", "customAttributes": {"sinGcjrk": {}}, "dateOfBirth": "9441-08-30", "firstName": "IVBmft3U", "language": "GP", "lastName": "X4MsisSX", "timeZone": "28nARxWR"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicCreateUserProfile'
delete_file $TEMP_FILE

#- 54 PublicGetCustomAttributesInfo
java -jar ${JAR_PATH} basic publicGetCustomAttributesInfo \
    --namespace "test" \
    --userId 'pv5ou5xt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetCustomAttributesInfo'
delete_file $TEMP_FILE

#- 55 PublicUpdateCustomAttributesPartially
java -jar ${JAR_PATH} basic publicUpdateCustomAttributesPartially \
    --namespace "test" \
    --userId 'vd28OUfC' \
    --body '{"t8UJC5fl": {}}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateCustomAttributesPartially'
delete_file $TEMP_FILE

#- 56 PublicGetUserProfilePublicInfo
java -jar ${JAR_PATH} basic publicGetUserProfilePublicInfo \
    --namespace "test" \
    --userId 'Nyj6HsTt' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicGetUserProfilePublicInfo'
delete_file $TEMP_FILE

#- 57 PublicUpdateUserProfileStatus
java -jar ${JAR_PATH} basic publicUpdateUserProfileStatus \
    --namespace "test" \
    --userId 'X8P3llna' \
    --body '{"status": "ACTIVE"}' \
    >$TEMP_FILE 2>&1
update_status $? 'PublicUpdateUserProfileStatus'
delete_file $TEMP_FILE

delete_file 'tmp.dat'

exit $FAILED_COUNT