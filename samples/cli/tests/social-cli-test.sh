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
echo "1..75"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespaceSlotConfig
./ng net.accelbyte.sdk.cli.Main social getNamespaceSlotConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'GetNamespaceSlotConfig' test.out

#- 3 UpdateNamespaceSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateNamespaceSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"maxSlotSize": 88, "maxSlots": 54}' \
    > test.out 2>&1
eval_tap $? 3 'UpdateNamespaceSlotConfig' test.out

#- 4 DeleteNamespaceSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteNamespaceSlotConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'DeleteNamespaceSlotConfig' test.out

#- 5 GetUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social getUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'i781ba37' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'aLdVcIOb' \
    --body '{"maxSlotSize": 81, "maxSlots": 28}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'agrpZ6rs' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'XFKgg2IE' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'AJ33rBUW' \
    --userId 'eiTFXeAK' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYKkWYoG' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '1RYOQGVb' \
    --userId '6Qen4Ucd' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'sgwM4mzn,HPP5kLOn,lvuKgmJR' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '4cQFSAEF' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'udVIn8JW' \
    --body '{"achievements": ["PVreJi2T", "geYuuV14", "85rocy2r"], "attributes": {"PyNCkoEc": "MYDf6aJ0", "ruEcIw8s": "Fi0wPphV", "ZXU5DJJt": "n3Kzztpn"}, "avatarUrl": "A7AlORUd", "inventories": ["3SYaEbPh", "3o4h1RHa", "jewpGA5M"], "label": "iy2nzEiA", "profileName": "y4aQg5z7", "statistics": ["JCQyy40k", "LEO2ukRt", "OioPGsDL"], "tags": ["bWQwpqtx", "T01MhkW6", "6bK6NbMX"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'GcJR2EHh' \
    --userId 'BLz9UONw' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '9Iu6Fs4I' \
    --userId 'N0R5GrBI' \
    --body '{"achievements": ["04rtjEJg", "luLUQQMs", "Q5QREzUO"], "attributes": {"Gmnh76eM": "CMGkYmWm", "PsfRV6CG": "jYKK1VoL", "u83njaFV": "MY0pnp8h"}, "avatarUrl": "7rsUHA9C", "inventories": ["v2VjecJG", "F81PUD8J", "8QloWr5Z"], "label": "JX2T2cEm", "profileName": "jyzSaRo7", "statistics": ["Ugqzg8Eu", "CEqP3t09", "AmkYjBok"], "tags": ["ub3S1Jyq", "RFyCCP9L", "qblYuhTn"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'd4TB8Z1A' \
    --userId 'eDSpyANq' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '7NTCQnuz' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'cuMBvrSX' \
    --userId '3mr11eZR' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'AjUIQfUJ' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Y5Mzq7nZ' \
    --userId 'iZjlCU6D' \
    --body '{"name": "EJVMVVvv", "value": "s0C4CqGf"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'EqObdTQB' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDjezlA1' \
    --label '6hTqJywE' \
    --tags '1CB3Ng7l,xJps5yu1,AICptSza' \
    --checksum 'QAmyJsgR' \
    --customAttribute '1IFbBudR' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'NNmCXdw4' \
    --userId 'MEFb5p9B' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'tI1Jq9vA' \
    --userId 'hHqH4C5C' \
    --label 'o0JIJ5f2' \
    --tags 'pm0PcyMh,Gx6RWLo4,wCdwd4gF' \
    --checksum 'bbMuPT1J' \
    --customAttribute 'kkFpgH9D' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'KOEIy9JX' \
    --userId '2fS4Tvuh' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'IvIIw6fM' \
    --userId 'CtbjhL8j' \
    --body '{"customAttribute": "kmUrfr5D", "label": "pWX96bAv", "tags": ["wvDVscdg", "x6sYPXSa", "Vkug2nQe"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PLd1UNtu' \
    --userIds '4y7MjaMq' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5266092534010002, "statCode": "F5oawxoz", "userId": "w08AjJTi"}, {"inc": 0.790100113085947, "statCode": "3JNRoLIb", "userId": "fN5BgGTJ"}, {"inc": 0.3861949211668452, "statCode": "Bgsu4tnU", "userId": "YtaghxFC"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8979972313872105, "statCode": "0g9doQYi", "userId": "ZWiKFNvd"}, {"inc": 0.4143824932000775, "statCode": "uU6jl0hI", "userId": "JIN6oDb6"}, {"inc": 0.07291623736124486, "statCode": "0lmu0Trm", "userId": "6XKKqo9r"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hoiVgTBu' \
    --userIds 'Tu38IOXH,IndU9Az3,kLE12lNV' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "2H7SWdpU", "userId": "mEOx9knL"}, {"statCode": "asJNbjRy", "userId": "LQCt60ig"}, {"statCode": "gS89PbjJ", "userId": "7AwdOKuK"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.3118756387653129, "description": "qL0rVetk", "incrementOnly": true, "maximum": 0.06654542358867022, "minimum": 0.27962908856423074, "name": "lYBciH4u", "setAsGlobal": true, "setBy": "SERVER", "statCode": "QZRwoPGj", "tags": ["rVN5LRli", "0i0SwGaQ", "rzKgUZAi"]}' \
    > test.out 2>&1
eval_tap $? 33 'CreateStat' test.out

#- 34 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'ExportStats' test.out

#- 35 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 35 'ImportStats' test.out

#- 36 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --limit '36' \
    --offset '5' \
    --keyword 'y2KkQGhU' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PMKuNABT' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eGomTvCN' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'My4LX78v' \
    --body '{"defaultValue": 0.35711662629797514, "description": "k3qH2Gbk", "name": "fmOCs8Lv", "tags": ["JfbYi8da", "2OHtf894", "7sxrt6CU"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'W6RLEy4X' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'chZBworz' \
    --limit '79' \
    --offset '82' \
    --statCodes '34I451ZK' \
    --tags 'BTRMKrB9' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bYikPq0C' \
    --body '[{"statCode": "iFyF5h7n"}, {"statCode": "LIkruuCG"}, {"statCode": "IBEe3O3S"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'so3ZQr16' \
    --body '[{"inc": 0.12096560253003152, "statCode": "qEy1YB8q"}, {"inc": 0.7134153600936819, "statCode": "GS3AhDFR"}, {"inc": 0.9442412477765694, "statCode": "B2qFn4No"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nhf0tszC' \
    --body '[{"inc": 0.8810549018867102, "statCode": "BYvEFoK5"}, {"inc": 0.15975123814785985, "statCode": "tHaRyl86"}, {"inc": 0.9591425374961086, "statCode": "btYFBxzX"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KOUamXhD' \
    --body '[{"statCode": "Y90gO5PF"}, {"statCode": "DmKFoIE4"}, {"statCode": "d5qRLVfS"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GM0rcPAL' \
    --userId '9ypVw8Zt' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '5kQZy2Sl' \
    --userId 'iQoGYslc' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 's7U5l9IP' \
    --userId 'HWmDTdoB' \
    --body '{"inc": 0.8472701825472981}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SHZI8CNs' \
    --userId 'tWg3TOBL' \
    --additionalKey 'IAp9xSOo' \
    --body '{"additionalData": {"FjciaMyg": {}, "Rmx1GPSs": {}, "vGANrvIM": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UGKpFrZ4' \
    --userIds 'U8R5hU7d' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5901616835529928, "statCode": "AD6IbMBs", "userId": "A9saXXlS"}, {"inc": 0.9925312811591113, "statCode": "PWX06YzH", "userId": "mZDU4V6e"}, {"inc": 0.5759421528759303, "statCode": "LROA5I7G", "userId": "bCd4NTGx"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7916225750999639, "statCode": "t3LkvAgI", "userId": "Hhw1Sl4D"}, {"inc": 0.9672239092514915, "statCode": "3gT91Kcx", "userId": "DaTt7C7Z"}, {"inc": 0.7645186019244508, "statCode": "RcypPuUG", "userId": "qdkYVjEZ"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "GjHk6mHy", "userId": "vxr71YPE"}, {"statCode": "d5DJxNeN", "userId": "QjHA7hyX"}, {"statCode": "MPrpeLtS", "userId": "6mozswhE"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.9021041855152366, "description": "4V65KZXX", "incrementOnly": false, "maximum": 0.29485256604049526, "minimum": 0.4055165520231133, "name": "S9Br4o1O", "setAsGlobal": true, "setBy": "SERVER", "statCode": "eAtCjLZN", "tags": ["4EMoCT1V", "FDIVsm8H", "6OsvUrTf"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zua6gO4h' \
    --limit '20' \
    --offset '44' \
    --statCodes 'lJHdddxl' \
    --tags 'Ecudpzt7' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'b1OghVzY' \
    --body '[{"statCode": "KliVT6ZO"}, {"statCode": "HiYlUWEG"}, {"statCode": "vam9qmLC"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QzCYJV6k' \
    --statCodes 'E0qUxS2V,CCamJYVT,sWa8m3Gv' \
    --tags 'KN4NcVnd,QkwvpOlF,fD7YhphK' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WDdwVGBb' \
    --body '[{"inc": 0.35129699457569763, "statCode": "iSK2TqyJ"}, {"inc": 0.7674380975923721, "statCode": "F4FWgi8R"}, {"inc": 0.7463997591667706, "statCode": "CHKYYSUr"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kx0N8KeR' \
    --body '[{"inc": 0.8794688509303789, "statCode": "ir3KM1rn"}, {"inc": 0.6496790675390033, "statCode": "LFrOBxuB"}, {"inc": 0.8620714602266975, "statCode": "OgH0Z6GA"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IydpVNtF' \
    --body '[{"statCode": "rqrVeIXq"}, {"statCode": "woTUt59x"}, {"statCode": "SZ9y4ukF"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zI061ipR' \
    --userId 'wwtWCRuv' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '5JBCATSj' \
    --userId 'cfitbWSo' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'J0p5K8jI' \
    --userId 'YwUKNIoY' \
    --body '{"inc": 0.09484795707297855}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'D00axr74' \
    --userId 'zFfnOmBw' \
    --body '{"inc": 0.30358557492497473}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '7u2OTvKA' \
    --userId 'i62qhHPJ' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"DTSCwSb3": {}, "IBhQcWGX": {}, "H2loKatG": {}}, "additionalKey": "vn9KXhey", "statCode": "0xDw0XcP", "updateStrategy": "MAX", "userId": "0kptqpdC", "value": 0.6923324845339621}, {"additionalData": {"e0kj5F9W": {}, "0yO72gDA": {}, "QkOR7mZ1": {}}, "additionalKey": "bkgu3LHS", "statCode": "ZEInEtcX", "updateStrategy": "MAX", "userId": "S8LHEcsH", "value": 0.4527970626165617}, {"additionalData": {"pS2pB67u": {}, "hjtUzRH9": {}, "WlskO9TS": {}}, "additionalKey": "Dm5PM2hK", "statCode": "bVq4Vnhk", "updateStrategy": "OVERRIDE", "userId": "xd6qaqAy", "value": 0.46937458405593424}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'VCQalh3C' \
    --statCode 'CqL9d17V' \
    --userIds 'AL4An9AW,c0S4QakQ,1CCMZCnn' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'tOTVln0R' \
    --additionalKey 'pMCrC3xI' \
    --body '[{"additionalData": {"ywrpiRq3": {}, "kOvYY5zm": {}, "rAC4J2WR": {}}, "statCode": "4BZRvM4p", "updateStrategy": "MAX", "value": 0.15083134229119288}, {"additionalData": {"x0j5E1gw": {}, "d85KHsuR": {}, "lsbGAGaW": {}}, "statCode": "rX5Tc8SD", "updateStrategy": "MIN", "value": 0.27123863155055394}, {"additionalData": {"q2wFsF7h": {}, "3hpsgSmf": {}, "tIi9vszN": {}}, "statCode": "luev81qa", "updateStrategy": "MAX", "value": 0.33220304702543946}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'cNygnIXo' \
    --additionalKey 'dJwtpYEC' \
    --body '[{"additionalData": {"FX4QjmYG": {}, "FYAVxgVO": {}, "svq4CrdB": {}}, "statCode": "S3CGLnZx"}, {"additionalData": {"Qv2yBwGi": {}, "73BjvlLi": {}, "eowevqPb": {}}, "statCode": "iHgGpBI1"}, {"additionalData": {"dNFLwzWu": {}, "mg4VXzcO": {}, "IlKlZ0qu": {}}, "statCode": "7jsKepVX"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WgzHyirc' \
    --userId 'CYstGYJQ' \
    --additionalKey 'oAVGGEC0' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SkRsznO8' \
    --userId 'Sn5BzNTn' \
    --additionalKey '7wDnXcVU' \
    --body '{"additionalData": {"COkNcUNW": {}, "rGwLKnWn": {}, "6puYuEij": {}}, "updateStrategy": "OVERRIDE", "value": 0.018842867347643066}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"m0Zs9ok5": {}, "MfUrnEaJ": {}, "cfvu0XgT": {}}, "additionalKey": "O3oH74ZZ", "statCode": "zzhLKdp5", "updateStrategy": "MIN", "userId": "J4H7qcwm", "value": 0.07981995287542676}, {"additionalData": {"fXh1Zjbe": {}, "nAr14hBb": {}, "EmRKyPEf": {}}, "additionalKey": "iOHB0Tth", "statCode": "E7QWmOwd", "updateStrategy": "INCREMENT", "userId": "UgfecaF9", "value": 0.35800915753686735}, {"additionalData": {"OogWhNOz": {}, "p4HrjkQI": {}, "hpOaPzto": {}}, "additionalKey": "qTKJ5DCz", "statCode": "KP8Bth8x", "updateStrategy": "OVERRIDE", "userId": "SOrZEunZ", "value": 0.009990037504622018}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VdQ8MmQj' \
    --additionalKey 'lMJrEK74' \
    --statCodes 'lPEkQcdI,uowWsl64,8ShzVJDn' \
    --tags 'J7QnI4k2,v6l35TXA,YmucE1ng' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p3izqTej' \
    --additionalKey 'SoP4PXF4' \
    --body '[{"additionalData": {"lud1d4P3": {}, "8jY4gqIj": {}, "c00WIdAN": {}}, "statCode": "yp1uKQhN", "updateStrategy": "OVERRIDE", "value": 0.1892953657203681}, {"additionalData": {"FNViEFkP": {}, "4y8qr8hj": {}, "bkEx3Lst": {}}, "statCode": "f7juduqS", "updateStrategy": "MIN", "value": 0.8852943826601221}, {"additionalData": {"Iw98YwSs": {}, "1wqcEqsr": {}, "0cXBYe4G": {}}, "statCode": "PAn6zhVB", "updateStrategy": "OVERRIDE", "value": 0.3066368293184586}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ovFR45Hs' \
    --userId 'hziT4Nxv' \
    --additionalKey 'S0JKuPKs' \
    --body '{"additionalData": {"QLI6bAJh": {}, "MqX7YaVg": {}, "duNwJYhF": {}}, "updateStrategy": "MAX", "value": 0.9763744959118452}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE