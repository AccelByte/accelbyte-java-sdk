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
echo "1..100"

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

#- 36 ResetStatCycle
./ng net.accelbyte.sdk.cli.Main social resetStatCycle \
    --cycleId 'uKeb9l3rGN9A3sNm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'ResetStatCycle' test.out

#- 37 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId '84hddSpHt0P7MIIR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["7CkyF6C7duuyZ0Gh", "DogqrhBRd8lDR6qV", "NPRZYdFLIAjGGJdd"]}' \
    > test.out 2>&1
eval_tap $? 37 'BulkAddStats' test.out

#- 38 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'VCvu9vx5KQ7KYnIu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 38 'StopStatCycle' test.out

#- 39 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MBvaO35llzQRaT5k' \
    --userIds 'PxUfofvnnSuB0y5W' \
    > test.out 2>&1
eval_tap $? 39 'BulkFetchStatItems' test.out

#- 40 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.755326192555292, "statCode": "lrMdI4sNveabntBS", "userId": "xTeIv53HGCiljvjK"}, {"inc": 0.23957490832203476, "statCode": "yD6SCwGrncqmLtjQ", "userId": "HAf8TgoNm03VLisV"}, {"inc": 0.9434590653125908, "statCode": "zwPuo3td6TC6I3lM", "userId": "jGSWN2laRlxfcjHf"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItem' test.out

#- 41 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.810248221485788, "statCode": "akUCTqGkE7wcWfDs", "userId": "lpJSqGAXQ0yYoNRK"}, {"inc": 0.061333130566999405, "statCode": "3IL5TAQ6iiPlSC2u", "userId": "E4o5Vwdo3fePqIJA"}, {"inc": 0.9785131874559623, "statCode": "IHtrkmu0hpDDWVAl", "userId": "a2l5BYNtIuS5S5XU"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkIncUserStatItemValue' test.out

#- 42 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'djsoqwGyzzWi9gwQ' \
    --userIds 'Yv7t1o7TTr1DmrhZ,v15T7quIOvBMcaYm,vCkGZ5dAgqxpBFma' \
    > test.out 2>&1
eval_tap $? 42 'BulkFetchOrDefaultStatItems' test.out

#- 43 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Loxozr6wfNPX2bOI", "userId": "tRMvqtlB2jJCSQT2"}, {"statCode": "79ZZPYGu0rdlgdWy", "userId": "OtXi3choQrpOsDBU"}, {"statCode": "5SepjChB3V0v52Dl", "userId": "ym6puQ23xoJ8aeCn"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkResetUserStatItem' test.out

#- 44 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'aLpUKp44YUDjasWI' \
    --isGlobal  \
    --isPublic  \
    --limit '84' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 44 'GetStats' test.out

#- 45 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["vmEejtGeoyIPa8ZR", "rvjj7il35MXbN9oC", "MNqq98SjTvhZNkSQ"], "cycleOverrides": [{"cycleId": "70D0H6BXksUC9b6i", "maximum": 0.9318777091080298, "minimum": 0.18197516540043357}, {"cycleId": "ZC9xv32e8c5csSov", "maximum": 0.23663002965950775, "minimum": 0.27063695102091945}, {"cycleId": "sZNBdte9NDUPVJf6", "maximum": 0.043303642635736384, "minimum": 0.8808316364753352}], "defaultValue": 0.8268336351116538, "description": "0QZxfgPubTDIHrvq", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": true, "maximum": 0.3335754951769271, "minimum": 0.35740132247772305, "name": "jRHpKKTlmVr9XuoJ", "setAsGlobal": false, "setBy": "SERVER", "statCode": "FQSKVPHbn4Xxtu7L", "tags": ["QRENjEEztx1WsYSi", "Zqan0nSBJroav91G", "XlvPG6bFYReVHQip"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 45 'CreateStat' test.out

#- 46 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'ExportStats' test.out

#- 47 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 47 'ImportStats' test.out

#- 48 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '39' \
    --offset '59' \
    --keyword 'ogWa24CKNS0GqVvU' \
    > test.out 2>&1
eval_tap $? 48 'QueryStats' test.out

#- 49 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fHQvsHXNUNe4mhgo' \
    > test.out 2>&1
eval_tap $? 49 'GetStat' test.out

#- 50 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '5QB65lSAiYnNjkfZ' \
    > test.out 2>&1
eval_tap $? 50 'DeleteStat' test.out

#- 51 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rQvGgbLdLsFzHkBM' \
    --body '{"capCycleOverride": true, "cycleIds": ["DxHSZjtqXyJ58f7G", "26yUZNmTBcvrbYCw", "c26SaiGVkydwYWQG"], "cycleOverrides": [{"cycleId": "ZtxFHyPLtI8ilbyD", "maximum": 0.6690689501743559, "minimum": 0.748312213322721}, {"cycleId": "Ij88cekdqCt81P1k", "maximum": 0.3108052510094127, "minimum": 0.0865949199580871}, {"cycleId": "Iovmv9gsR5cJcHm3", "maximum": 0.7163440353849057, "minimum": 0.8292672335645395}], "defaultValue": 0.6027038461092606, "description": "xoRDFuuuySj29a9L", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.8610884619981739, "minimum": 0.7913415933212115, "name": "2PFAAMwzHPxB1Usk", "setAsGlobal": true, "setBy": "SERVER", "tags": ["J5i0EeDxOgBnhhqE", "ntX9y1aZSWMiVi10", "sG6vxkfUcmqRRbce"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdateStat' test.out

#- 52 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ei8KlloeH0JT1ydu' \
    --limit '0' \
    --offset '39' \
    --sortBy '0x9WT0GfH2rtOa4E' \
    > test.out 2>&1
eval_tap $? 52 'GetStatItems' test.out

#- 53 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XsXzOXQAk4mqrxzT' \
    > test.out 2>&1
eval_tap $? 53 'DeleteTiedStat' test.out

#- 54 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'tuLl4XlbGL8QOxtj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zm8y2wNhmwoYZyI4' \
    --isPublic  \
    --limit '63' \
    --offset '68' \
    --sortBy 'FZKBcYrCEAE7WIsf' \
    --statCodes 'mx40NLRc6m8heKnW' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatCycleItems' test.out

#- 55 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'hzfe2NubeoKFeIaF' \
    --isPublic  \
    --limit '87' \
    --offset '58' \
    --sortBy 'Z8YYk6QEgJjBbEDo' \
    --statCodes 'Nf3n0hEoRCAcf80z' \
    --tags 'fFyabWAgIUXiI07A' \
    > test.out 2>&1
eval_tap $? 55 'GetUserStatItems' test.out

#- 56 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '68eaqC2J9jyEW6GL' \
    --body '[{"statCode": "bc0NaKDUL3sa13lk"}, {"statCode": "1dQBHO86IlBhnetU"}, {"statCode": "4RwTqUXlTDBzOuYs"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkCreateUserStatItems' test.out

#- 57 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aZA2yyd4mbqoOfAD' \
    --body '[{"inc": 0.6220113598735805, "statCode": "MAXFaY9eKa699bRV"}, {"inc": 0.11389385986377654, "statCode": "yaKwwrAP2aMlu7Wt"}, {"inc": 0.14585228308490295, "statCode": "CtoYetOO847g8Oud"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OfjnCuHZ3c46IjGa' \
    --body '[{"inc": 0.8725515289289336, "statCode": "3YvYmmDg7VYPXIuv"}, {"inc": 0.7511021150762613, "statCode": "YTZBRujIUE1Tq5jy"}, {"inc": 0.4223422745905151, "statCode": "ZvkRCMNFIurjh2im"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue1' test.out

#- 59 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'db4rbkXj0ZwsVC0g' \
    --body '[{"statCode": "L97ZVJSPqJiwv1ql"}, {"statCode": "YB1RSKs6gQxC3Gb7"}, {"statCode": "S0o4zGYY7KQI1AeF"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem1' test.out

#- 60 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gPqaOkvo1aolB4lk' \
    --userId 'KB4EYOkQ1jMD3cym' \
    > test.out 2>&1
eval_tap $? 60 'CreateUserStatItem' test.out

#- 61 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '8xIfkOVW2grREOLx' \
    --userId '0KOww3HICQLfl7MU' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems' test.out

#- 62 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BG7qtPu64yAtURKL' \
    --userId 'Rkb738HGS6rDgMdI' \
    --body '{"inc": 0.5507716858479617}' \
    > test.out 2>&1
eval_tap $? 62 'IncUserStatItemValue' test.out

#- 63 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lhS1fSiM9331m7Ta' \
    --userId '1PsKc50Kv6ecnEev' \
    --additionalKey 'cAx2K2zkRenmPZnG' \
    --body '{"additionalData": {"Bt4P7WnbdSJtjX7Z": {}, "shZyZl5x4bRXBHUT": {}, "rDzZSKscfOcYu3dp": {}}}' \
    > test.out 2>&1
eval_tap $? 63 'ResetUserStatItemValue' test.out

#- 64 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '22' \
    --statCodes 'ROYqUiGKXVFCmpo6' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItems1' test.out

#- 65 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sPwVOEDSJsEK5QpN' \
    > test.out 2>&1
eval_tap $? 65 'GetGlobalStatItemByStatCode1' test.out

#- 66 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '24' \
    --name 'my0Zp6iIaTIKUkmk' \
    --offset '22' \
    --sortBy 'upMzUYnb76tFkEOR' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 66 'GetStatCycles1' test.out

#- 67 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["ZxkrQDXuNFviMarv", "3bu1bNCtX7W40V6D", "o5sYadCCFrHHC3Dp"]}' \
    > test.out 2>&1
eval_tap $? 67 'BulkGetStatCycle1' test.out

#- 68 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId '8mnfHK8CCmE2lPns' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'GetStatCycle1' test.out

#- 69 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bD3SGEdlwuUccE53' \
    --userIds '6ugBp3HBvepnDCjg' \
    > test.out 2>&1
eval_tap $? 69 'BulkFetchStatItems1' test.out

#- 70 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.387782560548535, "statCode": "JlXe36mgWjLfFmte", "userId": "ue9nzJ6fH24T805t"}, {"inc": 0.7678686033963876, "statCode": "g8JqU0jZpjvsugAO", "userId": "S7u8RiWyerCSa8SR"}, {"inc": 0.10334799310401566, "statCode": "wsAj1ik1jglaDXTv", "userId": "KCWwNTAhd2wrS0uP"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItem' test.out

#- 71 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.05979081455869428, "statCode": "jhdinpng5BLy8wbh", "userId": "MssAHjapIkY9Rf4w"}, {"inc": 0.6742448280044169, "statCode": "57dBZNR88YbCtmKy", "userId": "8M9zVrjfGXZnqAQU"}, {"inc": 0.23748281182047282, "statCode": "Y1GjlIIk0iKoTTS1", "userId": "j02o7JjTXAQN0qds"}]' \
    > test.out 2>&1
eval_tap $? 71 'PublicBulkIncUserStatItemValue' test.out

#- 72 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "kdQV0TqI8EFnmDbx", "userId": "Ixi4YKlONk2Q5Y4J"}, {"statCode": "vaizwiilatuUjjt9", "userId": "lIMGql5ElEa9EIIl"}, {"statCode": "GcHB3CfR3ncDlwi3", "userId": "v3MFFJ1KesKoELCp"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItem2' test.out

#- 73 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["DKKoxLE1Y3Dymtj3", "giPg4x4yiPX6ues1", "Hhhkg1yLVbLFzHEP"], "cycleOverrides": [{"cycleId": "8cM4NTwr0KHaAsmT", "maximum": 0.07754147475854134, "minimum": 0.15287156375859234}, {"cycleId": "52WKi6tArAURt9pl", "maximum": 0.45624912044356647, "minimum": 0.718511593089142}, {"cycleId": "Vq8PdH6hJPUAc0RV", "maximum": 0.3619279324621498, "minimum": 0.8004038449485363}], "defaultValue": 0.11183495026536894, "description": "AgntLMCuaXBWQi6B", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.8675410666785492, "minimum": 0.19207262531455693, "name": "2XcrciYNEzvSZIPk", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "gORcz5S5BvmgBLxh", "tags": ["4ijFnE3Tam69qSZ7", "PC6f6QkmZXElW9Yf", "RSse6AAz3S4czz0Q"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 73 'CreateStat1' test.out

#- 74 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'PYuG6XqP6oo7G73z' \
    --namespace "$AB_NAMESPACE" \
    --limit '6' \
    --offset '9' \
    --sortBy 'xTgOfnwIdlNa29fD' \
    --statCodes 'Lh741IslKHzGlLKW,UtDQs61OQAoxyyQp,RWCiiPDGQhNPEwiJ' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatCycleItems' test.out

#- 75 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '62' \
    --sortBy 'f2XJVrlzqQls1ozh' \
    --statCodes 'LVA3kE8jKvgatOEB,M70TdlNBJYOmpu1V,CarzBsV6xnZ5Jrzz' \
    --tags 'jrcaug6CWVG8SWP3,glU6muswVJnNnN7k,Aa7j0riFc5HTHQIo' \
    > test.out 2>&1
eval_tap $? 75 'PublicListMyStatItems' test.out

#- 76 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'VsGo7dwV9DBqFKHQ' \
    --statCodes 'kETJyTlUrwDTnouj,QD4IEiH9Z5qXn3ao,RtlqOECohViHA5Cz' \
    --tags 'gFSy8X1A3PrIfapq,5AAeMe4L3mDWORBV,XTIIJM9XsYIIZxiX' \
    > test.out 2>&1
eval_tap $? 76 'PublicListAllMyStatItems' test.out

#- 77 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'NMR9BgaWcFX3SUBh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yoTsMWPAxUMkawaG' \
    --limit '31' \
    --offset '24' \
    --sortBy 'AyrIwMif3BOdkocV' \
    --statCodes 'Td4BxqGWV6mTJ0sQ' \
    > test.out 2>&1
eval_tap $? 77 'GetUserStatCycleItems1' test.out

#- 78 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 's6XNbjvqhnUVLWu8' \
    --limit '30' \
    --offset '78' \
    --sortBy 'lKdxL6ozRmDD0jJv' \
    --statCodes 'lfV5OemPYdYT7DRO' \
    --tags 'CjtuzFMbAG9YI89h' \
    > test.out 2>&1
eval_tap $? 78 'PublicQueryUserStatItems1' test.out

#- 79 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'mguB8FOTjMLo4b9r' \
    --body '[{"statCode": "IzqYkEpstyVTBcrM"}, {"statCode": "8rG0rH0zcswwVeMK"}, {"statCode": "6MbGIVIu8vvwLc7K"}]' \
    > test.out 2>&1
eval_tap $? 79 'PublicBulkCreateUserStatItems' test.out

#- 80 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y3uVoJXTIMtpgkie' \
    --additionalKey 'DyF97lGdMiHKxbWC' \
    --statCodes 'Yzo8yO2KTK9tmmOn,YnOpas6ghP1y4Zi7,s7QBlk44Z44B1GZg' \
    --tags 'Kg4uKxaCgcGLuC3b,rWdTYCfHkIySok5D,iXZtLW87rGysryod' \
    > test.out 2>&1
eval_tap $? 80 'PublicQueryUserStatItems' test.out

#- 81 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '3dNQrmsApRA6HX3R' \
    --body '[{"inc": 0.3628016518989039, "statCode": "rKt2ecozL0TOg54v"}, {"inc": 0.4518987155119071, "statCode": "E48L5oLF6M4lNa4J"}, {"inc": 0.7429738063650179, "statCode": "MSHNgqRqCV7usamA"}]' \
    > test.out 2>&1
eval_tap $? 81 'PublicBulkIncUserStatItem1' test.out

#- 82 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NkZlOX9Sfo95HgXq' \
    --body '[{"inc": 0.5873063594747129, "statCode": "hTPkwfLM9uSybRzW"}, {"inc": 0.06723316736646534, "statCode": "k2gZvRrvr0n9d9lv"}, {"inc": 0.04599126691357258, "statCode": "cKMLhrTrcBE2ItBS"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkIncUserStatItemValue2' test.out

#- 83 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '3KtKZWe8aoFzAyBM' \
    --body '[{"statCode": "E74HUtipUWYhWV1q"}, {"statCode": "x8CzPML52faXUr9S"}, {"statCode": "k4lq2faBcAXXKlhv"}]' \
    > test.out 2>&1
eval_tap $? 83 'BulkResetUserStatItem3' test.out

#- 84 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yH8paOJtxqMPpcVf' \
    --userId 'RwNj547fH0XrKEDp' \
    > test.out 2>&1
eval_tap $? 84 'PublicCreateUserStatItem' test.out

#- 85 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EY8VnocGAjci0V3t' \
    --userId 'Bf2jnHGKXphn50c9' \
    > test.out 2>&1
eval_tap $? 85 'DeleteUserStatItems1' test.out

#- 86 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tNLDljhZ2jxLRX3z' \
    --userId '46OCaGBeMfPlNos4' \
    --body '{"inc": 0.39394834466220807}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItem' test.out

#- 87 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BRjrERHEonAZR8Gm' \
    --userId 'Eu0q1p6QCyY6vSkV' \
    --body '{"inc": 0.5155735883849352}' \
    > test.out 2>&1
eval_tap $? 87 'PublicIncUserStatItemValue' test.out

#- 88 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WdsbYuVEGVxYheR3' \
    --userId 'j5mNZ6vwv7K8Asvt' \
    > test.out 2>&1
eval_tap $? 88 'ResetUserStatItemValue1' test.out

#- 89 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"1j1Rx59hesNWy2Nv": {}, "Z85DDKDAF8KDsBZO": {}, "uYQJ03BAHZ7c53q7": {}}, "additionalKey": "akMpcmnnx6RVBrop", "requestId": "9v7aZK3h65hbN15z", "statCode": "fQSfQrtfF3TQN0Oc", "updateStrategy": "OVERRIDE", "userId": "0kepEaC4dfiOMZfE", "value": 0.12887352112977712}, {"additionalData": {"Hr39pysFO3Zvc1BZ": {}, "G99LyvfvHEsJKQQe": {}, "wVLMUoAnaRcYp7FU": {}}, "additionalKey": "jfIGaffoflEIByYq", "requestId": "eKN0meGelYF5wWaD", "statCode": "hukU4khGG4vZFTYn", "updateStrategy": "INCREMENT", "userId": "kmSu4PWam1jxR7SE", "value": 0.7269057888582451}, {"additionalData": {"Wjteoc8fgvZDDhoO": {}, "05oKqymxLD1Lcvw6": {}, "T6mZEiwxxElpMYSW": {}}, "additionalKey": "IeVzm7z9noowmlTI", "requestId": "KVowi0RY2VN4ZONJ", "statCode": "REdUQ3z9F1BxNNgn", "updateStrategy": "MAX", "userId": "ukz3MnlrjcHp6B8V", "value": 0.1558804421786254}]' \
    > test.out 2>&1
eval_tap $? 89 'BulkUpdateUserStatItemV2' test.out

#- 90 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '7rXFgDnDkdZ9bpjb' \
    --statCode '1tdA3QhjCMW64f4X' \
    --userIds 'hIjSoTB2NMKtezap,Pr2QEPx3zTxBGtEJ,IYppuUSsKoHw2hyd' \
    > test.out 2>&1
eval_tap $? 90 'BulkFetchOrDefaultStatItems1' test.out

#- 91 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '12uSE7BEv3aevq6i' \
    --additionalKey 'ohU1cg4W1IS3Uv1B' \
    --statCodes 'pWoJBaqdg2FHcuns,S1lnaO2m9vqjhbeK,2qN8g6x2PyYDo5R3' \
    --tags 'hLiD5sf5y1JsxJNG,myt0SQDUDoWBZVGL,lkUetzCAWc9x1aMj' \
    > test.out 2>&1
eval_tap $? 91 'AdminListUsersStatItems' test.out

#- 92 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'gGim51T107XIZRZ7' \
    --additionalKey 'tZdIs0xf4czdt7zq' \
    --body '[{"additionalData": {"mSKxOEQlVcx6GqsB": {}, "q8vdhWVnuYLgpZeh": {}, "K0G2nmyuViB9kRTc": {}}, "requestId": "SQdTnNYGeAfYFG3w", "statCode": "SkHKufBdS3ZOokZB", "updateStrategy": "OVERRIDE", "value": 0.04782377763271539}, {"additionalData": {"XnAXyuGz6LlxHv8S": {}, "wyagYvDJ3w3UNgIG": {}, "j2jZtEYT8sIPSE1X": {}}, "requestId": "XPzySa0sZoFS6xCO", "statCode": "WMpyh9pMsQgb64EL", "updateStrategy": "INCREMENT", "value": 0.5499876842465219}, {"additionalData": {"WDZrpP7rz3ISW510": {}, "kHr4isTKWjmv67nu": {}, "HCXWfwnwGioVwVzm": {}}, "requestId": "mBVVFfpqx1AeLtzc", "statCode": "PJ3jtDYBo4FUTH7C", "updateStrategy": "INCREMENT", "value": 0.5894759341419679}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkUpdateUserStatItem' test.out

#- 93 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'iqaZD63xe5rruJVf' \
    --additionalKey 'LGea0ZtlzUcuHAXz' \
    --body '{"statCodes": ["ZaSHevO0TQNEI3kf", "0UV31MfuGaXsAuGs", "abxJWWSI1ECUo1NP"]}' \
    > test.out 2>&1
eval_tap $? 93 'BulkGetOrDefaultByUserId' test.out

#- 94 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'peFhUztXDgB7n4C9' \
    --additionalKey '7uAPP8PATLpUpxeJ' \
    --body '[{"additionalData": {"lsBJT6Hh3OMjAjq2": {}, "mK8lbSEEelxnb5Qx": {}, "WG2HFnZlA6HKWW4f": {}}, "statCode": "I1IQcoBQELcNlZkq"}, {"additionalData": {"TZrKgXNwvm4e5GX6": {}, "H742OixhtAoKiVm6": {}, "URT95XhnUcvWB28M": {}}, "statCode": "pusuhhDJ5slzgiWZ"}, {"additionalData": {"Etyd56LfxnbY97jj": {}, "YgXchCbkXX26uEdC": {}, "fQaMAQuTKfC0I2kN": {}}, "statCode": "jCMDtDMrentgn3Dh"}]' \
    > test.out 2>&1
eval_tap $? 94 'BulkResetUserStatItemValues' test.out

#- 95 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qciwIeShF9RKb9vv' \
    --userId 'xuJlhXbWhbwPwToC' \
    --additionalKey '6knjVwVnzaqSfJiQ' \
    > test.out 2>&1
eval_tap $? 95 'DeleteUserStatItems2' test.out

#- 96 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FC2gXoda0kg16yUS' \
    --userId 'pSOAjHJWwfCjYwWk' \
    --additionalKey 'Lob9gKLqs2nEZhpB' \
    --body '{"additionalData": {"yfHZinxNfgPAwkMB": {}, "sznlBUqnLT4AbGpt": {}, "KaWNvPbpg7yrRvXf": {}}, "updateStrategy": "MAX", "value": 0.9446730373902656}' \
    > test.out 2>&1
eval_tap $? 96 'UpdateUserStatItemValue' test.out

#- 97 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"rvgvEY3Hht1SwqTs": {}, "KKKo37NHDOQe91Ps": {}, "3ztUIV0dS6hIH9c4": {}}, "additionalKey": "VfkyrwpuXxbaERbf", "requestId": "gPmi0eHkt1mr9EOI", "statCode": "Fg0dnWIYN2NVL70I", "updateStrategy": "MIN", "userId": "BhSSQkQD6WmOt6D7", "value": 0.3245274132417302}, {"additionalData": {"fFVTOhvQpfbBke8a": {}, "Edd36xj6wySoltDx": {}, "sbzxrlaKEfkoYjY2": {}}, "additionalKey": "o6ouRW9UtNquwC3W", "requestId": "gumrIz4NhGztZpr4", "statCode": "U4fwQIiLXgmRasvj", "updateStrategy": "OVERRIDE", "userId": "lj8m3XEwP2b4gd3x", "value": 0.6532336141725211}, {"additionalData": {"eii8Jnmssep2xD2N": {}, "Y0kABeGs9yxahld1": {}, "pO0Gyf5PO3COyMvc": {}}, "additionalKey": "zgEpzZ3FbtxfhcRC", "requestId": "7IVYa6iZ5uFRYNn3", "statCode": "SHiWxF0YbuU5ar5q", "updateStrategy": "INCREMENT", "userId": "WUCy0Afgc050XIZR", "value": 0.7852287762807088}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem1' test.out

#- 98 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '491e94mQjVOOBnIW' \
    --additionalKey 'hunElqZUodp3IhtC' \
    --statCodes 'SHy1ei1fIrPvfHnR,N06EjRwEQlNapJRf,k4f9Zcw1pEHAyNFx' \
    --tags 'cVTKuAQTGh5BxjWO,ozGoDtsUuYo5p8ED,5QZAufwNa8lzfjv9' \
    > test.out 2>&1
eval_tap $? 98 'PublicQueryUserStatItems2' test.out

#- 99 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oYMXMjlVHY1AHwF3' \
    --additionalKey 'vGoav7MK0PcLnEkc' \
    --body '[{"additionalData": {"okKwcQ0baDT9OyJ2": {}, "h23GUS2amU7syGlE": {}, "lXdEAOrVSnLocLVV": {}}, "requestId": "YamQc4wcG5nDBLJo", "statCode": "JHbiQ5duE5p4cfs2", "updateStrategy": "OVERRIDE", "value": 0.46242335370375376}, {"additionalData": {"zkguwuJCW7EEFB67": {}, "AODbi9BzupBsFpYc": {}, "77GtRUcCFeY5g4Xg": {}}, "requestId": "BsbfzqxBPNe8ae1I", "statCode": "l4aAtEbu4IjGdqth", "updateStrategy": "MAX", "value": 0.3862541280142827}, {"additionalData": {"TjQ7gkZEY8rG0q0Q": {}, "2Qd2JzRbkF2I03dI": {}, "jvBbA6bfbYaJCJjf": {}}, "requestId": "k2TUvn95FhO7VW3m", "statCode": "bDVMDu87t0ldWf7i", "updateStrategy": "MAX", "value": 0.5553122078843202}]' \
    > test.out 2>&1
eval_tap $? 99 'BulkUpdateUserStatItem2' test.out

#- 100 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iKFtWtn4Yr2svKM6' \
    --userId 'pqLGZ0TBujELAUK6' \
    --additionalKey 'mQ5iZgbwwm5iGzXt' \
    --body '{"additionalData": {"cknrgidKupvXO6aj": {}, "4hCmTC34jxW4pIDw": {}, "dqXpmRmut9H9XyWI": {}}, "updateStrategy": "MAX", "value": 0.029202859955488547}' \
    > test.out 2>&1
eval_tap $? 100 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE