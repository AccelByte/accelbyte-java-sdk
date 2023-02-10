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

#- 2 GetNamespaces
./ng net.accelbyte.sdk.cli.Main basic getNamespaces \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 2 'GetNamespaces' test.out

#- 3 CreateNamespace
./ng net.accelbyte.sdk.cli.Main basic createNamespace \
    --body '{"displayName": "2iSyxDhw", "namespace": "LGPxvAhg"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateNamespace' test.out

#- 4 GetNamespace
./ng net.accelbyte.sdk.cli.Main basic getNamespace \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 4 'GetNamespace' test.out

#- 5 DeleteNamespace
./ng net.accelbyte.sdk.cli.Main basic deleteNamespace \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'DeleteNamespace' test.out

#- 6 GetActions
./ng net.accelbyte.sdk.cli.Main basic getActions \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetActions' test.out

#- 7 BanUsers
./ng net.accelbyte.sdk.cli.Main basic banUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"actionId": 18, "comment": "mZKb6NFL", "userIds": ["DPO96Ihs", "zioC1Bke", "CNOl8Rw6"]}' \
    > test.out 2>&1
eval_tap $? 7 'BanUsers' test.out

#- 8 GetBannedUsers
./ng net.accelbyte.sdk.cli.Main basic getBannedUsers \
    --namespace "$AB_NAMESPACE" \
    --userIds 'lglJEe3q,JVCDyB0w,RDa2xI2D' \
    > test.out 2>&1
eval_tap $? 8 'GetBannedUsers' test.out

#- 9 ReportUser
./ng net.accelbyte.sdk.cli.Main basic reportUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "4s4VBVdz", "description": "ExW2xGnb", "gameSessionId": "h9jfoAOK", "subcategory": "XRuv14wX", "userId": "aDAJ3tOA"}' \
    > test.out 2>&1
eval_tap $? 9 'ReportUser' test.out

#- 10 GetUserStatus
./ng net.accelbyte.sdk.cli.Main basic getUserStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '2T5w6gVT' \
    > test.out 2>&1
eval_tap $? 10 'GetUserStatus' test.out

#- 11 UnBanUsers
./ng net.accelbyte.sdk.cli.Main basic unBanUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "Tw6lgEP6", "userIds": ["zktprBPG", "LVs0BDOA", "bqoKTwCa"]}' \
    > test.out 2>&1
eval_tap $? 11 'UnBanUsers' test.out

#- 12 UpdateNamespace
./ng net.accelbyte.sdk.cli.Main basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "jBfL9FHD"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateNamespace' test.out

#- 13 GetConfig
./ng net.accelbyte.sdk.cli.Main basic getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetConfig' test.out

#- 14 DeleteConfig
./ng net.accelbyte.sdk.cli.Main basic deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteConfig' test.out

#- 15 UpdateConfig
./ng net.accelbyte.sdk.cli.Main basic updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "QSyY4q34"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateConfig' test.out

#- 16 GeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUploadUrl \
    --folder 'f4HEiplF' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'USfHfGNQ' \
    > test.out 2>&1
eval_tap $? 16 'GeneratedUploadUrl' test.out

#- 17 GetGameNamespaces
./ng net.accelbyte.sdk.cli.Main basic getGameNamespaces \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 17 'GetGameNamespaces' test.out

#- 18 GetCountries
./ng net.accelbyte.sdk.cli.Main basic getCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'vWtsdaQN' \
    > test.out 2>&1
eval_tap $? 18 'GetCountries' test.out

#- 19 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode '6WAPi5Cz' \
    > test.out 2>&1
eval_tap $? 19 'GetCountryGroups' test.out

#- 20 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "IUb7HjkQ", "name": "nN8W2ziM"}, {"code": "XmbSh37Y", "name": "YLLgu4jM"}, {"code": "jExdyDfu", "name": "y5wfUz73"}], "countryGroupCode": "IxIE2vTG", "countryGroupName": "ztlnNU1G"}' \
    > test.out 2>&1
eval_tap $? 20 'AddCountryGroup' test.out

#- 21 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 'iXTOItfH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "ffOhteFt", "name": "tVAPRvfv"}, {"code": "mryn4eUF", "name": "HW2Ro865"}, {"code": "aVq6JBUM", "name": "uyDUFrCz"}], "countryGroupName": "8mcoQps9"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateCountryGroup' test.out

#- 22 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode '8GKUtv1T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'DeleteCountryGroup' test.out

#- 23 GetLanguages
./ng net.accelbyte.sdk.cli.Main basic getLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetLanguages' test.out

#- 24 GetTimeZones
./ng net.accelbyte.sdk.cli.Main basic getTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetTimeZones' test.out

#- 25 GetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'UivsU6v4' \
    > test.out 2>&1
eval_tap $? 25 'GetUserProfileInfoByPublicId' test.out

#- 26 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["yFNBq9SR", "M2xJqW5L", "62IgsgKj"]}' \
    > test.out 2>&1
eval_tap $? 26 'AdminGetUserProfilePublicInfoByIds' test.out

#- 27 GetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetNamespacePublisher' test.out

#- 28 ChangeNamespaceStatus
./ng net.accelbyte.sdk.cli.Main basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 28 'ChangeNamespaceStatus' test.out

#- 29 AnonymizeUserProfile
./ng net.accelbyte.sdk.cli.Main basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'EO8FBCFA' \
    > test.out 2>&1
eval_tap $? 29 'AnonymizeUserProfile' test.out

#- 30 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'XFWc0lzQ' \
    --category 'V7KgegbV' \
    --fileType 'MGZwctnL' \
    > test.out 2>&1
eval_tap $? 30 'GeneratedUserUploadContentUrl' test.out

#- 31 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zdi4NNIf' \
    > test.out 2>&1
eval_tap $? 31 'GetUserProfileInfo' test.out

#- 32 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'OuxP5yjJ' \
    --body '{"avatarLargeUrl": "xA4jgkJ4", "avatarSmallUrl": "pNsz8rnP", "avatarUrl": "Yncix4ZU", "customAttributes": {"jrLB5Klv": {}, "aW3qeY1M": {}, "NyjjWsZZ": {}}, "dateOfBirth": "1986-02-16", "firstName": "7yTNXJQa", "language": "uM_706", "lastName": "ck5a2vKD", "status": "INACTIVE", "timeZone": "HKEYcJkL", "zipCode": "Cd5i7rz2"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateUserProfile' test.out

#- 33 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'bVq7aJ4v' \
    > test.out 2>&1
eval_tap $? 33 'DeleteUserProfile' test.out

#- 34 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'rirGCqlw' \
    > test.out 2>&1
eval_tap $? 34 'GetCustomAttributesInfo' test.out

#- 35 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'OccRh2Fy' \
    --body '{"Wh6cECGD": {}, "UR8h6lRR": {}, "tkHY8Krk": {}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCustomAttributesPartially' test.out

#- 36 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'PvPDkYM0' \
    > test.out 2>&1
eval_tap $? 36 'GetPrivateCustomAttributesInfo' test.out

#- 37 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '8xs5yc0m' \
    --body '{"xP6Ip2h5": {}, "EsjfcZp8": {}, "C8J4vMFG": {}}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePrivateCustomAttributesPartially' test.out

#- 38 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'blDkvV4X' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateUserProfileStatus' test.out

#- 39 PublicGetTime
./ng net.accelbyte.sdk.cli.Main basic publicGetTime \
    > test.out 2>&1
eval_tap $? 39 'PublicGetTime' test.out

#- 40 PublicGetNamespaces
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespaces \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 40 'PublicGetNamespaces' test.out

#- 41 PublicGeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUploadUrl \
    --folder 'wHAygkkN' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'PSy2DyPb' \
    > test.out 2>&1
eval_tap $? 41 'PublicGeneratedUploadUrl' test.out

#- 42 PublicGetCountries
./ng net.accelbyte.sdk.cli.Main basic publicGetCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'MpUs4YBO' \
    > test.out 2>&1
eval_tap $? 42 'PublicGetCountries' test.out

#- 43 PublicGetLanguages
./ng net.accelbyte.sdk.cli.Main basic publicGetLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'PublicGetLanguages' test.out

#- 44 PublicGetTimeZones
./ng net.accelbyte.sdk.cli.Main basic publicGetTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 44 'PublicGetTimeZones' test.out

#- 45 PublicGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --userIds '18MmYXqU' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserProfilePublicInfoByIds' test.out

#- 46 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'nfpZGsnU' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetUserProfileInfoByPublicId' test.out

#- 47 PublicGetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'PublicGetNamespacePublisher' test.out

#- 48 GetMyProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getMyProfileInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'GetMyProfileInfo' test.out

#- 49 UpdateMyProfile
./ng net.accelbyte.sdk.cli.Main basic updateMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "SbdcC1uX", "avatarSmallUrl": "iXVkAdE7", "avatarUrl": "eG35wRUP", "customAttributes": {"35Ojfknr": {}, "foSKN4Io": {}, "Bo9EGnxi": {}}, "dateOfBirth": "1996-08-29", "firstName": "SPq42LDJ", "language": "oaiF-Rw", "lastName": "6IFd4nSc", "privateCustomAttributes": {"QvZtzV7B": {}, "pOwhdOsO": {}, "dfRLqaPZ": {}}, "timeZone": "yYmnE6TE", "zipCode": "dM08hA70"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateMyProfile' test.out

#- 50 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "gpVvrQcH", "avatarSmallUrl": "rGqeMHRl", "avatarUrl": "DuEUHaiX", "customAttributes": {"5Gv27hwk": {}, "UT7kAz0y": {}, "Ktt9vdfW": {}}, "dateOfBirth": "1972-08-27", "firstName": "8BvPlVIe", "language": "hKg_cIhz-BN", "lastName": "fUnWvjpf", "privateCustomAttributes": {"9RewosiY": {}, "ms5TvA7l": {}, "PGUUmQKd": {}}, "timeZone": "djjBcllR"}' \
    > test.out 2>&1
eval_tap $? 50 'CreateMyProfile' test.out

#- 51 GetMyPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getMyPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'GetMyPrivateCustomAttributesInfo' test.out

#- 52 UpdateMyPrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateMyPrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --body '{"jD0FtXOm": {}, "Qy62JlhO": {}, "5i8gK2YU": {}}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateMyPrivateCustomAttributesPartially' test.out

#- 53 GetMyZipCode
./ng net.accelbyte.sdk.cli.Main basic getMyZipCode \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetMyZipCode' test.out

#- 54 UpdateMyZipCode
./ng net.accelbyte.sdk.cli.Main basic updateMyZipCode \
    --namespace "$AB_NAMESPACE" \
    --userZipCodeUpdate '{"zipCode": "h1ro0rv6"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateMyZipCode' test.out

#- 55 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZHRZXQro' \
    --body '{"category": "Hjr7tJTT", "description": "tazEXJ5A", "gameSessionId": "twe1cXdz", "subcategory": "vDRPJaaj", "userId": "RitqULFb"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicReportUser' test.out

#- 56 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'jcyGuycz' \
    --category 'sncluxnU' \
    --fileType 'E5aYZRre' \
    > test.out 2>&1
eval_tap $? 56 'PublicGeneratedUserUploadContentUrl' test.out

#- 57 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ngqp7QqK' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetUserProfileInfo' test.out

#- 58 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'vryOMe8O' \
    --body '{"avatarLargeUrl": "mP8aEjJu", "avatarSmallUrl": "PGc1Q4EU", "avatarUrl": "VxzAfzyy", "customAttributes": {"GBGdI5Gx": {}, "RbB5smnC": {}, "GOR1uqMt": {}}, "dateOfBirth": "1978-02-10", "firstName": "sMBKGEGS", "language": "AoK-009", "lastName": "qNf0MzOV", "timeZone": "eyjY3oRF", "zipCode": "4HBe8ExO"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateUserProfile' test.out

#- 59 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'H9k0RWFW' \
    --body '{"avatarLargeUrl": "OMbiMcTc", "avatarSmallUrl": "ZEdDwjxM", "avatarUrl": "0RDZ26JV", "customAttributes": {"4cEhy0uw": {}, "D924qdrf": {}, "SEl0fQAk": {}}, "dateOfBirth": "1977-11-20", "firstName": "I1pd7enx", "language": "oZH_LN", "lastName": "t5OdkYug", "timeZone": "4hinsPJK"}' \
    > test.out 2>&1
eval_tap $? 59 'PublicCreateUserProfile' test.out

#- 60 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '13VUKJdv' \
    > test.out 2>&1
eval_tap $? 60 'PublicGetCustomAttributesInfo' test.out

#- 61 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '3iqghGtE' \
    --body '{"RBxhNeCd": {}, "mfiGiqyV": {}, "iUCUu9Lz": {}}' \
    > test.out 2>&1
eval_tap $? 61 'PublicUpdateCustomAttributesPartially' test.out

#- 62 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dv7ugnr2' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetUserProfilePublicInfo' test.out

#- 63 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'MRpDVNBA' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE