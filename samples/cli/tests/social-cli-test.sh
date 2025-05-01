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
echo "1..99"

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
eval_tap 0 2 'GetNamespaceSlotConfig # SKIP deprecated' test.out

#- 3 UpdateNamespaceSlotConfig
eval_tap 0 3 'UpdateNamespaceSlotConfig # SKIP deprecated' test.out

#- 4 DeleteNamespaceSlotConfig
eval_tap 0 4 'DeleteNamespaceSlotConfig # SKIP deprecated' test.out

#- 5 GetUserSlotConfig
eval_tap 0 5 'GetUserSlotConfig # SKIP deprecated' test.out

#- 6 UpdateUserSlotConfig
eval_tap 0 6 'UpdateUserSlotConfig # SKIP deprecated' test.out

#- 7 DeleteUserSlotConfig
eval_tap 0 7 'DeleteUserSlotConfig # SKIP deprecated' test.out

#- 8 GetUserProfiles
eval_tap 0 8 'GetUserProfiles # SKIP deprecated' test.out

#- 9 GetProfile
eval_tap 0 9 'GetProfile # SKIP deprecated' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
eval_tap 0 12 'PublicGetUserGameProfiles # SKIP deprecated' test.out

#- 13 PublicGetUserProfiles
eval_tap 0 13 'PublicGetUserProfiles # SKIP deprecated' test.out

#- 14 PublicCreateProfile
eval_tap 0 14 'PublicCreateProfile # SKIP deprecated' test.out

#- 15 PublicGetProfile
eval_tap 0 15 'PublicGetProfile # SKIP deprecated' test.out

#- 16 PublicUpdateProfile
eval_tap 0 16 'PublicUpdateProfile # SKIP deprecated' test.out

#- 17 PublicDeleteProfile
eval_tap 0 17 'PublicDeleteProfile # SKIP deprecated' test.out

#- 18 PublicGetProfileAttribute
eval_tap 0 18 'PublicGetProfileAttribute # SKIP deprecated' test.out

#- 19 PublicUpdateAttribute
eval_tap 0 19 'PublicUpdateAttribute # SKIP deprecated' test.out

#- 20 PublicGetUserNamespaceSlots
eval_tap 0 20 'PublicGetUserNamespaceSlots # SKIP deprecated' test.out

#- 21 PublicCreateUserNamespaceSlot
eval_tap 0 21 'PublicCreateUserNamespaceSlot # SKIP deprecated' test.out

#- 22 PublicGetSlotData
eval_tap 0 22 'PublicGetSlotData # SKIP deprecated' test.out

#- 23 PublicUpdateUserNamespaceSlot
eval_tap 0 23 'PublicUpdateUserNamespaceSlot # SKIP deprecated' test.out

#- 24 PublicDeleteUserNamespaceSlot
eval_tap 0 24 'PublicDeleteUserNamespaceSlot # SKIP deprecated' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
eval_tap 0 25 'PublicUpdateUserNamespaceSlotMetadata # SKIP deprecated' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '39' \
    --statCodes 'AxcVpFrttufHIRdH' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode '9UzVRiXbqlAw7r6W' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '20' \
    --name 'HpzSn3ZPUdc0qh4n' \
    --offset '100' \
    --sortBy 'mzZ0m8SAMTwE6I56' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "Lx8bbgorQeFbQ1g7", "end": "1979-10-13T00:00:00Z", "id": "bPngUNB1vRodwpzS", "name": "6DaDpv8N7ZQVqGj6", "resetDate": 30, "resetDay": 75, "resetMonth": 61, "resetTime": "Jfh5pUkHODpoMF78", "seasonPeriod": 81, "start": "1975-01-24T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["TXp38zsCTCrbCbPO", "yNQkT7NvyE3cwyAL", "4YkHs1cnz1JSDgY1"]}' \
    > test.out 2>&1
eval_tap $? 30 'BulkGetStatCycle' test.out

#- 31 ExportStatCycle
./ng net.accelbyte.sdk.cli.Main social exportStatCycle \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ExportStatCycle' test.out

#- 32 ImportStatCycle
./ng net.accelbyte.sdk.cli.Main social importStatCycle \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 32 'ImportStatCycle' test.out

#- 33 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'czNIicXm7agSrjJW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId '2OQNOs1PXhT5Fvdi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "5TB0i7pKxR8dl0zR", "end": "1995-08-31T00:00:00Z", "name": "W4EZG9m0XcgGVbMq", "resetDate": 92, "resetDay": 33, "resetMonth": 37, "resetTime": "lqNiTvB6SdAdIhUD", "seasonPeriod": 35, "start": "1976-07-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'osAVerXpc1C8XfwH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'uKeb9l3rGN9A3sNm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["84hddSpHt0P7MIIR", "7CkyF6C7duuyZ0Gh", "DogqrhBRd8lDR6qV"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'NPRZYdFLIAjGGJdd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VCvu9vx5KQ7KYnIu' \
    --userIds 'MBvaO35llzQRaT5k' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6652598258878158, "statCode": "xUfofvnnSuB0y5WU", "userId": "lrMdI4sNveabntBS"}, {"inc": 0.37250248584772383, "statCode": "TeIv53HGCiljvjKo", "userId": "yD6SCwGrncqmLtjQ"}, {"inc": 0.5345867405854541, "statCode": "Af8TgoNm03VLisV6", "userId": "zwPuo3td6TC6I3lM"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.15319282496473985, "statCode": "GSWN2laRlxfcjHfY", "userId": "akUCTqGkE7wcWfDs"}, {"inc": 0.18555281921920364, "statCode": "pJSqGAXQ0yYoNRKd", "userId": "3IL5TAQ6iiPlSC2u"}, {"inc": 0.4988146082261804, "statCode": "4o5Vwdo3fePqIJA8", "userId": "IHtrkmu0hpDDWVAl"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'a2l5BYNtIuS5S5XU' \
    --userIds 'djsoqwGyzzWi9gwQ,Yv7t1o7TTr1DmrhZ,v15T7quIOvBMcaYm' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "vCkGZ5dAgqxpBFma", "userId": "Loxozr6wfNPX2bOI"}, {"statCode": "tRMvqtlB2jJCSQT2", "userId": "79ZZPYGu0rdlgdWy"}, {"statCode": "OtXi3choQrpOsDBU", "userId": "5SepjChB3V0v52Dl"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'ym6puQ23xoJ8aeCn' \
    --isGlobal  \
    --isPublic  \
    --limit '1' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["mykmoPYgc2L4jk4L", "khjYnaq6foWvXa3b", "MrXsDr6kILsSSyDd"], "cycleOverrides": [{"cycleId": "o0LSP0pf4IxjUkl5", "maximum": 0.8952160168371851, "minimum": 0.9314947684817215}, {"cycleId": "X3ateEKDpADz1x3p", "maximum": 0.24100830001534967, "minimum": 0.47614715984404277}, {"cycleId": "3Qgb3boLQQ1MzH7Q", "maximum": 0.2062482449127394, "minimum": 0.9804680767992237}], "defaultValue": 0.0313659939292984, "description": "wbmXgdAPh1EThG96", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.5866400159791997, "minimum": 0.8810708498452122, "name": "WDgCcxvONZm3EeER", "setAsGlobal": false, "setBy": "SERVER", "statCode": "pKKTlmVr9XuoJbRF", "tags": ["QSKVPHbn4Xxtu7LQ", "RENjEEztx1WsYSiZ", "qan0nSBJroav91GX"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 44 'CreateStat' test.out

#- 45 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'ExportStats' test.out

#- 46 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 46 'ImportStats' test.out

#- 47 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '8' \
    --offset '44' \
    --keyword 'KtW18iGeUlc9d9so' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gWa24CKNS0GqVvUf' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HQvsHXNUNe4mhgo5' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QB65lSAiYnNjkfZr' \
    --body '{"capCycleOverride": false, "cycleIds": ["yrOMlNFSrUEirnjX", "vGgbLdLsFzHkBMr1", "9fDmIbeZxzfTcyiu"], "cycleOverrides": [{"cycleId": "ATus9hsfpFDcSDG8", "maximum": 0.0021117655664283363, "minimum": 0.6278523393534964}, {"cycleId": "VGLiBNrDjqoxcwgG", "maximum": 0.6019578499510901, "minimum": 0.804133109540353}, {"cycleId": "pUL4pp2ncYAHdNzD", "maximum": 0.1961792286427485, "minimum": 0.0733883694519446}], "defaultValue": 0.5487924690810226, "description": "P6rOvDz9KOsb392k", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "FfRByjlBiuFM3FIo", "tags": ["iVi10sG6vxkfUcmq", "2SCnqntX9y1aZSWM", "Vk8T3GpAnkCmBUqg"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '5UBJCjfcnLRfxeCS' \
    --limit '52' \
    --offset '33' \
    --sortBy '9WEi8KlloeH0JT1y' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'duat2vQR3biBfsu4' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'jmsRE2w1yEkLgh3t' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IYt4SqYUTLDx9gIi' \
    --isPublic  \
    --limit '60' \
    --offset '47' \
    --sortBy 'andpGT2t24aOMh5e' \
    --statCodes 'C3IHeHSKLCa3xreN' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUWehwH3q31A806D' \
    --isPublic  \
    --limit '74' \
    --offset '74' \
    --sortBy 'gas4b6z3LNUj7fdg' \
    --statCodes 'LA84Z8YYk6QEgJjB' \
    --tags 'bEDoNf3n0hEoRCAc' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'f80zfFyabWAgIUXi' \
    --body '[{"statCode": "I07A68eaqC2J9jyE"}, {"statCode": "W6GLbc0NaKDUL3sa"}, {"statCode": "13lk1dQBHO86IlBh"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'netU4RwTqUXlTDBz' \
    --body '[{"inc": 0.6501629508923097, "statCode": "uYsaZA2yyd4mbqoO"}, {"inc": 0.09575427818634497, "statCode": "ADMMAXFaY9eKa699"}, {"inc": 0.030423209545482055, "statCode": "RVhyaKwwrAP2aMlu"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7WtjCtoYetOO847g' \
    --body '[{"inc": 0.9767384684533947, "statCode": "OudOfjnCuHZ3c46I"}, {"inc": 0.15085501740749396, "statCode": "Ga23YvYmmDg7VYPX"}, {"inc": 0.553466537168641, "statCode": "uvUYTZBRujIUE1Tq"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5jyAZvkRCMNFIurj' \
    --body '[{"statCode": "h2imdb4rbkXj0Zws"}, {"statCode": "VC0gL97ZVJSPqJiw"}, {"statCode": "v1qlYB1RSKs6gQxC"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '3Gb7S0o4zGYY7KQI' \
    --userId '1AeFgPqaOkvo1aol' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'B4lkKB4EYOkQ1jMD' \
    --userId '3cym8xIfkOVW2grR' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EOLx0KOww3HICQLf' \
    --userId 'l7MUBG7qtPu64yAt' \
    --body '{"inc": 0.7570414055710353}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RKLRkb738HGS6rDg' \
    --userId 'MdIIlhS1fSiM9331' \
    --additionalKey 'm7Ta1PsKc50Kv6ec' \
    --body '{"additionalData": {"nEevcAx2K2zkRenm": {}, "PZnGBt4P7WnbdSJt": {}, "jX7ZshZyZl5x4bRX": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '75' \
    --statCodes 'HUTrDzZSKscfOcYu' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '3dpCROYqUiGKXVFC' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '30' \
    --name 'po6sPwVOEDSJsEK5' \
    --offset '87' \
    --sortBy '65UXmy0Zp6iIaTIK' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["EORV3bu1bNCtX7W4", "0V6Do5sYadCCFrHH", "ck0upMzUYnb76tFk"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'C3DpZxkrQDXuNFvi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Marv8mnfHK8CCmE2' \
    --userIds 'lPnsbD3SGEdlwuUc' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.0373106812181625, "statCode": "E536ugBp3HBvepnD", "userId": "CjgyJlXe36mgWjLf"}, {"inc": 0.5031493666927561, "statCode": "mteue9nzJ6fH24T8", "userId": "05tVg8JqU0jZpjvs"}, {"inc": 0.3381196485685791, "statCode": "gAOS7u8RiWyerCSa", "userId": "8SRgwsAj1ik1jgla"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.47579165875827867, "statCode": "XTvKCWwNTAhd2wrS", "userId": "0uPdjhdinpng5BLy"}, {"inc": 0.9785573373314173, "statCode": "wbhMssAHjapIkY9R", "userId": "f4wP57dBZNR88YbC"}, {"inc": 0.3130692262199085, "statCode": "mKy8M9zVrjfGXZnq", "userId": "AQUoY1GjlIIk0iKo"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "TTS1j02o7JjTXAQN", "userId": "0qdskdQV0TqI8EFn"}, {"statCode": "mDbxIxi4YKlONk2Q", "userId": "5Y4JvaizwiilatuU"}, {"statCode": "jjt9lIMGql5ElEa9", "userId": "EIIlGcHB3CfR3ncD"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["mtj3giPg4x4yiPX6", "XJbZDKKoxLE1Y3Dy", "1eMbEIjowLqc3ecj"], "cycleOverrides": [{"cycleId": "ues1Hhhkg1yLVbLF", "maximum": 0.41532618984337, "minimum": 0.5384930373568598}, {"cycleId": "EP8cM4NTwr0KHaAs", "maximum": 0.20430102841032904, "minimum": 0.7339033146846644}, {"cycleId": "ej52WKi6tArAURt9", "maximum": 0.25518285111490535, "minimum": 0.18243570310217938}], "defaultValue": 0.45624912044356647, "description": "SVq8PdH6hJPUAc0R", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.938737989260501, "minimum": 0.019085535526272013, "name": "Q71w0deoV9Lx5RDA", "setAsGlobal": false, "setBy": "SERVER", "statCode": "2XcrciYNEzvSZIPk", "tags": ["Z7PC6f6QkmZXElW9", "xh4ijFnE3Tam69qS", "hSgORcz5S5BvmgBL"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'uWJu3pDMUAeeZ97S' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '75' \
    --sortBy 'ROPYuG6XqP6oo7G7' \
    --statCodes '3zdxTgOfnwIdlNa2,9fDLh741IslKHzGl,LKWUtDQs61OQAoxy' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --offset '10' \
    --sortBy 'QpRWCiiPDGQhNPEw' \
    --statCodes 'iJCf2XJVrlzqQls1,ozhLVA3kE8jKvgat,OEBM70TdlNBJYOmp' \
    --tags 'u1VCarzBsV6xnZ5J,rzzjrcaug6CWVG8S,WP3glU6muswVJnNn' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'N7kAa7j0riFc5HTH' \
    --statCodes 'QIoVsGo7dwV9DBqF,KHQkETJyTlUrwDTn,oujQD4IEiH9Z5qXn' \
    --tags '3aoRtlqOECohViHA,5CzgFSy8X1A3PrIf,apq5AAeMe4L3mDWO' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'RBVXTIIJM9XsYIIZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xiXNMR9BgaWcFX3S' \
    --limit '96' \
    --offset '66' \
    --sortBy 'BhyoTsMWPAxUMkaw' \
    --statCodes 'aGpAyrIwMif3BOdk' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ocVTd4BxqGWV6mTJ' \
    --limit '51' \
    --offset '37' \
    --sortBy 'AFdO0Khqf6kiTdSG' \
    --statCodes 'v2LFjAKY7CbgsWqF' \
    --tags 'WZX7kPBom8F9GLLT' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'G8phc3n4iLoIllKl' \
    --body '[{"statCode": "pO2pqiXJF3WGRaoQ"}, {"statCode": "omSJC4DdrKF7SUQP"}, {"statCode": "LG59e0k5ZtX6wK7P"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pUlcIW32iK7MGt1i' \
    --additionalKey 'xY5rA1WoVeJIePF8' \
    --statCodes 'ZrQzP4zvtdxdbZUp,d6FJtHJ1pyVwyKQL,Y6FEO65Rb3z7CYLM' \
    --tags '8IlsHqffnrfsGlfP,aZKBwa3Ddb60ufPp,zwj1QGIFmlVf4jva' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pseE9LN9bvhOrHfl' \
    --body '[{"inc": 0.5627648550111406, "statCode": "Od6X3viLvtEk4mTI"}, {"inc": 0.24513833743804103, "statCode": "UA9gxo8SV38nEhoX"}, {"inc": 0.1966410230542882, "statCode": "M2W7l6jHMA2rG3na"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kopAywelu01nryEJ' \
    --body '[{"inc": 0.85221680398654, "statCode": "NqoTow0qiOiC4j0i"}, {"inc": 0.16832769118301072, "statCode": "tm0ZPLkLOsp0LZ5n"}, {"inc": 0.15989172294372445, "statCode": "N86Hl8kUXzt6bSc6"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWvgpVyW9dD1kOmv' \
    --body '[{"statCode": "rAejcq2LgkQuaS7R"}, {"statCode": "Bx3vim02jBOxrZDy"}, {"statCode": "vpcLYOWA8NjxOnaE"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ok4nOOCzfsflhjbn' \
    --userId 'gJOUn18G5MlfDTk8' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aG40NlncceIZSwgA' \
    --userId 'Ikgzh4pTU0Am4DZh' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'l0bQxFJ3sWCqQpQ2' \
    --userId 'FbKPFMycMSQ4qfAa' \
    --body '{"inc": 0.04410765236711678}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'R0LgB5BUXvjcu2s6' \
    --userId 'w3VifnKqmTSoGH1X' \
    --body '{"inc": 0.49085014698450713}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fY6QAYn6WQ5UBEU1' \
    --userId 'QAOHfZiGhxOdcuDX' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"SxSc3aZPV87pna08": {}, "gxefTYKhuxaEc7M4": {}, "P7UckSC6ePeN8i4G": {}}, "additionalKey": "rFES9z7xueHpATHc", "statCode": "cee9GXhKcjmSEwdr", "updateStrategy": "MAX", "userId": "op9v7aZK3h65hbN1", "value": 0.9254424449783817}, {"additionalData": {"zfQSfQrtfF3TQN0O": {}, "cNDLr36vzohZyjMQ": {}, "Ag5mPYhrLTyU8Ohg": {}}, "additionalKey": "fY9JQYGF4bYXEcEN", "statCode": "x9xZlAchob44lOND", "updateStrategy": "OVERRIDE", "userId": "7FUjfIGaffoflEIB", "value": 0.3987551910723546}, {"additionalData": {"YqeKN0meGelYF5wW": {}, "aDhukU4khGG4vZFT": {}, "YnPkmSu4PWam1jxR": {}}, "additionalKey": "7SETWjteoc8fgvZD", "statCode": "DhoO05oKqymxLD1L", "updateStrategy": "INCREMENT", "userId": "Xvea7H1m2lJFRZ3Z", "value": 0.24421256643932354}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'rZ60zMjhTHeh94TS' \
    --statCode 'enE5hCFkIf5weqZ1' \
    --userIds '8MH57l2Zsrh90ETt,YmGukz3MnlrjcHp6,B8Vj7rXFgDnDkdZ9' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bpjb1tdA3QhjCMW6' \
    --additionalKey '4f4XhIjSoTB2NMKt' \
    --statCodes 'ezapPr2QEPx3zTxB,GtEJIYppuUSsKoHw,2hyd12uSE7BEv3ae' \
    --tags 'vq6iohU1cg4W1IS3,Uv1BpWoJBaqdg2FH,cunsS1lnaO2m9vqj' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'hbeK2qN8g6x2PyYD' \
    --additionalKey 'o5R3hLiD5sf5y1Js' \
    --body '[{"additionalData": {"xJNGmyt0SQDUDoWB": {}, "ZVGLlkUetzCAWc9x": {}, "1aMjgGim51T107XI": {}}, "statCode": "ZRZ7tZdIs0xf4czd", "updateStrategy": "MIN", "value": 0.7441129607500176}, {"additionalData": {"jOn5mM7k8nbLzvtC": {}, "IW5ynMKquUicAeIV": {}, "XtoWAXhMlW4tLqX7": {}}, "statCode": "OICf5oD1e6oI9FmY", "updateStrategy": "INCREMENT", "value": 0.897150525333361}, {"additionalData": {"wSkHKufBdS3ZOokZ": {}, "B4cXnAXyuGz6LlxH": {}, "v8SwyagYvDJ3w3UN": {}}, "statCode": "gIGj2jZtEYT8sIPS", "updateStrategy": "OVERRIDE", "value": 0.8645468493594508}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'fUfKmihDbmu8ePWl' \
    --additionalKey 'QMVDXEHeiGTnwyEw' \
    --body '{"statCodes": ["510kHr4isTKWjmv6", "6hIWDZrpP7rz3ISW", "7nuHCXWfwnwGioVw"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'VzmmBVVFfpqx1AeL' \
    --additionalKey 'tzcPJ3jtDYBo4FUT' \
    --body '[{"additionalData": {"H7CGfKSyxgRR1DiC": {}, "qSMzpqIFGLkDs7AC": {}, "C1RgBfoNrHlFi2qJ": {}}, "statCode": "LgmBLE35YhyiDV90"}, {"additionalData": {"SeI5yppBHoytVznC": {}, "gNyx9fbT63ShEh8P": {}, "bGikLjgjcj34uulU": {}}, "statCode": "6FYBZsWFbr3RSP0W"}, {"additionalData": {"9nBhvhf8Q0DtJMcY": {}, "QdN66bswAgt65X4N": {}, "1LQZmB61JMdtwCVU": {}}, "statCode": "rYQue84dwmbwFEnA"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZaWsQJtRYoagRJK5' \
    --userId 'PX9UcOvhPyE11TRT' \
    --additionalKey '2SKseoe8VLie0LBa' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '36KNzjf005CXNGeh' \
    --userId 'Q2aTjTDfKFDXC7eG' \
    --additionalKey 'L5YhJDWh9YWqc0qg' \
    --body '{"additionalData": {"V6d9yOfIMLds2DbP": {}, "caoMdtRLTmSvTkQQ": {}, "gB7exYvmHMxr5hPC": {}}, "updateStrategy": "MIN", "value": 0.4060991535387337}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"tJBg0tTJg46IewOX": {}, "E2AkCh3QIZsUf8lG": {}, "FXcmwTERHclOdxIw": {}}, "additionalKey": "qejxe18rNdb8Otq6", "statCode": "j1mqUav7k05HAQlt", "updateStrategy": "MAX", "userId": "MBsznlBUqnLT4AbG", "value": 0.24414838420592344}, {"additionalData": {"tKaWNvPbpg7yrRvX": {}, "fZ6rvgvEY3Hht1Sw": {}, "qTsKKKo37NHDOQe9": {}}, "additionalKey": "1Ps3ztUIV0dS6hIH", "statCode": "9c4VfkyrwpuXxbaE", "updateStrategy": "MAX", "userId": "bfgPmi0eHkt1mr9E", "value": 0.6521535091721916}, {"additionalData": {"IFg0dnWIYN2NVL70": {}, "Iw157g00jr9b8MuY": {}, "mmeKTmBNvGYxEQdf": {}}, "additionalKey": "3ewoGGoY7xmFNAmj", "statCode": "DDCvs78mcMdiS76Y", "updateStrategy": "OVERRIDE", "userId": "Y2o6ouRW9UtNquwC", "value": 0.8892083147452017}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WgumrIz4NhGztZpr' \
    --additionalKey '4U4fwQIiLXgmRasv' \
    --statCodes 'jO4lj8m3XEwP2b4g,d3xOeii8Jnmssep2,xD2NY0kABeGs9yxa' \
    --tags 'hld1pO0Gyf5PO3CO,yMvczgEpzZ3Fbtxf,hcRC7IVYa6iZ5uFR' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YNn3SHiWxF0YbuU5' \
    --additionalKey 'ar5qTLWUCy0Afgc0' \
    --body '[{"additionalData": {"50XIZRW491e94mQj": {}, "VOOBnIWhunElqZUo": {}, "dp3IhtCSHy1ei1fI": {}}, "statCode": "rPvfHnRN06EjRwEQ", "updateStrategy": "MAX", "value": 0.10700135408873968}, {"additionalData": {"t5cyNe27HLtwtVOa": {}, "xgP6Jbct8puMybYG": {}, "xD9IPmmsLmu3kaPj": {}}, "statCode": "0O4zd8Tb7cUNGPTB", "updateStrategy": "OVERRIDE", "value": 0.40784681693607994}, {"additionalData": {"fjv9oYMXMjlVHY1A": {}, "HwF3vGoav7MK0PcL": {}, "nEkcokKwcQ0baDT9": {}}, "statCode": "OyJ2h23GUS2amU7s", "updateStrategy": "OVERRIDE", "value": 0.203859310777193}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qvZI2KwjqPBiWXad' \
    --userId 'e41s3rH34mB2yPlR' \
    --additionalKey 'pWjmHZAAvKTH8Muq' \
    --body '{"additionalData": {"Ig0CzkguwuJCW7EE": {}, "FB67AODbi9BzupBs": {}, "FpYc77GtRUcCFeY5": {}}, "updateStrategy": "INCREMENT", "value": 0.17097964817354394}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE