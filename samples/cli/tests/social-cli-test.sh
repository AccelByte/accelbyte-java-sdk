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
    --body '{"maxSlotSize": 66, "maxSlots": 46}' \
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
    --userId 'uGu2PJFq' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'NeRZDmuW' \
    --body '{"maxSlotSize": 51, "maxSlots": 49}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'RyAQhNlx' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'kETAlseU' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'l5kjwVlp' \
    --userId 'HAyCDKLb' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'bRlWhAdx' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '86bPq8EP' \
    --userId 'PbF4zxTv' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'KZkQyP82,L5HUwLrY,sTnm2ENE' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'olzXtA86' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '3SUGymxC' \
    --body '{"achievements": ["OExkerei", "m3GB7Hy3", "bGbqEVoF"], "attributes": {"4dNZ0FQz": "7k5UjgqP", "IFlKEV1M": "75QULA4C", "c4ti9gcB": "KT3lksbI"}, "avatarUrl": "I15tWA5n", "inventories": ["8K6SXJiE", "ZL5y79DA", "t07RNxiy"], "label": "XQ8ZQddU", "profileName": "erux6q7G", "statistics": ["msPz5WSI", "Mjn6YE3V", "ZldlK76A"], "tags": ["VLjbfhgU", "8kk2O8rj", "UdVyBbfJ"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'IivQaLpL' \
    --userId '89NFQEV0' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'VB2SdLKr' \
    --userId 'T2dE4DKG' \
    --body '{"achievements": ["RZgeUhGI", "wV11u8jE", "g2GgUiyw"], "attributes": {"8fMxoPRC": "7Otwq5qL", "aHk6yPAy": "wKT6QF3J", "auCWcvXl": "VNphosre"}, "avatarUrl": "SRMPcGco", "inventories": ["EI7jn4oS", "trou5L0H", "DaRkeCWa"], "label": "7BlI3MHr", "profileName": "K9OupIo1", "statistics": ["GWEqSGB0", "5do5ZiDZ", "ZqsUSGTV"], "tags": ["pfch2GLN", "NsWWPg4e", "3DA9mk6Q"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'NOz6n1ro' \
    --userId 'uYRBIG44' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'Dwjf7uQY' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ZNvmcJPU' \
    --userId 'tSA5qqQG' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'y7PJhZr1' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'QafigdYJ' \
    --userId 'pgHDGMof' \
    --body '{"name": "FgbqW09L", "value": "7EBu2e8H"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tv817obU' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'tze28cFm' \
    --label 'qsmAAkhG' \
    --tags 'r1T4zA7d,9f7lJNP5,dewVu9ax' \
    --checksum 'h3Aiihj7' \
    --customAttribute 'Nv0osvpa' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'RwfAkt84' \
    --userId 'uTyPLkqU' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 's808fPdw' \
    --userId 'jWUkDCv8' \
    --label '1OOXHIRW' \
    --tags 'UKQUJAay,Rl61mOiw,nLXA365u' \
    --checksum 'zoGPop5O' \
    --customAttribute 'rsKmtHjz' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'AfQyEhZV' \
    --userId '0OtcwUR8' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'yKcPutk8' \
    --userId '0yY5GpnR' \
    --body '{"customAttribute": "l5UCBjoE", "label": "arceMczz", "tags": ["MQgkM4c8", "OCEArqA5", "TUWdgmpb"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'L7EjXowU' \
    --userIds '1zSZSVjf' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8252509898286136, "statCode": "4FYn3NQF", "userId": "hxoXyFH6"}, {"inc": 0.7748973392347878, "statCode": "2Sgv3VKj", "userId": "kIftU63r"}, {"inc": 0.5625319898296731, "statCode": "RNbnQlvi", "userId": "01kZWsKo"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.1478223182350702, "statCode": "PzNroyYK", "userId": "r56E2qxc"}, {"inc": 0.07265143671523866, "statCode": "8JK5sJTe", "userId": "7kg6H1Ls"}, {"inc": 0.34419558307921694, "statCode": "GxWxelZf", "userId": "Cn9MOJLR"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'a2AgwEss' \
    --userIds 'igXkpar7,n3WVB3V7,5OYF6QCZ' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "dJon01MS", "userId": "PlgAgEOl"}, {"statCode": "Owcg9xLl", "userId": "3PzvdBHC"}, {"statCode": "3hfounh5", "userId": "eo80sVVY"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.3663670353000532, "description": "5IwgEYgT", "incrementOnly": true, "maximum": 0.22822100167968895, "minimum": 0.7453313146593233, "name": "CpS7mzfM", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "FCiEKyFj", "tags": ["vTXpN3Pi", "XqcoeJD1", "NAl17kZS"]}' \
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
    --limit '6' \
    --offset '44' \
    --keyword 'MlPz5NQJ' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vjDx8MjT' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ELCihIX5' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SFBOcn0l' \
    --body '{"defaultValue": 0.03902804740105492, "description": "vpTlGzET", "name": "vJ8tPY8q", "tags": ["NKO1XPZA", "INh0ktQj", "ipWOYUrq"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SxShIXg2' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'BtGw6vaE' \
    --limit '63' \
    --offset '46' \
    --statCodes 'jTh1vaY9' \
    --tags '2dL3Iowt' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rpkz669A' \
    --body '[{"statCode": "KxAZIHbs"}, {"statCode": "kT5uYP4M"}, {"statCode": "kKoxI9fg"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e0iGNAus' \
    --body '[{"inc": 0.2926598111477975, "statCode": "SwAa3iz5"}, {"inc": 0.24733042581776588, "statCode": "8xWirFf2"}, {"inc": 0.3760583061712309, "statCode": "c3gt73Ek"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MDibqJrX' \
    --body '[{"inc": 0.4141366956979047, "statCode": "4jPoNAwL"}, {"inc": 0.5863995612305566, "statCode": "i5ZRHVzL"}, {"inc": 0.7726024623829795, "statCode": "gDZagxlV"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dver3WNR' \
    --body '[{"statCode": "Q2m5S7G8"}, {"statCode": "oJpJINY0"}, {"statCode": "ZQjQaJJh"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lhh85tAx' \
    --userId 'XMaFcvp8' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'T6GPhnS7' \
    --userId 'SFPizvQj' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'U9LSv7Jc' \
    --userId '44bv5dRF' \
    --body '{"inc": 0.6860320503799145}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FUzfxWRF' \
    --userId 'CV6Qu89c' \
    --additionalKey 'ZDn4oiUf' \
    --body '{"additionalData": {"GOMedMBi": {}, "onTy8B7K": {}, "O0VX6s6S": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Uj8btJhi' \
    --userIds 'RPLQaW66' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.04590878473539983, "statCode": "ZtjWAnDa", "userId": "Q2fy10j9"}, {"inc": 0.3656389065097889, "statCode": "09MNVfil", "userId": "yRu4fZ8l"}, {"inc": 0.4589498674337511, "statCode": "TPPFH3VX", "userId": "7wL7qd44"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8229076037668892, "statCode": "5DVjo4bS", "userId": "dyEhYa4p"}, {"inc": 0.011197168848027905, "statCode": "QmUTyDA9", "userId": "V1SKYf1h"}, {"inc": 0.48572527066612003, "statCode": "QYk7urWg", "userId": "j0P5aVE0"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "83KELmCl", "userId": "cmbpXhI5"}, {"statCode": "dMNd4lqz", "userId": "i05r9xgA"}, {"statCode": "3kR1pqsT", "userId": "W69y2lJV"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.7652920011975788, "description": "V9WPkl0j", "incrementOnly": true, "maximum": 0.5847514431695765, "minimum": 0.5270796738847736, "name": "5Qv2Y8JY", "setAsGlobal": false, "setBy": "SERVER", "statCode": "oI0r7fin", "tags": ["WMSmolAn", "quppgVZC", "BVGuVU4Q"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'oGmi7AHs' \
    --limit '74' \
    --offset '41' \
    --statCodes 'NQxpX2Bf' \
    --tags 'jVWgRMGn' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'grZynMTT' \
    --body '[{"statCode": "R0omgFnC"}, {"statCode": "Sh6d2JyP"}, {"statCode": "X844Mirz"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZpHjszE8' \
    --statCodes '98AJQXfV,uOAXQ7nU,IXeF4Hf4' \
    --tags 'P94rKpcL,2Tp11BQY,G5WpRnmZ' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DGHlO7Vw' \
    --body '[{"inc": 0.06679128716079019, "statCode": "2vtJR5tS"}, {"inc": 0.19938450828012888, "statCode": "ADBkqIO3"}, {"inc": 0.6174158882352082, "statCode": "uXRinlPU"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vcyClsbO' \
    --body '[{"inc": 0.9999911875545061, "statCode": "t9CHpwC4"}, {"inc": 0.6776587641166298, "statCode": "b50Nc46I"}, {"inc": 0.8679235323130738, "statCode": "NGba7Lbb"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '2vaifbJr' \
    --body '[{"statCode": "JLCZm2wo"}, {"statCode": "1GNeCflT"}, {"statCode": "8SfwcI32"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CrZkdFre' \
    --userId 'oOr2xNwI' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'IQPMit2w' \
    --userId 'vZFgRzrR' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QFFA7VSW' \
    --userId 'oCFOOvdc' \
    --body '{"inc": 0.21417986993432903}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'a1F1MXKp' \
    --userId 'F6LgLmAj' \
    --body '{"inc": 0.41054735540948895}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '4Jkd6285' \
    --userId 'zdA4zDKC' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"rHJgn2gy": {}, "OTYXh9WD": {}, "6Vab8nSD": {}}, "additionalKey": "tdTOpp9Z", "statCode": "EDyLNhzf", "updateStrategy": "OVERRIDE", "userId": "Io75mtbo", "value": 0.892564234719654}, {"additionalData": {"NlnuOzr6": {}, "bO5ODviD": {}, "NA74IYZd": {}}, "additionalKey": "TX5fTLRv", "statCode": "BUNzeolV", "updateStrategy": "OVERRIDE", "userId": "d3XteIMI", "value": 0.8926582733532468}, {"additionalData": {"geVEvI4W": {}, "XFLqT0Vd": {}, "J8n5DLc7": {}}, "additionalKey": "efXlAnZa", "statCode": "Vd1XWHHW", "updateStrategy": "MAX", "userId": "4e4ehb54", "value": 0.06324892403203763}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '00YXOj38' \
    --statCode 'KjsROkzq' \
    --userIds 'dGOJeq4V,HLtNNoeP,XTUzPb1b' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'MoTC19S7' \
    --additionalKey 'T6CHArTK' \
    --body '[{"additionalData": {"qsLtK2FU": {}, "Ysgtscrr": {}, "1SIPozrF": {}}, "statCode": "LkvwpQtb", "updateStrategy": "OVERRIDE", "value": 0.5587177246149593}, {"additionalData": {"7jACLngB": {}, "oTM3pGsR": {}, "tiVjONTl": {}}, "statCode": "aVkAX46p", "updateStrategy": "MAX", "value": 0.5761158580312138}, {"additionalData": {"jPQfROOU": {}, "t83BVNqV": {}, "8McdLKs4": {}}, "statCode": "Yy27q088", "updateStrategy": "OVERRIDE", "value": 0.5202333469522658}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'EbMbKHks' \
    --additionalKey 'zHyCEFXN' \
    --body '[{"additionalData": {"eIcfpIyi": {}, "s5ZpSIi5": {}, "Jib3WCvt": {}}, "statCode": "udbc1vQC"}, {"additionalData": {"224PEGZK": {}, "2Fj3TMkp": {}, "51LoSRXD": {}}, "statCode": "TTLc9hsR"}, {"additionalData": {"1VRgnbBR": {}, "b4eTH988": {}, "0McSz1iR": {}}, "statCode": "dvDewjTK"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZH4i56uT' \
    --userId '1nyx1fjK' \
    --additionalKey 'UHDH6yYQ' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p3O6bPhj' \
    --userId '339CT0uY' \
    --additionalKey 'vf8iE9om' \
    --body '{"additionalData": {"942iZb4O": {}, "fhhDdOc4": {}, "InndcV7h": {}}, "updateStrategy": "OVERRIDE", "value": 0.18235379517629735}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"icKJzssG": {}, "aMhyYv74": {}, "727cwmGd": {}}, "additionalKey": "V1kNhYHC", "statCode": "BX7XDAxA", "updateStrategy": "MIN", "userId": "9NP40VS0", "value": 0.17142892739250704}, {"additionalData": {"pFPTYOAa": {}, "7w8vhRxa": {}, "EAU4NVxG": {}}, "additionalKey": "DCGfmmM8", "statCode": "7EUFSPmO", "updateStrategy": "OVERRIDE", "userId": "KnQOifyr", "value": 0.2857069380584525}, {"additionalData": {"nSBYPBF0": {}, "aCVMEoux": {}, "Pk5rouvr": {}}, "additionalKey": "YYhg5vqi", "statCode": "wY5KrCPQ", "updateStrategy": "INCREMENT", "userId": "wpUC7jAC", "value": 0.5638429168555467}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PLwPRVeu' \
    --additionalKey 'mXUgKnit' \
    --statCodes 'sqJbzvBi,r5PWcR3p,UrQRSK7W' \
    --tags 's5VI5Ewk,QmJmE9pl,P6Vj4Px4' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SGvtlyK9' \
    --additionalKey 'IEloyjiT' \
    --body '[{"additionalData": {"IkLSixKK": {}, "cFFPNJXp": {}, "1AJMaKQp": {}}, "statCode": "8vDhODqb", "updateStrategy": "OVERRIDE", "value": 0.30225714642742896}, {"additionalData": {"vAH50cFl": {}, "n0PeVoWA": {}, "DuHw6dhV": {}}, "statCode": "VSasDeQW", "updateStrategy": "INCREMENT", "value": 0.2888423935192407}, {"additionalData": {"fHfOdPfv": {}, "GmbcjCIJ": {}, "Jxq5DqPP": {}}, "statCode": "Ia6GhWy4", "updateStrategy": "MAX", "value": 0.5948240958394968}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'q32JAZGg' \
    --userId 'rdUPyrYp' \
    --additionalKey 'ia6Tk6Y4' \
    --body '{"additionalData": {"BfkAP0pa": {}, "Rk0xz7cT": {}, "0TUkoYC4": {}}, "updateStrategy": "MIN", "value": 0.21408784256386248}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE