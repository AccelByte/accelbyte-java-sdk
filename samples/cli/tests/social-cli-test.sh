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
echo "1..89"

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
    --body '{"maxSlotSize": 62, "maxSlots": 39}' \
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
    --userId 'AxcVpFrt' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'tufHIRdH' \
    --body '{"maxSlotSize": 4, "maxSlots": 95}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '09nIW0Oa' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'iw9B0D7e' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'HpzSn3ZP' \
    --userId 'Udc0qh4n' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '8mzZ0m8S' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'AMTwE6I5' \
    --userId '6IaRDBXx' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'yaNoMR6h,kspInrAi,p6lyzSxw' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'ElFHHdgs' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '21Jub74C' \
    --body '{"achievements": ["UkNmKJfh", "5pUkHODp", "oMF78NY4"], "attributes": {"YkHs1cnz": "1JSDgY1T", "Xp38zsCT": "CrbCbPOy", "NQkT7Nvy": "E3cwyALc"}, "avatarUrl": "zNIicXm7", "inventories": ["agSrjJW2", "OQNOs1PX", "hT5FvdiR"], "label": "ilZ7oFgx", "profileName": "4c8OumKt", "statistics": ["PDKJDXn7", "Z4U68su8", "XfqlqNiT"], "tags": ["vB6SdAdI", "hUDrwoZ5", "MecdKi5r"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '6QEa1ysL' \
    --userId 'Ezth6mXh' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'zkzWkFeZ' \
    --userId 'SoEAcBdW' \
    --body '{"achievements": ["19m4eu6d", "5tA5jUmi", "TqpyhPFd"], "attributes": {"xLzFQN05": "MYzYiKWe", "5dNRljv7": "IPrDQQRg", "at0SevkL": "GMS0lyuI"}, "avatarUrl": "9a2I9u6V", "inventories": ["pbsx5w8h", "qUI06UpO", "XGSLmCVu"], "label": "HOPlLlkv", "profileName": "R8sKgnuR", "statistics": ["kgghGoYu", "pD391C2q", "tPYokahF"], "tags": ["jkQsfCaT", "mt1d67FX", "Gk2s9Q0m"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'PVo3twu0' \
    --userId 'MesTCf9x' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '4rt69lna' \
    --namespace "$AB_NAMESPACE" \
    --profileId '7qxNeIxP' \
    --userId 'z6MbwL6I' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'Y69z1UaL' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'qYSYWytL' \
    --userId 'PziZMdjx' \
    --body '{"name": "cBZufQxG", "value": "iHPllG4c"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'YEzfTD1Z' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bm3MqHcU' \
    --label 'mLZZbSqb' \
    --tags '8RwNmn9H,rNQy4uZA,AiE0mit9' \
    --checksum 'RGCCHYzU' \
    --customAttribute 'OcEdscKH' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'PEqgA8yu' \
    --userId '7Vk6Jt4Y' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'mos9Jcdo' \
    --userId 's4fYcTVU' \
    --label '6RBt0zYo' \
    --tags 'McHyCUEX,lAvxJMda,lwSyliWM' \
    --checksum 'NW5NyLu0' \
    --customAttribute 'M3VHh2EI' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId '8JlDbPWb' \
    --userId 'Q6Q9lNmq' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'RBaAkLnv' \
    --userId 'xkT1X68c' \
    --body '{"customAttribute": "mDc3fxU8", "label": "MyKrQpM4", "tags": ["hkkK6KKX", "NB3Gv0Iq", "mF51Tkhj"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '1' \
    --statCodes 'YUDjasWI' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PUvmEejt' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '8' \
    --name 'kILsSSyD' \
    --offset '7' \
    --sortBy 'rvjj7il3' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "bN9oCMNq", "end": "1979-12-30T00:00:00Z", "name": "98SjTvhZ", "resetDate": 81, "resetDay": 95, "resetMonth": 21, "resetTime": "kl535X3a", "seasonPeriod": 40, "start": "1985-02-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'XksUC9b6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetStatCycle' test.out

#- 31 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'i5lZC9xv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "2e8c5csS", "end": "1978-08-02T00:00:00Z", "name": "voqsZNBd", "resetDate": 40, "resetDay": 25, "resetMonth": 9, "resetTime": "XgdAPh1E", "seasonPeriod": 92, "start": "1975-01-23T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateStatCycle' test.out

#- 32 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'G96gAFKK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'DeleteStatCycle' test.out

#- 33 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId '2WDgCcxv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["ONZm3EeE", "RmDnyeFo", "F7VSZ6pf"]}' \
    > test.out 2>&1
eval_tap $? 33 'BulkAddStats' test.out

#- 34 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId '3vneSD2T' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'StopStatCycle' test.out

#- 35 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'b3g7mSQU' \
    --userIds 'hAEtrmjq' \
    > test.out 2>&1
eval_tap $? 35 'BulkFetchStatItems' test.out

#- 36 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.747115592753617, "statCode": "6YE3p4lS", "userId": "ck0ZHn5G"}, {"inc": 0.54840393791272, "statCode": "39YBHqaT", "userId": "HeKtW18i"}, {"inc": 0.5161771901423301, "statCode": "eUlc9d9s", "userId": "ogWa24CK"}]' \
    > test.out 2>&1
eval_tap $? 36 'BulkIncUserStatItem' test.out

#- 37 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6324365135621759, "statCode": "S0GqVvUf", "userId": "HQvsHXNU"}, {"inc": 0.6348420236736524, "statCode": "e4mhgo5Q", "userId": "B65lSAiY"}, {"inc": 0.21449890917305725, "statCode": "NjkfZrQv", "userId": "GgbLdLsF"}]' \
    > test.out 2>&1
eval_tap $? 37 'BulkIncUserStatItemValue' test.out

#- 38 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zHkBMr1y' \
    --userIds 'rOMlNFSr,UEirnjX9,fDmIbeZx' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchOrDefaultStatItems' test.out

#- 39 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "zfTcyiuA", "userId": "Tus9hsfp"}, {"statCode": "FDcSDG8a", "userId": "MVGLiBNr"}, {"statCode": "Djqoxcwg", "userId": "GLXpUL4p"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkResetUserStatItem' test.out

#- 40 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'p2ncYAHd' \
    --isGlobal  \
    --limit '82' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 40 'GetStats' test.out

#- 41 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["zDmeIP6r", "OvDz9KOs", "b392k6Ym"], "defaultValue": 0.5793456161760823, "description": "FfRByjlB", "incrementOnly": false, "maximum": 0.9967557290714741, "minimum": 0.605745334271637, "name": "JE8HoRS1", "setAsGlobal": false, "setBy": "SERVER", "statCode": "AnkCmBUq", "tags": ["X9y1aZSW", "MiVi10sG", "g2SCnqnt"]}' \
    > test.out 2>&1
eval_tap $? 41 'CreateStat' test.out

#- 42 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'ExportStats' test.out

#- 43 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 43 'ImportStats' test.out

#- 44 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '85' \
    --offset '44' \
    --keyword 'MMWH8Yb3' \
    > test.out 2>&1
eval_tap $? 44 'QueryStats' test.out

#- 45 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '3T5UBJCj' \
    > test.out 2>&1
eval_tap $? 45 'GetStat' test.out

#- 46 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fcnLRfxe' \
    > test.out 2>&1
eval_tap $? 46 'DeleteStat' test.out

#- 47 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CSz9WEi8' \
    --body '{"cycleIds": ["vQR3biBf", "T1yduat2", "KlloeH0J"], "defaultValue": 0.3013449407187887, "description": "u4jmsRE2", "name": "w1yEkLgh", "tags": ["IiDandpG", "3tIYt4Sq", "YUTLDx9g"]}' \
    > test.out 2>&1
eval_tap $? 47 'UpdateStat' test.out

#- 48 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'T2t24aOM' \
    > test.out 2>&1
eval_tap $? 48 'DeleteTiedStat' test.out

#- 49 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'h5eC3IHe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HSKLCa3x' \
    --limit '36' \
    --offset '62' \
    --sortBy 'eNDUWehw' \
    --statCodes 'H3q31A80' \
    > test.out 2>&1
eval_tap $? 49 'GetUserStatCycleItems' test.out

#- 50 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6DJgas4b' \
    --limit '9' \
    --offset '52' \
    --sortBy '2NubeoKF' \
    --statCodes 'eIaFQCYo' \
    --tags 'DPICpndu' \
    > test.out 2>&1
eval_tap $? 50 'GetUserStatItems' test.out

#- 51 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'EEQlULdJ' \
    --body '[{"statCode": "z4mnRBkM"}, {"statCode": "NxvvKgAT"}, {"statCode": "8mJrYq6h"}]' \
    > test.out 2>&1
eval_tap $? 51 'BulkCreateUserStatItems' test.out

#- 52 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RkloqxM3' \
    --body '[{"inc": 0.10367847984225909, "statCode": "pwxcfMy9"}, {"inc": 0.7980207635596597, "statCode": "zjjI5Ybs"}, {"inc": 0.5855707421112814, "statCode": "oADkzJEN"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkIncUserStatItem1' test.out

#- 53 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2VHzih3b' \
    --body '[{"inc": 0.1311058474844543, "statCode": "t0VWn3CO"}, {"inc": 0.8935408572997413, "statCode": "9PXDNxtX"}, {"inc": 0.10192715174780542, "statCode": "eO3FgkXh"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkIncUserStatItemValue1' test.out

#- 54 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jDzaQY3s' \
    --body '[{"statCode": "nn2ZkP7c"}, {"statCode": "FdP43e5d"}, {"statCode": "C9XIBudf"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkResetUserStatItem1' test.out

#- 55 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZgrbHDID' \
    --userId 'm4hMzF4T' \
    > test.out 2>&1
eval_tap $? 55 'CreateUserStatItem' test.out

#- 56 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xodenSrU' \
    --userId 'TvfqU0bf' \
    > test.out 2>&1
eval_tap $? 56 'DeleteUserStatItems' test.out

#- 57 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oMm5cTtF' \
    --userId 'WbotQyXJ' \
    --body '{"inc": 0.6938342937594209}' \
    > test.out 2>&1
eval_tap $? 57 'IncUserStatItemValue' test.out

#- 58 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cQWsmqPN' \
    --userId 's92epxk0' \
    --additionalKey 'i8VxsZNe' \
    --body '{"additionalData": {"reSvf969": {}, "9mCEHThU": {}, "JkETAsSp": {}}}' \
    > test.out 2>&1
eval_tap $? 58 'ResetUserStatItemValue' test.out

#- 59 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '13' \
    --statCodes '2imdb4rb' \
    > test.out 2>&1
eval_tap $? 59 'GetGlobalStatItems1' test.out

#- 60 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kXj0ZwsV' \
    > test.out 2>&1
eval_tap $? 60 'GetGlobalStatItemByStatCode1' test.out

#- 61 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '93' \
    --name '0gL97ZVJ' \
    --offset '91' \
    --sortBy 'Y2QD3oD5' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 61 'GetStatCycles1' test.out

#- 62 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'lYB1RSKs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'GetStatCycle1' test.out

#- 63 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '6gQxC3Gb' \
    --userIds '7S0o4zGY' \
    > test.out 2>&1
eval_tap $? 63 'BulkFetchStatItems1' test.out

#- 64 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.822578351801482, "statCode": "7KQI1AeF", "userId": "gPqaOkvo"}, {"inc": 0.8586697300419737, "statCode": "aolB4lkK", "userId": "B4EYOkQ1"}, {"inc": 0.14518909285827208, "statCode": "MD3cym8x", "userId": "IfkOVW2g"}]' \
    > test.out 2>&1
eval_tap $? 64 'PublicBulkIncUserStatItem' test.out

#- 65 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2896960635468795, "statCode": "REOLx0KO", "userId": "ww3HICQL"}, {"inc": 0.09323791644497659, "statCode": "l7MUBG7q", "userId": "tPu64yAt"}, {"inc": 0.7570414055710353, "statCode": "RKLRkb73", "userId": "8HGS6rDg"}]' \
    > test.out 2>&1
eval_tap $? 65 'PublicBulkIncUserStatItemValue' test.out

#- 66 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "MdIIlhS1", "userId": "fSiM9331"}, {"statCode": "m7Ta1PsK", "userId": "c50Kv6ec"}, {"statCode": "nEevcAx2", "userId": "K2zkRenm"}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkResetUserStatItem2' test.out

#- 67 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["PZnGBt4P", "7WnbdSJt", "jX7ZshZy"], "defaultValue": 0.8293567122625791, "description": "l5x4bRXB", "incrementOnly": true, "maximum": 0.75107051173064, "minimum": 0.7417007734915865, "name": "rDzZSKsc", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "OcYu3dpC", "tags": ["ROYqUiGK", "sPwVOEDS", "XVFCmpo6"]}' \
    > test.out 2>&1
eval_tap $? 67 'CreateStat1' test.out

#- 68 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'JsEK5QpN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hlI2iS5E' \
    --limit '31' \
    --offset '71' \
    --sortBy 'GhhvXYck' \
    --statCodes '0upMzUYn' \
    > test.out 2>&1
eval_tap $? 68 'GetUserStatCycleItems1' test.out

#- 69 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'b76tFkEO' \
    --limit '89' \
    --offset '77' \
    --sortBy 'V3bu1bNC' \
    --statCodes 'tX7W40V6' \
    --tags 'Do5sYadC' \
    > test.out 2>&1
eval_tap $? 69 'PublicQueryUserStatItems' test.out

#- 70 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'CFrHHC3D' \
    --body '[{"statCode": "pZxkrQDX"}, {"statCode": "uNFviMar"}, {"statCode": "v8mnfHK8"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkCreateUserStatItems' test.out

#- 71 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCmE2lPn' \
    --statCodes 'sbD3SGEd,lwuUccE5,36ugBp3H' \
    --tags 'BvepnDCj,gyJlXe36,mgWjLfFm' \
    > test.out 2>&1
eval_tap $? 71 'PublicQueryUserStatItems1' test.out

#- 72 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'teue9nzJ' \
    --body '[{"inc": 0.9369018709147585, "statCode": "fH24T805"}, {"inc": 0.31469905533586573, "statCode": "Vg8JqU0j"}, {"inc": 0.8315731515190536, "statCode": "pjvsugAO"}]' \
    > test.out 2>&1
eval_tap $? 72 'PublicBulkIncUserStatItem1' test.out

#- 73 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'S7u8RiWy' \
    --body '[{"inc": 0.0682576045791271, "statCode": "rCSa8SRg"}, {"inc": 0.365027793890249, "statCode": "sAj1ik1j"}, {"inc": 0.10007398301860815, "statCode": "laDXTvKC"}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkIncUserStatItemValue2' test.out

#- 74 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WwNTAhd2' \
    --body '[{"statCode": "wrS0uPdj"}, {"statCode": "hdinpng5"}, {"statCode": "BLy8wbhM"}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkResetUserStatItem3' test.out

#- 75 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ssAHjapI' \
    --userId 'kY9Rf4wP' \
    > test.out 2>&1
eval_tap $? 75 'PublicCreateUserStatItem' test.out

#- 76 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '57dBZNR8' \
    --userId '8YbCtmKy' \
    > test.out 2>&1
eval_tap $? 76 'DeleteUserStatItems1' test.out

#- 77 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '8M9zVrjf' \
    --userId 'GXZnqAQU' \
    --body '{"inc": 0.23748281182047282}' \
    > test.out 2>&1
eval_tap $? 77 'PublicIncUserStatItem' test.out

#- 78 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Y1GjlIIk' \
    --userId '0iKoTTS1' \
    --body '{"inc": 0.15331801666462286}' \
    > test.out 2>&1
eval_tap $? 78 'PublicIncUserStatItemValue' test.out

#- 79 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '02o7JjTX' \
    --userId 'AQN0qdsk' \
    > test.out 2>&1
eval_tap $? 79 'ResetUserStatItemValue1' test.out

#- 80 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"dQV0TqI8": {}, "EFnmDbxI": {}, "xi4YKlON": {}}, "additionalKey": "k2Q5Y4Jv", "statCode": "aizwiila", "updateStrategy": "MIN", "userId": "p18lOC3m", "value": 0.6380566851428628}, {"additionalData": {"qF7Bl0Lc": {}, "ghVHfPEs": {}, "pxwhRON0": {}}, "additionalKey": "bc1eMbEI", "statCode": "jowLqc3e", "updateStrategy": "INCREMENT", "userId": "oELCpobB", "value": 0.49838406767781585}, {"additionalData": {"G8X645xp": {}, "dXpai0rY": {}, "aT5hOPja": {}}, "additionalKey": "f3H0tYig", "statCode": "hU0VUfcY", "updateStrategy": "OVERRIDE", "userId": "JbBfAKSi", "value": 0.6679718623637916}]' \
    > test.out 2>&1
eval_tap $? 80 'BulkUpdateUserStatItemV2' test.out

#- 81 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'W3VgsZXi' \
    --statCode 'R1DJ7HVW' \
    --userIds 'qMkNSawQ,UWDFJvJB,Wic7UkBe' \
    > test.out 2>&1
eval_tap $? 81 'BulkFetchOrDefaultStatItems1' test.out

#- 82 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'IXuqDuAX' \
    --additionalKey 'I66bQ71w' \
    --body '[{"additionalData": {"0deoV9Lx": {}, "5RDA1l2X": {}, "crciYNEz": {}}, "statCode": "vSZIPkhS", "updateStrategy": "INCREMENT", "value": 0.6938832450489533}, {"additionalData": {"1KtOv7Zy": {}, "0b65uvuK": {}, "Nuy0ytZQ": {}}, "statCode": "7M6Nzy1a", "updateStrategy": "INCREMENT", "value": 0.9503182635869184}, {"additionalData": {"f6QkmZXE": {}, "lW9YfRSs": {}, "e6AAz3S4": {}}, "statCode": "czz0QKFl", "updateStrategy": "OVERRIDE", "value": 0.8111308273874861}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkUpdateUserStatItem' test.out

#- 83 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'uG6XqP6o' \
    --additionalKey 'o7G73zdx' \
    --body '[{"additionalData": {"TgOfnwId": {}, "lNa29fDL": {}, "h741IslK": {}}, "statCode": "HzGlLKWU"}, {"additionalData": {"tDQs61OQ": {}, "AoxyyQpR": {}, "WCiiPDGQ": {}}, "statCode": "hNPEwiJC"}, {"additionalData": {"f2XJVrlz": {}, "qQls1ozh": {}, "LVA3kE8j": {}}, "statCode": "KvgatOEB"}]' \
    > test.out 2>&1
eval_tap $? 83 'BulkResetUserStatItemValues' test.out

#- 84 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'M70TdlNB' \
    --userId 'JYOmpu1V' \
    --additionalKey 'CarzBsV6' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems2' test.out

#- 85 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xnZ5Jrzz' \
    --userId 'jrcaug6C' \
    --additionalKey 'WVG8SWP3' \
    --body '{"additionalData": {"glU6musw": {}, "VJnNnN7k": {}, "Aa7j0riF": {}}, "updateStrategy": "INCREMENT", "value": 0.4249685997429088}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateUserStatItemValue' test.out

#- 86 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"dNJOIG36": {}, "I6tRbRcr": {}, "EveMdAdi": {}}, "additionalKey": "PKDUVSC0", "statCode": "0PYeDcag", "updateStrategy": "INCREMENT", "userId": "4IEiH9Z5", "value": 0.26158507834345457}, {"additionalData": {"Xn3aoRtl": {}, "qOECohVi": {}, "HA5CzgFS": {}}, "additionalKey": "y8X1A3Pr", "statCode": "Ifapq5AA", "updateStrategy": "INCREMENT", "userId": "4ZH3mtgW", "value": 0.10516429433349572}, {"additionalData": {"U4pCAKxe": {}, "E70CaunQ": {}, "Nxot371W": {}}, "additionalKey": "9G4AvQkq", "statCode": "sGnmyo5J", "updateStrategy": "OVERRIDE", "userId": "Vmb8GEXF", "value": 0.7324971798323711}]' \
    > test.out 2>&1
eval_tap $? 86 'BulkUpdateUserStatItem1' test.out

#- 87 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lEMEsFzY' \
    --additionalKey 'qwgK1Np5' \
    --statCodes 'nodqpLm7,FhJBNXzA,FdO0Khqf' \
    --tags '6kiTdSGv,2LFjAKY7,CbgsWqFW' \
    > test.out 2>&1
eval_tap $? 87 'PublicQueryUserStatItems2' test.out

#- 88 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZX7kPBom' \
    --additionalKey '8F9GLLTG' \
    --body '[{"additionalData": {"8phc3n4i": {}, "LoIllKlp": {}, "O2pqiXJF": {}}, "statCode": "3WGRaoQo", "updateStrategy": "MAX", "value": 0.2893228808367996}, {"additionalData": {"IzqYkEps": {}, "tyVTBcrM": {}, "8rG0rH0z": {}}, "statCode": "cswwVeMK", "updateStrategy": "INCREMENT", "value": 0.613929134266353}, {"additionalData": {"bGIVIu8v": {}, "vwLc7KY3": {}, "uVoJXTIM": {}}, "statCode": "tpgkieDy", "updateStrategy": "OVERRIDE", "value": 0.9551615666895776}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItem2' test.out

#- 89 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lGdMiHKx' \
    --userId 'bWCYzo8y' \
    --additionalKey 'O2KTK9tm' \
    --body '{"additionalData": {"mOnYnOpa": {}, "s6ghP1y4": {}, "Zi7s7QBl": {}}, "updateStrategy": "MAX", "value": 0.2151484334044813}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE