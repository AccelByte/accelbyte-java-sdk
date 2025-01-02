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
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'EAxcVpFrttufHIRd' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'H9UzVRiXbqlAw7r6' \
    --userId 'W2ktQG0h5JAav5kR' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'a62WopBJHPtcDs8b,BZLCXLx8bbgorQeF,bQ1g7qbPngUNB1vR' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'odwpzS6DaDpv8N7Z' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'QVqGj6oDLjWjkY1a' \
    --body '{"achievements": ["XlFcDtgOjchIua5t", "WEIC32ogW7olvbTg", "rhRTcPiSuL0Sly6X"], "attributes": {"M4OI18mAQLnzjMf8": "GZ2WBZqxYG3aREAu", "2D6QVKNCWP75TB0i": "7pKxR8dl0zRVW4EZ", "G9m0XcgGVbMqSszE": "8GHavj7AorKsxwko"}, "avatarUrl": "sAVerXpc1C8XfwHu", "inventories": ["Keb9l3rGN9A3sNm8", "4hddSpHt0P7MIIR7", "CkyF6C7duuyZ0GhD"], "label": "ogqrhBRd8lDR6qVN", "profileName": "PRZYdFLIAjGGJddV", "statistics": ["Cvu9vx5KQ7KYnIuM", "BvaO35llzQRaT5kP", "xUfofvnnSuB0y5WU"], "tags": ["lrMdI4sNveabntBS", "xTeIv53HGCiljvjK", "oyD6SCwGrncqmLtj"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'QHAf8TgoNm03VLis' \
    --userId 'V6zwPuo3td6TC6I3' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'lMjGSWN2laRlxfcj' \
    --userId 'HfYakUCTqGkE7wcW' \
    --body '{"achievements": ["fDslpJSqGAXQ0yYo", "NRKd3IL5TAQ6iiPl", "SC2uE4o5Vwdo3feP"], "attributes": {"qIJA8IHtrkmu0hpD": "DWVAla2l5BYNtIuS", "5S5XUdjsoqwGyzzW": "i9gwQYv7t1o7TTr1", "DmrhZv15T7quIOvB": "McaYmvCkGZ5dAgqx"}, "avatarUrl": "pBFmaLoxozr6wfNP", "inventories": ["X2bOItRMvqtlB2jJ", "CSQT279ZZPYGu0rd", "lgdWyOtXi3choQrp"], "label": "OsDBU5SepjChB3V0", "profileName": "v52Dlym6puQ23xoJ", "statistics": ["8aeCnaLpUKp44YUD", "jasWIPUvmEejtGeo", "yIPa8ZRrvjj7il35"], "tags": ["MXbN9oCMNqq98SjT", "vhZNkSQ70D0H6BXk", "sUC9b6i5lZC9xv32"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'e8c5csSovoqsZNBd' \
    --userId 'te9NDUPVJf6c2Z0Q' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'ZxfgPubTDIHrvqAT' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'huwjRHpKKTlmVr9X' \
    --userId 'uoJbRFQSKVPHbn4X' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'xtu7LQRENjEEztx1' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'WsYSiZqan0nSBJro' \
    --userId 'av91GXlvPG6bFYRe' \
    --body '{"name": "VHQipcCx9Zw5D2L7", "value": "vIYhGGSyEW4ZJJ42"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

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
    --limit '7' \
    --offset '8' \
    --statCodes '3PBddN8S48l9lyNA' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pflxqMrj3oZk03QX' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '51' \
    --name 'KMDYDDxHSZjtqXyJ' \
    --offset '63' \
    --sortBy '8f7Gc26SaiGVkydw' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "QG26yUZNmTBcvrbY", "end": "1985-08-27T00:00:00Z", "id": "wZtxFHyPLtI8ilby", "name": "DPUIj88cekdqCt81", "resetDate": 86, "resetDay": 54, "resetMonth": 68, "resetTime": "ktfIovmv9gsR5cJc", "seasonPeriod": 69, "start": "1991-04-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["lBiuFM3FIoVk8T3G", "sb392k6YmJFfRByj", "pAnkCmBUqg2SCnqn"]}' \
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
    --cycleId 'tX9y1aZSWMiVi10s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'G6vxkfUcmqRRbceJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "i0EeDxOgBnhhqElI", "end": "1971-08-31T00:00:00Z", "name": "KlloeH0JT1yduat2", "resetDate": 43, "resetDay": 88, "resetMonth": 100, "resetTime": "R3biBfsu4jmsRE2w", "seasonPeriod": 82, "start": "1983-09-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'QAk4mqrxzTtuLl4X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'lbGL8QOxtjzm8y2w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["NhmwoYZyI4EFZKBc", "YrCEAE7WIsfmx40N", "LRc6m8heKnWhzfe2"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'NubeoKFeIaFQCYoD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PICpnduEEQlULdJz' \
    --userIds '4mnRBkMNxvvKgAT8' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2072593422443899, "statCode": "JrYq6hRkloqxM3gp", "userId": "wxcfMy9XzjjI5Ybs"}, {"inc": 0.5855707421112814, "statCode": "oADkzJEN2VHzih3b", "userId": "it0VWn3CO39PXDNx"}, {"inc": 0.31445948628705644, "statCode": "XgeO3FgkXhjDzaQY", "userId": "3snn2ZkP7cFdP43e"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9352307170056495, "statCode": "dC9XIBudfZgrbHDI", "userId": "Dm4hMzF4TxodenSr"}, {"inc": 0.7558294483300658, "statCode": "TvfqU0bfoMm5cTtF", "userId": "WbotQyXJRcQWsmqP"}, {"inc": 0.6392875552519923, "statCode": "s92epxk0i8VxsZNe", "userId": "reSvf9699mCEHThU"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JkETAsSp7gh4TeUT' \
    --userIds 'kOkAYfJB8AT9t4Tv,207Y2QD3oD5fLCr3,OOlXVv8ZGF7uYnGz' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "pipNDigNJma1Mbqq", "userId": "ZtfNWql4nmwAft4g"}, {"statCode": "qkNNlWkD9eOziYRF", "userId": "On0jJLHC9LxhvNXT"}, {"statCode": "wGBCtohLtl9Zuhyt", "userId": "m5UDrT6QXCs5SPBb"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'RPZTF6oQAXVG7tns' \
    --isGlobal  \
    --isPublic  \
    --limit '12' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["E5Vs2GcyomQoIXim", "BJehyxlNsjUgxBkF", "5QgXjvyGJPN4eXbJ"], "cycleOverrides": [{"cycleId": "6wFPoJeQediogEhh", "maximum": 0.6214331178346731, "minimum": 0.886584765681493}, {"cycleId": "rIizGdKvOPdq5xrg", "maximum": 0.3755302953545204, "minimum": 0.7111798308337324}, {"cycleId": "my1DN9LFkYW5DQyj", "maximum": 0.9185755163686595, "minimum": 0.017386330471665268}], "defaultValue": 0.1493656822084305, "description": "5Ro2ogaKt2ujQSa3", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.8016255735717046, "minimum": 0.19835491899032331, "name": "y0Zp6iIaTIKUkmkk", "setAsGlobal": true, "setBy": "SERVER", "statCode": "0NBMA9ORxpzwLR2A", "tags": ["yrVEiOG4UcqsuGKH", "K6eXUGPJsw1fiP80", "G9Pclxcft2ulIJzP"], "visibility": "SERVERONLY"}' \
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
    --limit '10' \
    --offset '78' \
    --keyword 'HK8CCmE2lPnsbD3S' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GEdlwuUccE536ugB' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p3HBvepnDCjgyJlX' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'e36mgWjLfFmteue9' \
    --body '{"cycleIds": ["u8RiWyerCSa8SRgw", "nzJ6fH24T805tVg8", "JqU0jZpjvsugAOS7"], "cycleOverrides": [{"cycleId": "sAj1ik1jglaDXTvK", "maximum": 0.461191753036883, "minimum": 0.7887244574730745}, {"cycleId": "wNTAhd2wrS0uPdjh", "maximum": 0.05279180678472495, "minimum": 0.13757110162256403}, {"cycleId": "npng5BLy8wbhMssA", "maximum": 0.5423313539972977, "minimum": 0.15461882444317065}], "defaultValue": 0.0119883776218076, "description": "pIkY9Rf4wP57dBZN", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "bCtmKy8M9zVrjfGX", "tags": ["ZnqAQUoY1GjlIIk0", "iKoTTS1j02o7JjTX", "AQN0qdskdQV0TqI8"], "visibility": "SHOWALL"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aKQDOJvrTefglSs6' \
    --limit '13' \
    --offset '88' \
    --sortBy 'iY9u02aCNYIWekp1' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '8lOC3mNqF7Bl0Lcg' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'hVHfPEspxwhRON0b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1eMbEIjowLqc3ec' \
    --isPublic  \
    --limit '19' \
    --offset '63' \
    --sortBy 'XJbZDKKoxLE1Y3Dy' \
    --statCodes 'mtj3giPg4x4yiPX6' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ues1Hhhkg1yLVbLF' \
    --isPublic  \
    --limit '53' \
    --offset '74' \
    --sortBy 'HEP8cM4NTwr0KHaA' \
    --statCodes 'smTej52WKi6tArAU' \
    --tags 'Rt9plCSVq8PdH6hJ' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PUAc0RVwXgAgntLM' \
    --body '[{"statCode": "CuaXBWQi6BqPg4xr"}, {"statCode": "0lCancUZGCHsZYoL"}, {"statCode": "fR1KtOv7Zy0b65uv"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uKNuy0ytZQ7M6Nzy' \
    --body '[{"inc": 0.8568865334676957, "statCode": "adnSKOLFKx1dX4Lu"}, {"inc": 0.7819850349154548, "statCode": "Ju3pDMUAeeZ97SBR"}, {"inc": 0.6483157365985963, "statCode": "PYuG6XqP6oo7G73z"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dxTgOfnwIdlNa29f' \
    --body '[{"inc": 0.4825417814545774, "statCode": "Lh741IslKHzGlLKW"}, {"inc": 0.746403840143706, "statCode": "tDQs61OQAoxyyQpR"}, {"inc": 0.7886800267392218, "statCode": "CiiPDGQhNPEwiJCf"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2XJVrlzqQls1ozhL' \
    --body '[{"statCode": "VA3kE8jKvgatOEBM"}, {"statCode": "70TdlNBJYOmpu1VC"}, {"statCode": "arzBsV6xnZ5Jrzzj"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rcaug6CWVG8SWP3g' \
    --userId 'lU6muswVJnNnN7kA' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'a7j0riFc5HTHQIoV' \
    --userId 'sGo7dwV9DBqFKHQk' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ETJyTlUrwDTnoujQ' \
    --userId 'D4IEiH9Z5qXn3aoR' \
    --body '{"inc": 0.3152623003133266}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lqOECohViHA5CzgF' \
    --userId 'Sy8X1A3PrIfapq5A' \
    --additionalKey 'AeMe4L3mDWORBVXT' \
    --body '{"additionalData": {"IIJM9XsYIIZxiXNM": {}, "R9BgaWcFX3SUBhyo": {}, "TsMWPAxUMkawaGpA": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '49' \
    --offset '80' \
    --statCodes 'rIwMif3BOdkocVTd' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '4BxqGWV6mTJ0sQs6' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'WEEKLY' \
    --limit '2' \
    --name 'hqf6kiTdSGv2LFjA' \
    --offset '75' \
    --sortBy 'L6ozRmDD0jJvlfV5' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["om8F9GLLTG8phc3n", "JF3WGRaoQomSJC4D", "4iLoIllKlpO2pqiX"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'drKF7SUQPLG59e0k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '5ZtX6wK7PpUlcIW3' \
    --userIds '2iK7MGt1ixY5rA1W' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.23469761446110882, "statCode": "VeJIePF8ZrQzP4zv", "userId": "tdxdbZUpd6FJtHJ1"}, {"inc": 0.24238703305364995, "statCode": "yVwyKQLY6FEO65Rb", "userId": "3z7CYLM8IlsHqffn"}, {"inc": 0.28074938732887467, "statCode": "fsGlfPaZKBwa3Ddb", "userId": "60ufPpzwj1QGIFml"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.773810834907092, "statCode": "f4jvapseE9LN9bvh", "userId": "OrHflIOd6X3viLvt"}, {"inc": 0.4921132228843371, "statCode": "k4mTIpUA9gxo8SV3", "userId": "8nEhoXmM2W7l6jHM"}, {"inc": 0.43075624068551355, "statCode": "2rG3nakopAywelu0", "userId": "1nryEJ0NqoTow0qi"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "OiC4j0iktm0ZPLkL", "userId": "Osp0LZ5njN86Hl8k"}, {"statCode": "UXzt6bSc6bWvgpVy", "userId": "W9dD1kOmvrAejcq2"}, {"statCode": "LgkQuaS7RBx3vim0", "userId": "2jBOxrZDyvpcLYOW"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["zfsflhjbngJOUn18", "G5MlfDTk8aG40Nln", "A8NjxOnaEok4nOOC"], "cycleOverrides": [{"cycleId": "cceIZSwgAIkgzh4p", "maximum": 0.7345909494141726, "minimum": 0.7478386688742953}, {"cycleId": "0Am4DZhl0bQxFJ3s", "maximum": 0.7791128798664892, "minimum": 0.4594185337786403}, {"cycleId": "qQpQ2FbKPFMycMSQ", "maximum": 0.9130853724356165, "minimum": 0.26396371704981725}], "defaultValue": 0.09350268243462945, "description": "AacR0LgB5BUXvjcu", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.9126934326906515, "minimum": 0.39394834466220807, "name": "BRjrERHEonAZR8Gm", "setAsGlobal": true, "setBy": "SERVER", "statCode": "QAYn6WQ5UBEU1QAO", "tags": ["c3aZPV87pna08gxe", "fTYKhuxaEc7M4P7U", "HfZiGhxOdcuDXSxS"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '85DDKDAF8KDsBZOu' \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '53' \
    --sortBy 'J03BAHZ7c53q7akM' \
    --statCodes 'pcmnnx6RVBrop9v7,aZK3h65hbN15zfQS,fQrtfF3TQN0OcNDL' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '9' \
    --sortBy '36vzohZyjMQAg5mP' \
    --statCodes 'YhrLTyU8OhgfY9JQ,YGF4bYXEcENx9xZl,Achob44lONDDwMvg' \
    --tags 'I0HlyPR7wZNiVsF6,xG2mXEQdbzIVy8al,ncV7vWgSHdfo07Uc' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'tPErqxyMyOK06MqQ' \
    --statCodes 'BErxgjVBycvU4Pbm,RDcrg0DjQjBECXve,a7H1m2lJFRZ3ZprZ' \
    --tags '60zMjhTHeh94TSen,E5hCFkIf5weqZ18M,H57l2Zsrh90ETtYm' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'Gukz3MnlrjcHp6B8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vj7rXFgDnDkdZ9bp' \
    --limit '18' \
    --offset '46' \
    --sortBy 'b1tdA3QhjCMW64f4' \
    --statCodes 'XhIjSoTB2NMKteza' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pPr2QEPx3zTxBGtE' \
    --limit '73' \
    --offset '88' \
    --sortBy 'IYppuUSsKoHw2hyd' \
    --statCodes '12uSE7BEv3aevq6i' \
    --tags 'ohU1cg4W1IS3Uv1B' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWoJBaqdg2FHcuns' \
    --body '[{"statCode": "S1lnaO2m9vqjhbeK"}, {"statCode": "2qN8g6x2PyYDo5R3"}, {"statCode": "hLiD5sf5y1JsxJNG"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'myt0SQDUDoWBZVGL' \
    --additionalKey 'lkUetzCAWc9x1aMj' \
    --statCodes 'gGim51T107XIZRZ7,tZdIs0xf4czdt7zq,mSKxOEQlVcx6GqsB' \
    --tags 'q8vdhWVnuYLgpZeh,K0G2nmyuViB9kRTc,SQdTnNYGeAfYFG3w' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SkHKufBdS3ZOokZB' \
    --body '[{"inc": 0.9144690742178185, "statCode": "cXnAXyuGz6LlxHv8"}, {"inc": 0.7168638242677321, "statCode": "wyagYvDJ3w3UNgIG"}, {"inc": 0.16015611250059025, "statCode": "2jZtEYT8sIPSE1XX"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PzySa0sZoFS6xCOW' \
    --body '[{"inc": 0.6159809192687695, "statCode": "pyh9pMsQgb64ELbz"}, {"inc": 0.47805522731264416, "statCode": "Mwyo4nIRysQdbufX"}, {"inc": 0.15719675479704065, "statCode": "YnSoIFeouC2m38kX"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rDZWlGVE9sJ4NpUt' \
    --body '[{"statCode": "Kp6M9I6nEwnZhsjw"}, {"statCode": "JeGwaPSDMZz95OYK"}, {"statCode": "iqaZD63xe5rruJVf"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LGea0ZtlzUcuHAXz' \
    --userId '0UV31MfuGaXsAuGs' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZaSHevO0TQNEI3kf' \
    --userId 'abxJWWSI1ECUo1NP' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'peFhUztXDgB7n4C9' \
    --userId '7uAPP8PATLpUpxeJ' \
    --body '{"inc": 0.1924975572510731}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sBJT6Hh3OMjAjq2m' \
    --userId 'K8lbSEEelxnb5QxW' \
    --body '{"inc": 0.52646507593775}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2HFnZlA6HKWW4fI1' \
    --userId 'IQcoBQELcNlZkqTZ' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"rKgXNwvm4e5GX6H7": {}, "42OixhtAoKiVm6UR": {}, "T95XhnUcvWB28Mpu": {}}, "additionalKey": "suhhDJ5slzgiWZEt", "statCode": "yd56LfxnbY97jjYg", "updateStrategy": "INCREMENT", "userId": "FDXC7eGL5YhJDWh9", "value": 0.8135625378911264}, {"additionalData": {"Wqc0qgV6d9yOfIML": {}, "ds2DbPcaoMdtRLTm": {}, "SvTkQQgB7exYvmHM": {}}, "additionalKey": "xr5hPCJJztJBg0tT", "statCode": "Jg46IewOXE2AkCh3", "updateStrategy": "MAX", "userId": "IZsUf8lGFXcmwTER", "value": 0.5440646601555765}, {"additionalData": {"clOdxIwqejxe18rN": {}, "db8Otq6j1mqUav7k": {}, "05HAQltnSojV4jT6": {}}, "additionalKey": "5yclX2FtAz0vJjFI", "statCode": "YWOaNdsimmkW2miH", "updateStrategy": "MIN", "userId": "3Hht1SwqTsKKKo37", "value": 0.6342712576087517}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'HDOQe91Ps3ztUIV0' \
    --statCode 'dS6hIH9c4Vfkyrwp' \
    --userIds 'uXxbaERbfgPmi0eH,kt1mr9EOIFg0dnWI,YN2NVL70Iw157g00' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'jr9b8MuYmmeKTmBN' \
    --additionalKey 'vGYxEQdf3ewoGGoY' \
    --statCodes '7xmFNAmjDDCvs78m,cMdiS76YApGJ9ufw,LYkqIgLuZS6hsQry' \
    --tags 'iEtOAbpeUNf26Uqk,CfgCUYBn2xaOBdPF,0JmX8qwU1cTuHHPB' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '5S3DvPRCzBrVUxmD' \
    --additionalKey 'Oj3cvRFaTC11W0TG' \
    --body '[{"additionalData": {"TCm4fZWuk6pQxDQp": {}, "KqxLGeMvr9TsvcMQ": {}, "7dBsaIecRxIsZvD6": {}}, "statCode": "rmzVr5XT1Nxw0v1d", "updateStrategy": "OVERRIDE", "value": 0.9914227381070906}, {"additionalData": {"Rrbk6C2cVWf6ttvb": {}, "U1PO6ApCD2VXidT7": {}, "w0Oc15N8WXBPp17P": {}}, "statCode": "AewqSm5x3B4t7WQn", "updateStrategy": "MIN", "value": 0.49439997958734083}, {"additionalData": {"jRwEQlNapJRfk4f9": {}, "Zcw1pEHAyNFxcVTK": {}, "uAQTGh5BxjWOozGo": {}}, "statCode": "DtsUuYo5p8ED5QZA", "updateStrategy": "MIN", "value": 0.757496886597819}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'NGPTBxiFFCrn7djj' \
    --additionalKey 's69FTFVGUVhvKhJC' \
    --body '{"statCodes": ["qlkiFAamqvZI2Kwj", "mNhcZsU3VAdMDcb4", "meisql14mUHVbMPi"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'qPBiWXade41s3rH3' \
    --additionalKey '4mB2yPlRpWjmHZAA' \
    --body '[{"additionalData": {"vKTH8MuqIg0Czkgu": {}, "wuJCW7EEFB67AODb": {}, "i9BzupBsFpYc77Gt": {}}, "statCode": "RUcCFeY5g4XgBsbf"}, {"additionalData": {"zqxBPNe8ae1Il4aA": {}, "tEbu4IjGdqthRxTj": {}, "Q7gkZEY8rG0q0Q2Q": {}}, "statCode": "d2JzRbkF2I03dIjv"}, {"additionalData": {"BbA6bfbYaJCJjfk2": {}, "TUvn95FhO7VW3mbD": {}, "VMDu87t0ldWf7iSG": {}}, "statCode": "IiKFtWtn4Yr2svKM"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '6pqLGZ0TBujELAUK' \
    --userId '6mQ5iZgbwwm5iGzX' \
    --additionalKey 'tcknrgidKupvXO6a' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'j4hCmTC34jxW4pID' \
    --userId 'wdqXpmRmut9H9XyW' \
    --additionalKey 'I8bp8fQxRuX91uYm' \
    --body '{"additionalData": {"trHJbEGTUj7YjERL": {}, "1rEQG02zccA8wvLs": {}, "WUNd6lPKvqDejvqk": {}}, "updateStrategy": "MAX", "value": 0.3426375145637601}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"BaagTiRJ8daGTVX3": {}, "Bb7jlz5IfHgKjI9m": {}, "wJSrN8jkIykR2zba": {}}, "additionalKey": "I6PD7fEscShnGUGU", "statCode": "tV9GJ279GDbLNwjm", "updateStrategy": "MAX", "userId": "FK0nnX2poMfZ1hDH", "value": 0.3093219982211802}, {"additionalData": {"bh4HtMlFgvh2Dp2S": {}, "oiIPp1yvfAHS0VgL": {}, "u11A3HTovFi4tPAG": {}}, "additionalKey": "fleyCA6jEtcqsnzo", "statCode": "VILjkwW61duF87aU", "updateStrategy": "OVERRIDE", "userId": "lCiQQC35cj4KyOVg", "value": 0.3407045250364814}, {"additionalData": {"nWbfRJtsB7cUQZ2Q": {}, "UAxJrINPXppPNO3A": {}, "fmXcgwC3IN6tvKgL": {}}, "additionalKey": "B9QmJIOq9dP5szG7", "statCode": "1utjsQ4CrRb9gUCe", "updateStrategy": "OVERRIDE", "userId": "MNIpWoSLkUrfuf4U", "value": 0.8963460655467635}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WeYeA9t2ENKKWrFt' \
    --additionalKey 'HIi1CMgKAOG5iDcC' \
    --statCodes 'R5PbCvDLil8wj9cK,M3Ar6MF35hCER4nG,mWGgTJfHlJl4tHGa' \
    --tags '4XfZcd9CVnGqMX9F,ieeEssWEUl07bhwn,tCVqiYOJf5KwMZQj' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zvjSozv6CTRDl0zp' \
    --additionalKey '9CzHFwinkBNi4gvq' \
    --body '[{"additionalData": {"gl6TZ9TGVPmv34h6": {}, "T7EsufmfxKYB4LM6": {}, "H6QXmpZ9X3fUSR1l": {}}, "statCode": "9xLPBsmAUrD9L1Ii", "updateStrategy": "OVERRIDE", "value": 0.7046761806245707}, {"additionalData": {"NMZcA92hzC7MNa8v": {}, "Ve4MHX6AgMep90Ay": {}, "yUJyAK5PRMRMwdvl": {}}, "statCode": "0hv6g62GxBW2tQF5", "updateStrategy": "MIN", "value": 0.07807245228656157}, {"additionalData": {"0MrPc4vtxk9hVKlG": {}, "56HlzGr7XjdyRJun": {}, "ZPkp6ccIBnWyPw8m": {}}, "statCode": "j7gyQ7XdIszGRj46", "updateStrategy": "OVERRIDE", "value": 0.0770459074617762}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QAe1rzmmgqBPRmd6' \
    --userId 'mO4oI8KDqebm83ra' \
    --additionalKey 'NBJ5y7axEkvI4oxZ' \
    --body '{"additionalData": {"EDxGiBnNbn0zaf7C": {}, "aOSlHXrUSA6sMJzA": {}, "5mtqISQ83TTbtefX": {}}, "updateStrategy": "OVERRIDE", "value": 0.37275079795978805}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE