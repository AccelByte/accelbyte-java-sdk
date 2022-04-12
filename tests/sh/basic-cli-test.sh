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
echo "1..58"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespaces
java -jar "${CLI_JAR}" basic getNamespaces \
    > test.out 2>&1
eval_tap $? 2 'GetNamespaces' test.out

#- 3 CreateNamespace
java -jar "${CLI_JAR}" basic createNamespace \
    --body '{"displayName": "FtBxyZcD", "namespace": "XBpGlsQu"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateNamespace' test.out

#- 4 GetNamespace
java -jar "${CLI_JAR}" basic getNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'GetNamespace' test.out

#- 5 DeleteNamespace
java -jar "${CLI_JAR}" basic deleteNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'DeleteNamespace' test.out

#- 6 GetActions
java -jar "${CLI_JAR}" basic getActions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetActions' test.out

#- 7 BanUsers
java -jar "${CLI_JAR}" basic banUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"actionId": 71, "comment": "u8vMf0Is", "userIds": ["JkTrd8ID"]}' \
    > test.out 2>&1
eval_tap $? 7 'BanUsers' test.out

#- 8 GetBannedUsers
java -jar "${CLI_JAR}" basic getBannedUsers \
    --namespace "$AB_NAMESPACE" \
    --userIds '["cV2zXnTK"]' \
    > test.out 2>&1
eval_tap $? 8 'GetBannedUsers' test.out

#- 9 ReportUser
java -jar "${CLI_JAR}" basic reportUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "jXY1bPqa", "description": "miBxx9Cs", "gameSessionId": "18EY84ek", "subcategory": "ItqRzHU1", "userId": "oh570KQB"}' \
    > test.out 2>&1
eval_tap $? 9 'ReportUser' test.out

#- 10 GetUserStatus
java -jar "${CLI_JAR}" basic getUserStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vaewc72k' \
    > test.out 2>&1
eval_tap $? 10 'GetUserStatus' test.out

#- 11 UnBanUsers
java -jar "${CLI_JAR}" basic unBanUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "rSha68n3", "userIds": ["Ynozp1C2"]}' \
    > test.out 2>&1
eval_tap $? 11 'UnBanUsers' test.out

#- 12 UpdateNamespace
java -jar "${CLI_JAR}" basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "KmIQTuBd"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateNamespace' test.out

#- 13 GetConfig
java -jar "${CLI_JAR}" basic getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetConfig' test.out

#- 14 DeleteConfig
java -jar "${CLI_JAR}" basic deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteConfig' test.out

#- 15 UpdateConfig
java -jar "${CLI_JAR}" basic updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "NEUsxFb8"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateConfig' test.out

#- 16 GeneratedUploadUrl
java -jar "${CLI_JAR}" basic generatedUploadUrl \
    --folder 'CJ17M7DJ' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'ZaMSxECb' \
    > test.out 2>&1
eval_tap $? 16 'GeneratedUploadUrl' test.out

#- 17 GetCountries
java -jar "${CLI_JAR}" basic getCountries \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetCountries' test.out

#- 18 GetCountryGroups
java -jar "${CLI_JAR}" basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetCountryGroups' test.out

#- 19 AddCountryGroup
java -jar "${CLI_JAR}" basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "Zbygyoar", "name": "ORoeNHSb"}], "countryGroupCode": "8Rh3kgs9", "countryGroupName": "qqJbnQso"}' \
    > test.out 2>&1
eval_tap $? 19 'AddCountryGroup' test.out

#- 20 UpdateCountryGroup
java -jar "${CLI_JAR}" basic updateCountryGroup \
    --countryGroupCode 'BgiVpP8C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "m3yvASUo", "name": "xdxxFqmA"}], "countryGroupName": "GTJ8IEda"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateCountryGroup' test.out

#- 21 DeleteCountryGroup
java -jar "${CLI_JAR}" basic deleteCountryGroup \
    --countryGroupCode 'gEtp4w29' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'DeleteCountryGroup' test.out

#- 22 GetLanguages
java -jar "${CLI_JAR}" basic getLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetLanguages' test.out

#- 23 GetTimeZones
java -jar "${CLI_JAR}" basic getTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetTimeZones' test.out

#- 24 AdminGetUserProfilePublicInfoByIds
java -jar "${CLI_JAR}" basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["KOu9c19R"]}' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetUserProfilePublicInfoByIds' test.out

#- 25 GetNamespacePublisher
java -jar "${CLI_JAR}" basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'GetNamespacePublisher' test.out

#- 26 ChangeNamespaceStatus
java -jar "${CLI_JAR}" basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 26 'ChangeNamespaceStatus' test.out

#- 27 AnonymizeUserProfile
java -jar "${CLI_JAR}" basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'qWHkkP8n' \
    > test.out 2>&1
eval_tap $? 27 'AnonymizeUserProfile' test.out

#- 28 GeneratedUserUploadContentUrl
java -jar "${CLI_JAR}" basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'pLEKMfji' \
    --fileType 'X7jpkVZk' \
    > test.out 2>&1
eval_tap $? 28 'GeneratedUserUploadContentUrl' test.out

#- 29 GetUserProfileInfo
java -jar "${CLI_JAR}" basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '3IaQYEmq' \
    > test.out 2>&1
eval_tap $? 29 'GetUserProfileInfo' test.out

#- 30 UpdateUserProfile
java -jar "${CLI_JAR}" basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'GodOEGt9' \
    --body '{"avatarLargeUrl": "gPOj0c6i", "avatarSmallUrl": "0JkvIas7", "avatarUrl": "3ucYnFAJ", "customAttributes": {"3DK5T4Eo": {}}, "dateOfBirth": "1323-10-31", "firstName": "gtsDhUTD", "language": "SCBq_tqUp_uz", "lastName": "POw6zPFJ", "status": "ACTIVE", "timeZone": "wmzBBSMN", "zipCode": "coAAOjKN"}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateUserProfile' test.out

#- 31 DeleteUserProfile
java -jar "${CLI_JAR}" basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'jfcYHm09' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserProfile' test.out

#- 32 GetCustomAttributesInfo
java -jar "${CLI_JAR}" basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '3aYgBU1s' \
    > test.out 2>&1
eval_tap $? 32 'GetCustomAttributesInfo' test.out

#- 33 UpdateCustomAttributesPartially
java -jar "${CLI_JAR}" basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'qjyK0XH4' \
    --body '{"5PaRSOFQ": {}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateCustomAttributesPartially' test.out

#- 34 GetPrivateCustomAttributesInfo
java -jar "${CLI_JAR}" basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'Btu23REZ' \
    > test.out 2>&1
eval_tap $? 34 'GetPrivateCustomAttributesInfo' test.out

#- 35 UpdatePrivateCustomAttributesPartially
java -jar "${CLI_JAR}" basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '8hRVX7LG' \
    --body '{"OvDdYiQS": {}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdatePrivateCustomAttributesPartially' test.out

#- 36 UpdateUserProfileStatus
java -jar "${CLI_JAR}" basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '9i7mV1C9' \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 36 'UpdateUserProfileStatus' test.out

#- 37 PublicGetTime
java -jar "${CLI_JAR}" basic publicGetTime \
    > test.out 2>&1
eval_tap $? 37 'PublicGetTime' test.out

#- 38 PublicGetNamespaces
java -jar "${CLI_JAR}" basic publicGetNamespaces \
    > test.out 2>&1
eval_tap $? 38 'PublicGetNamespaces' test.out

#- 39 PublicGeneratedUploadUrl
java -jar "${CLI_JAR}" basic publicGeneratedUploadUrl \
    --folder 'jG9gpxL6' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'ycTQdvln' \
    > test.out 2>&1
eval_tap $? 39 'PublicGeneratedUploadUrl' test.out

#- 40 PublicGetCountries
java -jar "${CLI_JAR}" basic publicGetCountries \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'PublicGetCountries' test.out

#- 41 PublicGetLanguages
java -jar "${CLI_JAR}" basic publicGetLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'PublicGetLanguages' test.out

#- 42 PublicGetTimeZones
java -jar "${CLI_JAR}" basic publicGetTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'PublicGetTimeZones' test.out

#- 43 PublicGetUserProfilePublicInfoByIds
java -jar "${CLI_JAR}" basic publicGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --userIds '2LAuSQWE' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetUserProfilePublicInfoByIds' test.out

#- 44 PublicGetNamespacePublisher
java -jar "${CLI_JAR}" basic publicGetNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'PublicGetNamespacePublisher' test.out

#- 45 GetMyProfileInfo
java -jar "${CLI_JAR}" basic getMyProfileInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'GetMyProfileInfo' test.out

#- 46 UpdateMyProfile
java -jar "${CLI_JAR}" basic updateMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "XL6LFE1Y", "avatarSmallUrl": "Ho9m126Z", "avatarUrl": "Wc8hHtWv", "customAttributes": {"bNYqgUqs": {}}, "dateOfBirth": "6472-10-22", "firstName": "U9dBBpds", "language": "lHSv-RKXO", "lastName": "t0B7WOfe", "privateCustomAttributes": {"rcZdpMci": {}}, "timeZone": "37Ds7YSf", "zipCode": "ExaI3uzL"}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateMyProfile' test.out

#- 47 CreateMyProfile
java -jar "${CLI_JAR}" basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "teMbFAlt", "avatarSmallUrl": "4hr7HmOY", "avatarUrl": "iBA5ltAO", "customAttributes": {"XmlG6eh1": {}}, "dateOfBirth": "0373-12-06", "firstName": "C1dQY93O", "language": "NjtE-DZhU-wU", "lastName": "nvizU0q1", "privateCustomAttributes": {"pHyhhERo": {}}, "timeZone": "GgdrysMi"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateMyProfile' test.out

#- 48 GetMyZipCode
java -jar "${CLI_JAR}" basic getMyZipCode \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetMyZipCode' test.out

#- 49 UpdateMyZipCode
java -jar "${CLI_JAR}" basic updateMyZipCode \
    --userZipCodeUpdate '{"zipCode": "zBGSRdP2"}' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'UpdateMyZipCode' test.out

#- 50 PublicReportUser
java -jar "${CLI_JAR}" basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'l7DNSZ8A' \
    --body '{"category": "q0XiPLQX", "description": "Se07ZddO", "gameSessionId": "GTMlJjBw", "subcategory": "j9HJHQKs", "userId": "eEdSXRDS"}' \
    > test.out 2>&1
eval_tap $? 50 'PublicReportUser' test.out

#- 51 PublicGeneratedUserUploadContentUrl
java -jar "${CLI_JAR}" basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'vguauw1x' \
    --fileType 'T7eMwSl9' \
    > test.out 2>&1
eval_tap $? 51 'PublicGeneratedUserUploadContentUrl' test.out

#- 52 PublicGetUserProfileInfo
java -jar "${CLI_JAR}" basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'MLH0NnTJ' \
    > test.out 2>&1
eval_tap $? 52 'PublicGetUserProfileInfo' test.out

#- 53 PublicUpdateUserProfile
java -jar "${CLI_JAR}" basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '2ulNzBvw' \
    --body '{"avatarLargeUrl": "JaQa547J", "avatarSmallUrl": "llvA8RWS", "avatarUrl": "pabUt7xk", "customAttributes": {"6QxyWhfq": {}}, "dateOfBirth": "1853-05-28", "firstName": "zT7NXmWD", "language": "xS_SnoL_As", "lastName": "bnsuLCgT", "timeZone": "oxuVTekJ", "zipCode": "gvg6h5HI"}' \
    > test.out 2>&1
eval_tap $? 53 'PublicUpdateUserProfile' test.out

#- 54 PublicCreateUserProfile
java -jar "${CLI_JAR}" basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'pH0Dvipl' \
    --body '{"avatarLargeUrl": "Ek4vj3LD", "avatarSmallUrl": "p4yqDt8Q", "avatarUrl": "UZDpxlHa", "customAttributes": {"sinGcjrk": {}}, "dateOfBirth": "9441-08-30", "firstName": "IVBmft3U", "language": "GP", "lastName": "X4MsisSX", "timeZone": "28nARxWR"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicCreateUserProfile' test.out

#- 55 PublicGetCustomAttributesInfo
java -jar "${CLI_JAR}" basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'pv5ou5xt' \
    > test.out 2>&1
eval_tap $? 55 'PublicGetCustomAttributesInfo' test.out

#- 56 PublicUpdateCustomAttributesPartially
java -jar "${CLI_JAR}" basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'vd28OUfC' \
    --body '{"t8UJC5fl": {}}' \
    > test.out 2>&1
eval_tap $? 56 'PublicUpdateCustomAttributesPartially' test.out

#- 57 PublicGetUserProfilePublicInfo
java -jar "${CLI_JAR}" basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nyj6HsTt' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetUserProfilePublicInfo' test.out

#- 58 PublicUpdateUserProfileStatus
java -jar "${CLI_JAR}" basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'X8P3llna' \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE