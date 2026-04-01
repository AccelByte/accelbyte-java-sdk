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
    --isTesting  \
    > test.out 2>&1
eval_tap $? 2 'GetNamespaces' test.out

#- 3 CreateNamespace
./ng net.accelbyte.sdk.cli.Main basic createNamespace \
    --body '{"displayName": "EAxcVpFrttufHIRd", "isTesting": true, "namespace": "9UzVRiXbqlAw7r6W"}' \
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

#- 6 UpdateNamespace
./ng net.accelbyte.sdk.cli.Main basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "2ktQG0h5JAav5kRa"}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateNamespace' test.out

#- 7 GetChildNamespaces
./ng net.accelbyte.sdk.cli.Main basic getChildNamespaces \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 7 'GetChildNamespaces' test.out

#- 8 CreateConfig
./ng net.accelbyte.sdk.cli.Main basic createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"key": "62WopBJHPtcDs8bB", "value": "ZLCXLx8bbgorQeFb"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateConfig' test.out

#- 9 GetConfig
./ng net.accelbyte.sdk.cli.Main basic getConfig \
    --configKey 'Q1g7qbPngUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'GetConfig' test.out

#- 10 DeleteConfig
./ng net.accelbyte.sdk.cli.Main basic deleteConfig \
    --configKey 'dwpzS6DaDpv8N7ZQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'DeleteConfig' test.out

#- 11 UpdateConfig
./ng net.accelbyte.sdk.cli.Main basic updateConfig \
    --configKey 'VqGj6oDLjWjkY1aX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "lFcDtgOjchIua5tW"}' \
    > test.out 2>&1
eval_tap $? 11 'UpdateConfig' test.out

#- 12 GetNamespaceContext
./ng net.accelbyte.sdk.cli.Main basic getNamespaceContext \
    --namespace "$AB_NAMESPACE" \
    --refreshOnCacheMiss  \
    > test.out 2>&1
eval_tap $? 12 'GetNamespaceContext' test.out

#- 13 GeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUploadUrl \
    --folder 'EIC32ogW7olvbTgr' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'hRTcPiSuL0Sly6XM' \
    > test.out 2>&1
eval_tap $? 13 'GeneratedUploadUrl' test.out

#- 14 GetGameNamespaces
./ng net.accelbyte.sdk.cli.Main basic getGameNamespaces \
    --namespace "$AB_NAMESPACE" \
    --activeOnly  \
    > test.out 2>&1
eval_tap $? 14 'GetGameNamespaces' test.out

#- 15 GetCountries
eval_tap 0 15 'GetCountries # SKIP deprecated' test.out

#- 16 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode '4OI18mAQLnzjMf8G' \
    > test.out 2>&1
eval_tap $? 16 'GetCountryGroups' test.out

#- 17 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "Z2WBZqxYG3aREAu2", "name": "D6QVKNCWP75TB0i7"}, {"code": "pKxR8dl0zRVW4EZG", "name": "9m0XcgGVbMqSszE8"}, {"code": "GHavj7AorKsxwkos", "name": "AVerXpc1C8XfwHuK"}], "countryGroupCode": "eb9l3rGN9A3sNm84", "countryGroupName": "hddSpHt0P7MIIR7C"}' \
    > test.out 2>&1
eval_tap $? 17 'AddCountryGroup' test.out

#- 18 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 'kyF6C7duuyZ0GhDo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "gqrhBRd8lDR6qVNP", "name": "RZYdFLIAjGGJddVC"}, {"code": "vu9vx5KQ7KYnIuMB", "name": "vaO35llzQRaT5kPx"}, {"code": "UfofvnnSuB0y5WUl", "name": "rMdI4sNveabntBSx"}], "countryGroupName": "TeIv53HGCiljvjKo"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateCountryGroup' test.out

#- 19 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode 'yD6SCwGrncqmLtjQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteCountryGroup' test.out

#- 20 GetLanguages
./ng net.accelbyte.sdk.cli.Main basic getLanguages \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetLanguages' test.out

#- 21 GetTimeZones
./ng net.accelbyte.sdk.cli.Main basic getTimeZones \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetTimeZones' test.out

#- 22 GetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'HAf8TgoNm03VLisV' \
    > test.out 2>&1
eval_tap $? 22 'GetUserProfileInfoByPublicId' test.out

#- 23 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6zwPuo3td6TC6I3l", "MjGSWN2laRlxfcjH", "fYakUCTqGkE7wcWf"]}' \
    > test.out 2>&1
eval_tap $? 23 'AdminGetUserProfilePublicInfoByIds' test.out

#- 24 GetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetNamespacePublisher' test.out

#- 25 GetPublisherConfig
./ng net.accelbyte.sdk.cli.Main basic getPublisherConfig \
    --configKey 'DslpJSqGAXQ0yYoN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'GetPublisherConfig' test.out

#- 26 ChangeNamespaceStatus
./ng net.accelbyte.sdk.cli.Main basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 26 'ChangeNamespaceStatus' test.out

#- 27 UpdateTestingFlag
./ng net.accelbyte.sdk.cli.Main basic updateTestingFlag \
    --namespace "$AB_NAMESPACE" \
    --body '{"isTesting": false}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateTestingFlag' test.out

#- 28 AnonymizeUserProfile
./ng net.accelbyte.sdk.cli.Main basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'd3IL5TAQ6iiPlSC2' \
    > test.out 2>&1
eval_tap $? 28 'AnonymizeUserProfile' test.out

#- 29 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'uE4o5Vwdo3fePqIJ' \
    --category 'A8IHtrkmu0hpDDWV' \
    --fileType 'Ala2l5BYNtIuS5S5' \
    > test.out 2>&1
eval_tap $? 29 'GeneratedUserUploadContentUrl' test.out

#- 30 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'XUdjsoqwGyzzWi9g' \
    > test.out 2>&1
eval_tap $? 30 'GetUserProfileInfo' test.out

#- 31 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQYv7t1o7TTr1Dmr' \
    --body '{"avatarLargeUrl": "hZv15T7quIOvBMca", "avatarSmallUrl": "YmvCkGZ5dAgqxpBF", "avatarUrl": "maLoxozr6wfNPX2b", "customAttributes": {"OItRMvqtlB2jJCSQ": {}, "T279ZZPYGu0rdlgd": {}, "WyOtXi3choQrpOsD": {}}, "dateOfBirth": "1985-08-26", "firstName": "U5SepjChB3V0v52D", "language": "KZ", "lastName": "KXNB3Gv0IqmF51Tk", "privateCustomAttributes": {"hjYnaq6foWvXa3bM": {}, "rXsDr6kILsSSyDdm": {}, "ykmoPYgc2L4jk4Lo": {}}, "status": "INACTIVE", "timeZone": "LSP0pf4IxjUkl535", "zipCode": "X3ateEKDpADz1x3p"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateUserProfile' test.out

#- 32 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'oD3Qgb3boLQQ1MzH' \
    > test.out 2>&1
eval_tap $? 32 'DeleteUserProfile' test.out

#- 33 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '7Qm8bwbmXgdAPh1E' \
    > test.out 2>&1
eval_tap $? 33 'GetCustomAttributesInfo' test.out

#- 34 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'ThG96gAFKK2WDgCc' \
    --body '{"xvONZm3EeERmDnye": {}, "FoF7VSZ6pf3vneSD": {}, "2Tb3g7mSQUhAEtrm": {}}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateCustomAttributesPartially' test.out

#- 35 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqU6YE3p4lSck0ZH' \
    > test.out 2>&1
eval_tap $? 35 'GetPrivateCustomAttributesInfo' test.out

#- 36 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'n5GI39YBHqaTHeKt' \
    --body '{"W18iGeUlc9d9sogW": {}, "a24CKNS0GqVvUfHQ": {}, "vsHXNUNe4mhgo5QB": {}}' \
    > test.out 2>&1
eval_tap $? 36 'UpdatePrivateCustomAttributesPartially' test.out

#- 37 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '65lSAiYnNjkfZrQv' \
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

#- 40 GetNamespace1
./ng net.accelbyte.sdk.cli.Main basic getNamespace1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 40 'GetNamespace1' test.out

#- 41 PublicGeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUploadUrl \
    --folder 'gbLdLsFzHkBMr1yr' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'OMlNFSrUEirnjX9f' \
    > test.out 2>&1
eval_tap $? 41 'PublicGeneratedUploadUrl' test.out

#- 42 PublicGetCountries
eval_tap 0 42 'PublicGetCountries # SKIP deprecated' test.out

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
    --userIds 'DmIbeZxzfTcyiuAT' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserProfilePublicInfoByIds' test.out

#- 46 PublicBulkGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicBulkGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["us9hsfpFDcSDG8aM", "VGLiBNrDjqoxcwgG", "LXpUL4pp2ncYAHdN"]}' \
    > test.out 2>&1
eval_tap $? 46 'PublicBulkGetUserProfilePublicInfo' test.out

#- 47 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'zDmeIP6rOvDz9KOs' \
    > test.out 2>&1
eval_tap $? 47 'PublicGetUserProfileInfoByPublicId' test.out

#- 48 PublicGetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic publicGetNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 48 'PublicGetNamespacePublisher' test.out

#- 49 GetMyProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getMyProfileInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 49 'GetMyProfileInfo' test.out

#- 50 UpdateMyProfile
./ng net.accelbyte.sdk.cli.Main basic updateMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "b392k6YmJFfRByjl", "avatarSmallUrl": "BiuFM3FIoVk8T3Gp", "avatarUrl": "AnkCmBUqg2SCnqnt", "customAttributes": {"X9y1aZSWMiVi10sG": {}, "6vxkfUcmqRRbceJ5": {}, "i0EeDxOgBnhhqElI": {}}, "dateOfBirth": "1971-08-31", "firstName": "KlloeH0JT1yduat2", "language": "sys", "lastName": "fH2rtOa4EXsXzOXQ", "privateCustomAttributes": {"Ak4mqrxzTtuLl4Xl": {}, "bGL8QOxtjzm8y2wN": {}, "hmwoYZyI4EFZKBcY": {}}, "timeZone": "rCEAE7WIsfmx40NL", "zipCode": "Rc6m8heKnWhzfe2N"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateMyProfile' test.out

#- 51 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "ubeoKFeIaFQCYoDP", "avatarSmallUrl": "ICpnduEEQlULdJz4", "avatarUrl": "mnRBkMNxvvKgAT8m", "customAttributes": {"JrYq6hRkloqxM3gp": {}, "wxcfMy9XzjjI5Ybs": {}, "KoADkzJEN2VHzih3": {}}, "dateOfBirth": "1971-12-02", "firstName": "it0VWn3CO39PXDNx", "language": "zyM", "lastName": "DBzOuYsaZA2yyd4m", "privateCustomAttributes": {"bqoOfADMMAXFaY9e": {}, "Ka699bRVhyaKwwrA": {}, "P2aMlu7WtjCtoYet": {}}, "timeZone": "OO847g8OudOfjnCu"}' \
    > test.out 2>&1
eval_tap $? 51 'CreateMyProfile' test.out

#- 52 GetMyPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getMyPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'GetMyPrivateCustomAttributesInfo' test.out

#- 53 UpdateMyPrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateMyPrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --body '{"HZ3c46IjGa23YvYm": {}, "mDg7VYPXIuvUYTZB": {}, "RujIUE1Tq5jyAZvk": {}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateMyPrivateCustomAttributesPartially' test.out

#- 54 GetMyZipCode
./ng net.accelbyte.sdk.cli.Main basic getMyZipCode \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'GetMyZipCode' test.out

#- 55 UpdateMyZipCode
./ng net.accelbyte.sdk.cli.Main basic updateMyZipCode \
    --namespace "$AB_NAMESPACE" \
    --userZipCodeUpdate '{"zipCode": "RCMNFIurjh2imdb4"}' \
    > test.out 2>&1
eval_tap $? 55 'UpdateMyZipCode' test.out

#- 56 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'rbkXj0ZwsVC0gL97' \
    --category 'ZVJSPqJiwv1qlYB1' \
    --fileType 'RSKs6gQxC3Gb7S0o' \
    > test.out 2>&1
eval_tap $? 56 'PublicGeneratedUserUploadContentUrl' test.out

#- 57 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '4zGYY7KQI1AeFgPq' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetUserProfileInfo' test.out

#- 58 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'aOkvo1aolB4lkKB4' \
    --body '{"avatarLargeUrl": "EYOkQ1jMD3cym8xI", "avatarSmallUrl": "fkOVW2grREOLx0KO", "avatarUrl": "ww3HICQLfl7MUBG7", "customAttributes": {"qtPu64yAtURKLRkb": {}, "738HGS6rDgMdIIlh": {}, "S1fSiM9331m7Ta1P": {}}, "dateOfBirth": "1980-01-11", "firstName": "Kc50Kv6ecnEevcAx", "language": "lc_IsZE_oq", "lastName": "sjUgxBkF6wFPoJeQ", "privateCustomAttributes": {"ediogEhhM2rIizGd": {}, "KvOPdq5xrgxSmy1D": {}, "N9LFkYW5DQyj4bj5": {}}, "timeZone": "Ro2ogaKt2ujQSa3Z", "zipCode": "db65UXmy0Zp6iIaT"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateUserProfile' test.out

#- 59 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'IKUkmkk9QM0NBMA9' \
    --body '{"avatarLargeUrl": "ORxpzwLR2AK6eXUG", "avatarSmallUrl": "PJsw1fiP80G9Pclx", "avatarUrl": "cft2ulIJzPyrVEiO", "customAttributes": {"G4UcqsuGKHhMRWLV": {}, "d3DlhLuIpomM8sm1": {}, "MiaI1mX2tJoARtdb": {}}, "dateOfBirth": "1985-01-31", "firstName": "e7udsMrok0WvGYYn", "language": "Jmx", "lastName": "9xbnGezKsDwG2omO", "timeZone": "R2nvYI9TVqJdvzcW"}' \
    > test.out 2>&1
eval_tap $? 59 'PublicCreateUserProfile' test.out

#- 60 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'bfUpaXp5JMl5LL4b' \
    > test.out 2>&1
eval_tap $? 60 'PublicGetCustomAttributesInfo' test.out

#- 61 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'TxBmZjdrrIxsB0NR' \
    --body '{"sB1fPqqRRulpqpym": {}, "DkQhtrHWwRVnwVBO": {}, "qOHi8pWGd1juYhiq": {}}' \
    > test.out 2>&1
eval_tap $? 61 'PublicUpdateCustomAttributesPartially' test.out

#- 62 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'jRJOqB5F93zFQbJn' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetUserProfilePublicInfo' test.out

#- 63 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUDpdONneAczbBdH' \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE