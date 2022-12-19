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
    --body '{"displayName": "ydTp9ysR", "namespace": "ch1eaO0a"}' \
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
    --body '{"actionId": 56, "comment": "nXJrrdMj", "userIds": ["VaZEAA2c", "SwxFZdNJ", "ClZ51Jrf"]}' \
    > test.out 2>&1
eval_tap $? 7 'BanUsers' test.out

#- 8 GetBannedUsers
./ng net.accelbyte.sdk.cli.Main basic getBannedUsers \
    --namespace "$AB_NAMESPACE" \
    --userIds 'gFDdGagn,719FZnu9,XdMq13B0' \
    > test.out 2>&1
eval_tap $? 8 'GetBannedUsers' test.out

#- 9 ReportUser
./ng net.accelbyte.sdk.cli.Main basic reportUser \
    --namespace "$AB_NAMESPACE" \
    --body '{"category": "LhxqvWX9", "description": "2CugAQW1", "gameSessionId": "63XwWAEH", "subcategory": "c9YuYqc2", "userId": "PRPFfiIY"}' \
    > test.out 2>&1
eval_tap $? 9 'ReportUser' test.out

#- 10 GetUserStatus
./ng net.accelbyte.sdk.cli.Main basic getUserStatus \
    --namespace "$AB_NAMESPACE" \
    --userId '0ofTaGWH' \
    > test.out 2>&1
eval_tap $? 10 'GetUserStatus' test.out

#- 11 UnBanUsers
./ng net.accelbyte.sdk.cli.Main basic unBanUsers \
    --namespace "$AB_NAMESPACE" \
    --body '{"comment": "Ue06Axkh", "userIds": ["T3vfezrd", "GEXwBwvI", "USnWhquS"]}' \
    > test.out 2>&1
eval_tap $? 11 'UnBanUsers' test.out

#- 12 UpdateNamespace
./ng net.accelbyte.sdk.cli.Main basic updateNamespace \
    --namespace "$AB_NAMESPACE" \
    --body '{"displayName": "A7P1JPTV"}' \
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
    --body '{"apiKey": "22UG4jEn"}' \
    > test.out 2>&1
eval_tap $? 15 'UpdateConfig' test.out

#- 16 GeneratedUploadUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUploadUrl \
    --folder 'jDhk55QC' \
    --namespace "$AB_NAMESPACE" \
    --fileType '07712ifZ' \
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
    --lang '8s20AHr8' \
    > test.out 2>&1
eval_tap $? 18 'GetCountries' test.out

#- 19 GetCountryGroups
./ng net.accelbyte.sdk.cli.Main basic getCountryGroups \
    --namespace "$AB_NAMESPACE" \
    --groupCode 'RzWzakUo' \
    > test.out 2>&1
eval_tap $? 19 'GetCountryGroups' test.out

#- 20 AddCountryGroup
./ng net.accelbyte.sdk.cli.Main basic addCountryGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "d9IM9kUA", "name": "tizJpg2d"}, {"code": "OXmX2evW", "name": "oRFoNCyh"}, {"code": "xUQacon7", "name": "uErfOGrC"}], "countryGroupCode": "vOqsDp0g", "countryGroupName": "MDkM273U"}' \
    > test.out 2>&1
eval_tap $? 20 'AddCountryGroup' test.out

#- 21 UpdateCountryGroup
./ng net.accelbyte.sdk.cli.Main basic updateCountryGroup \
    --countryGroupCode 'TzASEd5D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"countries": [{"code": "yPr3fKLs", "name": "NTpQNjnk"}, {"code": "JoSqhZlC", "name": "tIU4h6Jp"}, {"code": "HKrspVZb", "name": "h1JVDr6T"}], "countryGroupName": "lvGjcD3w"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateCountryGroup' test.out

#- 22 DeleteCountryGroup
./ng net.accelbyte.sdk.cli.Main basic deleteCountryGroup \
    --countryGroupCode '7SKBBDII' \
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
    --publicId 'djwBvNst' \
    > test.out 2>&1
eval_tap $? 25 'GetUserProfileInfoByPublicId' test.out

#- 26 AdminGetUserProfilePublicInfoByIds
./ng net.accelbyte.sdk.cli.Main basic adminGetUserProfilePublicInfoByIds \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["jKlsjxbN", "WrGFv3Ny", "k80z09EX"]}' \
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
    --userId 'P2GwWxjH' \
    > test.out 2>&1
eval_tap $? 29 'AnonymizeUserProfile' test.out

#- 30 GeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic generatedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId '1XsGCU6W' \
    --category 'aA8OQe90' \
    --fileType 'AD1RtfMb' \
    > test.out 2>&1
eval_tap $? 30 'GeneratedUserUploadContentUrl' test.out

#- 31 GetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic getUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'tnwdg5mb' \
    > test.out 2>&1
eval_tap $? 31 'GetUserProfileInfo' test.out

#- 32 UpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic updateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'CxaWoGBE' \
    --body '{"avatarLargeUrl": "brAohjZY", "avatarSmallUrl": "b8rXXKxx", "avatarUrl": "QVymLF9W", "customAttributes": {"O5OqZxUr": {}, "fz2mufuF": {}, "qdnBdHDB": {}}, "dateOfBirth": "1985-01-05", "firstName": "nFMEPORe", "language": "pJ", "lastName": "xBuaMhV7", "status": "ACTIVE", "timeZone": "touoTx2G", "zipCode": "AlU7mylq"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateUserProfile' test.out

#- 33 DeleteUserProfile
./ng net.accelbyte.sdk.cli.Main basic deleteUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '3mZNZo0k' \
    > test.out 2>&1
eval_tap $? 33 'DeleteUserProfile' test.out

#- 34 GetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'NszN76BC' \
    > test.out 2>&1
eval_tap $? 34 'GetCustomAttributesInfo' test.out

#- 35 UpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vy9iOGDl' \
    --body '{"tAhLTGfv": {}, "XsjyhXD8": {}, "f7yf22XC": {}}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateCustomAttributesPartially' test.out

#- 36 GetPrivateCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic getPrivateCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'SVRraRJD' \
    > test.out 2>&1
eval_tap $? 36 'GetPrivateCustomAttributesInfo' test.out

#- 37 UpdatePrivateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic updatePrivateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '3ppZriRo' \
    --body '{"sZwuTkPP": {}, "BqSGz1y5": {}, "0pnwmmP0": {}}' \
    > test.out 2>&1
eval_tap $? 37 'UpdatePrivateCustomAttributesPartially' test.out

#- 38 UpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic updateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'uWwilIHR' \
    --body '{"status": "ACTIVE"}' \
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
    --folder 'pfhjduM5' \
    --namespace "$AB_NAMESPACE" \
    --fileType '3tsl8flc' \
    > test.out 2>&1
eval_tap $? 41 'PublicGeneratedUploadUrl' test.out

#- 42 PublicGetCountries
./ng net.accelbyte.sdk.cli.Main basic publicGetCountries \
    --namespace "$AB_NAMESPACE" \
    --lang 'LlWFQa1Q' \
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
    --userIds 'e73PnNNY' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetUserProfilePublicInfoByIds' test.out

#- 46 PublicGetUserProfileInfoByPublicId
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfoByPublicId \
    --namespace "$AB_NAMESPACE" \
    --publicId 'kVtLjUuS' \
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
    --body '{"avatarLargeUrl": "aKgFJLS1", "avatarSmallUrl": "XYfMxOKX", "avatarUrl": "e5PotKsG", "customAttributes": {"xyTtpVTT": {}, "MfXc4AqO": {}, "Jscbzjw4": {}}, "dateOfBirth": "1986-08-07", "firstName": "r7PoYy6s", "language": "hKa-bTuX-Qg", "lastName": "vSRLV3DM", "privateCustomAttributes": {"PV7Q8so2": {}, "xucmWt0Q": {}, "ESP1TeYZ": {}}, "timeZone": "EBxOq069", "zipCode": "HvXCjgIo"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdateMyProfile' test.out

#- 50 CreateMyProfile
./ng net.accelbyte.sdk.cli.Main basic createMyProfile \
    --namespace "$AB_NAMESPACE" \
    --body '{"avatarLargeUrl": "h5nrmwFo", "avatarSmallUrl": "hyW4EPl7", "avatarUrl": "bbUGlCDu", "customAttributes": {"cuizbGjm": {}, "iTdobFGF": {}, "mUdlTc8T": {}}, "dateOfBirth": "1979-11-09", "firstName": "Pdv1mITL", "language": "pAuy-trCI", "lastName": "MnLzy54n", "privateCustomAttributes": {"whNqiQ78": {}, "75Celhzt": {}, "HB1Sm1NH": {}}, "timeZone": "wkFwhKj9"}' \
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
    --body '{"xGInIDYh": {}, "fRtzMiwu": {}, "fWA1Zc1m": {}}' \
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
    --userZipCodeUpdate '{"zipCode": "5gQE7Khn"}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateMyZipCode' test.out

#- 55 PublicReportUser
./ng net.accelbyte.sdk.cli.Main basic publicReportUser \
    --namespace "$AB_NAMESPACE" \
    --userId 'J1Fevuy0' \
    --body '{"category": "nsVMbLmn", "description": "o3B5S3NW", "gameSessionId": "MQZaAfL1", "subcategory": "LmeTZk4u", "userId": "iJpqKsBN"}' \
    > test.out 2>&1
eval_tap $? 55 'PublicReportUser' test.out

#- 56 PublicGeneratedUserUploadContentUrl
./ng net.accelbyte.sdk.cli.Main basic publicGeneratedUserUploadContentUrl \
    --namespace "$AB_NAMESPACE" \
    --userId 'sCtYPnjE' \
    --category '96QNInwI' \
    --fileType 'VWPfSkwE' \
    > test.out 2>&1
eval_tap $? 56 'PublicGeneratedUserUploadContentUrl' test.out

#- 57 PublicGetUserProfileInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfileInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'sQP8rxhp' \
    > test.out 2>&1
eval_tap $? 57 'PublicGetUserProfileInfo' test.out

#- 58 PublicUpdateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'HN7URxJk' \
    --body '{"avatarLargeUrl": "5BKKIVR4", "avatarSmallUrl": "J1NyKdh5", "avatarUrl": "oHxA1ZzY", "customAttributes": {"dPaBcuHx": {}, "3CEaAO9i": {}, "am4f16zB": {}}, "dateOfBirth": "1981-06-24", "firstName": "n5ajMeSQ", "language": "cD-ooEM", "lastName": "X1DJwPfo", "timeZone": "cM3CD2zu", "zipCode": "KmXsNh1w"}' \
    > test.out 2>&1
eval_tap $? 58 'PublicUpdateUserProfile' test.out

#- 59 PublicCreateUserProfile
./ng net.accelbyte.sdk.cli.Main basic publicCreateUserProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'grkwEt5H' \
    --body '{"avatarLargeUrl": "S9y1xEPg", "avatarSmallUrl": "HzhbtjzQ", "avatarUrl": "NHzTEQNl", "customAttributes": {"7T4ShQ6B": {}, "O33zA579": {}, "hGwYqcOj": {}}, "dateOfBirth": "1998-10-19", "firstName": "afxbgDuh", "language": "Tb", "lastName": "ZGFfmBpH", "timeZone": "VHDbFhlh"}' \
    > test.out 2>&1
eval_tap $? 59 'PublicCreateUserProfile' test.out

#- 60 PublicGetCustomAttributesInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetCustomAttributesInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'BPKLKQiV' \
    > test.out 2>&1
eval_tap $? 60 'PublicGetCustomAttributesInfo' test.out

#- 61 PublicUpdateCustomAttributesPartially
./ng net.accelbyte.sdk.cli.Main basic publicUpdateCustomAttributesPartially \
    --namespace "$AB_NAMESPACE" \
    --userId '2rJOurK6' \
    --body '{"VVy05k42": {}, "aKi19x0r": {}, "4j518KeW": {}}' \
    > test.out 2>&1
eval_tap $? 61 'PublicUpdateCustomAttributesPartially' test.out

#- 62 PublicGetUserProfilePublicInfo
./ng net.accelbyte.sdk.cli.Main basic publicGetUserProfilePublicInfo \
    --namespace "$AB_NAMESPACE" \
    --userId 'lh79egHQ' \
    > test.out 2>&1
eval_tap $? 62 'PublicGetUserProfilePublicInfo' test.out

#- 63 PublicUpdateUserProfileStatus
./ng net.accelbyte.sdk.cli.Main basic publicUpdateUserProfileStatus \
    --namespace "$AB_NAMESPACE" \
    --userId 'MEpPDhYO' \
    --body '{"status": "ACTIVE"}' \
    > test.out 2>&1
eval_tap $? 63 'PublicUpdateUserProfileStatus' test.out


rm -f "tmp.dat"

exit $EXIT_CODE