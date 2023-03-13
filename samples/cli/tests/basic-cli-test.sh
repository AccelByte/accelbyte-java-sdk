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
echo "1..67"

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
    --body '{"displayName": "EAxcVpFr", "namespace": "ttufHIRd"}' \
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
    --body '{"actionId": 68, "comment": "Dc09nIW0", "userIds": ["Oaiw9B0D", "7eHpzSn3", "ZPUdc0qh"]}' \
    > test.out 2>&1
eval_tap $? 7 'BanUsers' test.out

#- 8 GetBannedUsers
./ng net.accelbyte.sdk.cli.Main basic getBannedUsers \
    --namespace "$AB_NAMESPACE" \
    --userIds '4n8mzZ0m,8SAMTwE6,I56IaRDB' \
    > test.out 2>&1
eval_tap $? 8 'GetBannedUsers' test.out

#- 9 ReportUser
./ng net.accelbyte.sdk.cli.Main basic reportUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "XxyaNoMR", "description": "6hkspInr", "gameSessionId": "Aip6lyzS", "subcategory": "xwElFHHd", "userId": "gs21Jub7"}' \
    > test.out 2>&1
eval_tap $? 9 'ReportUser' test.out

#- 10 GetUserStatus
./ng net.accelbyte.sdk.cli.Main basic getUserStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '4CUkNmKJ' \
    > test.out 2>&1
eval_tap $? 10 'GetUserStatus' test.out

#- 11 UnBanUsers
./ng net.accelbyte.sdk.cli.Main basic unBanUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "fh5pUkHO", "userIds": ["DpoMF78N", "Y4YkHs1c", "nz1JSDgY"]}' \
    > test.out 2>&1
eval_tap $? 11 'UnBanUsers' test.out

#- 12 UpdateNamespace
./ng net.accelbyte.sdk.cli.Main basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "1TXp38zs"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateNamespace' test.out

#- 13 CreateConfig
./ng net.accelbyte.sdk.cli.Main basic createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"key": "CTCrbCbP", "value": "OyNQkT7N"}' \
    > test.out 2>&1
eval_tap $? 13 'CreateConfig' test.out

#- 14 GetConfig1
./ng net.accelbyte.sdk.cli.Main basic getConfig1 \
    --configKey 'vyE3cwyA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetConfig1' test.out

#- 15 DeleteConfig1
./ng net.accelbyte.sdk.cli.Main basic deleteConfig1 \
    --configKey 'LczNIicX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DeleteConfig1' test.out

#- 16 UpdateConfig1
./ng net.accelbyte.sdk.cli.Main basic updateConfig1 \
    --configKey 'm7agSrjJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "W2OQNOs1"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateConfig1' test.out

#- 17 GetConfig
./ng net.accelbyte.sdk.cli.Main basic getConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetConfig' test.out

#- 18 DeleteConfig
./ng net.accelbyte.sdk.cli.Main basic deleteConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'DeleteConfig' test.out

#- 19 UpdateConfig
./ng net.accelbyte.sdk.cli.Main basic updateConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"apiKey": "PXhT5Fvd"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateConfig' test.out

#- 20 GeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUploadUrl \
    --folder 'iRilZ7oF' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'gx4c8Oum' \
    > test.out 2>&1
eval_tap $? 20 'GeneratedUploadUrl' test.out

#- 21 GetGameNamespaces
./ng net.accelbyte.sdk.cli.Main basic getGameNamespaces \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 21 'GetGameNamespaces' test.out

#- 22 GetCountries
./ng net.accelbyte.sdk.cli.Main basic getCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'KtPDKJDX' \
    > test.out 2>&1
eval_tap $? 22 'GetCountries' test.out

#- 23 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode 'n7Z4U68s' \
    > test.out 2>&1
eval_tap $? 23 'GetCountryGroups' test.out

#- 24 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "u8XfqlqN", "name": "iTvB6SdA"}, {"code": "dIhUDrwo", "name": "Z5MecdKi"}, {"code": "5r6QEa1y", "name": "sLEzth6m"}], "countryGroupCode": "XhzkzWkF", "countryGroupName": "eZSoEAcB"}' \
    > test.out 2>&1
eval_tap $? 24 'AddCountryGroup' test.out

#- 25 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 'dW19m4eu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "6d5tA5jU", "name": "miTqpyhP"}, {"code": "FdxLzFQN", "name": "05MYzYiK"}, {"code": "We5dNRlj", "name": "v7IPrDQQ"}], "countryGroupName": "Rgat0Sev"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateCountryGroup' test.out

#- 26 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode 'kLGMS0ly' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'DeleteCountryGroup' test.out

#- 27 GetLanguages
./ng net.accelbyte.sdk.cli.Main basic getLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetLanguages' test.out

#- 28 GetTimeZones
./ng net.accelbyte.sdk.cli.Main basic getTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetTimeZones' test.out

#- 29 GetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'uI9a2I9u' \
    > test.out 2>&1
eval_tap $? 29 'GetUserProfileInfoByPublicId' test.out

#- 30 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6Vpbsx5w", "8hqUI06U", "pOXGSLmC"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetUserProfilePublicInfoByIds' test.out

#- 31 GetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetNamespacePublisher' test.out

#- 32 ChangeNamespaceStatus
./ng net.accelbyte.sdk.cli.Main basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 32 'ChangeNamespaceStatus' test.out

#- 33 AnonymizeUserProfile
./ng net.accelbyte.sdk.cli.Main basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'uHOPlLlk' \
    > test.out 2>&1
eval_tap $? 33 'AnonymizeUserProfile' test.out

#- 34 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'vR8sKgnu' \
    --category 'RkgghGoY' \
    --fileType 'upD391C2' \
    > test.out 2>&1
eval_tap $? 34 'GeneratedUserUploadContentUrl' test.out

#- 35 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'qtPYokah' \
    > test.out 2>&1
eval_tap $? 35 'GetUserProfileInfo' test.out

#- 36 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'FjkQsfCa' \
    --body '{"avatarLargeUrl": "Tmt1d67F", "avatarSmallUrl": "XGk2s9Q0", "avatarUrl": "mPVo3twu", "customAttributes": {"0MesTCf9": {}, "x4rt69ln": {}, "a7qxNeIx": {}}, "dateOfBirth": "1992-07-21", "firstName": "akUCTqGk", "language": "XaC", "lastName": "DslpJSqG", "status": "INACTIVE", "timeZone": "LPziZMdj", "zipCode": "xcBZufQx"}' \
    > test.out 2>&1
eval_tap $? 36 'UpdateUserProfile' test.out

#- 37 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'GiHPllG4' \
    > test.out 2>&1
eval_tap $? 37 'DeleteUserProfile' test.out

#- 38 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'cYEzfTD1' \
    > test.out 2>&1
eval_tap $? 38 'GetCustomAttributesInfo' test.out

#- 39 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBm3MqHc' \
    --body '{"UmLZZbSq": {}, "b8RwNmn9": {}, "HrNQy4uZ": {}}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateCustomAttributesPartially' test.out

#- 40 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'AAiE0mit' \
    > test.out 2>&1
eval_tap $? 40 'GetPrivateCustomAttributesInfo' test.out

#- 41 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '9RGCCHYz' \
    --body '{"UOcEdscK": {}, "HPEqgA8y": {}, "u7Vk6Jt4": {}}' \
    > test.out 2>&1
eval_tap $? 41 'UpdatePrivateCustomAttributesPartially' test.out

#- 42 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ymos9Jcd' \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 42 'UpdateUserProfileStatus' test.out

#- 43 PublicGetTime
./ng net.accelbyte.sdk.cli.Main basic publicGetTime \
    > test.out 2>&1
eval_tap $? 43 'PublicGetTime' test.out

#- 44 PublicGetNamespaces
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespaces \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 44 'PublicGetNamespaces' test.out

#- 45 PublicGeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUploadUrl \
    --folder 'quIOvBMc' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'aYmvCkGZ' \
    > test.out 2>&1
eval_tap $? 45 'PublicGeneratedUploadUrl' test.out

#- 46 PublicGetCountries
./ng net.accelbyte.sdk.cli.Main basic publicGetCountries \
    --namespace "$AB_NAMESPACE" \
    --lang '5dAgqxpB' \
    > test.out 2>&1
eval_tap $? 46 'PublicGetCountries' test.out

#- 47 PublicGetLanguages
./ng net.accelbyte.sdk.cli.Main basic publicGetLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 47 'PublicGetLanguages' test.out

#- 48 PublicGetTimeZones
./ng net.accelbyte.sdk.cli.Main basic publicGetTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'PublicGetTimeZones' test.out

#- 49 PublicGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --userIds 'FmaLoxoz' \
    > test.out 2>&1
eval_tap $? 49 'PublicGetUserProfilePublicInfoByIds' test.out

#- 50 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'r6wfNPX2' \
    > test.out 2>&1
eval_tap $? 50 'PublicGetUserProfileInfoByPublicId' test.out

#- 51 PublicGetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'PublicGetNamespacePublisher' test.out

#- 52 GetMyProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getMyProfileInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetMyProfileInfo' test.out

#- 53 UpdateMyProfile
./ng net.accelbyte.sdk.cli.Main basic updateMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "bOItRMvq", "avatarSmallUrl": "tlB2jJCS", "avatarUrl": "QT279ZZP", "customAttributes": {"YGu0rdlg": {}, "dWyOtXi3": {}, "choQrpOs": {}}, "dateOfBirth": "1986-04-09", "firstName": "BU5SepjC", "language": "Zc-oIeK", "lastName": "kK6KKXNB", "privateCustomAttributes": {"3Gv0IqmF": {}, "51TkhjYn": {}, "aq6foWvX": {}}, "timeZone": "a3bMrXsD", "zipCode": "r6kILsSS"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateMyProfile' test.out

#- 54 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "yDdmykmo", "avatarSmallUrl": "PYgc2L4j", "avatarUrl": "k4Lo0LSP", "customAttributes": {"0pf4IxjU": {}, "kl535X3a": {}, "teEKDpAD": {}}, "dateOfBirth": "1984-03-11", "firstName": "x3poD3Qg", "language": "EB", "lastName": "LQQ1MzH7", "privateCustomAttributes": {"Qm8bwbmX": {}, "gdAPh1ET": {}, "hG96gAFK": {}}, "timeZone": "K2WDgCcx"}' \
    > test.out 2>&1
eval_tap $? 54 'CreateMyProfile' test.out

#- 55 GetMyPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getMyPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'GetMyPrivateCustomAttributesInfo' test.out

#- 56 UpdateMyPrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateMyPrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --body '{"vONZm3Ee": {}, "ERmDnyeF": {}, "oF7VSZ6p": {}}' \
    > test.out 2>&1
eval_tap $? 56 'UpdateMyPrivateCustomAttributesPartially' test.out

#- 57 GetMyZipCode
./ng net.accelbyte.sdk.cli.Main basic getMyZipCode \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'GetMyZipCode' test.out

#- 58 UpdateMyZipCode
./ng net.accelbyte.sdk.cli.Main basic updateMyZipCode \
    --namespace "$AB_NAMESPACE" \
    --userZipCodeUpdate '{"zipCode": "f3vneSD2"}' \
    > test.out 2>&1
eval_tap $? 58 'UpdateMyZipCode' test.out

#- 59 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tb3g7mSQ' \
    --body '{"category": "UhAEtrmj", "description": "qU6YE3p4", "gameSessionId": "lSck0ZHn", "subcategory": "5GI39YBH", "userId": "qaTHeKtW"}' \
    > test.out 2>&1
eval_tap $? 59 'PublicReportUser' test.out

#- 60 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId '18iGeUlc' \
    --category '9d9sogWa' \
    --fileType '24CKNS0G' \
    > test.out 2>&1
eval_tap $? 60 'PublicGeneratedUserUploadContentUrl' test.out

#- 61 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'qVvUfHQv' \
    > test.out 2>&1
eval_tap $? 61 'PublicGetUserProfileInfo' test.out

#- 62 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'sHXNUNe4' \
    --body '{"avatarLargeUrl": "mhgo5QB6", "avatarSmallUrl": "5lSAiYnN", "avatarUrl": "jkfZrQvG", "customAttributes": {"gbLdLsFz": {}, "HkBMr1yr": {}, "OMlNFSrU": {}}, "dateOfBirth": "1986-03-11", "firstName": "f7Gc26Sa", "language": "kh", "lastName": "kydwYWQG", "timeZone": "26yUZNmT", "zipCode": "BcvrbYCw"}' \
    > test.out 2>&1
eval_tap $? 62 'PublicUpdateUserProfile' test.out

#- 63 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZtxFHyPL' \
    --body '{"avatarLargeUrl": "tI8ilbyD", "avatarSmallUrl": "PUIj88ce", "avatarUrl": "kdqCt81P", "customAttributes": {"1ktfIovm": {}, "v9gsR5cJ": {}, "cHm3SZLx": {}}, "dateOfBirth": "1978-12-25", "firstName": "YmJFfRBy", "language": "Mc", "lastName": "9LJE8HoR", "timeZone": "S1X2PFAA"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicCreateUserProfile' test.out

#- 64 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'MwzHPxB1' \
    > test.out 2>&1
eval_tap $? 64 'PublicGetCustomAttributesInfo' test.out

#- 65 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'UskYs4Yw' \
    --body '{"20DOqOBS": {}, "C2DKHRuP": {}, "MMWH8Yb3": {}}' \
    > test.out 2>&1
eval_tap $? 65 'PublicUpdateCustomAttributesPartially' test.out

#- 66 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '3T5UBJCj' \
    > test.out 2>&1
eval_tap $? 66 'PublicGetUserProfilePublicInfo' test.out

#- 67 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'fcnLRfxe' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 67 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE