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
echo "1..74"

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
    --body '{"maxSlotSize": 59, "maxSlots": 8}' \
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
    --userId 'Ibfuf56i' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'kfppCSG7' \
    --body '{"maxSlotSize": 46, "maxSlots": 76}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'TaQY1egw' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ij4Eqdue' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Zr5I5loS' \
    --userId 'DYRcI1p8' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'QE24AJs0' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'vhyLVSwH' \
    --userId 'Xn1Y7a33' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'FMzAI9lG,Pw0e07J3,ye2xJuUS' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'n90xKN0y' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'UGR9s2EO' \
    --body '{"achievements": ["IRB53Hso", "zumUkZEv", "adtfar0x"], "attributes": {"S8nQikMj": "xejgmQI3", "tISOcpvh": "OSkH3M9c", "wD8mpvXl": "EWzGPDwe"}, "avatarUrl": "HbH9X8G0", "inventories": ["RpXwcPO1", "t4Rw2pA6", "OXVBaZRo"], "label": "YmHtzGme", "profileName": "DvMLYP47", "statistics": ["F8zDxahO", "82L03uux", "ZXSUEPMt"], "tags": ["z9YBZ4xm", "uoIYcWhe", "DcKkszOj"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '1MMRTrfF' \
    --userId 'NUnC44oa' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '0IYCJosw' \
    --userId 'jYrscVhk' \
    --body '{"achievements": ["5bqCQhQK", "H5nGt2eV", "8QErCQ8X"], "attributes": {"0aOKIS4a": "kuIuHNGs", "DkLnq1yP": "VNVJNYFP", "hzyRBlsW": "hHy00FOi"}, "avatarUrl": "HOB9QZvf", "inventories": ["ArxMj5AK", "lde7XDvr", "L4vIZb8m"], "label": "hlvGwTRI", "profileName": "oXDStMgs", "statistics": ["NcYPsqeT", "MvC624sn", "TY49zcWg"], "tags": ["N7dAqc8v", "dAbrADNo", "6bw2H1Mn"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'sJh9SVfp' \
    --userId 'U6gN8oTg' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'XDEY0dX9' \
    --namespace "$AB_NAMESPACE" \
    --profileId '42rDQUoU' \
    --userId 'j36BytyZ' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'Vq6Nv36c' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'N5K7vnVJ' \
    --userId 'bD7zJ35F' \
    --body '{"name": "0vtyiX1g", "value": "P0fEDbTT"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '6FhLvYsR' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'qW84kolX' \
    --label 'GvJwRSxP' \
    --tags 'FoDJKGxL,4skMTdJc,8g8BnUO1' \
    --checksum 'bLlGV7ji' \
    --customAttribute 'Mg3P7hYk' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'wAryhthQ' \
    --userId 'IpFOoHu1' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId '39LUZWHA' \
    --userId 'qsHZLHkR' \
    --label 'OYctu5jT' \
    --tags '3CjEhRBB,y33Jxho8,IkrOmJjz' \
    --checksum 'jjNvZRwE' \
    --customAttribute 'voUlT8b4' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'VS1rpBur' \
    --userId '67X4Rnqs' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId '6Pz77S59' \
    --userId '7Vyd3fPP' \
    --body '{"customAttribute": "31MN5Q8u", "label": "Lb1zjUzx", "tags": ["UNbSX5yP", "YyUvxJOo", "gThYMbVu"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OLu9ZT4s' \
    --userIds 'MfbM0ZRl' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.09635985158165394, "statCode": "4YvFPTUf", "userId": "hrsYXzB3"}, {"inc": 0.37336232724825413, "statCode": "KCws8qgR", "userId": "umA1GDjJ"}, {"inc": 0.6084168172416966, "statCode": "hiZ3z6iP", "userId": "gVLziZVg"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7183795527096565, "statCode": "01VVgsC4", "userId": "VKRGaYh3"}, {"inc": 0.2810690342997767, "statCode": "AzhhaZtl", "userId": "qnBqzpQm"}, {"inc": 0.549660555497974, "statCode": "VJchEa8c", "userId": "BcajtEvp"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Uxtandwf' \
    --userIds 'zXcJrZBT,5wWAim4E,NHqyZw40' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "1dTSqiGO", "userId": "ZBG9ND0i"}, {"statCode": "7ZitH9PK", "userId": "cElzeiAh"}, {"statCode": "q5nsxdoZ", "userId": "JNQ1oLvS"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '52' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.81964436761568, "description": "tUnzllfN", "incrementOnly": false, "maximum": 0.7504995028652269, "minimum": 0.9083535971766555, "name": "brd2t7r3", "setAsGlobal": false, "setBy": "SERVER", "statCode": "oYPKRLIo", "tags": ["NpNmN7KM", "RlBvkfeW", "FG2zTHKV"]}' \
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
    --limit '24' \
    --offset '38' \
    --keyword 'nZUAV5Hx' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UupDyEzi' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'btkpLKfD' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eApbGOIp' \
    --body '{"description": "cPrtxrn4", "name": "CN3A1LkY", "tags": ["jmYS12Ro", "uCUwN6zT", "t8gJBTG7"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'RhXQUtCz' \
    --limit '96' \
    --offset '10' \
    --statCodes '50EmfdJp' \
    --tags '8B5kuSbl' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'UbZCIEJC' \
    --body '[{"statCode": "6rYfbaOg"}, {"statCode": "VuhDwP85"}, {"statCode": "Gw3z6MtB"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XF0GxYWL' \
    --body '[{"inc": 0.20263656314637646, "statCode": "RmCatOGE"}, {"inc": 0.7080187685996497, "statCode": "gDU6Q8wl"}, {"inc": 0.05971964444628175, "statCode": "CLcElQZL"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vL7NgVei' \
    --body '[{"inc": 0.14186805745747588, "statCode": "AyrkDega"}, {"inc": 0.286234857028528, "statCode": "Y3garjDV"}, {"inc": 0.6689301641152393, "statCode": "QgS4ToZQ"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Si7dD01j' \
    --body '[{"statCode": "vtvegaT4"}, {"statCode": "XfNs25Qk"}, {"statCode": "KVwmE3BZ"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iCco3kt0' \
    --userId '5s1JdpRb' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Jza5hMjf' \
    --userId 'Ghq4MYsw' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '1iUe0laA' \
    --userId 'xmXKVyE0' \
    --body '{"inc": 0.6046827153411449}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '96hbUQA7' \
    --userId 'SbEEm5Er' \
    --additionalKey 'c23WO5We' \
    --body '{"additionalData": {"bhrzW34K": {}, "UwnX7oT7": {}, "DLIdDoks": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2dbd6apS' \
    --userIds '4Rf87MsT' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.16183517315290574, "statCode": "HWfIdjbk", "userId": "soLR3LLY"}, {"inc": 0.5666116197869275, "statCode": "2r8o6TP1", "userId": "tlD25whn"}, {"inc": 0.6945473392091083, "statCode": "sFcsb2q2", "userId": "hJy9vAHP"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5490044054827065, "statCode": "ocIlArx3", "userId": "UyxAvy9G"}, {"inc": 0.6857109750790527, "statCode": "yrC9PzWk", "userId": "6qFXPKu0"}, {"inc": 0.7221342407677331, "statCode": "W5TcnCto", "userId": "PoIGcEt4"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Xe5X7vrm", "userId": "rQTXaZSv"}, {"statCode": "oNAnol7W", "userId": "vu4INjPV"}, {"statCode": "J8FGZXLL", "userId": "jE1OgIPs"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.4087824044449534, "description": "7tiid0nN", "incrementOnly": true, "maximum": 0.14731767447192246, "minimum": 0.1536649094930328, "name": "GzOpDBED", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "xnwck3eS", "tags": ["QOqqfwc9", "FDWntLld", "D47PO0kR"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJG1E6FD' \
    --limit '29' \
    --offset '74' \
    --statCodes 'cLJLV4mA' \
    --tags 'OKEb5pJS' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'diAD0OJq' \
    --body '[{"statCode": "Z8AnSZ76"}, {"statCode": "bFXHsxoo"}, {"statCode": "wO2tPttT"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oV65o43b' \
    --statCodes '2QRZshiT,Klvk3aYP,9503vF72' \
    --tags 'l98xZzM3,YdsdTpb6,ErQEXCZQ' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rVNS1SIR' \
    --body '[{"inc": 0.14696719379349987, "statCode": "9ebGrwkI"}, {"inc": 0.6993518158374941, "statCode": "IDX25CkQ"}, {"inc": 0.8226863438793116, "statCode": "gVxpMKzd"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bMovVBcf' \
    --body '[{"inc": 0.8280048576190163, "statCode": "iisFrklY"}, {"inc": 0.2406427283443855, "statCode": "gchssCAP"}, {"inc": 0.9959251118306662, "statCode": "UZubMAti"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yWXNX3pH' \
    --body '[{"statCode": "SIz1r3vJ"}, {"statCode": "M3lsnq6X"}, {"statCode": "9RPMgQ3j"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cB0JUEXt' \
    --userId 'CaxD5nBJ' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VP4p26V3' \
    --userId 'lK0561LZ' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '37qF25Vg' \
    --userId 'CxGlCxlc' \
    --body '{"inc": 0.044738652532700485}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZBncRru7' \
    --userId '8oIFtkKd' \
    --body '{"inc": 0.3710823468400961}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Def3Ndfy' \
    --userId 'TKoTn29b' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"urD5Egvj": {}, "HkkdHohi": {}, "DD28vB8g": {}}, "additionalKey": "Eld82em5", "statCode": "si4ijnVE", "updateStrategy": "MIN", "userId": "G21jB9K4", "value": 0.5375539219239364}, {"additionalData": {"tgmOej1h": {}, "WjnAU7CY": {}, "t02kSDSS": {}}, "additionalKey": "G5CbPiBw", "statCode": "ryDqZE2k", "updateStrategy": "MAX", "userId": "ItlnMC7Z", "value": 0.24508943729465837}, {"additionalData": {"TMS0e644": {}, "MrBRRX53": {}, "8fxlf51x": {}}, "additionalKey": "wlWA7fga", "statCode": "Wrm2j4DX", "updateStrategy": "MAX", "userId": "cUwIxvsQ", "value": 0.3319772212760068}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '4lnWL4RL' \
    --statCode 'jJYusjV6' \
    --userIds 'Rmd9E3IE,GOIbTLOy,SX6QJqzk' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '9VCLPBUI' \
    --additionalKey 'eeqzCpUv' \
    --body '[{"additionalData": {"9nHXl0Cv": {}, "W2HYrNE9": {}, "cOwSRHtm": {}}, "statCode": "ZddM0jyg", "updateStrategy": "OVERRIDE", "value": 0.3215641233959199}, {"additionalData": {"YDAuec0R": {}, "2PY8fEc9": {}, "o3q08gW4": {}}, "statCode": "HCHYX4lu", "updateStrategy": "MAX", "value": 0.7667874600769368}, {"additionalData": {"PG54Wgmx": {}, "JyuxQIBz": {}, "AWCmUoXp": {}}, "statCode": "JjEvNSEb", "updateStrategy": "INCREMENT", "value": 0.9753343272048576}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'l4psnQeR' \
    --additionalKey 'PqMWD2jg' \
    --body '[{"additionalData": {"JNcSO8dH": {}, "4mNZp1od": {}, "o1ZOfkVA": {}}, "statCode": "cpm7KtTW"}, {"additionalData": {"nFLJVKLq": {}, "BYZEyDeL": {}, "IoJcPX53": {}}, "statCode": "FC92ksqX"}, {"additionalData": {"jRLWcj5b": {}, "ZzLuqU1q": {}, "ZJaOZC4u": {}}, "statCode": "YHw5nNEL"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cU3nJ4XA' \
    --userId 'Zx8cREGc' \
    --additionalKey 'y6SxpnZM' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '4vrKdzr3' \
    --userId 'VwvmPzmv' \
    --additionalKey '8ZoGQPcC' \
    --body '{"additionalData": {"Q1NVGZHq": {}, "X3C9CHjG": {}, "dSXpEpNP": {}}, "updateStrategy": "OVERRIDE", "value": 0.06675408644682035}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"y8NMTCWZ": {}, "SQJaB6hS": {}, "A60AG5Vp": {}}, "additionalKey": "lW76uL8d", "statCode": "gaLZgAE6", "updateStrategy": "MAX", "userId": "1yHIKsfJ", "value": 0.7441161906251522}, {"additionalData": {"FVUz8Zyc": {}, "1rgmoCpr": {}, "yKNzETK7": {}}, "additionalKey": "avCkrfie", "statCode": "5fRXoKS0", "updateStrategy": "INCREMENT", "userId": "xMYl0wXy", "value": 0.4161691603561021}, {"additionalData": {"Thf1Cjw5": {}, "nha1P7Eg": {}, "Qs8jFyCX": {}}, "additionalKey": "EYJC6AVD", "statCode": "yWrsBxh0", "updateStrategy": "OVERRIDE", "userId": "x5vZgpev", "value": 0.8623297171933336}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ct5OKDAX' \
    --additionalKey 'c1jf0Du0' \
    --statCodes 's59leC7u,3w97pI9l,vAb2j2FP' \
    --tags 'EkcGYnPK,VUb1ZKYn,t44lpwWv' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bAsJFzon' \
    --additionalKey 'OIxIqAYP' \
    --body '[{"additionalData": {"oRCmGWWS": {}, "zVo5iSMW": {}, "X27L2YnA": {}}, "statCode": "6fGJyFCL", "updateStrategy": "OVERRIDE", "value": 0.5948785299636251}, {"additionalData": {"fuUnmt3i": {}, "jBuaRViV": {}, "jlCUHWWC": {}}, "statCode": "Bgv6LVft", "updateStrategy": "OVERRIDE", "value": 0.9864800960907282}, {"additionalData": {"X57NNNAu": {}, "N4232dlI": {}, "Hk6EzAfw": {}}, "statCode": "WzmNRV48", "updateStrategy": "INCREMENT", "value": 0.046311852556228494}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JBzHrMGk' \
    --userId '22I9yGxu' \
    --additionalKey 'DBm5YbLo' \
    --body '{"additionalData": {"2RtlMp9K": {}, "BDulLi9Y": {}, "JYUF7mUx": {}}, "updateStrategy": "MIN", "value": 0.27017274046851836}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE