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
    --body '{"maxSlotSize": 16, "maxSlots": 64}' \
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
    --userId 'vuxvl7cK' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'zOK9yb9a' \
    --body '{"maxSlotSize": 32, "maxSlots": 4}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'wxIZxBiT' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'R8XxkfhS' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ccAB6n7K' \
    --userId 'HDKhk1zH' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'XF1o94v1' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '26rglEDO' \
    --userId 'duI9H7Xc' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'gNTmfoH5,bIMw3FTm,b2NZIryR' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'pNg680Sc' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'HXSBtYTH' \
    --body '{"achievements": ["LWrMtW2b", "NSiSaqNd", "mndsdAFY"], "attributes": {"OQdcTmJA": "JybklMKD", "bN05RWjb": "0ojOIwTr", "qL54oCks": "9iJZc8VL"}, "avatarUrl": "ZaFIcD0U", "inventories": ["1pnZrHrm", "wecrQABc", "7chHbbQC"], "label": "ESJW08CQ", "profileName": "7R777E4P", "statistics": ["CY7vRqtD", "VcxIF6nV", "MDiTmCnh"], "tags": ["kuOQGHTm", "MFXRBK7M", "MWoBZhoC"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'T12GR5QY' \
    --userId 'kfg8DeHw' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'nVFziEQG' \
    --userId 'HWDABaGp' \
    --body '{"achievements": ["qE5NqxUl", "obqmfVFY", "HZNjZwd7"], "attributes": {"P1zLc8hM": "YXxNm1zp", "idu45jfy": "Qleo76Fs", "YvebRMxI": "7uqOkCQk"}, "avatarUrl": "3xBwiHb7", "inventories": ["YfC9ApJn", "NouawyP5", "F8de5Woj"], "label": "vXdFO6qM", "profileName": "xmrqFpML", "statistics": ["qZpZrFLt", "itwVfY4U", "KP1HQy5M"], "tags": ["KeWoRjBN", "iNCxj1Qp", "ZHvfjOy3"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'jVgFgXv0' \
    --userId 'tGaXatjC' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'EDdOygHA' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'haKoWqmw' \
    --userId 'zqJtq1PF' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'fMMtVswd' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'PG023pLE' \
    --userId 'Hg50NEHN' \
    --body '{"name": "sQKcBCYF", "value": "qNImSPaQ"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '8dBfP8jQ' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'bSvHnm9k' \
    --label 'hMd1GdRz' \
    --tags 'RPqrv3zH,uDw2fbYK,5XXf155w' \
    --checksum 'NOgwnme6' \
    --customAttribute 'NR9OWmRd' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'I5UnSPns' \
    --userId 'QkCcw5zc' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'RD3jsx5i' \
    --userId 'mb9yHa73' \
    --label 'qmz0AwUE' \
    --tags 'hFLa1V1t,kig8VfdF,jot3Hbxq' \
    --checksum '3kGox9aN' \
    --customAttribute 'BDheTiGT' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'wFA8dD2J' \
    --userId 'k7DXZXNs' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'uLQundh3' \
    --userId 'XXFFHj3d' \
    --body '{"customAttribute": "kM0MbzcC", "label": "jWwdZqp1", "tags": ["KVto563w", "z3gHgc0Y", "3XaNmJA5"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '61' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UMkW33da' \
    --userIds 'jFYzdFow' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.655267919506341, "statCode": "WSvLKm4z", "userId": "e3TstPac"}, {"inc": 0.5743055477484942, "statCode": "d9I9dzQ6", "userId": "SDh7DCgh"}, {"inc": 0.9560505116937814, "statCode": "5PTspIVl", "userId": "Krt5HMLK"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6184501879886004, "statCode": "gpzXZlKQ", "userId": "iQyPdulI"}, {"inc": 0.8547377363324399, "statCode": "VfSg5hyS", "userId": "wKGupZBL"}, {"inc": 0.8387438001102221, "statCode": "l1GQc0QR", "userId": "GdpwAZtr"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LkH6Q2Y9' \
    --userIds 'pSgV9qrF,JLxSb56T,4487Sn1v' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "IOizhJXB", "userId": "EFCVfmsh"}, {"statCode": "VUmDqE4V", "userId": "EtcjjYYY"}, {"statCode": "M5jpyzvQ", "userId": "Qot9Lx5E"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.3530299681665289, "description": "LePslqLO", "incrementOnly": true, "maximum": 0.8383401141571203, "minimum": 0.5101154514829239, "name": "i4seHini", "setAsGlobal": false, "setBy": "SERVER", "statCode": "LaDBwnaG", "tags": ["vn9C7pSd", "Yo1YedH0", "19HvcE40"]}' \
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
    --limit '39' \
    --offset '25' \
    --keyword 'JoF9FaCX' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QNHm3MH3' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AjRI1gGM' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BISJjMfV' \
    --body '{"defaultValue": 0.4785092705921672, "description": "AxsA8nvi", "name": "WHX8QKHt", "tags": ["9F2Ad6Ju", "GyFxn20F", "I7jDEm3T"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'noEDAdfB' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'TQSHdJv0' \
    --limit '96' \
    --offset '26' \
    --statCodes 'Bq07X1XB' \
    --tags 'VHfkiqgV' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'rtlgBzY3' \
    --body '[{"statCode": "cnsR2ijt"}, {"statCode": "UyFRLIRl"}, {"statCode": "GSp2jIKW"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AFMgOuoW' \
    --body '[{"inc": 0.8924181611437676, "statCode": "aKDKRkx5"}, {"inc": 0.7423590660486662, "statCode": "Bzw1If7A"}, {"inc": 0.226645517557036, "statCode": "utz9VgrV"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1IQCFKJ6' \
    --body '[{"inc": 0.27314478703861, "statCode": "qWo4vL9z"}, {"inc": 0.05319422240588967, "statCode": "riHH8pRe"}, {"inc": 0.43420400929571024, "statCode": "txnBiRJb"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'de4XrnQY' \
    --body '[{"statCode": "aX18gLyL"}, {"statCode": "l7SWjCGR"}, {"statCode": "bIjvT62R"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fkhp4hd9' \
    --userId 'qDm1tSX0' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XIH7oNVU' \
    --userId '8ilytSv4' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KTwqNZNc' \
    --userId '5JwSkjow' \
    --body '{"inc": 0.8179875431712136}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KMXXE7Z6' \
    --userId 'PtKTJk7D' \
    --additionalKey 'iIUfllqH' \
    --body '{"additionalData": {"doq6ED5g": {}, "JUlstfNC": {}, "WepQ1Qsk": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GyVBWbN8' \
    --userIds 'oCDkGYi1' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2570529867146488, "statCode": "uEqKKBX5", "userId": "ZNfRKRmk"}, {"inc": 0.2795797816041289, "statCode": "6H7hnInA", "userId": "PaphcEri"}, {"inc": 0.3491004060838673, "statCode": "cYzQ4xkj", "userId": "rC8qaO5J"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8118491723991634, "statCode": "GLu4laV7", "userId": "GY0rEkSU"}, {"inc": 0.031133549355796153, "statCode": "NPuiHKuU", "userId": "Mrky7gdV"}, {"inc": 0.8022998924987431, "statCode": "uA60is30", "userId": "tj2ORBI6"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Be5e9Fqg", "userId": "4I5q6pn0"}, {"statCode": "jPQgRVcd", "userId": "CafQWFqg"}, {"statCode": "RBYQlzxJ", "userId": "LbgO9D7Z"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.9056160506069251, "description": "zeBbSxmH", "incrementOnly": true, "maximum": 0.47042877976609454, "minimum": 0.76673453318309, "name": "cKKso1nY", "setAsGlobal": true, "setBy": "SERVER", "statCode": "dHNT7dPD", "tags": ["QtP2NgQv", "KIlrQYgb", "HVbGl4yX"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'iZlx7r75' \
    --limit '50' \
    --offset '16' \
    --statCodes '9xIXf4If' \
    --tags '1nfV2kTe' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PHUaUJ0X' \
    --body '[{"statCode": "PbpSesPP"}, {"statCode": "o6C0MHdZ"}, {"statCode": "7ekB3R5k"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rg5cIsrm' \
    --statCodes 'TOdjN9mX,lulNTLrh,MdsIwqLD' \
    --tags 'iEdjGMcl,VK8mxHJO,yrh3hVPU' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZhMOjcJh' \
    --body '[{"inc": 0.2475323134297983, "statCode": "WYCUjcbN"}, {"inc": 0.26000064713678217, "statCode": "eZvsoVvs"}, {"inc": 0.1783269263072239, "statCode": "eIMQypRv"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tAR0PxlO' \
    --body '[{"inc": 0.05780909075118512, "statCode": "mJvnDxOE"}, {"inc": 0.41266468669874423, "statCode": "6pu5CbET"}, {"inc": 0.7719570054383704, "statCode": "oEhoVVQJ"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tXBtbtEC' \
    --body '[{"statCode": "mPsJQGNw"}, {"statCode": "8LtssR8q"}, {"statCode": "FwSihtGG"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GBTvfcYk' \
    --userId 'wruFmc4U' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Eow6Oe8N' \
    --userId 'fasTPn8s' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'AVMFv5Wo' \
    --userId 'CaExV9x2' \
    --body '{"inc": 0.9218861987688239}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yapctIQv' \
    --userId 'jWIW0VxN' \
    --body '{"inc": 0.34502814195671927}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SnLTnZE9' \
    --userId 'DZqrYhkY' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"Nju8AUik": {}, "DpanBdqx": {}, "hrA2mRek": {}}, "additionalKey": "4y414J3r", "statCode": "RDqjYwpj", "updateStrategy": "MAX", "userId": "ONLo03IY", "value": 0.7950404047040484}, {"additionalData": {"6wf13S0m": {}, "ILs3Qm4x": {}, "Ry10iGGP": {}}, "additionalKey": "rORjxw9p", "statCode": "GXQLOa5n", "updateStrategy": "OVERRIDE", "userId": "jbwsgTQt", "value": 0.8970500099016848}, {"additionalData": {"8NCyRxGJ": {}, "ynT9Gamz": {}, "CFkmicwm": {}}, "additionalKey": "SzCppVnM", "statCode": "OAp0V0sk", "updateStrategy": "INCREMENT", "userId": "nIXM3E23", "value": 0.6750836383358184}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'qYeuLdcL' \
    --statCode 'eIMphpNS' \
    --userIds '9yIIaMCi,5caVEMwW,z6iUmRSz' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '2NXO484U' \
    --additionalKey 'AgMSvQ8o' \
    --body '[{"additionalData": {"WbFwd0uF": {}, "2sf4kr5c": {}, "hvzDj6v0": {}}, "statCode": "G8GNMrFH", "updateStrategy": "OVERRIDE", "value": 0.893569844687943}, {"additionalData": {"Fk38syjq": {}, "Tx16sSKo": {}, "q742Yq1U": {}}, "statCode": "UV2o6ysu", "updateStrategy": "OVERRIDE", "value": 0.5485707850657708}, {"additionalData": {"EY99RHsk": {}, "pKTGCc6W": {}, "uvcwA1Hl": {}}, "statCode": "LnmW9lDp", "updateStrategy": "INCREMENT", "value": 0.6897779630852068}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'TWMmOG6Q' \
    --additionalKey 'upZoB7rX' \
    --body '[{"additionalData": {"x6WegWic": {}, "sUAUI3ax": {}, "KyTACsSh": {}}, "statCode": "jB6ATduf"}, {"additionalData": {"qjwK9j2i": {}, "Xsvh6Mdc": {}, "EhVKk97V": {}}, "statCode": "y4AMooST"}, {"additionalData": {"jK7UVcvF": {}, "kGxvoFCk": {}, "1Vm7Wjyp": {}}, "statCode": "3iCJghji"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f2Mpmr55' \
    --userId 'gUBFFJNw' \
    --additionalKey 'zXyyXGj4' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '81XClXBf' \
    --userId '3Y937F19' \
    --additionalKey 'SilJrq6H' \
    --body '{"additionalData": {"J1RQS0Vh": {}, "jbgucHnt": {}, "AEkfLgN6": {}}, "updateStrategy": "MIN", "value": 0.26504411176990983}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"h9vqZ6Js": {}, "q3B4BIiF": {}, "MqbAXLIX": {}}, "additionalKey": "UYMzhqYq", "statCode": "lyyUeUS8", "updateStrategy": "MAX", "userId": "2i7Y8BNd", "value": 0.29508053935208933}, {"additionalData": {"WGhWCJGT": {}, "xzfBO712": {}, "9APprL54": {}}, "additionalKey": "7rvUSI3w", "statCode": "YJQL2ebu", "updateStrategy": "MAX", "userId": "RcQOxR32", "value": 0.4364000773111234}, {"additionalData": {"oZZb6eAT": {}, "sdHGd5gk": {}, "MwdE8Q2m": {}}, "additionalKey": "4z4YoffK", "statCode": "az6uuRG4", "updateStrategy": "OVERRIDE", "userId": "BaqB6NBx", "value": 0.14380480289776687}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QmM4hyb6' \
    --additionalKey '7GW1i1jy' \
    --statCodes 'Y1Z7HIIH,w9vnZrM1,z9Wq865M' \
    --tags 'odwjJk7P,ClbZNde3,LlwB87Be' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z9AWfffH' \
    --additionalKey 'pjThUyY8' \
    --body '[{"additionalData": {"8jihzuD6": {}, "Acm6AD5i": {}, "WswEx4QO": {}}, "statCode": "BpY65Jos", "updateStrategy": "OVERRIDE", "value": 0.16637632084429244}, {"additionalData": {"rp9NOc9J": {}, "xHlkeEXT": {}, "QtZTFASB": {}}, "statCode": "g0Id7a6n", "updateStrategy": "OVERRIDE", "value": 0.4169226816978163}, {"additionalData": {"wxmhrp1j": {}, "03F401vM": {}, "y2mVMLlg": {}}, "statCode": "PQI8JqQs", "updateStrategy": "OVERRIDE", "value": 0.10521828529081101}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2pGSn74J' \
    --userId '26xnxjmF' \
    --additionalKey 'ek2gf7z3' \
    --body '{"additionalData": {"pqy5vWsk": {}, "rW2Y5ZX2": {}, "6g77sKQp": {}}, "updateStrategy": "INCREMENT", "value": 0.546788605617207}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE