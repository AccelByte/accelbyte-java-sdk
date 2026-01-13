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
    --body '{"cycleIds": ["TXp38zsCTCrbCbPO", "4YkHs1cnz1JSDgY1", "yNQkT7NvyE3cwyAL"]}' \
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
    --body '{"capCycleOverride": false, "cycleIds": ["MrXsDr6kILsSSyDd", "khjYnaq6foWvXa3b", "mykmoPYgc2L4jk4L"], "cycleOverrides": [{"cycleId": "o0LSP0pf4IxjUkl5", "maximum": 0.8952160168371851, "minimum": 0.9314947684817215}, {"cycleId": "X3ateEKDpADz1x3p", "maximum": 0.24100830001534967, "minimum": 0.47614715984404277}, {"cycleId": "3Qgb3boLQQ1MzH7Q", "maximum": 0.2062482449127394, "minimum": 0.9804680767992237}], "defaultValue": 0.0313659939292984, "description": "wbmXgdAPh1EThG96", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.5866400159791997, "minimum": 0.8810708498452122, "name": "WDgCcxvONZm3EeER", "setAsGlobal": false, "setBy": "SERVER", "statCode": "pKKTlmVr9XuoJbRF", "tags": ["qan0nSBJroav91GX", "QSKVPHbn4Xxtu7LQ", "RENjEEztx1WsYSiZ"], "visibility": "SERVERONLY"}' \
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
    --body '{"capCycleOverride": false, "cycleIds": ["9fDmIbeZxzfTcyiu", "yrOMlNFSrUEirnjX", "vGgbLdLsFzHkBMr1"], "cycleOverrides": [{"cycleId": "ATus9hsfpFDcSDG8", "maximum": 0.0021117655664283363, "minimum": 0.6278523393534964}, {"cycleId": "VGLiBNrDjqoxcwgG", "maximum": 0.6019578499510901, "minimum": 0.804133109540353}, {"cycleId": "pUL4pp2ncYAHdNzD", "maximum": 0.1961792286427485, "minimum": 0.0733883694519446}], "defaultValue": 0.5487924690810226, "description": "P6rOvDz9KOsb392k", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.09054199103285177, "minimum": 0.6982540070123989, "name": "ByjlBiuFM3FIoVk8", "setAsGlobal": false, "setBy": "SERVER", "tags": ["X9y1aZSWMiVi10sG", "6vxkfUcmqRRbceJ5", "AnkCmBUqg2SCnqnt"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jfcnLRfxeCSz9WEi' \
    --limit '60' \
    --offset '75' \
    --sortBy 'ml48wdNFLTm5T50x' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '9WT0GfH2rtOa4EXs' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'XzOXQAk4mqrxzTtu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ll4XlbGL8QOxtjzm' \
    --isPublic  \
    --limit '93' \
    --offset '51' \
    --sortBy '2t24aOMh5eC3IHeH' \
    --statCodes 'SKLCa3xreNDUWehw' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'H3q31A806DJgas4b' \
    --isPublic  \
    --limit '9' \
    --offset '52' \
    --sortBy '2NubeoKFeIaFQCYo' \
    --statCodes 'DPICpnduEEQlULdJ' \
    --tags 'z4mnRBkMNxvvKgAT' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '8mJrYq6hRkloqxM3' \
    --body '[{"statCode": "gpwxcfMy9XzjjI5Y"}, {"statCode": "bsKoADkzJEN2VHzi"}, {"statCode": "h3bit0VWn3CO39PX"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNxtXgeO3FgkXhjD' \
    --body '[{"inc": 0.411346784796245, "statCode": "aQY3snn2ZkP7cFdP"}, {"inc": 0.9100392648009473, "statCode": "3e5dC9XIBudfZgrb"}, {"inc": 0.5473894653527273, "statCode": "DIDm4hMzF4Txoden"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SrUTvfqU0bfoMm5c' \
    --body '[{"inc": 0.7396681250399703, "statCode": "tFWbotQyXJRcQWsm"}, {"inc": 0.26634441176713775, "statCode": "PNs92epxk0i8VxsZ"}, {"inc": 0.6433411497698663, "statCode": "ereSvf9699mCEHTh"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UJkETAsSp7gh4TeU' \
    --body '[{"statCode": "TkOkAYfJB8AT9t4T"}, {"statCode": "v207Y2QD3oD5fLCr"}, {"statCode": "3OOlXVv8ZGF7uYnG"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zpipNDigNJma1Mbq' \
    --userId 'qZtfNWql4nmwAft4' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gqkNNlWkD9eOziYR' \
    --userId 'FOn0jJLHC9LxhvNX' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TwGBCtohLtl9Zuhy' \
    --userId 'tm5UDrT6QXCs5SPB' \
    --body '{"inc": 0.018629476179174542}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RPZTF6oQAXVG7tns' \
    --userId 'Zg5QgXjvyGJPN4eX' \
    --additionalKey 'bJE5Vs2GcyomQoIX' \
    --body '{"additionalData": {"imBJehyxlNsjUgxB": {}, "kF6wFPoJeQediogE": {}, "hhM2rIizGdKvOPdq": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '91' \
    --statCodes 'rgxSmy1DN9LFkYW5' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DQyj4bj5Ro2ogaKt' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '62' \
    --name 'jQSa3Zdb65UXmy0Z' \
    --offset '31' \
    --sortBy '5EpGhhvXYck0upMz' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["9Pclxcft2ulIJzPy", "NBMA9ORxpzwLR2AK", "6eXUGPJsw1fiP80G"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'rVEiOG4UcqsuGKHh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MRWLVd3DlhLuIpom' \
    --userIds 'M8sm1MiaI1mX2tJo' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4258106146041919, "statCode": "RtdbBe7udsMrok0W", "userId": "vGYYnx4V709xbnGe"}, {"inc": 0.41392094201569307, "statCode": "KsDwG2omOR2nvYI9", "userId": "TVqJdvzcWbfUpaXp"}, {"inc": 0.9319580026332254, "statCode": "JMl5LL4bTxBmZjdr", "userId": "rIxsB0NRsB1fPqqR"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.706464638132051, "statCode": "ulpqpymDkQhtrHWw", "userId": "RVnwVBOqOHi8pWGd"}, {"inc": 0.8641799579734456, "statCode": "juYhiqjRJOqB5F93", "userId": "zFQbJndUDpdONneA"}, {"inc": 0.03568193886334792, "statCode": "zbBdHb2slt71B1Sm", "userId": "Zp2JZp50CnPb71OR"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "YcmQbTU5JX8ccLjM", "userId": "XJRk0eaKQDOJvrTe"}, {"statCode": "fglSs6g4iY9u02aC", "userId": "NYIWekp18lOC3mNq"}, {"statCode": "F7Bl0LcghVHfPEsp", "userId": "xwhRON0bc1eMbEIj"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["FJ1KesKoELCpobBE", "G8X645xpdXpai0rY", "aT5hOPjaf3H0tYig"], "cycleOverrides": [{"cycleId": "hU0VUfcYHJbBfAKS", "maximum": 0.13851733230896857, "minimum": 0.6679718623637916}, {"cycleId": "W3VgsZXiR1DJ7HVW", "maximum": 0.26113724068539934, "minimum": 0.622233636196678}, {"cycleId": "kNSawQUWDFJvJBWi", "maximum": 0.03424309237260048, "minimum": 0.9670067097364041}], "defaultValue": 0.7518497254152791, "description": "kBeIXuqDuAXI66bQ", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.014752381030691653, "minimum": 0.7943831774446338, "name": "BWQi6BqPg4xr0lCa", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "NEzvSZIPkhSgORcz", "tags": ["E3Tam69qSZ7PC6f6", "5S5BvmgBLxh4ijFn", "QkmZXElW9YfRSse6"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'DMUAeeZ97SBROPYu' \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '97' \
    --sortBy '6XqP6oo7G73zdxTg' \
    --statCodes 'OfnwIdlNa29fDLh7,41IslKHzGlLKWUtD,Qs61OQAoxyyQpRWC' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '60' \
    --sortBy 'iPDGQhNPEwiJCf2X' \
    --statCodes 'JVrlzqQls1ozhLVA,3kE8jKvgatOEBM70,TdlNBJYOmpu1VCar' \
    --tags 'zBsV6xnZ5Jrzzjrc,aug6CWVG8SWP3glU,6muswVJnNnN7kAa7' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'j0riFc5HTHQIoVsG' \
    --statCodes 'o7dwV9DBqFKHQkET,JyTlUrwDTnoujQD4,IEiH9Z5qXn3aoRtl' \
    --tags 'qOECohViHA5CzgFS,y8X1A3PrIfapq5AA,eMe4L3mDWORBVXTI' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'IJM9XsYIIZxiXNMR' \
    --namespace "$AB_NAMESPACE" \
    --userId '9BgaWcFX3SUBhyoT' \
    --limit '38' \
    --offset '73' \
    --sortBy 'MWPAxUMkawaGpAyr' \
    --statCodes 'IwMif3BOdkocVTd4' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BxqGWV6mTJ0sQs6X' \
    --limit '81' \
    --offset '75' \
    --sortBy 'bjvqhnUVLWu8olKd' \
    --statCodes 'xL6ozRmDD0jJvlfV' \
    --tags '5OemPYdYT7DROCjt' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems1' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'uzFMbAG9YI89hmgu' \
    --body '[{"statCode": "B8FOTjMLo4b9rIzq"}, {"statCode": "YkEpstyVTBcrM8rG"}, {"statCode": "0rH0zcswwVeMK6Mb"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'GIVIu8vvwLc7KY3u' \
    --additionalKey 'VoJXTIMtpgkieDyF' \
    --statCodes '97lGdMiHKxbWCYzo,8yO2KTK9tmmOnYnO,pas6ghP1y4Zi7s7Q' \
    --tags 'Blk44Z44B1GZgKg4,uKxaCgcGLuC3brWd,TYCfHkIySok5DiXZ' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tLW87rGysryod3dN' \
    --body '[{"inc": 0.6781351964151027, "statCode": "rmsApRA6HX3RwrKt"}, {"inc": 0.8728218468701433, "statCode": "ecozL0TOg54vCE48"}, {"inc": 0.5984429862291547, "statCode": "5oLF6M4lNa4JUMSH"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NgqRqCV7usamANkZ' \
    --body '[{"inc": 0.1777912479785706, "statCode": "OX9Sfo95HgXqKhTP"}, {"inc": 0.17700782124155712, "statCode": "wfLM9uSybRzWek2g"}, {"inc": 0.8314821270834292, "statCode": "vRrvr0n9d9lvccKM"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LhrTrcBE2ItBS3Kt' \
    --body '[{"statCode": "KZWe8aoFzAyBME74"}, {"statCode": "HUtipUWYhWV1qx8C"}, {"statCode": "zPML52faXUr9Sk4l"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'q2faBcAXXKlhvyH8' \
    --userId 'paOJtxqMPpcVfRwN' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'j547fH0XrKEDpEY8' \
    --userId 'VnocGAjci0V3tBf2' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jnHGKXphn50c9tNL' \
    --userId 'DljhZ2jxLRX3z46O' \
    --body '{"inc": 0.45447194521142}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aGBeMfPlNos4yBRj' \
    --userId 'rERHEonAZR8GmEu0' \
    --body '{"inc": 0.27364411810025346}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1p6QCyY6vSkVFWds' \
    --userId 'bYuVEGVxYheR3j5m' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"NZ6vwv7K8Asvt1j1": {}, "Rx59hesNWy2NvZ85": {}, "DDKDAF8KDsBZOuYQ": {}}, "additionalKey": "J03BAHZ7c53q7akM", "requestId": "pcmnnx6RVBrop9v7", "statCode": "aZK3h65hbN15zfQS", "updateStrategy": "INCREMENT", "userId": "U7eHGebSVu0LQ40k", "value": 0.07510013055205422}, {"additionalData": {"pEaC4dfiOMZfEhHr": {}, "39pysFO3Zvc1BZG9": {}, "9LyvfvHEsJKQQewV": {}}, "additionalKey": "LMUoAnaRcYp7FUjf", "requestId": "IGaffoflEIByYqeK", "statCode": "N0meGelYF5wWaDhu", "updateStrategy": "MAX", "userId": "cV7vWgSHdfo07Uct", "value": 0.6672981509245468}, {"additionalData": {"ErqxyMyOK06MqQBE": {}, "rxgjVBycvU4PbmRD": {}, "crg0DjQjBECXvea7": {}}, "additionalKey": "H1m2lJFRZ3ZprZ60", "requestId": "zMjhTHeh94TSenE5", "statCode": "hCFkIf5weqZ18MH5", "updateStrategy": "INCREMENT", "userId": "l2Zsrh90ETtYmGuk", "value": 0.4110634699722774}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '3MnlrjcHp6B8Vj7r' \
    --statCode 'XFgDnDkdZ9bpjb1t' \
    --userIds 'dA3QhjCMW64f4XhI,jSoTB2NMKtezapPr,2QEPx3zTxBGtEJIY' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ppuUSsKoHw2hyd12' \
    --additionalKey 'uSE7BEv3aevq6ioh' \
    --statCodes 'U1cg4W1IS3Uv1BpW,oJBaqdg2FHcunsS1,lnaO2m9vqjhbeK2q' \
    --tags 'N8g6x2PyYDo5R3hL,iD5sf5y1JsxJNGmy,t0SQDUDoWBZVGLlk' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'UetzCAWc9x1aMjgG' \
    --additionalKey 'im51T107XIZRZ7tZ' \
    --body '[{"additionalData": {"dIs0xf4czdt7zqmS": {}, "KxOEQlVcx6GqsBq8": {}, "vdhWVnuYLgpZehK0": {}}, "requestId": "G2nmyuViB9kRTcSQ", "statCode": "dTnNYGeAfYFG3wSk", "updateStrategy": "MIN", "value": 0.5837823597062365}, {"additionalData": {"ufBdS3ZOokZB4cXn": {}, "AXyuGz6LlxHv8Swy": {}, "agYvDJ3w3UNgIGj2": {}}, "requestId": "jZtEYT8sIPSE1XXP", "statCode": "zySa0sZoFS6xCOWM", "updateStrategy": "MAX", "value": 0.7976080431584907}, {"additionalData": {"EHeiGTnwyEw6hIWD": {}, "ZrpP7rz3ISW510kH": {}, "r4isTKWjmv67nuHC": {}}, "requestId": "XWfwnwGioVwVzmmB", "statCode": "VVFfpqx1AeLtzcPJ", "updateStrategy": "MAX", "value": 0.0764097222100506}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'GwaPSDMZz95OYKiq' \
    --additionalKey 'aZD63xe5rruJVfLG' \
    --body '{"statCodes": ["ea0ZtlzUcuHAXz0U", "SHevO0TQNEI3kfab", "V31MfuGaXsAuGsZa"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'xJWWSI1ECUo1NPpe' \
    --additionalKey 'FhUztXDgB7n4C97u' \
    --body '[{"additionalData": {"APP8PATLpUpxeJls": {}, "BJT6Hh3OMjAjq2mK": {}, "8lbSEEelxnb5QxWG": {}}, "statCode": "2HFnZlA6HKWW4fI1"}, {"additionalData": {"IQcoBQELcNlZkqTZ": {}, "rKgXNwvm4e5GX6H7": {}, "42OixhtAoKiVm6UR": {}}, "statCode": "T95XhnUcvWB28Mpu"}, {"additionalData": {"suhhDJ5slzgiWZEt": {}, "yd56LfxnbY97jjYg": {}, "XchCbkXX26uEdCfQ": {}}, "statCode": "aMAQuTKfC0I2kNjC"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MDtDMrentgn3Dhqc' \
    --userId 'iwIeShF9RKb9vvxu' \
    --additionalKey 'JlhXbWhbwPwToC6k' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'njVwVnzaqSfJiQFC' \
    --userId '2gXoda0kg16yUSpS' \
    --additionalKey 'OAjHJWwfCjYwWkLo' \
    --body '{"additionalData": {"b9gKLqs2nEZhpByf": {}, "HZinxNfgPAwkMBsz": {}, "nlBUqnLT4AbGptKa": {}}, "updateStrategy": "MAX", "value": 0.3532400019980123}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"Pbpg7yrRvXfZ6rvg": {}, "vEY3Hht1SwqTsKKK": {}, "o37NHDOQe91Ps3zt": {}}, "additionalKey": "UIV0dS6hIH9c4Vfk", "requestId": "yrwpuXxbaERbfgPm", "statCode": "i0eHkt1mr9EOIFg0", "updateStrategy": "INCREMENT", "userId": "CxuogFteTHJe4BhS", "value": 0.7169018469641976}, {"additionalData": {"QkQD6WmOt6D7ufFV": {}, "TOhvQpfbBke8aEdd": {}, "36xj6wySoltDxsbz": {}}, "additionalKey": "xrlaKEfkoYjY2o6o", "requestId": "uRW9UtNquwC3Wgum", "statCode": "rIz4NhGztZpr4U4f", "updateStrategy": "MIN", "userId": "qkCfgCUYBn2xaOBd", "value": 0.664281390378021}, {"additionalData": {"F0JmX8qwU1cTuHHP": {}, "B5S3DvPRCzBrVUxm": {}, "DOj3cvRFaTC11W0T": {}}, "additionalKey": "GTCm4fZWuk6pQxDQ", "requestId": "pKqxLGeMvr9TsvcM", "statCode": "Q7dBsaIecRxIsZvD", "updateStrategy": "MAX", "userId": "rmzVr5XT1Nxw0v1d", "value": 0.6136707570300272}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q9Rrbk6C2cVWf6tt' \
    --additionalKey 'vbU1PO6ApCD2VXid' \
    --statCodes 'T7w0Oc15N8WXBPp1,7PAewqSm5x3B4t7W,Qnp8jXZedgt5cyNe' \
    --tags '27HLtwtVOaxgP6Jb,ct8puMybYGxD9IPm,msLmu3kaPj0O4zd8' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tb7cUNGPTBxiFFCr' \
    --additionalKey 'n7djjs69FTFVGUVh' \
    --body '[{"additionalData": {"vKhJCmeisql14mUH": {}, "VbMPimNhcZsU3VAd": {}, "MDcb4qlkiFAamqvZ": {}}, "requestId": "I2KwjqPBiWXade41", "statCode": "s3rH34mB2yPlRpWj", "updateStrategy": "MAX", "value": 0.5425820838380074}, {"additionalData": {"biQ5duE5p4cfs2E4": {}, "1cK8QTwiIAvxSvND": {}, "lmM5nQFMGzs7fzjg": {}}, "requestId": "yc44mEh9tRk8knYS", "statCode": "V30lnroQehMDli6t", "updateStrategy": "MIN", "value": 0.014259317675403005}, {"additionalData": {"AtEbu4IjGdqthRxT": {}, "jQ7gkZEY8rG0q0Q2": {}, "Qd2JzRbkF2I03dIj": {}}, "requestId": "vBbA6bfbYaJCJjfk", "statCode": "2TUvn95FhO7VW3mb", "updateStrategy": "OVERRIDE", "value": 0.18011072104001125}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oFSKWM1eym5ydC6p' \
    --userId '25xCWTqUOYZENJ1Q' \
    --additionalKey 'HZQxPRXH7uxBJEEC' \
    --body '{"additionalData": {"QE1li3Bg7Jxc9pUn": {}, "ZmvhidwCkZwqjYLf": {}, "TiCO1NDBvQvRPnAz": {}}, "updateStrategy": "INCREMENT", "value": 0.7649626602381021}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE