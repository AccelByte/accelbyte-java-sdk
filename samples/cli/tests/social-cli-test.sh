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
echo "1..88"

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

#- 34 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '3vneSD2T' \
    --userIds 'b3g7mSQU' \
    > test.out 2>&1
eval_tap $? 34 'BulkFetchStatItems' test.out

#- 35 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.11518502690410715, "statCode": "AEtrmjqU", "userId": "6YE3p4lS"}, {"inc": 0.03378151225626991, "statCode": "k0ZHn5GI", "userId": "39YBHqaT"}, {"inc": 0.5389673574558402, "statCode": "eKtW18iG", "userId": "eUlc9d9s"}]' \
    > test.out 2>&1
eval_tap $? 35 'BulkIncUserStatItem' test.out

#- 36 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.23761844917164, "statCode": "gWa24CKN", "userId": "S0GqVvUf"}, {"inc": 0.5479072815833855, "statCode": "QvsHXNUN", "userId": "e4mhgo5Q"}, {"inc": 0.4507852562022244, "statCode": "65lSAiYn", "userId": "NjkfZrQv"}]' \
    > test.out 2>&1
eval_tap $? 36 'BulkIncUserStatItemValue' test.out

#- 37 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GgbLdLsF' \
    --userIds 'zHkBMr1y,rOMlNFSr,UEirnjX9' \
    > test.out 2>&1
eval_tap $? 37 'BulkFetchOrDefaultStatItems' test.out

#- 38 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "fDmIbeZx", "userId": "zfTcyiuA"}, {"statCode": "Tus9hsfp", "userId": "FDcSDG8a"}, {"statCode": "MVGLiBNr", "userId": "Djqoxcwg"}]' \
    > test.out 2>&1
eval_tap $? 38 'BulkResetUserStatItem' test.out

#- 39 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'GLXpUL4p' \
    --isGlobal  \
    --limit '31' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 39 'GetStats' test.out

#- 40 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["2ncYAHdN", "OvDz9KOs", "zDmeIP6r"], "defaultValue": 0.02423299637693188, "description": "392k6YmJ", "incrementOnly": true, "maximum": 0.09054199103285177, "minimum": 0.6982540070123989, "name": "ByjlBiuF", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "oVk8T3Gp", "tags": ["g2SCnqnt", "X9y1aZSW", "AnkCmBUq"]}' \
    > test.out 2>&1
eval_tap $? 40 'CreateStat' test.out

#- 41 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'ExportStats' test.out

#- 42 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 42 'ImportStats' test.out

#- 43 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '79' \
    --offset '90' \
    --keyword 'iVi10sG6' \
    > test.out 2>&1
eval_tap $? 43 'QueryStats' test.out

#- 44 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vxkfUcmq' \
    > test.out 2>&1
eval_tap $? 44 'GetStat' test.out

#- 45 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RRbceJ5i' \
    > test.out 2>&1
eval_tap $? 45 'DeleteStat' test.out

#- 46 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '0EeDxOgB' \
    --body '{"cycleIds": ["nhhqElIa", "FLTm5T50", "Dml48wdN"], "defaultValue": 0.37927665068826366, "description": "9WT0GfH2", "name": "rtOa4EXs", "tags": ["mqrxzTtu", "XzOXQAk4", "Ll4XlbGL"]}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateStat' test.out

#- 47 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '8QOxtjzm' \
    > test.out 2>&1
eval_tap $? 47 'DeleteTiedStat' test.out

#- 48 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId '8y2wNhmw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oYZyI4EF' \
    --limit '69' \
    --offset '76' \
    --statCodes 'SKLCa3xr' \
    > test.out 2>&1
eval_tap $? 48 'GetUserStatCycleItems' test.out

#- 49 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'eNDUWehw' \
    --limit '70' \
    --offset '82' \
    --sortBy 'q31A806D' \
    --statCodes 'Jgas4b6z' \
    --tags '3LNUj7fd' \
    > test.out 2>&1
eval_tap $? 49 'GetUserStatItems' test.out

#- 50 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'gLA84Z8Y' \
    --body '[{"statCode": "Yk6QEgJj"}, {"statCode": "BbEDoNf3"}, {"statCode": "n0hEoRCA"}]' \
    > test.out 2>&1
eval_tap $? 50 'BulkCreateUserStatItems' test.out

#- 51 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cf80zfFy' \
    --body '[{"inc": 0.003104554170812235, "statCode": "bWAgIUXi"}, {"inc": 0.5615205256654423, "statCode": "07A68eaq"}, {"inc": 0.4609844265776686, "statCode": "2J9jyEW6"}]' \
    > test.out 2>&1
eval_tap $? 51 'BulkIncUserStatItem1' test.out

#- 52 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GLbc0NaK' \
    --body '[{"inc": 0.47763553578792295, "statCode": "UL3sa13l"}, {"inc": 0.16203210155948633, "statCode": "1dQBHO86"}, {"inc": 0.559773957444385, "statCode": "lBhnetU4"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkIncUserStatItemValue1' test.out

#- 53 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RwTqUXlT' \
    --body '[{"statCode": "DBzOuYsa"}, {"statCode": "ZA2yyd4m"}, {"statCode": "bqoOfADM"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem1' test.out

#- 54 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MAXFaY9e' \
    --userId 'Ka699bRV' \
    > test.out 2>&1
eval_tap $? 54 'CreateUserStatItem' test.out

#- 55 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hyaKwwrA' \
    --userId 'P2aMlu7W' \
    > test.out 2>&1
eval_tap $? 55 'DeleteUserStatItems' test.out

#- 56 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tjCtoYet' \
    --userId 'OO847g8O' \
    --body '{"inc": 0.32783923016536154}' \
    > test.out 2>&1
eval_tap $? 56 'IncUserStatItemValue' test.out

#- 57 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dOfjnCuH' \
    --userId 'Z3c46IjG' \
    --additionalKey 'a23YvYmm' \
    --body '{"additionalData": {"Dg7VYPXI": {}, "uvUYTZBR": {}, "ujIUE1Tq": {}}}' \
    > test.out 2>&1
eval_tap $? 57 'ResetUserStatItemValue' test.out

#- 58 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --offset '20' \
    --statCodes 'CEHThUJk' \
    > test.out 2>&1
eval_tap $? 58 'GetGlobalStatItems1' test.out

#- 59 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ETAsSp7g' \
    > test.out 2>&1
eval_tap $? 59 'GetGlobalStatItemByStatCode1' test.out

#- 60 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '18' \
    --name '4TeUTkOk' \
    --offset '53' \
    --sortBy 'j0ZwsVC0' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 60 'GetStatCycles1' test.out

#- 61 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 't4Tv207Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'GetStatCycle1' test.out

#- 62 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2QD3oD5f' \
    --userIds 'LCr3OOlX' \
    > test.out 2>&1
eval_tap $? 62 'BulkFetchStatItems1' test.out

#- 63 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7583555438229681, "statCode": "v8ZGF7uY", "userId": "nGzpipND"}, {"inc": 0.1368938430639971, "statCode": "gNJma1Mb", "userId": "qqZtfNWq"}, {"inc": 0.19041392386129807, "statCode": "4nmwAft4", "userId": "gqkNNlWk"}]' \
    > test.out 2>&1
eval_tap $? 63 'PublicBulkIncUserStatItem' test.out

#- 64 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4692255816039117, "statCode": "9eOziYRF", "userId": "On0jJLHC"}, {"inc": 0.9879696778502407, "statCode": "LxhvNXTw", "userId": "GBCtohLt"}, {"inc": 0.18615409696855045, "statCode": "9Zuhytm5", "userId": "UDrT6QXC"}]' \
    > test.out 2>&1
eval_tap $? 64 'PublicBulkIncUserStatItemValue' test.out

#- 65 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "s5SPBbRP", "userId": "ZTF6oQAX"}, {"statCode": "VG7tnsZg", "userId": "5QgXjvyG"}, {"statCode": "JPN4eXbJ", "userId": "E5Vs2Gcy"}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkResetUserStatItem2' test.out

#- 66 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["sjUgxBkF", "omQoIXim", "BJehyxlN"], "defaultValue": 0.9381333499118298, "description": "wFPoJeQe", "incrementOnly": false, "maximum": 0.953637556214384, "minimum": 0.8385108949967551, "name": "shZyZl5x", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "zGdKvOPd", "tags": ["y1DN9LFk", "YW5DQyj4", "q5xrgxSm"]}' \
    > test.out 2>&1
eval_tap $? 66 'CreateStat1' test.out

#- 67 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'bj5Ro2og' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aKt2ujQS' \
    --limit '0' \
    --offset '38' \
    --statCodes '3Zdb65UX' \
    > test.out 2>&1
eval_tap $? 67 'GetUserStatCycleItems1' test.out

#- 68 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'my0Zp6iI' \
    --limit '0' \
    --offset '14' \
    --sortBy 'TIKUkmkk' \
    --statCodes '9QM0NBMA' \
    --tags '9ORxpzwL' \
    > test.out 2>&1
eval_tap $? 68 'PublicQueryUserStatItems' test.out

#- 69 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2AK6eXU' \
    --body '[{"statCode": "GPJsw1fi"}, {"statCode": "P80G9Pcl"}, {"statCode": "xcft2ulI"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkCreateUserStatItems' test.out

#- 70 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JzPyrVEi' \
    --statCodes 'OG4Ucqsu,GKHhMRWL,Vd3DlhLu' \
    --tags 'IpomM8sm,1MiaI1mX,2tJoARtd' \
    > test.out 2>&1
eval_tap $? 70 'PublicQueryUserStatItems1' test.out

#- 71 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bBe7udsM' \
    --body '[{"inc": 0.288366886882354, "statCode": "ok0WvGYY"}, {"inc": 0.21497187605094004, "statCode": "x4V709xb"}, {"inc": 0.2213321705609963, "statCode": "GezKsDwG"}]' \
    > test.out 2>&1
eval_tap $? 71 'PublicBulkIncUserStatItem1' test.out

#- 72 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '2omOR2nv' \
    --body '[{"inc": 0.8129874093462562, "statCode": "I9TVqJdv"}, {"inc": 0.41617567346829587, "statCode": "cWbfUpaX"}, {"inc": 0.2574289364335838, "statCode": "5JMl5LL4"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkIncUserStatItemValue2' test.out

#- 73 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bTxBmZjd' \
    --body '[{"statCode": "rrIxsB0N"}, {"statCode": "RsB1fPqq"}, {"statCode": "RRulpqpy"}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkResetUserStatItem3' test.out

#- 74 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mDkQhtrH' \
    --userId 'WwRVnwVB' \
    > test.out 2>&1
eval_tap $? 74 'PublicCreateUserStatItem' test.out

#- 75 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OqOHi8pW' \
    --userId 'Gd1juYhi' \
    > test.out 2>&1
eval_tap $? 75 'DeleteUserStatItems1' test.out

#- 76 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qjRJOqB5' \
    --userId 'F93zFQbJ' \
    --body '{"inc": 0.21232898398037525}' \
    > test.out 2>&1
eval_tap $? 76 'PublicIncUserStatItem' test.out

#- 77 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dUDpdONn' \
    --userId 'eAczbBdH' \
    --body '{"inc": 0.02278522271174832}' \
    > test.out 2>&1
eval_tap $? 77 'PublicIncUserStatItemValue' test.out

#- 78 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2slt71B1' \
    --userId 'SmZp2JZp' \
    > test.out 2>&1
eval_tap $? 78 'ResetUserStatItemValue1' test.out

#- 79 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"50CnPb71": {}, "ORYcmQbT": {}, "U5JX8ccL": {}}, "additionalKey": "jMXJRk0e", "statCode": "aKQDOJvr", "updateStrategy": "MAX", "userId": "efglSs6g", "value": 0.9073022283005595}, {"additionalData": {"iY9u02aC": {}, "NYIWekp1": {}, "8lOC3mNq": {}}, "additionalKey": "F7Bl0Lcg", "statCode": "hVHfPEsp", "updateStrategy": "OVERRIDE", "userId": "3CfR3ncD", "value": 0.17759964517013727}, {"additionalData": {"wi3v3MFF": {}, "J1KesKoE": {}, "LCpobBEG": {}}, "additionalKey": "8X645xpd", "statCode": "Xpai0rYa", "updateStrategy": "OVERRIDE", "userId": "5hOPjaf3", "value": 0.5391472973346789}]' \
    > test.out 2>&1
eval_tap $? 79 'BulkUpdateUserStatItemV2' test.out

#- 80 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '0tYighU0' \
    --statCode 'VUfcYHJb' \
    --userIds 'BfAKSiPW,3VgsZXiR,1DJ7HVWq' \
    > test.out 2>&1
eval_tap $? 80 'BulkFetchOrDefaultStatItems1' test.out

#- 81 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkNSawQU' \
    --additionalKey 'WDFJvJBW' \
    --body '[{"additionalData": {"ic7UkBeI": {}, "XuqDuAXI": {}, "66bQ71w0": {}}, "statCode": "deoV9Lx5", "updateStrategy": "MIN", "value": 0.48309282706700163}, {"additionalData": {"A1l2Xcrc": {}, "iYNEzvSZ": {}, "IPkhSgOR": {}}, "statCode": "cz5S5Bvm", "updateStrategy": "INCREMENT", "value": 0.9478697734949925}, {"additionalData": {"5uvuKNuy": {}, "0ytZQ7M6": {}, "Nzy1adnS": {}}, "statCode": "KOLFKx1d", "updateStrategy": "INCREMENT", "value": 0.3264947586215158}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkUpdateUserStatItem' test.out

#- 82 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'WJu3pDMU' \
    --additionalKey 'AeeZ97SB' \
    --body '[{"additionalData": {"ROPYuG6X": {}, "qP6oo7G7": {}, "3zdxTgOf": {}}, "statCode": "nwIdlNa2"}, {"additionalData": {"9fDLh741": {}, "IslKHzGl": {}, "LKWUtDQs": {}}, "statCode": "61OQAoxy"}, {"additionalData": {"yQpRWCii": {}, "PDGQhNPE": {}, "wiJCf2XJ": {}}, "statCode": "VrlzqQls"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItemValues' test.out

#- 83 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1ozhLVA3' \
    --userId 'kE8jKvga' \
    --additionalKey 'tOEBM70T' \
    > test.out 2>&1
eval_tap $? 83 'DeleteUserStatItems2' test.out

#- 84 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dlNBJYOm' \
    --userId 'pu1VCarz' \
    --additionalKey 'BsV6xnZ5' \
    --body '{"additionalData": {"Jrzzjrca": {}, "ug6CWVG8": {}, "SWP3glU6": {}}, "updateStrategy": "MAX", "value": 0.12575824806249758}' \
    > test.out 2>&1
eval_tap $? 84 'UpdateUserStatItemValue' test.out

#- 85 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"LOqQGhCU": {}, "r6iTrjyE": {}, "garAdNJO": {}}, "additionalKey": "IG36I6tR", "statCode": "bRcrEveM", "updateStrategy": "INCREMENT", "userId": "HQkETJyT", "value": 0.17934705853030686}, {"additionalData": {"UrwDTnou": {}, "jQD4IEiH": {}, "9Z5qXn3a": {}}, "additionalKey": "oRtlqOEC", "statCode": "ohViHA5C", "updateStrategy": "OVERRIDE", "userId": "GRUvpZaH", "value": 0.45186401075554417}, {"additionalData": {"uESOiIZs": {}, "MfB4ZH3m": {}, "tgWgU4pC": {}}, "additionalKey": "AKxeE70C", "statCode": "aunQNxot", "updateStrategy": "OVERRIDE", "userId": "9G4AvQkq", "value": 0.3054939564525456}]' \
    > test.out 2>&1
eval_tap $? 85 'BulkUpdateUserStatItem1' test.out

#- 86 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gnmyo5JJ' \
    --additionalKey 'TUVmb8GE' \
    --statCodes 'XFTlEMEs,FzYqwgK1,Np5nodqp' \
    --tags 'Lm7FhJBN,XzAFdO0K,hqf6kiTd' \
    > test.out 2>&1
eval_tap $? 86 'PublicQueryUserStatItems2' test.out

#- 87 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SGv2LFjA' \
    --additionalKey 'KY7CbgsW' \
    --body '[{"additionalData": {"qFWZX7kP": {}, "Bom8F9GL": {}, "LTG8phc3": {}}, "statCode": "n4iLoIll", "updateStrategy": "MAX", "value": 0.9799894634291041}, {"additionalData": {"9hmguB8F": {}, "OTjMLo4b": {}, "9rIzqYkE": {}}, "statCode": "pstyVTBc", "updateStrategy": "MIN", "value": 0.5232135476251192}, {"additionalData": {"59e0k5Zt": {}, "X6wK7PpU": {}, "lcIW32iK": {}}, "statCode": "7MGt1ixY", "updateStrategy": "MIN", "value": 0.8989606680878668}]' \
    > test.out 2>&1
eval_tap $? 87 'BulkUpdateUserStatItem2' test.out

#- 88 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uVoJXTIM' \
    --userId 'tpgkieDy' \
    --additionalKey 'F97lGdMi' \
    --body '{"additionalData": {"HKxbWCYz": {}, "o8yO2KTK": {}, "9tmmOnYn": {}}, "updateStrategy": "MIN", "value": 0.9260672405572047}' \
    > test.out 2>&1
eval_tap $? 88 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE