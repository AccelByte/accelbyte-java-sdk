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
    --body '{"maxSlotSize": 5, "maxSlots": 69}' \
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
    --userId 'KCvGe5Hm' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'E7AvasXm' \
    --body '{"maxSlotSize": 39, "maxSlots": 29}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'VKT16rZG' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'BfTCCWaF' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'BIUPL4QW' \
    --userId 'til69uDw' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgQzII1l' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'zGs5UAMq' \
    --userId '1iudNp1F' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'SOaw5nyg,KxyxUWls,ktSOdMeY' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'ajh7hoMU' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'DNtZZl3X' \
    --body '{"achievements": ["jh0FVOtn", "xlH8EFxf", "qej3C16A"], "attributes": {"FXru9HMr": "OTZX5Bug", "hiTfWcZD": "7zXy7cpv", "sFgsBpLY": "Vi2Xzazt"}, "avatarUrl": "QnYW1xIH", "inventories": ["kw7zmA9f", "Nky4ljvJ", "WzEXkN7t"], "label": "Iw3mw6K8", "profileName": "RRSjIV7I", "statistics": ["jowl9P1w", "cJ3TDKw4", "YLsG34U1"], "tags": ["QvA9iHIX", "Nl2zlM67", "NE4yyckG"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'qaYzhi1A' \
    --userId 'RR0j2Brm' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'QLwYbnqj' \
    --userId 'UWFBPr5E' \
    --body '{"achievements": ["PbfPnHn1", "gPn2Ml3l", "BBat96nQ"], "attributes": {"lHIyjo9e": "TjhXxz61", "r63Uv5YO": "aJEY5q9U", "RVHYsqhc": "gRKLUdDq"}, "avatarUrl": "R2qLuOYh", "inventories": ["EBVSiVtV", "K9VmvD0f", "HExga1D8"], "label": "TSU5PTkt", "profileName": "Mnefnb1P", "statistics": ["MXtGHkZJ", "6as54Mha", "AypzHWvb"], "tags": ["YvdcfdAt", "j210FNe5", "i4DdlsLu"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'C3xIVWnJ' \
    --userId 'RLKLBJj3' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'udNUxaq2' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'aqXmAIbu' \
    --userId 'ZVyZuMUI' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '8lS9Anm2' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'hVPjC675' \
    --userId 'ltWQvQ06' \
    --body '{"name": "q7uoAfiJ", "value": "sdxwVOdX"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'njfqdcAq' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'inlnHJ7o' \
    --label 'SkKfUtUF' \
    --tags 'LKY5u9GB,ozdNYhyF,JQ3eZC8h' \
    --checksum 'FC5r2JXL' \
    --customAttribute 'O6Qpwhif' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'G1h5oC3j' \
    --userId 'pV1kZbqX' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'BMufZr0T' \
    --userId 'KMvtaLlk' \
    --label 'zmxTF7Ld' \
    --tags 'lPAfAdXK,YstGLKAk,c1DSNo57' \
    --checksum 'aWGBpKUQ' \
    --customAttribute 'C51jzDqC' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId '7CoHjobc' \
    --userId 'Qvh0X1wh' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'Mvy2P3lA' \
    --userId 'AYDLK0WF' \
    --body '{"customAttribute": "O0giWSD0", "label": "KRfLYvrn", "tags": ["kwH7l7wW", "wDdGjC4t", "Dfo0vym2"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '10' \
    --statCodes 'KDd0OaKi' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iSB3fAGS' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sPsu8Nws' \
    --userIds '9VY9KGab' \
    > test.out 2>&1
eval_tap $? 28 'BulkFetchStatItems' test.out

#- 29 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6059496941246604, "statCode": "k0Aw4str", "userId": "uytBBI6L"}, {"inc": 0.1336663666968767, "statCode": "KcM6p8PY", "userId": "PNaGJjc8"}, {"inc": 0.3544555023369742, "statCode": "KQot1lY7", "userId": "7xee42Rz"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItem' test.out

#- 30 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7186239531338566, "statCode": "vI9AD0r6", "userId": "7eprwdDD"}, {"inc": 0.7268253645285883, "statCode": "kBG8ATDM", "userId": "j4rXBj7M"}, {"inc": 0.8112069169226835, "statCode": "bWOBaYqo", "userId": "aBd2qHdd"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkIncUserStatItemValue' test.out

#- 31 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WeBhX1WG' \
    --userIds '2Dz2sikA,JLcm0w3G,TSQzafmf' \
    > test.out 2>&1
eval_tap $? 31 'BulkFetchOrDefaultStatItems' test.out

#- 32 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "v3IKWjhT", "userId": "e8S2kCjU"}, {"statCode": "aJSTweEU", "userId": "Wp88fqHp"}, {"statCode": "1D1lg4H1", "userId": "BPonGrcs"}]' \
    > test.out 2>&1
eval_tap $? 32 'BulkResetUserStatItem' test.out

#- 33 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '21' \
    > test.out 2>&1
eval_tap $? 33 'GetStats' test.out

#- 34 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.5432698129828382, "description": "MskxPGtl", "incrementOnly": true, "maximum": 0.9972532458397736, "minimum": 0.08573222255321444, "name": "bFR7M5Dw", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "71ysqvda", "tags": ["BevvlSQR", "F5SQpPTp", "7cLzVrNH"]}' \
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
    --limit '38' \
    --offset '67' \
    --keyword 'PV0AgJoD' \
    > test.out 2>&1
eval_tap $? 37 'QueryStats' test.out

#- 38 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oL2oYocJ' \
    > test.out 2>&1
eval_tap $? 38 'GetStat' test.out

#- 39 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bDWjEkBx' \
    > test.out 2>&1
eval_tap $? 39 'DeleteStat' test.out

#- 40 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'H95fU6WD' \
    --body '{"defaultValue": 0.4394829948577579, "description": "yH5Ena4b", "name": "6xKcGl9X", "tags": ["aJqjMf6a", "wvNc24ma", "6MDx6FoG"]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateStat' test.out

#- 41 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GREqEWf7' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTiedStat' test.out

#- 42 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6PYpyxCE' \
    --limit '94' \
    --offset '52' \
    --statCodes 'sDjXBm5E' \
    --tags 'hGPZTdc2' \
    > test.out 2>&1
eval_tap $? 42 'GetUserStatItems' test.out

#- 43 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'znQGJj3q' \
    --body '[{"statCode": "uBA3lZ4t"}, {"statCode": "bgLWUpEZ"}, {"statCode": "RZHSfeR9"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkCreateUserStatItems' test.out

#- 44 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5FeGF22t' \
    --body '[{"inc": 0.03448667316851295, "statCode": "HISfvE54"}, {"inc": 0.8129138905181635, "statCode": "TgyPZmWq"}, {"inc": 0.08296163984553251, "statCode": "qBwBRFfh"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItem1' test.out

#- 45 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tp3ssCIB' \
    --body '[{"inc": 0.8270711227641195, "statCode": "ZLxK98UJ"}, {"inc": 0.5995298271512701, "statCode": "FHdI5z1Z"}, {"inc": 0.695660357554631, "statCode": "nOIdBP9O"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkIncUserStatItemValue1' test.out

#- 46 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LKvsvdw2' \
    --body '[{"statCode": "oZ97QNwM"}, {"statCode": "8eHb7WyK"}, {"statCode": "Yv7h369A"}]' \
    > test.out 2>&1
eval_tap $? 46 'BulkResetUserStatItem1' test.out

#- 47 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '5RvyTzx5' \
    --userId 'No9mKuq7' \
    > test.out 2>&1
eval_tap $? 47 'CreateUserStatItem' test.out

#- 48 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tpL8Y74A' \
    --userId 'jybd3gTX' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserStatItems' test.out

#- 49 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'B2A4Ifc9' \
    --userId '64vIBG5s' \
    --body '{"inc": 0.8734801033808333}' \
    > test.out 2>&1
eval_tap $? 49 'IncUserStatItemValue' test.out

#- 50 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '8q1YMmTA' \
    --userId 'ZBbp65v0' \
    --additionalKey 'H4cczzXB' \
    --body '{"additionalData": {"38Cd40e3": {}, "ce5T83yr": {}, "AeKtlH70": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'ResetUserStatItemValue' test.out

#- 51 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '49' \
    --statCodes 'gqVNv8Xb' \
    > test.out 2>&1
eval_tap $? 51 'GetGlobalStatItems1' test.out

#- 52 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NuMHvLsU' \
    > test.out 2>&1
eval_tap $? 52 'GetGlobalStatItemByStatCode1' test.out

#- 53 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'W20AjtLl' \
    --userIds 'DnCaeb8A' \
    > test.out 2>&1
eval_tap $? 53 'BulkFetchStatItems1' test.out

#- 54 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2132982397447667, "statCode": "Y6hc7JEg", "userId": "b38Muy6U"}, {"inc": 0.8365838500061284, "statCode": "5iVgpRdf", "userId": "5NWYpT6E"}, {"inc": 0.6745146499917709, "statCode": "kcyTCJFM", "userId": "tz03KhsT"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkIncUserStatItem' test.out

#- 55 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.18773182399531096, "statCode": "XSwyMCzZ", "userId": "xr6Q67EA"}, {"inc": 0.5715969873975397, "statCode": "UiRXhwD8", "userId": "uLDJqOhH"}, {"inc": 0.36567363191402547, "statCode": "izI6IotX", "userId": "FprNQCDU"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItemValue' test.out

#- 56 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "f8OSQOzI", "userId": "UiR75d3x"}, {"statCode": "OZY96n0K", "userId": "B0tZe1AO"}, {"statCode": "riPfmJgF", "userId": "fO2L47ez"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkResetUserStatItem2' test.out

#- 57 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.7972566673609759, "description": "HKUHTYKz", "incrementOnly": true, "maximum": 0.9028532098932249, "minimum": 0.09081550073479361, "name": "tJFw7pmd", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "1vDgsbfO", "tags": ["8J0Beb61", "2BJfwauw", "A8KOqi0u"]}' \
    > test.out 2>&1
eval_tap $? 57 'CreateStat1' test.out

#- 58 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'WWqIqlCZ' \
    --limit '98' \
    --offset '1' \
    --statCodes 'eWPsyK7y' \
    --tags 'TjKPELaC' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryUserStatItems' test.out

#- 59 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Aav3gt6F' \
    --body '[{"statCode": "COHLcYqA"}, {"statCode": "0XQ1Yyr2"}, {"statCode": "qNmqhq56"}]' \
    > test.out 2>&1
eval_tap $? 59 'PublicBulkCreateUserStatItems' test.out

#- 60 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrC2MsP4' \
    --statCodes 'CNrqvPTk,BwChkrmR,7O6DEw4M' \
    --tags 'JvfxahcL,T06LSnvX,wSM0vM9y' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryUserStatItems1' test.out

#- 61 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dn9t9c5q' \
    --body '[{"inc": 0.2751172492072045, "statCode": "EL99YX6M"}, {"inc": 0.22378012627920463, "statCode": "TxDCyr1s"}, {"inc": 0.990741875611144, "statCode": "sbV6Lv4F"}]' \
    > test.out 2>&1
eval_tap $? 61 'PublicBulkIncUserStatItem1' test.out

#- 62 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OdHPo0P2' \
    --body '[{"inc": 0.5633167747338123, "statCode": "dlaNZrUH"}, {"inc": 0.4648810046651267, "statCode": "e4jDeuMu"}, {"inc": 0.9930716541932519, "statCode": "NltZdTGZ"}]' \
    > test.out 2>&1
eval_tap $? 62 'BulkIncUserStatItemValue2' test.out

#- 63 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vA5Ib63t' \
    --body '[{"statCode": "8owelN7y"}, {"statCode": "Q5STONLJ"}, {"statCode": "dYIDtN5L"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkResetUserStatItem3' test.out

#- 64 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'b53Ca7aO' \
    --userId 'YDbqSZ3I' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserStatItem' test.out

#- 65 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UiR98h9r' \
    --userId 'UwhsYzzL' \
    > test.out 2>&1
eval_tap $? 65 'DeleteUserStatItems1' test.out

#- 66 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RIgzwNi0' \
    --userId 'rQ6IQWag' \
    --body '{"inc": 0.4601540778627312}' \
    > test.out 2>&1
eval_tap $? 66 'PublicIncUserStatItem' test.out

#- 67 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zvPGV78H' \
    --userId 'qSTEkjoC' \
    --body '{"inc": 0.13386151990702644}' \
    > test.out 2>&1
eval_tap $? 67 'PublicIncUserStatItemValue' test.out

#- 68 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hUGGFRL1' \
    --userId '7KWev08q' \
    > test.out 2>&1
eval_tap $? 68 'ResetUserStatItemValue1' test.out

#- 69 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"UvpSLfUr": {}, "d9KzkKdj": {}, "yOQi8YUy": {}}, "additionalKey": "VMGwRyiH", "statCode": "LeUfwSxq", "updateStrategy": "MIN", "userId": "nSzpCrhq", "value": 0.07949950273293727}, {"additionalData": {"sy8Y3Prl": {}, "GB40ioZ7": {}, "ouJYaEUK": {}}, "additionalKey": "RJMXwH9E", "statCode": "xiEH53qk", "updateStrategy": "INCREMENT", "userId": "aybnuFuX", "value": 0.538566994982519}, {"additionalData": {"5DlcRU2u": {}, "j7BcVRYK": {}, "soAJx91k": {}}, "additionalKey": "fyeBf24B", "statCode": "SmMbdaxD", "updateStrategy": "MIN", "userId": "dPPDtKTu", "value": 0.8654668966421408}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItemV2' test.out

#- 70 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'NHm3Uxxj' \
    --statCode 'QqyoZ806' \
    --userIds 'M8p6pYac,VqVrhaxr,895AjYjo' \
    > test.out 2>&1
eval_tap $? 70 'BulkFetchOrDefaultStatItems1' test.out

#- 71 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'cLTaIHNr' \
    --additionalKey 'cNKT7v9N' \
    --body '[{"additionalData": {"dlWwR8gR": {}, "nS0kH81u": {}, "kuGxAUbD": {}}, "statCode": "osVG8Cw9", "updateStrategy": "INCREMENT", "value": 0.7719627903298009}, {"additionalData": {"326Ay167": {}, "ItRYkgYt": {}, "a0BoeGEK": {}}, "statCode": "vIecJL8l", "updateStrategy": "MIN", "value": 0.40255321067510674}, {"additionalData": {"D5crClgB": {}, "igXnlY24": {}, "aeJStq02": {}}, "statCode": "TsnaE0xp", "updateStrategy": "MAX", "value": 0.666543012253335}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem' test.out

#- 72 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'mHsSUB0m' \
    --additionalKey 'tW0PaJAC' \
    --body '[{"additionalData": {"btOV6L4q": {}, "n9e7J11w": {}, "A9sflQZ5": {}}, "statCode": "DRZxfH7A"}, {"additionalData": {"vWFY8CsQ": {}, "zn0dGfa6": {}, "c4UMnlCg": {}}, "statCode": "rLSqBpb5"}, {"additionalData": {"5OKOYzNM": {}, "PrqRR86j": {}, "DI1LzIFm": {}}, "statCode": "M7fIVWP0"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItemValues' test.out

#- 73 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QdLxvwUv' \
    --userId '3SxJE2vL' \
    --additionalKey 'CVDSriaV' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems2' test.out

#- 74 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'E2F9Yx3d' \
    --userId 'UG6Q3ISr' \
    --additionalKey 'Wifb9R8E' \
    --body '{"additionalData": {"BwkEm1EM": {}, "fIxczqWD": {}, "U14FhExs": {}}, "updateStrategy": "OVERRIDE", "value": 0.36103561577902876}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue' test.out

#- 75 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"gRnvP7V4": {}, "CdF3PEXk": {}, "PomOaChK": {}}, "additionalKey": "oBwVsENo", "statCode": "bWqqugVP", "updateStrategy": "INCREMENT", "userId": "N3R9EBHa", "value": 0.27640858743918484}, {"additionalData": {"hoDTDyXn": {}, "fOSQadqy": {}, "2jhTKoi2": {}}, "additionalKey": "HeQMoRvN", "statCode": "VCcUKnaM", "updateStrategy": "MAX", "userId": "ToFABdr5", "value": 0.990639732139652}, {"additionalData": {"bq6kTNYB": {}, "TgMcOrHn": {}, "ggBOQ56m": {}}, "additionalKey": "Dn7kvMtl", "statCode": "IhIi8uDa", "updateStrategy": "OVERRIDE", "userId": "XmqqDmff", "value": 0.9117452264571466}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkUpdateUserStatItem1' test.out

#- 76 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ORKIieok' \
    --additionalKey 'xnMC5yjn' \
    --statCodes 'hksNS9cO,nr14ZFtf,81VpG65N' \
    --tags 'nyxEWF2k,ZFsmXQ7Y,6uvXCvWQ' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems2' test.out

#- 77 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gfgdrfXp' \
    --additionalKey 'UrbbwqQm' \
    --body '[{"additionalData": {"SSw5yfva": {}, "I5zWCiPq": {}, "edaanOYu": {}}, "statCode": "WTSdciry", "updateStrategy": "INCREMENT", "value": 0.21093097528828686}, {"additionalData": {"zoZ7TD9e": {}, "5F1BDOES": {}, "rDK39PsG": {}}, "statCode": "Ne80vaWf", "updateStrategy": "INCREMENT", "value": 0.4774859872803633}, {"additionalData": {"yD2cXXa6": {}, "73tmos2Z": {}, "pBFU0o70": {}}, "statCode": "eWTaAskQ", "updateStrategy": "OVERRIDE", "value": 0.24283872807922913}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItem2' test.out

#- 78 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZBcXkyxh' \
    --userId 'z7wwU847' \
    --additionalKey '7KcpL5l5' \
    --body '{"additionalData": {"HgroeNKr": {}, "fyqiZUjW": {}, "JM2w71JS": {}}, "updateStrategy": "MAX", "value": 0.19267726134458807}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE