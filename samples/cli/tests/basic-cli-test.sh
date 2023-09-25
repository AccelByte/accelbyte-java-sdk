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
eval_tap 0 22 'GetCountries # SKIP deprecated' test.out

#- 23 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode 'aTmt1d67FXGk2s9Q' \
    > test.out 2>&1
eval_tap $? 23 'GetCountryGroups' test.out

#- 24 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "0mPVo3twu0MesTCf", "name": "9x4rt69lna7qxNeI"}, {"code": "xPz6MbwL6IY69z1U", "name": "aLqYSYWytLPziZMd"}, {"code": "jxcBZufQxGiHPllG", "name": "4cYEzfTD1ZBm3MqH"}], "countryGroupCode": "cUmLZZbSqb8RwNmn", "countryGroupName": "9HrNQy4uZAAiE0mi"}' \
    > test.out 2>&1
eval_tap $? 24 'AddCountryGroup' test.out

#- 25 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 't9RGCCHYzUOcEdsc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "KHPEqgA8yu7Vk6Jt", "name": "4Ymos9Jcdos4fYcT"}, {"code": "VU6RBt0zYoMcHyCU", "name": "EXlAvxJMdalwSyli"}, {"code": "WMNW5NyLu0M3VHh2", "name": "EI8JlDbPWbQ6Q9lN"}], "countryGroupName": "mqRBaAkLnvxkT1X6"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateCountryGroup' test.out

#- 26 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode '8cmDc3fxU8MyKrQp' \
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
    --publicId 'M4hkkK6KKXNB3Gv0' \
    > test.out 2>&1
eval_tap $? 29 'GetUserProfileInfoByPublicId' test.out

#- 30 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["IqmF51TkhjYnaq6f", "oWvXa3bMrXsDr6kI", "LsSSyDdmykmoPYgc"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminGetUserProfilePublicInfoByIds' test.out

#- 31 GetNamespacePublisher
./ng net.accelbyte.sdk.cli.Main basic getNamespacePublisher \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetNamespacePublisher' test.out

#- 32 GetPublisherConfig
./ng net.accelbyte.sdk.cli.Main basic getPublisherConfig \
    --configKey '2L4jk4Lo0LSP0pf4' \
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
    --userId 'xjUkl535X3ateEKD' \
    > test.out 2>&1
eval_tap $? 34 'AnonymizeUserProfile' test.out

#- 35 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'pADz1x3poD3Qgb3b' \
    --category 'oLQQ1MzH7Qm8bwbm' \
    --fileType 'XgdAPh1EThG96gAF' \
    > test.out 2>&1
eval_tap $? 35 'GeneratedUserUploadContentUrl' test.out

#- 36 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'KK2WDgCcxvONZm3E' \
    > test.out 2>&1
eval_tap $? 36 'GetUserProfileInfo' test.out

#- 37 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'eERmDnyeFoF7VSZ6' \
    --body '{"avatarLargeUrl": "pf3vneSD2Tb3g7mS", "avatarSmallUrl": "QUhAEtrmjqU6YE3p", "avatarUrl": "4lSck0ZHn5GI39YB", "customAttributes": {"HqaTHeKtW18iGeUl": {}, "c9d9sogWa24CKNS0": {}, "GqVvUfHQvsHXNUNe": {}}, "dateOfBirth": "1992-04-06", "firstName": "BddN8S48l9lyNApf", "language": "LX-583", "lastName": "gbLdLsFzHkBMr1yr", "privateCustomAttributes": {"OMlNFSrUEirnjX9f": {}, "DmIbeZxzfTcyiuAT": {}, "us9hsfpFDcSDG8aM": {}}, "status": "INACTIVE", "timeZone": "LiBNrDjqoxcwgGLX", "zipCode": "pUL4pp2ncYAHdNzD"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateUserProfile' test.out

#- 38 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'meIP6rOvDz9KOsb3' \
    > test.out 2>&1
eval_tap $? 38 'DeleteUserProfile' test.out

#- 39 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '92k6YmJFfRByjlBi' \
    > test.out 2>&1
eval_tap $? 39 'GetCustomAttributesInfo' test.out

#- 40 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'uFM3FIoVk8T3GpAn' \
    --body '{"kCmBUqg2SCnqntX9": {}, "y1aZSWMiVi10sG6v": {}, "xkfUcmqRRbceJ5i0": {}}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateCustomAttributesPartially' test.out

#- 41 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'EeDxOgBnhhqElIaD' \
    > test.out 2>&1
eval_tap $? 41 'GetPrivateCustomAttributesInfo' test.out

#- 42 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'ml48wdNFLTm5T50x' \
    --body '{"9WT0GfH2rtOa4EXs": {}, "XzOXQAk4mqrxzTtu": {}, "Ll4XlbGL8QOxtjzm": {}}' \
    > test.out 2>&1
eval_tap $? 42 'UpdatePrivateCustomAttributesPartially' test.out

#- 43 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '8y2wNhmwoYZyI4EF' \
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
    --folder 'KLCa3xreNDUWehwH' \
    --namespace "$AB_NAMESPACE" \
    --fileType '3q31A806DJgas4b6' \
    > test.out 2>&1
eval_tap $? 46 'PublicGeneratedUploadUrl' test.out

#- 47 PublicGetCountries
eval_tap 0 47 'PublicGetCountries # SKIP deprecated' test.out

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
    --userIds 'z3LNUj7fdgLA84Z8' \
    > test.out 2>&1
eval_tap $? 50 'PublicGetUserProfilePublicInfoByIds' test.out

#- 51 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'YYk6QEgJjBbEDoNf' \
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
    --body '{"avatarLargeUrl": "3n0hEoRCAcf80zfF", "avatarSmallUrl": "yabWAgIUXiI07A68", "avatarUrl": "eaqC2J9jyEW6GLbc", "customAttributes": {"0NaKDUL3sa13lk1d": {}, "QBHO86IlBhnetU4R": {}, "wTqUXlTDBzOuYsaZ": {}}, "dateOfBirth": "1984-07-27", "firstName": "2yyd4mbqoOfADMMA", "language": "AEDE_VBEt", "lastName": "VhyaKwwrAP2aMlu7", "privateCustomAttributes": {"WtjCtoYetOO847g8": {}, "OudOfjnCuHZ3c46I": {}, "jGa23YvYmmDg7VYP": {}}, "timeZone": "XIuvUYTZBRujIUE1", "zipCode": "Tq5jyAZvkRCMNFIu"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateMyProfile' test.out

#- 55 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "rjh2imdb4rbkXj0Z", "avatarSmallUrl": "wsVC0gL97ZVJSPqJ", "avatarUrl": "iwv1qlYB1RSKs6gQ", "customAttributes": {"xC3Gb7S0o4zGYY7K": {}, "QI1AeFgPqaOkvo1a": {}, "olB4lkKB4EYOkQ1j": {}}, "dateOfBirth": "1990-08-25", "firstName": "D3cym8xIfkOVW2gr", "language": "fmpY-586", "lastName": "HICQLfl7MUBG7qtP", "privateCustomAttributes": {"u64yAtURKLRkb738": {}, "HGS6rDgMdIIlhS1f": {}, "SiM9331m7Ta1PsKc": {}}, "timeZone": "50Kv6ecnEevcAx2K"}' \
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
    --body '{"2zkRenmPZnGBt4P7": {}, "WnbdSJtjX7ZshZyZ": {}, "l5x4bRXBHUTrDzZS": {}}' \
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
    --userZipCodeUpdate '{"zipCode": "KscfOcYu3dpCROYq"}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateMyZipCode' test.out

#- 60 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'UiGKXVFCmpo6sPwV' \
    --body '{"category": "OEDSJsEK5QpNhlI2", "description": "iS5EpGhhvXYck0up", "gameSessionId": "MzUYnb76tFkEORV3", "subcategory": "bu1bNCtX7W40V6Do", "userId": "5sYadCCFrHHC3DpZ"}' \
    > test.out 2>&1
eval_tap $? 60 'PublicReportUser' test.out

#- 61 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'xkrQDXuNFviMarv8' \
    --category 'mnfHK8CCmE2lPnsb' \
    --fileType 'D3SGEdlwuUccE536' \
    > test.out 2>&1
eval_tap $? 61 'PublicGeneratedUserUploadContentUrl' test.out

#- 62 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'ugBp3HBvepnDCjgy' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetUserProfileInfo' test.out

#- 63 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'JlXe36mgWjLfFmte' \
    --body '{"avatarLargeUrl": "ue9nzJ6fH24T805t", "avatarSmallUrl": "Vg8JqU0jZpjvsugA", "avatarUrl": "OS7u8RiWyerCSa8S", "customAttributes": {"RgwsAj1ik1jglaDX": {}, "TvKCWwNTAhd2wrS0": {}, "uPdjhdinpng5BLy8": {}}, "dateOfBirth": "1982-03-11", "firstName": "bhMssAHjapIkY9Rf", "language": "Xcr-DB", "lastName": "UDpdONneAczbBdHb", "privateCustomAttributes": {"2slt71B1SmZp2JZp": {}, "50CnPb71ORYcmQbT": {}, "U5JX8ccLjMXJRk0e": {}}, "timeZone": "aKQDOJvrTefglSs6", "zipCode": "g4iY9u02aCNYIWek"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateUserProfile' test.out

#- 64 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'p18lOC3mNqF7Bl0L' \
    --body '{"avatarLargeUrl": "cghVHfPEspxwhRON", "avatarSmallUrl": "0bc1eMbEIjowLqc3", "avatarUrl": "ecjXJbZDKKoxLE1Y", "customAttributes": {"3Dymtj3giPg4x4yi": {}, "PX6ues1Hhhkg1yLV": {}, "bLFzHEP8cM4NTwr0": {}}, "dateOfBirth": "1990-05-28", "firstName": "HaAsmTej52WKi6tA", "language": "AbX-gLkd-008", "lastName": "UkBeIXuqDuAXI66b", "timeZone": "Q71w0deoV9Lx5RDA"}' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserProfile' test.out

#- 65 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId '1l2XcrciYNEzvSZI' \
    > test.out 2>&1
eval_tap $? 65 'PublicGetCustomAttributesInfo' test.out

#- 66 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'PkhSgORcz5S5Bvmg' \
    --body '{"BLxh4ijFnE3Tam69": {}, "qSZ7PC6f6QkmZXEl": {}, "W9YfRSse6AAz3S4c": {}}' \
    > test.out 2>&1
eval_tap $? 66 'PublicUpdateCustomAttributesPartially' test.out

#- 67 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'zz0QKFlAVmVLu4AO' \
    > test.out 2>&1
eval_tap $? 67 'PublicGetUserProfilePublicInfo' test.out

#- 68 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'ec0z8eBeeoip68J1' \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 68 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE