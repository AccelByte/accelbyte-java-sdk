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
echo "1..68"

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

#- 32 GetPublisherConfig
./ng net.accelbyte.sdk.cli.Main basic getPublisherConfig \
    --configKey 'VuHOPlLl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPublisherConfig' test.out

#- 33 ChangeNamespaceStatus
./ng net.accelbyte.sdk.cli.Main basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 33 'ChangeNamespaceStatus' test.out

#- 34 AnonymizeUserProfile
./ng net.accelbyte.sdk.cli.Main basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'eabntBSx' \
    > test.out 2>&1
eval_tap $? 34 'AnonymizeUserProfile' test.out

#- 35 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'TeIv53HG' \
    --category 'CiljvjKo' \
    --fileType 'yD6SCwGr' \
    > test.out 2>&1
eval_tap $? 35 'GeneratedUserUploadContentUrl' test.out

#- 36 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'ncqmLtjQ' \
    > test.out 2>&1
eval_tap $? 36 'GetUserProfileInfo' test.out

#- 37 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'HAf8TgoN' \
    --body '{"avatarLargeUrl": "m03VLisV", "avatarSmallUrl": "6zwPuo3t", "avatarUrl": "d6TC6I3l", "customAttributes": {"MjGSWN2l": {}, "aRlxfcjH": {}, "fYakUCTq": {}}, "dateOfBirth": "1987-10-06", "firstName": "kE7wcWfD", "language": "RLP-bmyq_026", "lastName": "Kd3IL5TA", "privateCustomAttributes": {"Q6iiPlSC": {}, "2uE4o5Vw": {}, "do3fePqI": {}}, "status": "ACTIVE", "timeZone": "A8IHtrkm", "zipCode": "u0hpDDWV"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateUserProfile' test.out

#- 38 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ala2l5BY' \
    > test.out 2>&1
eval_tap $? 38 'DeleteUserProfile' test.out

#- 39 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'NtIuS5S5' \
    > test.out 2>&1
eval_tap $? 39 'GetCustomAttributesInfo' test.out

#- 40 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUdjsoqw' \
    --body '{"GyzzWi9g": {}, "wQYv7t1o": {}, "7TTr1Dmr": {}}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateCustomAttributesPartially' test.out

#- 41 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'hZv15T7q' \
    > test.out 2>&1
eval_tap $? 41 'GetPrivateCustomAttributesInfo' test.out

#- 42 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'uIOvBMca' \
    --body '{"YmvCkGZ5": {}, "dAgqxpBF": {}, "maLoxozr": {}}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePrivateCustomAttributesPartially' test.out

#- 43 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '6wfNPX2b' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateUserProfileStatus' test.out

#- 44 PublicGetTime
./ng net.accelbyte.sdk.cli.Main basic publicGetTime \
    > test.out 2>&1
eval_tap $? 44 'PublicGetTime' test.out

#- 45 PublicGetNamespaces
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespaces \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 45 'PublicGetNamespaces' test.out

#- 46 PublicGeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUploadUrl \
    --folder 'NyLu0M3V' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'Hh2EI8Jl' \
    > test.out 2>&1
eval_tap $? 46 'PublicGeneratedUploadUrl' test.out

#- 47 PublicGetCountries
./ng net.accelbyte.sdk.cli.Main basic publicGetCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'DbPWbQ6Q' \
    > test.out 2>&1
eval_tap $? 47 'PublicGetCountries' test.out

#- 48 PublicGetLanguages
./ng net.accelbyte.sdk.cli.Main basic publicGetLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'PublicGetLanguages' test.out

#- 49 PublicGetTimeZones
./ng net.accelbyte.sdk.cli.Main basic publicGetTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'PublicGetTimeZones' test.out

#- 50 PublicGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --userIds '9lNmqRBa' \
    > test.out 2>&1
eval_tap $? 50 'PublicGetUserProfilePublicInfoByIds' test.out

#- 51 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'AkLnvxkT' \
    > test.out 2>&1
eval_tap $? 51 'PublicGetUserProfileInfoByPublicId' test.out

#- 52 PublicGetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'PublicGetNamespacePublisher' test.out

#- 53 GetMyProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getMyProfileInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'GetMyProfileInfo' test.out

#- 54 UpdateMyProfile
./ng net.accelbyte.sdk.cli.Main basic updateMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "1X68cmDc", "avatarSmallUrl": "3fxU8MyK", "avatarUrl": "rQpM4hkk", "customAttributes": {"K6KKXNB3": {}, "Gv0IqmF5": {}, "1TkhjYna": {}}, "dateOfBirth": "1979-08-30", "firstName": "foWvXa3b", "language": "MSfy_481", "lastName": "kILsSSyD", "privateCustomAttributes": {"dmykmoPY": {}, "gc2L4jk4": {}, "Lo0LSP0p": {}}, "timeZone": "f4IxjUkl", "zipCode": "535X3ate"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateMyProfile' test.out

#- 55 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "EKDpADz1", "avatarSmallUrl": "x3poD3Qg", "avatarUrl": "b3boLQQ1", "customAttributes": {"MzH7Qm8b": {}, "wbmXgdAP": {}, "h1EThG96": {}}, "dateOfBirth": "1974-12-18", "firstName": "AFKK2WDg", "language": "eCj-pWoR_VF", "lastName": "wjRHpKKT", "privateCustomAttributes": {"lmVr9Xuo": {}, "JbRFQSKV": {}, "PHbn4Xxt": {}}, "timeZone": "u7LQRENj"}' \
    > test.out 2>&1
eval_tap $? 55 'CreateMyProfile' test.out

#- 56 GetMyPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getMyPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'GetMyPrivateCustomAttributesInfo' test.out

#- 57 UpdateMyPrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateMyPrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --body '{"EEztx1Ws": {}, "YSiZqan0": {}, "nSBJroav": {}}' \
    > test.out 2>&1
eval_tap $? 57 'UpdateMyPrivateCustomAttributesPartially' test.out

#- 58 GetMyZipCode
./ng net.accelbyte.sdk.cli.Main basic getMyZipCode \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'GetMyZipCode' test.out

#- 59 UpdateMyZipCode
./ng net.accelbyte.sdk.cli.Main basic updateMyZipCode \
    --namespace "$AB_NAMESPACE" \
    --userZipCodeUpdate '{"zipCode": "91GXlvPG"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateMyZipCode' test.out

#- 60 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId '6bFYReVH' \
    --body '{"category": "QipcCx9Z", "description": "w5D2L7vI", "gameSessionId": "YhGGSyEW", "subcategory": "4ZJJ42d3", "userId": "PBddN8S4"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicReportUser' test.out

#- 61 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId '8l9lyNAp' \
    --category 'flxqMrj3' \
    --fileType 'oZk03QXc' \
    > test.out 2>&1
eval_tap $? 61 'PublicGeneratedUserUploadContentUrl' test.out

#- 62 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'KMDYDDxH' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetUserProfileInfo' test.out

#- 63 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'SZjtqXyJ' \
    --body '{"avatarLargeUrl": "58f7Gc26", "avatarSmallUrl": "SaiGVkyd", "avatarUrl": "wYWQG26y", "customAttributes": {"UZNmTBcv": {}, "rbYCwZtx": {}, "FHyPLtI8": {}}, "dateOfBirth": "1975-03-16", "firstName": "lbyDPUIj", "language": "CwF", "lastName": "pp2ncYAH", "privateCustomAttributes": {"dNzDmeIP": {}, "6rOvDz9K": {}, "Osb392k6": {}}, "timeZone": "YmJFfRBy", "zipCode": "jlBiuFM3"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateUserProfile' test.out

#- 64 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'FIoVk8T3' \
    --body '{"avatarLargeUrl": "GpAnkCmB", "avatarSmallUrl": "Uqg2SCnq", "avatarUrl": "ntX9y1aZ", "customAttributes": {"SWMiVi10": {}, "sG6vxkfU": {}, "cmqRRbce": {}}, "dateOfBirth": "1989-10-18", "firstName": "5i0EeDxO", "language": "Xb", "lastName": "CSz9WEi8", "timeZone": "KlloeH0J"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserProfile' test.out

#- 65 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'T1yduat2' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCustomAttributesInfo' test.out

#- 66 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'vQR3biBf' \
    --body '{"su4jmsRE": {}, "2w1yEkLg": {}, "h3tIYt4S": {}}' \
    > test.out 2>&1
eval_tap $? 66 'PublicUpdateCustomAttributesPartially' test.out

#- 67 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'qYUTLDx9' \
    > test.out 2>&1
eval_tap $? 67 'PublicGetUserProfilePublicInfo' test.out

#- 68 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'gIiDandp' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE