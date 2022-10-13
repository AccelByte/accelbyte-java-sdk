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
echo "1..62"

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
    --body '{"displayName": "cCI3K7GI", "namespace": "tNkhrwOc"}' \
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
    --body '{"actionId": 66, "comment": "2FHXH2Ae", "userIds": ["eOCFQRSc", "bcQ25h3n", "lcCiGc2F"]}' \
    > test.out 2>&1
eval_tap $? 7 'BanUsers' test.out

#- 8 GetBannedUsers
./ng net.accelbyte.sdk.cli.Main basic getBannedUsers \
    --namespace "$AB_NAMESPACE" \
    --userIds '2JYgIHi0,HaVD8c6s,g4Yiu6pi' \
    > test.out 2>&1
eval_tap $? 8 'GetBannedUsers' test.out

#- 9 ReportUser
./ng net.accelbyte.sdk.cli.Main basic reportUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "HsdzfEQO", "description": "rcudU1Pu", "gameSessionId": "DGnluVyu", "subcategory": "E26Bl2sq", "userId": "3WtlNrgv"}' \
    > test.out 2>&1
eval_tap $? 9 'ReportUser' test.out

#- 10 GetUserStatus
./ng net.accelbyte.sdk.cli.Main basic getUserStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'ozxjyjEj' \
    > test.out 2>&1
eval_tap $? 10 'GetUserStatus' test.out

#- 11 UnBanUsers
./ng net.accelbyte.sdk.cli.Main basic unBanUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "gnAYImqS", "userIds": ["VAEMfaSD", "mei32xJV", "npVu6QvT"]}' \
    > test.out 2>&1
eval_tap $? 11 'UnBanUsers' test.out

#- 12 UpdateNamespace
./ng net.accelbyte.sdk.cli.Main basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "e4pbULmb"}' \
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
    --body '{"apiKey": "EIJRzfR6"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateConfig' test.out

#- 16 GeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUploadUrl \
    --folder 'Q8wjCrrr' \
    --namespace "$AB_NAMESPACE" \
    --fileType '3a6LnTMB' \
    > test.out 2>&1
eval_tap $? 16 'GeneratedUploadUrl' test.out

#- 17 GetCountries
./ng net.accelbyte.sdk.cli.Main basic getCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'FsqKlOpO' \
    > test.out 2>&1
eval_tap $? 17 'GetCountries' test.out

#- 18 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode 'jXfCyhkf' \
    > test.out 2>&1
eval_tap $? 18 'GetCountryGroups' test.out

#- 19 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "ic6cJFJc", "name": "Wnsnm6Jd"}, {"code": "v3ZoOcOG", "name": "dPRNqW0y"}, {"code": "YuGGe4j8", "name": "pymOkxnW"}], "countryGroupCode": "Ex3wJ6CP", "countryGroupName": "rTA2BgMd"}' \
    > test.out 2>&1
eval_tap $? 19 'AddCountryGroup' test.out

#- 20 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 'ZIXtNxL1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "0Y0bpl3m", "name": "5SReQl2Z"}, {"code": "UXeQooCg", "name": "TdK7WQAQ"}, {"code": "CuyCCvey", "name": "v5yQDe9O"}], "countryGroupName": "amYmDTAX"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdateCountryGroup' test.out

#- 21 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode 'PmoG5YSy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'DeleteCountryGroup' test.out

#- 22 GetLanguages
./ng net.accelbyte.sdk.cli.Main basic getLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetLanguages' test.out

#- 23 GetTimeZones
./ng net.accelbyte.sdk.cli.Main basic getTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetTimeZones' test.out

#- 24 GetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'w2twDsCX' \
    > test.out 2>&1
eval_tap $? 24 'GetUserProfileInfoByPublicId' test.out

#- 25 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["50uuTfD6", "lS3KbuYd", "yU8rzj37"]}' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetUserProfilePublicInfoByIds' test.out

#- 26 GetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'GetNamespacePublisher' test.out

#- 27 ChangeNamespaceStatus
./ng net.accelbyte.sdk.cli.Main basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 27 'ChangeNamespaceStatus' test.out

#- 28 AnonymizeUserProfile
./ng net.accelbyte.sdk.cli.Main basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'DDYEVOvf' \
    > test.out 2>&1
eval_tap $? 28 'AnonymizeUserProfile' test.out

#- 29 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'BuhaGji6' \
    --category 'fqb9LF4G' \
    --fileType 'PFqMyqvw' \
    > test.out 2>&1
eval_tap $? 29 'GeneratedUserUploadContentUrl' test.out

#- 30 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'z2sUeU9l' \
    > test.out 2>&1
eval_tap $? 30 'GetUserProfileInfo' test.out

#- 31 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'iBFQU7yp' \
    --body '{"avatarLargeUrl": "vjalG5ka", "avatarSmallUrl": "g9Fd20Ay", "avatarUrl": "7YDDo7No", "customAttributes": {"acAqpeqF": {}, "ckRvef0E": {}, "0phwY58T": {}}, "dateOfBirth": "1972-03-07", "firstName": "SFVyuavI", "language": "cDsZ", "lastName": "STqGKxyA", "status": "INACTIVE", "timeZone": "1gr1SLkB", "zipCode": "e8EUt7dp"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateUserProfile' test.out

#- 32 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUy0TBrD' \
    > test.out 2>&1
eval_tap $? 32 'DeleteUserProfile' test.out

#- 33 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '8sKSBptt' \
    > test.out 2>&1
eval_tap $? 33 'GetCustomAttributesInfo' test.out

#- 34 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'WWXWJ8h4' \
    --body '{"Igl73ieB": {}, "8iXKxZVX": {}, "R9a7WY6S": {}}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateCustomAttributesPartially' test.out

#- 35 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'AOamCmly' \
    > test.out 2>&1
eval_tap $? 35 'GetPrivateCustomAttributesInfo' test.out

#- 36 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'IfSOi6jd' \
    --body '{"moEXv6UK": {}, "Xa6zIt10": {}, "9u9X6bYp": {}}' \
    > test.out 2>&1
eval_tap $? 36 'UpdatePrivateCustomAttributesPartially' test.out

#- 37 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'CM1lYEPA' \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateUserProfileStatus' test.out

#- 38 PublicGetTime
./ng net.accelbyte.sdk.cli.Main basic publicGetTime \
    > test.out 2>&1
eval_tap $? 38 'PublicGetTime' test.out

#- 39 PublicGetNamespaces
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespaces \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 39 'PublicGetNamespaces' test.out

#- 40 PublicGeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUploadUrl \
    --folder 'vtTgxB4B' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'uTT07JUp' \
    > test.out 2>&1
eval_tap $? 40 'PublicGeneratedUploadUrl' test.out

#- 41 PublicGetCountries
./ng net.accelbyte.sdk.cli.Main basic publicGetCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'EKsGscep' \
    > test.out 2>&1
eval_tap $? 41 'PublicGetCountries' test.out

#- 42 PublicGetLanguages
./ng net.accelbyte.sdk.cli.Main basic publicGetLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'PublicGetLanguages' test.out

#- 43 PublicGetTimeZones
./ng net.accelbyte.sdk.cli.Main basic publicGetTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'PublicGetTimeZones' test.out

#- 44 PublicGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --userIds 'bbBG36hk' \
    > test.out 2>&1
eval_tap $? 44 'PublicGetUserProfilePublicInfoByIds' test.out

#- 45 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'pEs1y400' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserProfileInfoByPublicId' test.out

#- 46 PublicGetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'PublicGetNamespacePublisher' test.out

#- 47 GetMyProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getMyProfileInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'GetMyProfileInfo' test.out

#- 48 UpdateMyProfile
./ng net.accelbyte.sdk.cli.Main basic updateMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "Wd8biWnH", "avatarSmallUrl": "EQOsZcvD", "avatarUrl": "nRVlX1k9", "customAttributes": {"6du99tAi": {}, "Itzq4EoJ": {}, "1wIEkvba": {}}, "dateOfBirth": "1998-08-21", "firstName": "6Unh0KZ4", "language": "DD_NPpS-oX", "lastName": "2vcBsxiL", "privateCustomAttributes": {"eFx35V7M": {}, "dzSjGFOU": {}, "S7K9QMGY": {}}, "timeZone": "Nc0g4ASR", "zipCode": "2dGjIGHt"}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateMyProfile' test.out

#- 49 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "50OdtvEV", "avatarSmallUrl": "Mla4tzD9", "avatarUrl": "iQi0aqTm", "customAttributes": {"ZGYel3gp": {}, "2urPlA6T": {}, "DKt61IV0": {}}, "dateOfBirth": "1985-09-01", "firstName": "GoADhK64", "language": "yjC", "lastName": "6O6B4udb", "privateCustomAttributes": {"TD3bi4I7": {}, "R2ArtgM8": {}, "shVqKBTL": {}}, "timeZone": "NWGUSF2I"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateMyProfile' test.out

#- 50 GetMyPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getMyPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'GetMyPrivateCustomAttributesInfo' test.out

#- 51 UpdateMyPrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateMyPrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --body '{"dkwQCujR": {}, "duefudAW": {}, "U5h5E6tE": {}}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateMyPrivateCustomAttributesPartially' test.out

#- 52 GetMyZipCode
./ng net.accelbyte.sdk.cli.Main basic getMyZipCode \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetMyZipCode' test.out

#- 53 UpdateMyZipCode
./ng net.accelbyte.sdk.cli.Main basic updateMyZipCode \
    --namespace "$AB_NAMESPACE" \
    --userZipCodeUpdate '{"zipCode": "qjYdd5U1"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateMyZipCode' test.out

#- 54 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'BqaM4v9u' \
    --body '{"category": "4e3mJRZT", "description": "3HGURmMI", "gameSessionId": "ZAmA8GyK", "subcategory": "fMcyG6rt", "userId": "BidpgZCZ"}' \
    > test.out 2>&1
eval_tap $? 54 'PublicReportUser' test.out

#- 55 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId '7gAvJKrS' \
    --category 'pFz6BF6a' \
    --fileType 'PQNU6mHM' \
    > test.out 2>&1
eval_tap $? 55 'PublicGeneratedUserUploadContentUrl' test.out

#- 56 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '23UYPHU4' \
    > test.out 2>&1
eval_tap $? 56 'PublicGetUserProfileInfo' test.out

#- 57 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'H7WZuMsP' \
    --body '{"avatarLargeUrl": "JWvjSiJH", "avatarSmallUrl": "ALrlBpqH", "avatarUrl": "CKr6ZXzC", "customAttributes": {"y7jN8aPN": {}, "D9X2IsOa": {}, "hnbxuzOO": {}}, "dateOfBirth": "1999-03-15", "firstName": "5dsgsmmJ", "language": "xO", "lastName": "xxjUG5mp", "timeZone": "QmCAWs5i", "zipCode": "OkarzlvJ"}' \
    > test.out 2>&1
eval_tap $? 57 'PublicUpdateUserProfile' test.out

#- 58 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'qvh3eFfH' \
    --body '{"avatarLargeUrl": "RMdFF6IQ", "avatarSmallUrl": "HWuTM6aI", "avatarUrl": "DZ6P3ecS", "customAttributes": {"xtObqRZ9": {}, "ZiZ1rFEj": {}, "A9yaqw6y": {}}, "dateOfBirth": "1976-12-05", "firstName": "D27eYIsE", "language": "aqt_AKaq", "lastName": "Km9Z05RI", "timeZone": "TOHewuu2"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicCreateUserProfile' test.out

#- 59 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '2IoofIXu' \
    > test.out 2>&1
eval_tap $? 59 'PublicGetCustomAttributesInfo' test.out

#- 60 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'qJHQAXjX' \
    --body '{"YEh6EfKw": {}, "cRcOLREm": {}, "PosPlk4z": {}}' \
    > test.out 2>&1
eval_tap $? 60 'PublicUpdateCustomAttributesPartially' test.out

#- 61 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'UKbv94eO' \
    > test.out 2>&1
eval_tap $? 61 'PublicGetUserProfilePublicInfo' test.out

#- 62 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'BISW2N0R' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE