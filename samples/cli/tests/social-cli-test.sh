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
    --body '{"maxSlotSize": 59, "maxSlots": 2}' \
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
    --userId 'Hsnp49Lg' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'zo0nhOPM' \
    --body '{"maxSlotSize": 74, "maxSlots": 98}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'PSKz91mi' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjNQfwlD' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ysfP1ike' \
    --userId 'io1Qv3R5' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'GHZZ2kO4' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'y9muqU5o' \
    --userId 'FhLmZJ0o' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'QYguO4Q4,YrlkFhcZ,aOiqOwLj' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQKf6Iid' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'D1URgaaw' \
    --body '{"achievements": ["pAphZIs7", "ip5Db30V", "LGvQEXnB"], "attributes": {"MRhNA3cw": "Z2G4AI7j", "QBNgKpBj": "toV5QtU3", "98Hq3BaE": "rR6nGzVM"}, "avatarUrl": "q6pS8Ckm", "inventories": ["SPT2GkwE", "hgDL3xH2", "AfPA4JhI"], "label": "c5q9uxoK", "profileName": "nSYVeaQE", "statistics": ["tfg5ZwO2", "OeLp3kDA", "QTpxldMd"], "tags": ["QBtaXY6P", "3M0mR1yi", "bLUG8tRL"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'nAeCBlYo' \
    --userId 'VJrL3wIG' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'HLytJuF7' \
    --userId 'TzVj9MTY' \
    --body '{"achievements": ["MYZNARYU", "8lKWUL1H", "SoqaZLqZ"], "attributes": {"ltlwoeZq": "vhXNUwdc", "PXOTZVJ5": "IoMpYgc5", "cXiDbISF": "DrWmHUik"}, "avatarUrl": "KtUgnONq", "inventories": ["Z1Q4V0Bp", "bG6AnVDe", "tbQNyeok"], "label": "iUKm5daH", "profileName": "l1c8rQQg", "statistics": ["lOLuBGtu", "PLt81jA2", "zoAhZmrk"], "tags": ["25T1vARc", "05SZCp84", "Nj6PUXHX"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'DtvHHzMb' \
    --userId 'LtcvWouX' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'iF0OKlb4' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'eftAy0Zv' \
    --userId 'vL7r3tlv' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'Sa8nduof' \
    --namespace "$AB_NAMESPACE" \
    --profileId '7AMkNcUw' \
    --userId 'vu7WWAva' \
    --body '{"name": "zjQnEOYI", "value": "owdjutsy"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'QxeyDeZ2' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'TEoNeBJV' \
    --label 'TyO3sqrS' \
    --tags 'gyNlYH21,c6vx7Agu,Dx57EkMr' \
    --checksum 'ERqfub4u' \
    --customAttribute 'lXwky3Le' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'iKTAaJgg' \
    --userId 'tXYad6eR' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'fxWZljdz' \
    --userId '4yZ6nC9o' \
    --label 'dEw0xgvl' \
    --tags 'YCvMvzZa,GE1NkTtb,iKKkV5jT' \
    --checksum 'lv8E68j2' \
    --customAttribute 'jk4EE0ON' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'WEVVvFIm' \
    --userId 'gXeYaWJe' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'jHv3J3bm' \
    --userId 'sCgWVeBm' \
    --body '{"customAttribute": "onrEJj31", "label": "49zqutUe", "tags": ["btaJ8tBK", "DRnQsiRB", "7wKeExqP"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xUpF4FpU' \
    --userIds 'Ak7m9bQP' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.23328896609197725, "statCode": "MF3BmQuD", "userId": "E6GusE4D"}, {"inc": 0.27763730303229117, "statCode": "ITUxy5Zf", "userId": "IEQNbrHF"}, {"inc": 0.39710325158985715, "statCode": "ppn7OCGI", "userId": "BepN2900"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.17828309079917593, "statCode": "qcSLwpcQ", "userId": "Mdlip7oH"}, {"inc": 0.2097086883975513, "statCode": "b7VkDk1z", "userId": "tS7EHE2P"}, {"inc": 0.9129237870626806, "statCode": "Tzli2Mft", "userId": "RMzWE8ou"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '01fe5zty' \
    --userIds 'w2B3X3AV,rqc9TeIq,4thOjF4W' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "5yujGnFH", "userId": "9Ykt5KJz"}, {"statCode": "7PLTS9Su", "userId": "yd6qoL8j"}, {"statCode": "wiROkHQy", "userId": "St53l6rT"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.5059846427814342, "description": "oJ5Cw1An", "incrementOnly": false, "maximum": 0.7878980233528601, "minimum": 0.5076304782931533, "name": "vTuJfDEn", "setAsGlobal": true, "setBy": "SERVER", "statCode": "pD1NTqMP", "tags": ["d4AGStAh", "yzAwIXHK", "9vU2GTtr"]}' \
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
    --limit '13' \
    --offset '65' \
    --keyword 'L5jg1nXp' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LPBKPOAS' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kNzXzzne' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TjjAXv3Q' \
    --body '{"defaultValue": 0.6627720876826697, "description": "r5hNF8LO", "name": "bnfIxSCr", "tags": ["PjRk5qpz", "q1cZhvNn", "SjHJSoKG"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HsqJA2Z3' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'IymtGSGx' \
    --limit '81' \
    --offset '77' \
    --statCodes 'djQN0xRd' \
    --tags 'TMMOzklq' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PiHwoLRu' \
    --body '[{"statCode": "21p34NZB"}, {"statCode": "LuuBv360"}, {"statCode": "2cbIJheU"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5bcp7vYI' \
    --body '[{"inc": 0.7165974293142955, "statCode": "nMY3ZmPx"}, {"inc": 0.44026471582586535, "statCode": "UCJa47fs"}, {"inc": 0.3252605912649177, "statCode": "HJVGzXSF"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '167CpIDc' \
    --body '[{"inc": 0.9314807901195236, "statCode": "5hOYvS12"}, {"inc": 0.4552439918358918, "statCode": "pr97pfVl"}, {"inc": 0.4945136883324015, "statCode": "jIUhYxvK"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2a4M7qcI' \
    --body '[{"statCode": "CwRvPg0r"}, {"statCode": "eHONtWOS"}, {"statCode": "KaE5FZm6"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AC1ZCN0B' \
    --userId 'txIJNJUR' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fsrNmUIq' \
    --userId 'SejFjgWV' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HHiauH69' \
    --userId 'PIPzRX56' \
    --body '{"inc": 0.13136648144290364}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gJpJMSN7' \
    --userId 'VxreL5L8' \
    --additionalKey '7Mj6MRVZ' \
    --body '{"additionalData": {"c9bdvmt2": {}, "T4vtTT03": {}, "YWPxyx0r": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'i6Q53Tn0' \
    --userIds 'Yb9adfxJ' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.09373655956508298, "statCode": "EIMSQRkc", "userId": "YHAdiqvG"}, {"inc": 0.8385194427197002, "statCode": "gKiquLnM", "userId": "Njgb8P9i"}, {"inc": 0.42287247169240827, "statCode": "l340KcQi", "userId": "WLHioxiR"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7807186148640787, "statCode": "dHIUT277", "userId": "JYdoWc7w"}, {"inc": 0.35401663740189715, "statCode": "OMjKVJnT", "userId": "iAvC0Zza"}, {"inc": 0.3136702991161018, "statCode": "ZJXpiC2j", "userId": "2lZgYJZC"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "zetJO1RG", "userId": "lPTpq556"}, {"statCode": "6d54z7Hy", "userId": "3fUQgRDu"}, {"statCode": "QfxGNzBL", "userId": "jw0fAjnz"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.5375917853965385, "description": "o2097TcX", "incrementOnly": true, "maximum": 0.7286349480290736, "minimum": 0.7700825640313325, "name": "jGxbiXLt", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "su8xbDch", "tags": ["7GZS4VDF", "8pw10CGh", "BZIGXTqU"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ty4KmT03' \
    --limit '94' \
    --offset '38' \
    --statCodes 'Wyoy8lLg' \
    --tags 'LayGMlo1' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 's4fI0CS4' \
    --body '[{"statCode": "zevMHEv5"}, {"statCode": "AGnDEYAU"}, {"statCode": "AKDp7l3x"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZZd6WLPf' \
    --statCodes 'geQzD5Cj,IpGHIeqM,sQRq98BL' \
    --tags 'R46WydHX,fRktRDM9,zqQETF2U' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PYlranZP' \
    --body '[{"inc": 0.4937210253578398, "statCode": "oGoch2ag"}, {"inc": 0.20484505101494277, "statCode": "T9YK4qSm"}, {"inc": 0.9885073048094783, "statCode": "ivgOUVyU"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bAgxi3h5' \
    --body '[{"inc": 0.9988897314937796, "statCode": "L79hcJ43"}, {"inc": 0.2634576805627633, "statCode": "xGAY3Rnk"}, {"inc": 0.5423522320128599, "statCode": "huapbNwS"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LB1NOgix' \
    --body '[{"statCode": "w4Y5cQDw"}, {"statCode": "mf9WHfLt"}, {"statCode": "j5uIo1qg"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '3yk7ubak' \
    --userId 'OYdv8hUr' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jl48h7rt' \
    --userId 'KnNWSyad' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EDHpY5yv' \
    --userId '9xOW0zf5' \
    --body '{"inc": 0.09224926425392987}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ti1zeWQ7' \
    --userId 'ty7G6DX7' \
    --body '{"inc": 0.3880708316678325}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OJNHef9H' \
    --userId 'JanhgbJp' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"wi1SdrsD": {}, "SQbIeEpI": {}, "z7arFtio": {}}, "additionalKey": "dPGghw6u", "statCode": "Zf0uGS02", "updateStrategy": "MAX", "userId": "FnZ67onC", "value": 0.06285993478690999}, {"additionalData": {"hulZCKOv": {}, "QupAIvci": {}, "5PTsYfgi": {}}, "additionalKey": "7KAmn5DR", "statCode": "IqeD8ZpX", "updateStrategy": "MAX", "userId": "TMaC27Yk", "value": 0.45060815843436275}, {"additionalData": {"Xz4ZnvuJ": {}, "CKwwTVC2": {}, "6QlQKfFJ": {}}, "additionalKey": "vDLyHZ0f", "statCode": "UoZH8NpP", "updateStrategy": "INCREMENT", "userId": "dw2792Wy", "value": 0.05414314057469194}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'kTWPHsrP' \
    --statCode 't7v8XSXg' \
    --userIds 'IRxQRSii,iPGx3Il4,1Mjq6wbE' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ay9K5SZm' \
    --additionalKey 'b7P9Ovr5' \
    --body '[{"additionalData": {"zhSZWQxU": {}, "WiEB6XuW": {}, "xlQvaqjC": {}}, "statCode": "JAtCvhGs", "updateStrategy": "MAX", "value": 0.09941592004547017}, {"additionalData": {"MPs1qKkq": {}, "PvaLASsT": {}, "jtIgsrdD": {}}, "statCode": "UE08YiuM", "updateStrategy": "MIN", "value": 0.7404407725119123}, {"additionalData": {"oGrPqCWy": {}, "HUfVdBvd": {}, "T2lY5sen": {}}, "statCode": "czLOtrae", "updateStrategy": "MIN", "value": 0.9004077486600592}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'z8vE83GR' \
    --additionalKey 'GVs7CIuz' \
    --body '[{"additionalData": {"iOqDwgpC": {}, "qz23CV61": {}, "btVyVJlr": {}}, "statCode": "vsDUpQX1"}, {"additionalData": {"VA6TGhZ7": {}, "CLCiB6Sa": {}, "a4NAVGot": {}}, "statCode": "MDqUaH8B"}, {"additionalData": {"y2rdOt9o": {}, "8Pkgu4Cp": {}, "gh9yvhid": {}}, "statCode": "lABvxDoz"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Mwop9BgX' \
    --userId 'IMvfL4L3' \
    --additionalKey 'ykEGKDl6' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'a2kn6Z3V' \
    --userId 'v3Ey5DNd' \
    --additionalKey '7BjdNzNq' \
    --body '{"additionalData": {"P3jpurSc": {}, "ugwyHSPG": {}, "Qs38NJ6z": {}}, "updateStrategy": "OVERRIDE", "value": 0.22884443659168474}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"b0yqnqUk": {}, "n79ca7l6": {}, "pd7Lz5eP": {}}, "additionalKey": "bO1UumlC", "statCode": "24Mpc3ee", "updateStrategy": "INCREMENT", "userId": "FZ5ClOJY", "value": 0.1556871313090875}, {"additionalData": {"7HKFM3Tc": {}, "BT7Y8cg2": {}, "F6hKWjlo": {}}, "additionalKey": "FaAzJVSL", "statCode": "ifr2DHhL", "updateStrategy": "MIN", "userId": "nugpsMI5", "value": 0.39363307225025257}, {"additionalData": {"XjU4Qivr": {}, "68PMTlHX": {}, "ijiUPY52": {}}, "additionalKey": "ouZU59CG", "statCode": "ofxbqTar", "updateStrategy": "MAX", "userId": "4u4TusAw", "value": 0.04272180315332619}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UKoheLEq' \
    --additionalKey 'jM5FanFq' \
    --statCodes 'vXuhpsXQ,GTm6gLgN,M4plXD5S' \
    --tags 'GcfVkctU,0T0bOHPl,GHd7vEnD' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId '4zf1749Z' \
    --additionalKey 'BLSpGScq' \
    --body '[{"additionalData": {"ticqSbZf": {}, "gNrEDdMP": {}, "QWV1i3OR": {}}, "statCode": "yOXbMBKv", "updateStrategy": "INCREMENT", "value": 0.09932877676184981}, {"additionalData": {"75whBa97": {}, "LmzY8Gbj": {}, "wZ1o5xsL": {}}, "statCode": "h7vCOn3K", "updateStrategy": "OVERRIDE", "value": 0.2629104361447515}, {"additionalData": {"mGVa88Qw": {}, "lkGcZNS3": {}, "oFuidiH8": {}}, "statCode": "c6OOEdbc", "updateStrategy": "OVERRIDE", "value": 0.6286767007687706}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dNFdXtLm' \
    --userId 'otxuDt2l' \
    --additionalKey 'mNeVAglf' \
    --body '{"additionalData": {"UaJPRU3O": {}, "xp4jWn2F": {}, "2c9eKHev": {}}, "updateStrategy": "OVERRIDE", "value": 0.9639136584399539}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE