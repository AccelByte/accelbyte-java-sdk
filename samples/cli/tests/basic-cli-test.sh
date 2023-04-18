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
    --body '{"displayName": "EAxcVpFrttufHIRd", "namespace": "H9UzVRiXbqlAw7r6"}' \
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
    --body '{"actionId": 100, "comment": "7eHpzSn3ZPUdc0qh", "userIds": ["4n8mzZ0m8SAMTwE6", "I56IaRDBXxyaNoMR", "6hkspInrAip6lyzS"]}' \
    > test.out 2>&1
eval_tap $? 7 'BanUsers' test.out

#- 8 GetBannedUsers
./ng net.accelbyte.sdk.cli.Main basic getBannedUsers \
    --namespace "$AB_NAMESPACE" \
    --userIds 'xwElFHHdgs21Jub7,4CUkNmKJfh5pUkHO,DpoMF78NY4YkHs1c' \
    > test.out 2>&1
eval_tap $? 8 'GetBannedUsers' test.out

#- 9 ReportUser
./ng net.accelbyte.sdk.cli.Main basic reportUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "nz1JSDgY1TXp38zs", "description": "CTCrbCbPOyNQkT7N", "gameSessionId": "vyE3cwyALczNIicX", "subcategory": "m7agSrjJW2OQNOs1", "userId": "PXhT5FvdiRilZ7oF"}' \
    > test.out 2>&1
eval_tap $? 9 'ReportUser' test.out

#- 10 GetUserStatus
./ng net.accelbyte.sdk.cli.Main basic getUserStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'gx4c8OumKtPDKJDX' \
    > test.out 2>&1
eval_tap $? 10 'GetUserStatus' test.out

#- 11 UnBanUsers
./ng net.accelbyte.sdk.cli.Main basic unBanUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "n7Z4U68su8XfqlqN", "userIds": ["iTvB6SdAdIhUDrwo", "Z5MecdKi5r6QEa1y", "sLEzth6mXhzkzWkF"]}' \
    > test.out 2>&1
eval_tap $? 11 'UnBanUsers' test.out

#- 12 UpdateNamespace
./ng net.accelbyte.sdk.cli.Main basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "eZSoEAcBdW19m4eu"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateNamespace' test.out

#- 13 CreateConfig
./ng net.accelbyte.sdk.cli.Main basic createConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"key": "6d5tA5jUmiTqpyhP", "value": "FdxLzFQN05MYzYiK"}' \
    > test.out 2>&1
eval_tap $? 13 'CreateConfig' test.out

#- 14 GetConfig1
./ng net.accelbyte.sdk.cli.Main basic getConfig1 \
    --configKey 'We5dNRljv7IPrDQQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetConfig1' test.out

#- 15 DeleteConfig1
./ng net.accelbyte.sdk.cli.Main basic deleteConfig1 \
    --configKey 'Rgat0SevkLGMS0ly' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DeleteConfig1' test.out

#- 16 UpdateConfig1
./ng net.accelbyte.sdk.cli.Main basic updateConfig1 \
    --configKey 'uI9a2I9u6Vpbsx5w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"value": "8hqUI06UpOXGSLmC"}' \
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
    --body '{"apiKey": "VuHOPlLlkvR8sKgn"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateConfig' test.out

#- 20 GeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUploadUrl \
    --folder 'uRkgghGoYupD391C' \
    --namespace "$AB_NAMESPACE" \
    --fileType '2qtPYokahFjkQsfC' \
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
    --lang 'aTmt1d67FXGk2s9Q' \
    > test.out 2>&1
eval_tap $? 22 'GetCountries' test.out

#- 23 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode '0mPVo3twu0MesTCf' \
    > test.out 2>&1
eval_tap $? 23 'GetCountryGroups' test.out

#- 24 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "9x4rt69lna7qxNeI", "name": "xPz6MbwL6IY69z1U"}, {"code": "aLqYSYWytLPziZMd", "name": "jxcBZufQxGiHPllG"}, {"code": "4cYEzfTD1ZBm3MqH", "name": "cUmLZZbSqb8RwNmn"}], "countryGroupCode": "9HrNQy4uZAAiE0mi", "countryGroupName": "t9RGCCHYzUOcEdsc"}' \
    > test.out 2>&1
eval_tap $? 24 'AddCountryGroup' test.out

#- 25 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 'KHPEqgA8yu7Vk6Jt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "4Ymos9Jcdos4fYcT", "name": "VU6RBt0zYoMcHyCU"}, {"code": "EXlAvxJMdalwSyli", "name": "WMNW5NyLu0M3VHh2"}, {"code": "EI8JlDbPWbQ6Q9lN", "name": "mqRBaAkLnvxkT1X6"}], "countryGroupName": "8cmDc3fxU8MyKrQp"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateCountryGroup' test.out

#- 26 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode 'M4hkkK6KKXNB3Gv0' \
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
    --publicId 'IqmF51TkhjYnaq6f' \
    > test.out 2>&1
eval_tap $? 29 'GetUserProfileInfoByPublicId' test.out

#- 30 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["oWvXa3bMrXsDr6kI", "LsSSyDdmykmoPYgc", "2L4jk4Lo0LSP0pf4"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetUserProfilePublicInfoByIds' test.out

#- 31 GetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetNamespacePublisher' test.out

#- 32 GetPublisherConfig
./ng net.accelbyte.sdk.cli.Main basic getPublisherConfig \
    --configKey 'IxjUkl535X3ateEK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetPublisherConfig' test.out

#- 33 ChangeNamespaceStatus
./ng net.accelbyte.sdk.cli.Main basic changeNamespaceStatus \
    --namespace "$AB_NAMESPACE" \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 33 'ChangeNamespaceStatus' test.out

#- 34 AnonymizeUserProfile
./ng net.accelbyte.sdk.cli.Main basic anonymizeUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'UC9b6i5lZC9xv32e' \
    > test.out 2>&1
eval_tap $? 34 'AnonymizeUserProfile' test.out

#- 35 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId '8c5csSovoqsZNBdt' \
    --category 'e9NDUPVJf6c2Z0QZ' \
    --fileType 'xfgPubTDIHrvqATh' \
    > test.out 2>&1
eval_tap $? 35 'GeneratedUserUploadContentUrl' test.out

#- 36 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'uwjRHpKKTlmVr9Xu' \
    > test.out 2>&1
eval_tap $? 36 'GetUserProfileInfo' test.out

#- 37 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJbRFQSKVPHbn4Xx' \
    --body '{"avatarLargeUrl": "tu7LQRENjEEztx1W", "avatarSmallUrl": "sYSiZqan0nSBJroa", "avatarUrl": "v91GXlvPG6bFYReV", "customAttributes": {"HQipcCx9Zw5D2L7v": {}, "IYhGGSyEW4ZJJ42d": {}, "3PBddN8S48l9lyNA": {}}, "dateOfBirth": "1978-11-21", "firstName": "flxqMrj3oZk03QXc", "language": "inLe-eYZi_oR", "lastName": "FSrUEirnjX9fDmIb", "privateCustomAttributes": {"eZxzfTcyiuATus9h": {}, "sfpFDcSDG8aMVGLi": {}, "BNrDjqoxcwgGLXpU": {}}, "status": "ACTIVE", "timeZone": "4pp2ncYAHdNzDmeI", "zipCode": "P6rOvDz9KOsb392k"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateUserProfile' test.out

#- 38 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '6YmJFfRByjlBiuFM' \
    > test.out 2>&1
eval_tap $? 38 'DeleteUserProfile' test.out

#- 39 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '3FIoVk8T3GpAnkCm' \
    > test.out 2>&1
eval_tap $? 39 'GetCustomAttributesInfo' test.out

#- 40 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'BUqg2SCnqntX9y1a' \
    --body '{"ZSWMiVi10sG6vxkf": {}, "UcmqRRbceJ5i0EeD": {}, "xOgBnhhqElIaDml4": {}}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateCustomAttributesPartially' test.out

#- 41 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '8wdNFLTm5T50x9WT' \
    > test.out 2>&1
eval_tap $? 41 'GetPrivateCustomAttributesInfo' test.out

#- 42 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '0GfH2rtOa4EXsXzO' \
    --body '{"XQAk4mqrxzTtuLl4": {}, "XlbGL8QOxtjzm8y2": {}, "wNhmwoYZyI4EFZKB": {}}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePrivateCustomAttributesPartially' test.out

#- 43 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'cYrCEAE7WIsfmx40' \
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
    --folder 'LRc6m8heKnWhzfe2' \
    --namespace "$AB_NAMESPACE" \
    --fileType 'NubeoKFeIaFQCYoD' \
    > test.out 2>&1
eval_tap $? 46 'PublicGeneratedUploadUrl' test.out

#- 47 PublicGetCountries
./ng net.accelbyte.sdk.cli.Main basic publicGetCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'PICpnduEEQlULdJz' \
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
    --userIds '4mnRBkMNxvvKgAT8' \
    > test.out 2>&1
eval_tap $? 50 'PublicGetUserProfilePublicInfoByIds' test.out

#- 51 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'mJrYq6hRkloqxM3g' \
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
    --body '{"avatarLargeUrl": "pwxcfMy9XzjjI5Yb", "avatarSmallUrl": "sKoADkzJEN2VHzih", "avatarUrl": "3bit0VWn3CO39PXD", "customAttributes": {"NxtXgeO3FgkXhjDz": {}, "aQY3snn2ZkP7cFdP": {}, "43e5dC9XIBudfZgr": {}}, "dateOfBirth": "1971-10-27", "firstName": "HDIDm4hMzF4Txode", "language": "Ot_vpWq", "lastName": "847g8OudOfjnCuHZ", "privateCustomAttributes": {"3c46IjGa23YvYmmD": {}, "g7VYPXIuvUYTZBRu": {}, "jIUE1Tq5jyAZvkRC": {}}, "timeZone": "MNFIurjh2imdb4rb", "zipCode": "kXj0ZwsVC0gL97ZV"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateMyProfile' test.out

#- 55 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "JSPqJiwv1qlYB1RS", "avatarSmallUrl": "Ks6gQxC3Gb7S0o4z", "avatarUrl": "GYY7KQI1AeFgPqaO", "customAttributes": {"kvo1aolB4lkKB4EY": {}, "OkQ1jMD3cym8xIfk": {}, "OVW2grREOLx0KOww": {}}, "dateOfBirth": "1999-08-06", "firstName": "HICQLfl7MUBG7qtP", "language": "eSu-ywdt_088", "lastName": "F6oQAXVG7tnsZg5Q", "privateCustomAttributes": {"gXjvyGJPN4eXbJE5": {}, "Vs2GcyomQoIXimBJ": {}, "ehyxlNsjUgxBkF6w": {}}, "timeZone": "FPoJeQediogEhhM2"}' \
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
    --body '{"rIizGdKvOPdq5xrg": {}, "xSmy1DN9LFkYW5DQ": {}, "yj4bj5Ro2ogaKt2u": {}}' \
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
    --userZipCodeUpdate '{"zipCode": "jQSa3Zdb65UXmy0Z"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateMyZipCode' test.out

#- 60 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'p6iIaTIKUkmkk9QM' \
    --body '{"category": "0NBMA9ORxpzwLR2A", "description": "K6eXUGPJsw1fiP80", "gameSessionId": "G9Pclxcft2ulIJzP", "subcategory": "yrVEiOG4UcqsuGKH", "userId": "hMRWLVd3DlhLuIpo"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicReportUser' test.out

#- 61 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'mM8sm1MiaI1mX2tJ' \
    --category 'oARtdbBe7udsMrok' \
    --fileType '0WvGYYnx4V709xbn' \
    > test.out 2>&1
eval_tap $? 61 'PublicGeneratedUserUploadContentUrl' test.out

#- 62 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'GezKsDwG2omOR2nv' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetUserProfileInfo' test.out

#- 63 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'YI9TVqJdvzcWbfUp' \
    --body '{"avatarLargeUrl": "aXp5JMl5LL4bTxBm", "avatarSmallUrl": "ZjdrrIxsB0NRsB1f", "avatarUrl": "PqqRRulpqpymDkQh", "customAttributes": {"trHWwRVnwVBOqOHi": {}, "8pWGd1juYhiqjRJO": {}, "qB5F93zFQbJndUDp": {}}, "dateOfBirth": "1972-10-26", "firstName": "ONneAczbBdHb2slt", "language": "Pczu", "lastName": "Zp2JZp50CnPb71OR", "privateCustomAttributes": {"YcmQbTU5JX8ccLjM": {}, "XJRk0eaKQDOJvrTe": {}, "fglSs6g4iY9u02aC": {}}, "timeZone": "NYIWekp18lOC3mNq", "zipCode": "F7Bl0LcghVHfPEsp"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateUserProfile' test.out

#- 64 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'xwhRON0bc1eMbEIj' \
    --body '{"avatarLargeUrl": "owLqc3ecjXJbZDKK", "avatarSmallUrl": "oxLE1Y3Dymtj3giP", "avatarUrl": "g4x4yiPX6ues1Hhh", "customAttributes": {"kg1yLVbLFzHEP8cM": {}, "4NTwr0KHaAsmTej5": {}, "2WKi6tArAURt9plC": {}}, "dateOfBirth": "1993-10-12", "firstName": "Vq8PdH6hJPUAc0RV", "language": "yzj_sU", "lastName": "71w0deoV9Lx5RDA1", "timeZone": "l2XcrciYNEzvSZIP"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserProfile' test.out

#- 65 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'khSgORcz5S5BvmgB' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCustomAttributesInfo' test.out

#- 66 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lxh4ijFnE3Tam69q' \
    --body '{"SZ7PC6f6QkmZXElW": {}, "9YfRSse6AAz3S4cz": {}, "z0QKFlAVmVLu4AOe": {}}' \
    > test.out 2>&1
eval_tap $? 66 'PublicUpdateCustomAttributesPartially' test.out

#- 67 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'c0z8eBeeoip68J1n' \
    > test.out 2>&1
eval_tap $? 67 'PublicGetUserProfilePublicInfo' test.out

#- 68 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'sv4W2OJhtafxMSJl' \
    --body '{"status": "INACTIVE"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE