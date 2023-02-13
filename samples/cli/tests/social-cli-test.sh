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
echo "1..78"

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
    --body '{"maxSlotSize": 52, "maxSlots": 94}' \
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
    --userId 'Qp2jBRbk' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '4Le3swlC' \
    --body '{"maxSlotSize": 87, "maxSlots": 54}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6W03uLh' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'KgQGYLg2' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'j6EjpliR' \
    --userId 'MhIA9wJ7' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'bT0fvIS5' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'ex8hwaNK' \
    --userId '4Dz8fytX' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'qQrcwQ5g,BUiVzWlf,qFJ7AZb3' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'tTiIrfFa' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'bUBwzEgR' \
    --body '{"achievements": ["yh2D9J0c", "jpDlPXbA", "P8EEBzCv"], "attributes": {"JeH6lFJe": "96EaezOq", "AuNmyhH6": "y5jmgeeG", "Pgk5sfSk": "Rqi3XBfH"}, "avatarUrl": "U1SAcbA0", "inventories": ["AzEo8zrt", "fo7DOt9B", "OwRex2RA"], "label": "DMeNYiWf", "profileName": "zFqtsKfY", "statistics": ["LugHvQMv", "atKp8lvJ", "PaPR6vIa"], "tags": ["XFj5srI9", "umTUn7AR", "bXlMp8ga"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ZM5E8Kxp' \
    --userId 't1GLEeDk' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'EFV06MQm' \
    --userId 'mkASaCo1' \
    --body '{"achievements": ["36zjmENu", "ODelGfsi", "bTuEz9pg"], "attributes": {"1doZdJyz": "7j4TlfTh", "OJ0pnEZj": "aHrmWwk8", "zWPqfjPs": "DC530TO9"}, "avatarUrl": "AgEYguZd", "inventories": ["K6JwYtDv", "tqG8IRLh", "op1hsk9U"], "label": "MnvLJpAt", "profileName": "Yyn0GRD4", "statistics": ["JpctGmL4", "sHWMmYM1", "DpIh4c5x"], "tags": ["rfbg4hxf", "rIcTbHr7", "DvfCrf4V"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Oz0YB29u' \
    --userId 'MjDtELK8' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'IeDpdWlb' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'pUDckRa3' \
    --userId 'FExII8GZ' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'uJ06JEko' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'XMGNiyKV' \
    --userId 'zslU8cNU' \
    --body '{"name": "k31NB1C4", "value": "3ImEYwHt"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '3SzCc06L' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'UZ0eHHpe' \
    --label 'OW6mxytA' \
    --tags '2q1eEu96,t0PgWBDR,EqaVoNx4' \
    --checksum 'lVxBU8MT' \
    --customAttribute 'UsXYYEeb' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'EukBrP2C' \
    --userId 'xMKsXO6C' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId '3KfSJXmT' \
    --userId 'z6MqAFdf' \
    --label 'Co4wvCe3' \
    --tags 'E0r0ar6g,U76I8ZfO,T5tI0C6P' \
    --checksum 'xOWqVQNa' \
    --customAttribute 'WMwmkijk' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'bHmd4kri' \
    --userId 'MxO4b3kG' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'YlC3PUHU' \
    --userId 'oqt6tRNs' \
    --body '{"customAttribute": "SHp1mKdk", "label": "tmZYutd3", "tags": ["8DilFHFt", "kes71wMV", "yhZLAVYW"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '96' \
    --statCodes '8TLhSI9h' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jdbKU679' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TtxZJ9O7' \
    --userIds 'mC7f5Dtf' \
    > test.out 2>&1
eval_tap $? 28 'BulkFetchStatItems' test.out

#- 29 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9191067288458226, "statCode": "FzYILWOM", "userId": "CJuscTCz"}, {"inc": 0.7937184090799448, "statCode": "9R26iGjl", "userId": "aRgvZomO"}, {"inc": 0.530708476421472, "statCode": "a5l2A8Kd", "userId": "15x5hAuk"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItem' test.out

#- 30 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9377555402126613, "statCode": "uJ5BY91U", "userId": "BUFoxG7i"}, {"inc": 0.13328090952243066, "statCode": "zQ8VxiA0", "userId": "qcBVnD8V"}, {"inc": 0.48521908992418694, "statCode": "EEa8epsf", "userId": "JtpevAg8"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkIncUserStatItemValue' test.out

#- 31 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '19cfr8Qg' \
    --userIds 'L4Ds32HK,jsAg9rbA,eQAtq2kW' \
    > test.out 2>&1
eval_tap $? 31 'BulkFetchOrDefaultStatItems' test.out

#- 32 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "rLrnzO3Y", "userId": "o8W2Jp1B"}, {"statCode": "4qeI7f2W", "userId": "bh3EdphG"}, {"statCode": "59n9JcZq", "userId": "wN0JJkbT"}]' \
    > test.out 2>&1
eval_tap $? 32 'BulkResetUserStatItem' test.out

#- 33 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '2' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 33 'GetStats' test.out

#- 34 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.05488819659868993, "description": "PanGYwEi", "incrementOnly": false, "maximum": 0.48500437082783143, "minimum": 0.9041361801980112, "name": "NGxCryeB", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "cIxtPO75", "tags": ["Wam0GMAS", "95bjybjH", "JfXnpH6Y"]}' \
    > test.out 2>&1
eval_tap $? 34 'CreateStat' test.out

#- 35 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'ExportStats' test.out

#- 36 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 36 'ImportStats' test.out

#- 37 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '81' \
    --offset '29' \
    --keyword 'Twi4xkEr' \
    > test.out 2>&1
eval_tap $? 37 'QueryStats' test.out

#- 38 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'v7UeRQwu' \
    > test.out 2>&1
eval_tap $? 38 'GetStat' test.out

#- 39 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BqQVnbsh' \
    > test.out 2>&1
eval_tap $? 39 'DeleteStat' test.out

#- 40 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'H77Fx3Wn' \
    --body '{"defaultValue": 0.34083342965083785, "description": "sFgvqlNC", "name": "6OzNL9tj", "tags": ["Z6twjnn0", "Z6YzzvWa", "WB6hiooH"]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateStat' test.out

#- 41 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sNXssEJl' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTiedStat' test.out

#- 42 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'upu0sYbs' \
    --limit '47' \
    --offset '75' \
    --sortBy 'oKI2EP06' \
    --statCodes 'EpGisiDy' \
    --tags 'jKXv0Dhx' \
    > test.out 2>&1
eval_tap $? 42 'GetUserStatItems' test.out

#- 43 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'XXsO6iIa' \
    --body '[{"statCode": "zpXvDHMO"}, {"statCode": "6zq7kwMd"}, {"statCode": "AbazTRQ7"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkCreateUserStatItems' test.out

#- 44 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FJ7H5OSc' \
    --body '[{"inc": 0.4017393255194739, "statCode": "fafSOno7"}, {"inc": 0.19576124045417564, "statCode": "ecZ1P9H6"}, {"inc": 0.22683900772321308, "statCode": "wIF1aaSd"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItem1' test.out

#- 45 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ll0ZiwiG' \
    --body '[{"inc": 0.5643186375857933, "statCode": "SpS1yFXg"}, {"inc": 0.66286112794313, "statCode": "hIo2PmvI"}, {"inc": 0.9576916683515826, "statCode": "zdxc8UGL"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkIncUserStatItemValue1' test.out

#- 46 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dstDK4sw' \
    --body '[{"statCode": "1iLmAxVM"}, {"statCode": "PdGDjp7k"}, {"statCode": "bEdkEDKl"}]' \
    > test.out 2>&1
eval_tap $? 46 'BulkResetUserStatItem1' test.out

#- 47 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'atE084Ht' \
    --userId '4gEnUpmO' \
    > test.out 2>&1
eval_tap $? 47 'CreateUserStatItem' test.out

#- 48 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LuWhsYs0' \
    --userId 'ydXuXkxu' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserStatItems' test.out

#- 49 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wR7Aqe9H' \
    --userId 'Wjp9PO8g' \
    --body '{"inc": 0.5341836096563053}' \
    > test.out 2>&1
eval_tap $? 49 'IncUserStatItemValue' test.out

#- 50 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mqVE0dWm' \
    --userId 'shvpk2OS' \
    --additionalKey 'XHOwM6XO' \
    --body '{"additionalData": {"QhqP6uXh": {}, "HAurjsAr": {}, "9YlpQo0j": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'ResetUserStatItemValue' test.out

#- 51 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '82' \
    --statCodes 'kBDsRYGR' \
    > test.out 2>&1
eval_tap $? 51 'GetGlobalStatItems1' test.out

#- 52 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eswTR9U4' \
    > test.out 2>&1
eval_tap $? 52 'GetGlobalStatItemByStatCode1' test.out

#- 53 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '4290qJ4o' \
    --userIds 'HFln2O9x' \
    > test.out 2>&1
eval_tap $? 53 'BulkFetchStatItems1' test.out

#- 54 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.18179006859298863, "statCode": "MSe8NroE", "userId": "3S2WG4sH"}, {"inc": 0.9551028783687024, "statCode": "SQxRQ2KJ", "userId": "vcgHV7wR"}, {"inc": 0.9051924947909364, "statCode": "1E5otg9K", "userId": "omlghJdN"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkIncUserStatItem' test.out

#- 55 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9347737173029455, "statCode": "wEuxvIpJ", "userId": "Ek48TL5R"}, {"inc": 0.8793400981629461, "statCode": "Mnw02zWd", "userId": "zCcBjjp5"}, {"inc": 0.6057200462777527, "statCode": "WigIDpzl", "userId": "XxP1KPGR"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItemValue' test.out

#- 56 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "K6QbAV2U", "userId": "Je4WHwhl"}, {"statCode": "bvLNpI51", "userId": "1lr9FLg0"}, {"statCode": "EaxjE1BI", "userId": "lpVI6f3d"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkResetUserStatItem2' test.out

#- 57 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.11270086615851738, "description": "fClHSgoq", "incrementOnly": false, "maximum": 0.5886512151744677, "minimum": 0.3200439850776752, "name": "Lw3WAHWI", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "itELm0Ka", "tags": ["S11uYggJ", "SQTeqwIm", "ZIk8Fgfr"]}' \
    > test.out 2>&1
eval_tap $? 57 'CreateStat1' test.out

#- 58 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'GWYNC71V' \
    --limit '68' \
    --offset '10' \
    --sortBy 'thktlJkA' \
    --statCodes 'aqsoVD4q' \
    --tags 'jHA9COS7' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryUserStatItems' test.out

#- 59 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'EevMd1Ta' \
    --body '[{"statCode": "G4ZM193C"}, {"statCode": "wO99Icaz"}, {"statCode": "OpzGBGIF"}]' \
    > test.out 2>&1
eval_tap $? 59 'PublicBulkCreateUserStatItems' test.out

#- 60 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qbpTIQKp' \
    --statCodes 'fnZFi0ln,Ju0wzrwA,EhOo368C' \
    --tags '6TjJAsf6,m6xokecN,5kDJy3DV' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryUserStatItems1' test.out

#- 61 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fyvxf14j' \
    --body '[{"inc": 0.3940525629963787, "statCode": "D6X8Mizt"}, {"inc": 0.6288803840413008, "statCode": "3103Cj88"}, {"inc": 0.1686896135083933, "statCode": "qpfZURIZ"}]' \
    > test.out 2>&1
eval_tap $? 61 'PublicBulkIncUserStatItem1' test.out

#- 62 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W9P7xgt5' \
    --body '[{"inc": 0.9135863143911654, "statCode": "XIFXbOzs"}, {"inc": 0.9465684017159647, "statCode": "OBLQ3KmF"}, {"inc": 0.10653377571376876, "statCode": "c6J6M1wU"}]' \
    > test.out 2>&1
eval_tap $? 62 'BulkIncUserStatItemValue2' test.out

#- 63 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W4klcMBn' \
    --body '[{"statCode": "rqTvghfB"}, {"statCode": "hvLDK164"}, {"statCode": "bm13brp4"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkResetUserStatItem3' test.out

#- 64 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '4DbbEQF2' \
    --userId 'JKRH4myP' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserStatItem' test.out

#- 65 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '0ZwYa01Z' \
    --userId 'PLLBDnBb' \
    > test.out 2>&1
eval_tap $? 65 'DeleteUserStatItems1' test.out

#- 66 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KUZ6xxmA' \
    --userId 'qAibDFym' \
    --body '{"inc": 0.8109143083664755}' \
    > test.out 2>&1
eval_tap $? 66 'PublicIncUserStatItem' test.out

#- 67 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '0pr4Rc1y' \
    --userId 'qXfNzDF7' \
    --body '{"inc": 0.20210800867462653}' \
    > test.out 2>&1
eval_tap $? 67 'PublicIncUserStatItemValue' test.out

#- 68 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vYrNDan2' \
    --userId 'SyZSNcCU' \
    > test.out 2>&1
eval_tap $? 68 'ResetUserStatItemValue1' test.out

#- 69 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"8DMyKhQB": {}, "aVB1f14f": {}, "7mzpMi6t": {}}, "additionalKey": "ksKID1DI", "statCode": "wvjab06g", "updateStrategy": "MAX", "userId": "2ZLlLQFQ", "value": 0.6427781063661893}, {"additionalData": {"VzGjuLcd": {}, "aBMyIhgI": {}, "dCBSxdVC": {}}, "additionalKey": "aqmPxPB9", "statCode": "g5pscZEp", "updateStrategy": "OVERRIDE", "userId": "efBcHrgN", "value": 0.7220742190912145}, {"additionalData": {"LCpNsXYV": {}, "AVcf072V": {}, "981pOI35": {}}, "additionalKey": "Qtr5lSHN", "statCode": "osnR1iBY", "updateStrategy": "INCREMENT", "userId": "k4y90ATV", "value": 0.08100627931724713}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItemV2' test.out

#- 70 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'dZPDNOqw' \
    --statCode 'MasjVQCD' \
    --userIds 'z33jch5d,hZq2CVXY,swERY6kT' \
    > test.out 2>&1
eval_tap $? 70 'BulkFetchOrDefaultStatItems1' test.out

#- 71 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'YvDxYICR' \
    --additionalKey 'wFS4RVAk' \
    --body '[{"additionalData": {"pQXIBhJR": {}, "LPjJX1gH": {}, "rqyeAZXP": {}}, "statCode": "G5fhnM2z", "updateStrategy": "OVERRIDE", "value": 0.4340101213147215}, {"additionalData": {"Cm8jR5Ua": {}, "PNAT0RrY": {}, "9PmW2COu": {}}, "statCode": "CnZTW65Y", "updateStrategy": "MAX", "value": 0.24634588096596133}, {"additionalData": {"lz7kk2R1": {}, "3O58YjYz": {}, "hG6OdfpN": {}}, "statCode": "TZqZ0YEC", "updateStrategy": "MAX", "value": 0.6483257875701458}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem' test.out

#- 72 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'QsUtJaqU' \
    --additionalKey 'MQ1xqjmz' \
    --body '[{"additionalData": {"4SKDd6ZO": {}, "sycGm4no": {}, "UKKuAda9": {}}, "statCode": "kN35C7fV"}, {"additionalData": {"wUO3klT8": {}, "pYUdRKaH": {}, "0jfb9UV1": {}}, "statCode": "tzbbbmG9"}, {"additionalData": {"tqnm2KT3": {}, "etyIwOSM": {}, "HXvaGZs7": {}}, "statCode": "yYYDRGUp"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItemValues' test.out

#- 73 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nF3c9v38' \
    --userId 'Y4byYTPU' \
    --additionalKey 'cYoyu4kJ' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems2' test.out

#- 74 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'T5xR4aQZ' \
    --userId 'TJ6FrZqh' \
    --additionalKey 'us0aSa2b' \
    --body '{"additionalData": {"VGnrNF3i": {}, "m6jhHOyr": {}, "JO7XBpTO": {}}, "updateStrategy": "MAX", "value": 0.1439189316739099}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue' test.out

#- 75 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"pf8VTheO": {}, "9dPwnyOs": {}, "7MRBD5H9": {}}, "additionalKey": "HtMaI2s7", "statCode": "ZhXaZpSG", "updateStrategy": "OVERRIDE", "userId": "5i3xrKR8", "value": 0.9986560192597475}, {"additionalData": {"jLWLImJN": {}, "xmHHhGZL": {}, "Xn6eUSN3": {}}, "additionalKey": "8Ef5WtWj", "statCode": "WJL1Z02t", "updateStrategy": "MAX", "userId": "yYqq8FN9", "value": 0.6835084108930537}, {"additionalData": {"aZbiLo0b": {}, "lc7Hm18L": {}, "8vp8gUQp": {}}, "additionalKey": "xnWvTV3u", "statCode": "RGu8HIGQ", "updateStrategy": "MIN", "userId": "l0i3Vt4Y", "value": 0.9350981620829018}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkUpdateUserStatItem1' test.out

#- 76 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TmvhUCHi' \
    --additionalKey '7RKFnYbU' \
    --statCodes 'mHaDaNcr,HYKShOJ3,85pVDvGa' \
    --tags 'dKWZKmD5,WmBuuMTr,WgyWAz7i' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems2' test.out

#- 77 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId '2iijOeTM' \
    --additionalKey 'w5Hn8SXY' \
    --body '[{"additionalData": {"mGobJSf4": {}, "6DyO3Jp4": {}, "w4D8QHq3": {}}, "statCode": "I5UqF4Dr", "updateStrategy": "MIN", "value": 0.5889006934542056}, {"additionalData": {"D8EU3wek": {}, "43Qpe9fA": {}, "qcleoCpY": {}}, "statCode": "UL0RYVnh", "updateStrategy": "OVERRIDE", "value": 0.02654369064792539}, {"additionalData": {"PtuTx6Hn": {}, "beQxv5je": {}, "p0dGmqOZ": {}}, "statCode": "1qBNG0Lh", "updateStrategy": "INCREMENT", "value": 0.8643672442517292}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItem2' test.out

#- 78 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1k5HzetY' \
    --userId '593GHaMD' \
    --additionalKey 'zZ8sDv2t' \
    --body '{"additionalData": {"26ZviIYf": {}, "dBVERogm": {}, "iemVkYMU": {}}, "updateStrategy": "MAX", "value": 0.3119264498727006}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE