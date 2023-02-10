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
    --body '{"maxSlotSize": 61, "maxSlots": 52}' \
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
    --userId 'wDZhrcNQ' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'SdNQhy6b' \
    --body '{"maxSlotSize": 93, "maxSlots": 63}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'pg8DKnJS' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'xdPXc0Ll' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '2mAljVHK' \
    --userId 'Ljnv0n5n' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cz0UZuUH' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'SgS3QluJ' \
    --userId '3NndYhor' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'pCNMTeoM,vQevHAK6,pTvAVqao' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'mVGkDMED' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '08WblgoM' \
    --body '{"achievements": ["M55Nguky", "D4r2Fy6m", "IQoH4tD4"], "attributes": {"ifAgmiy5": "pTRcPCb6", "KBvqaRiz": "YFb6dhqM", "HM7U1v1j": "NGUyt4PU"}, "avatarUrl": "tlTO9A8P", "inventories": ["RUFm5dEA", "inN1Y1Ks", "mEJsVqEC"], "label": "m4AcuEVk", "profileName": "oNHais7S", "statistics": ["erMMKYQ5", "xnJd5Q1c", "SmVkfRvM"], "tags": ["XR3TvWAi", "UKLF9PYM", "1DGFes6U"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'm5MA8EPq' \
    --userId 'NBB3c9kR' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ysFd20yC' \
    --userId 'fOdUTzGZ' \
    --body '{"achievements": ["0kaVubf4", "Mkjbnyup", "CqNobJMX"], "attributes": {"mZFOHJu8": "Gmwn2DZB", "S1FJqwef": "HLO0UZ5G", "hl74WyOc": "pYO3HNvR"}, "avatarUrl": "SnRGZcuL", "inventories": ["urq7tUXw", "tpsl3fJ2", "SoTpMMNO"], "label": "LXjNjuEU", "profileName": "d67hi7Ny", "statistics": ["scf2aOUL", "ouqNtRg3", "zcuYYcP3"], "tags": ["s94q8Wmp", "c6iSyk1g", "mqupVJLO"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '5czwE9Sm' \
    --userId 'A47BYAKt' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'GTG0jN7c' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'vwjkGZzl' \
    --userId 'XpHRXk2M' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'hkBrhnoJ' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'EKOMTG6K' \
    --userId 'J28U4U0i' \
    --body '{"name": "tDAxO1pj", "value": "5Svp6qKL"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y0VqLd2Z' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'H6ROe3aw' \
    --label 'Qa2flBw1' \
    --tags 'MK8qIfTN,1aGhNnph,giT5VH5w' \
    --checksum '0caIxT6u' \
    --customAttribute 'jEvZKk1N' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '3DDBs68q' \
    --userId '4y8X0H46' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'wSnCwxum' \
    --userId 'ESwU1D6p' \
    --label 'fcSG9tPv' \
    --tags 'wMZqzwGZ,ukCYEynm,5Bz1KEl3' \
    --checksum 'gI4QfR6o' \
    --customAttribute 'SWLGemDx' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'oEBijm9F' \
    --userId 'gQcyjkNI' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'NGyxg8q3' \
    --userId 'AHiWz9wW' \
    --body '{"customAttribute": "T04ooUtO", "label": "UWSAOsIo", "tags": ["skP7vsVK", "pTVjMz27", "OYaa5q02"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '89' \
    --statCodes 'q13Tbwxq' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lvJsjrUA' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '25IpAgAI' \
    --userIds 'VoOGeX29' \
    > test.out 2>&1
eval_tap $? 28 'BulkFetchStatItems' test.out

#- 29 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8508761474526408, "statCode": "J3Jx8fjb", "userId": "edNiSZHH"}, {"inc": 0.19208447404866402, "statCode": "SJjFYrtg", "userId": "UReMCZoc"}, {"inc": 0.4571750372766965, "statCode": "qcnXezt8", "userId": "lLxZj5y6"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItem' test.out

#- 30 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9251367245729559, "statCode": "TmUSgQ0n", "userId": "0SFfxNNI"}, {"inc": 0.3438684107898009, "statCode": "TlzbZRPR", "userId": "xt9ebJPS"}, {"inc": 0.6895757527068033, "statCode": "orSC9eE0", "userId": "PCQOZXtK"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkIncUserStatItemValue' test.out

#- 31 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DarG6qhU' \
    --userIds 'f6qRBELH,RDtoE0SY,ua7Eck8E' \
    > test.out 2>&1
eval_tap $? 31 'BulkFetchOrDefaultStatItems' test.out

#- 32 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "ekycV0x0", "userId": "GM7ft7L5"}, {"statCode": "aFSbV1XZ", "userId": "LOGaUvTA"}, {"statCode": "qaKp6Z3m", "userId": "97QLtwVX"}]' \
    > test.out 2>&1
eval_tap $? 32 'BulkResetUserStatItem' test.out

#- 33 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 33 'GetStats' test.out

#- 34 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.2791820429621391, "description": "3EBWuhTi", "incrementOnly": true, "maximum": 0.8921743928408467, "minimum": 0.46657657316675827, "name": "9CEqWmyT", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "GiIrM3Wx", "tags": ["rtddGYFA", "MYZNNuFv", "Etd2ztxZ"]}' \
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
    --limit '55' \
    --offset '49' \
    --keyword 'gdt7Mkhf' \
    > test.out 2>&1
eval_tap $? 37 'QueryStats' test.out

#- 38 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Pf3GDM9I' \
    > test.out 2>&1
eval_tap $? 38 'GetStat' test.out

#- 39 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xrtTG7gz' \
    > test.out 2>&1
eval_tap $? 39 'DeleteStat' test.out

#- 40 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'E9pnubm7' \
    --body '{"defaultValue": 0.7766320377806046, "description": "rOljSfAU", "name": "DuQY7Iln", "tags": ["EPNyXPlA", "KQTv1GIK", "ovjEgnOp"]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateStat' test.out

#- 41 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ikby3DfL' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTiedStat' test.out

#- 42 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'a561jHvF' \
    --limit '30' \
    --offset '61' \
    --statCodes 'DICXwnP1' \
    --tags 'h06QQrpX' \
    > test.out 2>&1
eval_tap $? 42 'GetUserStatItems' test.out

#- 43 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7NlV7RV' \
    --body '[{"statCode": "u7zbfjeI"}, {"statCode": "e0EkDn1j"}, {"statCode": "wjutf772"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkCreateUserStatItems' test.out

#- 44 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmXwqj9o' \
    --body '[{"inc": 0.767657684399907, "statCode": "FuWj4GqY"}, {"inc": 0.12684745355231763, "statCode": "UORhyEcs"}, {"inc": 0.6909211257685384, "statCode": "rGHWvvxT"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItem1' test.out

#- 45 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BsqVVfAH' \
    --body '[{"inc": 0.8550632973822978, "statCode": "0k7yAIF3"}, {"inc": 0.3359808364983716, "statCode": "oY7ypWi1"}, {"inc": 0.2981903629453534, "statCode": "AwXaIft6"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkIncUserStatItemValue1' test.out

#- 46 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GZRksapC' \
    --body '[{"statCode": "Rgw3UlTL"}, {"statCode": "sWyNDdOQ"}, {"statCode": "sxGW8f3V"}]' \
    > test.out 2>&1
eval_tap $? 46 'BulkResetUserStatItem1' test.out

#- 47 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Qt9ttHvM' \
    --userId 'zetSaZIr' \
    > test.out 2>&1
eval_tap $? 47 'CreateUserStatItem' test.out

#- 48 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'z79eBnEB' \
    --userId 'fzudBpt0' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserStatItems' test.out

#- 49 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cNLxPCqu' \
    --userId '455de76Y' \
    --body '{"inc": 0.7990421225369717}' \
    > test.out 2>&1
eval_tap $? 49 'IncUserStatItemValue' test.out

#- 50 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'to35RuCs' \
    --userId 'Lo9wOq2E' \
    --additionalKey 'RBJYEiDv' \
    --body '{"additionalData": {"DRClYsFM": {}, "pcqfzbUc": {}, "BR0IAbzt": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'ResetUserStatItemValue' test.out

#- 51 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '54' \
    --statCodes 'mwNuLZuP' \
    > test.out 2>&1
eval_tap $? 51 'GetGlobalStatItems1' test.out

#- 52 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GUk3pt0e' \
    > test.out 2>&1
eval_tap $? 52 'GetGlobalStatItemByStatCode1' test.out

#- 53 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Psztcbdb' \
    --userIds 'Rd0C5w8R' \
    > test.out 2>&1
eval_tap $? 53 'BulkFetchStatItems1' test.out

#- 54 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6092115320682345, "statCode": "lF4LNXRL", "userId": "oCM3tLSV"}, {"inc": 0.2385423460606303, "statCode": "0ck4Q9iT", "userId": "D3aIHgK7"}, {"inc": 0.6338402545069179, "statCode": "gEsDsTzY", "userId": "0BpAfWwy"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkIncUserStatItem' test.out

#- 55 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5808028930268238, "statCode": "UFP29yyc", "userId": "maV1NvMt"}, {"inc": 0.6818952602192612, "statCode": "X9Ii3cDj", "userId": "8wEdA4EW"}, {"inc": 0.09369844540312, "statCode": "uj2caItw", "userId": "JN1Y3Jfz"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItemValue' test.out

#- 56 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "x146d4hA", "userId": "0ugQTZ7U"}, {"statCode": "uo8RY1bk", "userId": "sXcUNtzL"}, {"statCode": "QQCJZBMH", "userId": "QmxgEsiH"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkResetUserStatItem2' test.out

#- 57 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.8932467483172692, "description": "hEWNTktF", "incrementOnly": true, "maximum": 0.16131115018259112, "minimum": 0.7092728937611434, "name": "AhNEUyYD", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "xkZIwJQx", "tags": ["TQoTSv31", "hUzX40Pz", "AY1uiqDj"]}' \
    > test.out 2>&1
eval_tap $? 57 'CreateStat1' test.out

#- 58 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PG9T8aWt' \
    --limit '68' \
    --offset '51' \
    --statCodes '3EJUUH8b' \
    --tags 'DoFwQF3u' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryUserStatItems' test.out

#- 59 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'YG0wK6wa' \
    --body '[{"statCode": "TQsftrzG"}, {"statCode": "am6jqlAN"}, {"statCode": "hWewXnZ7"}]' \
    > test.out 2>&1
eval_tap $? 59 'PublicBulkCreateUserStatItems' test.out

#- 60 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YMIwnUDI' \
    --statCodes 'hxiONBnd,uls2K958,sfHoAZbr' \
    --tags 'HLSE53Wy,ozQZoYnK,DN9jQFm4' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryUserStatItems1' test.out

#- 61 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vk6MgjxX' \
    --body '[{"inc": 0.956872494444542, "statCode": "iWfbvmDI"}, {"inc": 0.5849766059452768, "statCode": "Wzo93Afv"}, {"inc": 0.32553996645180816, "statCode": "mRTb05fz"}]' \
    > test.out 2>&1
eval_tap $? 61 'PublicBulkIncUserStatItem1' test.out

#- 62 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '7tv9Lsaq' \
    --body '[{"inc": 0.05862351747576555, "statCode": "h07PZ6b5"}, {"inc": 0.20438858050108877, "statCode": "TLa2HSFx"}, {"inc": 0.1855156998264692, "statCode": "PWfDVD8o"}]' \
    > test.out 2>&1
eval_tap $? 62 'BulkIncUserStatItemValue2' test.out

#- 63 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '09JjQUAA' \
    --body '[{"statCode": "WqpeUTfX"}, {"statCode": "XjF30WfA"}, {"statCode": "yXod6zTJ"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkResetUserStatItem3' test.out

#- 64 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LoZ0A6ai' \
    --userId 'ifqXSGiF' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserStatItem' test.out

#- 65 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Rylu2lh7' \
    --userId 'kA4cqzXQ' \
    > test.out 2>&1
eval_tap $? 65 'DeleteUserStatItems1' test.out

#- 66 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SvxiHB5l' \
    --userId 'gKV3A9ia' \
    --body '{"inc": 0.9467417774372677}' \
    > test.out 2>&1
eval_tap $? 66 'PublicIncUserStatItem' test.out

#- 67 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'E08IKE1P' \
    --userId 'PGtpy9cE' \
    --body '{"inc": 0.8008125516679316}' \
    > test.out 2>&1
eval_tap $? 67 'PublicIncUserStatItemValue' test.out

#- 68 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1fQWP2zD' \
    --userId 'hQ5pYREs' \
    > test.out 2>&1
eval_tap $? 68 'ResetUserStatItemValue1' test.out

#- 69 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"h59OoW3e": {}, "KeTmIlL1": {}, "Vczk4uuD": {}}, "additionalKey": "Fvn1Mayj", "statCode": "NSFZV9gc", "updateStrategy": "OVERRIDE", "userId": "c2LFvp8O", "value": 0.27289512166075514}, {"additionalData": {"XKrv23GB": {}, "XneB6NJb": {}, "wBuvumla": {}}, "additionalKey": "Hs3RXkMr", "statCode": "axNxNftl", "updateStrategy": "INCREMENT", "userId": "ZWFE1H2C", "value": 0.8223108201777335}, {"additionalData": {"GMArU7g5": {}, "HbC3s1Yc": {}, "uynKMe0t": {}}, "additionalKey": "7CRa5IWc", "statCode": "9EXcYVUq", "updateStrategy": "MAX", "userId": "3LDpREgb", "value": 0.4719225852063321}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItemV2' test.out

#- 70 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '5kJC4Qsz' \
    --statCode 'AOO3lIuO' \
    --userIds '9uTXMN8o,S2OrsTEG,Ts8pH8J5' \
    > test.out 2>&1
eval_tap $? 70 'BulkFetchOrDefaultStatItems1' test.out

#- 71 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'noaCpgc2' \
    --additionalKey 'HOqKd6lY' \
    --body '[{"additionalData": {"OQgzwljw": {}, "1khCB8F1": {}, "LcJMBCDp": {}}, "statCode": "gghSxZ8j", "updateStrategy": "OVERRIDE", "value": 0.5242268568949662}, {"additionalData": {"CR6kFgYG": {}, "BQ3y1efv": {}, "qTzFP8jh": {}}, "statCode": "Exgl6rVY", "updateStrategy": "OVERRIDE", "value": 0.6105687950140114}, {"additionalData": {"n7CVcKMo": {}, "qBE1kJlK": {}, "UlCHl9BE": {}}, "statCode": "sWO1JCJe", "updateStrategy": "MIN", "value": 0.8951480252569616}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem' test.out

#- 72 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '5EEubaTQ' \
    --additionalKey 'GFQABCje' \
    --body '[{"additionalData": {"HK5rcWtO": {}, "kOwmbhEY": {}, "8bufliF6": {}}, "statCode": "4K4XvUMp"}, {"additionalData": {"wCm4A1dz": {}, "KLhhJTkV": {}, "59uMyhTA": {}}, "statCode": "jRuYwkEa"}, {"additionalData": {"b5BB0K0x": {}, "bh2tWn6n": {}, "mSf5bkRr": {}}, "statCode": "xiH9a7MX"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItemValues' test.out

#- 73 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eCf2CVmf' \
    --userId 'HlI3CO5U' \
    --additionalKey 'KSzt7dkG' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems2' test.out

#- 74 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'So94AhBd' \
    --userId 'MkVf2BVO' \
    --additionalKey '5MOJrV8I' \
    --body '{"additionalData": {"xjvmOpQB": {}, "i66KGhRr": {}, "umKePIWS": {}}, "updateStrategy": "OVERRIDE", "value": 0.4075113038099377}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue' test.out

#- 75 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"zciEkZin": {}, "O2z5GxUd": {}, "fJbX1j2I": {}}, "additionalKey": "ldy1Strl", "statCode": "OUcoYvlQ", "updateStrategy": "MAX", "userId": "uUzs6ecn", "value": 0.5332667250879934}, {"additionalData": {"v9qO1DDR": {}, "pAr2t7HU": {}, "8IOKicng": {}}, "additionalKey": "ChdcVQx0", "statCode": "QAm5BvF3", "updateStrategy": "INCREMENT", "userId": "7VPycXzr", "value": 0.38942873656814136}, {"additionalData": {"9Z1SZLeU": {}, "0ipLrajc": {}, "aWgFZENM": {}}, "additionalKey": "dzq3ZThS", "statCode": "ykM9XqVt", "updateStrategy": "MIN", "userId": "B9FjkWKd", "value": 0.6991553380675073}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkUpdateUserStatItem1' test.out

#- 76 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3EvpoG7L' \
    --additionalKey 'yonq8Tjy' \
    --statCodes 'i8HuYBg6,DVF5v8bR,mPqvL9Mw' \
    --tags 'ie7Q6Jiy,uQXawrzc,5D2xQPNK' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems2' test.out

#- 77 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sQQuGHe9' \
    --additionalKey 'joLImebt' \
    --body '[{"additionalData": {"iOoyvYE3": {}, "1w7ECWNj": {}, "hjX18vkx": {}}, "statCode": "yBYFtMTU", "updateStrategy": "INCREMENT", "value": 0.9745695201827884}, {"additionalData": {"oD86lxDv": {}, "aEICNsQn": {}, "cBZGSPXb": {}}, "statCode": "L6s0O5z2", "updateStrategy": "MIN", "value": 0.6617860744859814}, {"additionalData": {"ztXKeWcT": {}, "zzG082KM": {}, "zRYrXD41": {}}, "statCode": "eyBdxIM4", "updateStrategy": "MIN", "value": 0.8371404334952842}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItem2' test.out

#- 78 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AYLrCBHk' \
    --userId 'v3s7IaBm' \
    --additionalKey 'BFmRDj94' \
    --body '{"additionalData": {"1zaZSRYn": {}, "s374Vk1w": {}, "RCMIJUkb": {}}, "updateStrategy": "INCREMENT", "value": 0.8475210267071861}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE