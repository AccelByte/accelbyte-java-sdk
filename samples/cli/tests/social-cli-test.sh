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
echo "1..86"

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
    --body '{"maxSlotSize": 98, "maxSlots": 42}' \
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
    --userId 'wkRrpkwZ' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'mIt36yB3' \
    --body '{"maxSlotSize": 47, "maxSlots": 85}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'iSaKKv19' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'xtgPAiSN' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'aSSyTTaE' \
    --userId 'g0MqB0nJ' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'XVrc3e2J' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'afLcS5Zk' \
    --userId 'z3x9zc88' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'FvULA0oj,53ZqNcIl,pCDgINEX' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'WF5WpGjW' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xk60Ai3c' \
    --body '{"achievements": ["NZ4P4IDB", "IvEWJNru", "Mo23QCqo"], "attributes": {"wOIF17Oh": "PeqUkPRk", "WGWCOJzZ": "QD0jPS9z", "6NEzI275": "tRzF7OCv"}, "avatarUrl": "rcUjwtuG", "inventories": ["MaPilUf1", "DT4UeFAZ", "VScfNMv6"], "label": "3lxLSv7r", "profileName": "ul988NG3", "statistics": ["gwx50HC6", "Ot0IGCLg", "vIBsZw1a"], "tags": ["irfTIIEB", "JKeMqRKi", "eBi9VgxE"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'JF8miodN' \
    --userId 'qs2sZMn2' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'xHCzEQ2m' \
    --userId 'A7IX8paS' \
    --body '{"achievements": ["UishIWMM", "DlGJ60lC", "1LI2PnsM"], "attributes": {"KROH3V3V": "yrY7WgUY", "jFMzvwAv": "L3HBzspk", "m6lv2Bfd": "ZhhRZUzz"}, "avatarUrl": "Kwth3O39", "inventories": ["2sov8M2R", "6EQdw9cP", "IeXBjmRD"], "label": "ejICQbaQ", "profileName": "T9HhtBi6", "statistics": ["Pm701rX4", "dD6dU1av", "Xj4R8nsK"], "tags": ["uqDVfV3f", "CkiqQjVM", "F2U5FWvr"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'zWGmJDJ6' \
    --userId 'ywKOQOv5' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '3P58Aw6n' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'LEBmXn0v' \
    --userId '0D3uqmT6' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '8MV945gz' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'vGbagYqt' \
    --userId 'gHPHn8Ft' \
    --body '{"name": "6WeR5b2k", "value": "0cupN8Ed"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'F86cMbrP' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'ds6yaSiY' \
    --label 'aU0Rdgph' \
    --tags 'HiTMhj5E,fOOaZA96,7kKb1j4z' \
    --checksum '2CWM7zvL' \
    --customAttribute 'DVdvy4Yd' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'PaGOQq9v' \
    --userId 'Y1swkfcE' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'pkXpMMmR' \
    --userId '7gkPB7or' \
    --label 'VDiy9RuR' \
    --tags 'cvV9Jrgb,A2RuiEhy,zLHtG6dM' \
    --checksum 'ICOu0ulN' \
    --customAttribute 'x116tRlr' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'QQnestVt' \
    --userId 'nEQObuQ2' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'DIoY550a' \
    --userId 'gppYnH33' \
    --body '{"customAttribute": "HIPbm0Gu", "label": "pK1wrH3k", "tags": ["QrkEQkO2", "34mRSqTa", "l5nOvGDI"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '68' \
    --statCodes 'dXgp1YNf' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UupIH2fx' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '17' \
    --name 'LVJ5ieuD' \
    --offset '82' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "yzeSnaKG", "end": "1971-07-08T00:00:00Z", "name": "WU8mnxyA", "resetDate": 70, "resetDay": 16, "resetMonth": 86, "resetTime": "HbzmdHRm", "seasonPeriod": 24, "start": "1986-04-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'cu35BPrU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetStatCycle' test.out

#- 31 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'Z6dUh1Rk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "MONTHLY", "description": "D6lZhh6J", "end": "1987-10-23T00:00:00Z", "name": "hhqX1l8y", "resetDate": 18, "resetDay": 34, "resetMonth": 65, "resetTime": "IG2VR0sA", "seasonPeriod": 41, "start": "1972-11-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateStatCycle' test.out

#- 32 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId '8w3E5Smd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'DeleteStatCycle' test.out

#- 33 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'mrd1oN0K' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["kLl73zWU", "7c25U1TD", "qym4xqxT"]}' \
    > test.out 2>&1
eval_tap $? 33 'BulkAddStats' test.out

#- 34 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'F0kK2ctU' \
    --userIds 'a2CsJcwc' \
    > test.out 2>&1
eval_tap $? 34 'BulkFetchStatItems' test.out

#- 35 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9439658228196521, "statCode": "rXwmFv9v", "userId": "WfzzviZy"}, {"inc": 0.6055938248629634, "statCode": "X3MjErHt", "userId": "iZeJMj8M"}, {"inc": 0.9149961743001521, "statCode": "G8lgZ4hs", "userId": "YlKDt58J"}]' \
    > test.out 2>&1
eval_tap $? 35 'BulkIncUserStatItem' test.out

#- 36 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.29810710576621824, "statCode": "fybCcILe", "userId": "BYJ07XXj"}, {"inc": 0.7563089756099669, "statCode": "OMRRtfTb", "userId": "HK03g8dS"}, {"inc": 0.3535245954492735, "statCode": "4dffSU7m", "userId": "U9Qeb0Ly"}]' \
    > test.out 2>&1
eval_tap $? 36 'BulkIncUserStatItemValue' test.out

#- 37 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EdIkZ5TH' \
    --userIds 'qEoAxAqj,C7WnBsHk,taO2hayC' \
    > test.out 2>&1
eval_tap $? 37 'BulkFetchOrDefaultStatItems' test.out

#- 38 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Ypk2FqXk", "userId": "11gmFchz"}, {"statCode": "s1uupa2b", "userId": "rRSSmUfo"}, {"statCode": "gDhi8yZZ", "userId": "zEA7G1XG"}]' \
    > test.out 2>&1
eval_tap $? 38 'BulkResetUserStatItem' test.out

#- 39 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'ha52U81Z' \
    --isGlobal  \
    --limit '24' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 39 'GetStats' test.out

#- 40 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["NUq90sSd", "AuCRhdsj", "paovrdDV"], "defaultValue": 0.7116708159098836, "description": "M4jzNkG9", "incrementOnly": true, "maximum": 0.7918664330072961, "minimum": 0.4779097879055494, "name": "6kZjUsjm", "setAsGlobal": true, "setBy": "SERVER", "statCode": "tNotHz8O", "tags": ["84IN1id5", "bCrmuxvk", "uVQJ4qQQ"]}' \
    > test.out 2>&1
eval_tap $? 40 'CreateStat' test.out

#- 41 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 41 'ExportStats' test.out

#- 42 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 42 'ImportStats' test.out

#- 43 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '60' \
    --offset '88' \
    --keyword 'cPPwWBXP' \
    > test.out 2>&1
eval_tap $? 43 'QueryStats' test.out

#- 44 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '44xnRR4m' \
    > test.out 2>&1
eval_tap $? 44 'GetStat' test.out

#- 45 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'anT1vGfd' \
    > test.out 2>&1
eval_tap $? 45 'DeleteStat' test.out

#- 46 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QMGQoLzL' \
    --body '{"cycleIds": ["VKcBlYvX", "sSDNLATa", "aU0pq3VB"], "defaultValue": 0.23435643477388024, "description": "ZqiDnXvO", "name": "YlXqlPNv", "tags": ["SvTl20OA", "ApGZxTd7", "v8F8wtny"]}' \
    > test.out 2>&1
eval_tap $? 46 'UpdateStat' test.out

#- 47 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'K6m4MIEc' \
    > test.out 2>&1
eval_tap $? 47 'DeleteTiedStat' test.out

#- 48 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'cCoip57l' \
    --limit '64' \
    --offset '60' \
    --sortBy 'n4kgF00o' \
    --statCodes 'GSK1ZOVA' \
    --tags 'JhvvV3EK' \
    > test.out 2>&1
eval_tap $? 48 'GetUserStatItems' test.out

#- 49 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '4k61q5rx' \
    --body '[{"statCode": "jwXpoPOt"}, {"statCode": "xp64q6Um"}, {"statCode": "iq58F3Kd"}]' \
    > test.out 2>&1
eval_tap $? 49 'BulkCreateUserStatItems' test.out

#- 50 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zWjFjLUT' \
    --body '[{"inc": 0.41955432744779897, "statCode": "gU3NiAO9"}, {"inc": 0.6357267332878451, "statCode": "DRSxDdHM"}, {"inc": 0.31847209462499393, "statCode": "wRANelou"}]' \
    > test.out 2>&1
eval_tap $? 50 'BulkIncUserStatItem1' test.out

#- 51 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sZoRFKVY' \
    --body '[{"inc": 0.7898220283707434, "statCode": "Ph8R7IN2"}, {"inc": 0.11491896433419402, "statCode": "Q6V75nME"}, {"inc": 0.858593903864009, "statCode": "LPfAEc38"}]' \
    > test.out 2>&1
eval_tap $? 51 'BulkIncUserStatItemValue1' test.out

#- 52 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'obh6kwSh' \
    --body '[{"statCode": "yOAXYFm1"}, {"statCode": "IqP7OEaH"}, {"statCode": "JVx9uL0P"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem1' test.out

#- 53 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TEnBo4MO' \
    --userId 'foDDxsp0' \
    > test.out 2>&1
eval_tap $? 53 'CreateUserStatItem' test.out

#- 54 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Jv1vjFky' \
    --userId 'g12pUtFO' \
    > test.out 2>&1
eval_tap $? 54 'DeleteUserStatItems' test.out

#- 55 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'csVoZHHw' \
    --userId 'EiP8KIg7' \
    --body '{"inc": 0.5702681560079312}' \
    > test.out 2>&1
eval_tap $? 55 'IncUserStatItemValue' test.out

#- 56 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Qfe04IR3' \
    --userId 'aipveZ43' \
    --additionalKey 'yKU0natw' \
    --body '{"additionalData": {"bge4w8Er": {}, "PpX4VxDI": {}, "ikh8hgiD": {}}}' \
    > test.out 2>&1
eval_tap $? 56 'ResetUserStatItemValue' test.out

#- 57 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '47' \
    --statCodes 'llszYUhC' \
    > test.out 2>&1
eval_tap $? 57 'GetGlobalStatItems1' test.out

#- 58 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rDaRGo7p' \
    > test.out 2>&1
eval_tap $? 58 'GetGlobalStatItemByStatCode1' test.out

#- 59 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '28' \
    --name 'fkEfGWdv' \
    --offset '93' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 59 'GetStatCycles1' test.out

#- 60 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'YaPjg0sM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetStatCycle1' test.out

#- 61 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GF6yJYbG' \
    --userIds 'dQo5DM3m' \
    > test.out 2>&1
eval_tap $? 61 'BulkFetchStatItems1' test.out

#- 62 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9927739906161508, "statCode": "txL0uiRj", "userId": "wx5hI8Br"}, {"inc": 0.5069340940987338, "statCode": "YF7rgnqq", "userId": "mEGfiHiW"}, {"inc": 0.3566849452645503, "statCode": "OYtuQ1UT", "userId": "8t7BicIi"}]' \
    > test.out 2>&1
eval_tap $? 62 'PublicBulkIncUserStatItem' test.out

#- 63 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.49965200796640685, "statCode": "CcX3tFRn", "userId": "8MRPK0f0"}, {"inc": 0.1192211810893199, "statCode": "6OATuFrd", "userId": "paZP4IBG"}, {"inc": 0.9203822356243666, "statCode": "yVFK84Ug", "userId": "AOE8pbF0"}]' \
    > test.out 2>&1
eval_tap $? 63 'PublicBulkIncUserStatItemValue' test.out

#- 64 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "drXaaByG", "userId": "Gz0dxq2d"}, {"statCode": "IJqXVdDb", "userId": "5Dvvvuup"}, {"statCode": "1nWRRyXS", "userId": "LSTT7pqy"}]' \
    > test.out 2>&1
eval_tap $? 64 'BulkResetUserStatItem2' test.out

#- 65 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["h3c8miqs", "64IjfPvN", "PmrPjeeq"], "defaultValue": 0.39456085325761325, "description": "cq7juIH0", "incrementOnly": true, "maximum": 0.6311762378230362, "minimum": 0.5117572975753034, "name": "tV81tJZA", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "X9oIyNwG", "tags": ["2UhBPA4k", "mekty7wY", "lfkDXQDv"]}' \
    > test.out 2>&1
eval_tap $? 65 'CreateStat1' test.out

#- 66 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '8ENBJwY8' \
    --limit '46' \
    --offset '91' \
    --sortBy '6VQMRNR5' \
    --statCodes '72BXgU9j' \
    --tags '2P6SOWwu' \
    > test.out 2>&1
eval_tap $? 66 'PublicQueryUserStatItems' test.out

#- 67 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'u53LMWd6' \
    --body '[{"statCode": "n9CcN5eV"}, {"statCode": "aUqEBt1b"}, {"statCode": "zfYwcUJF"}]' \
    > test.out 2>&1
eval_tap $? 67 'PublicBulkCreateUserStatItems' test.out

#- 68 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2ItAtUCs' \
    --statCodes 's5aovopR,VAjbL8OL,q6MSynOU' \
    --tags 'AxjcJfuk,0j9PfaZd,tIrTwNpX' \
    > test.out 2>&1
eval_tap $? 68 'PublicQueryUserStatItems1' test.out

#- 69 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1NaIEmsy' \
    --body '[{"inc": 0.21312181579430423, "statCode": "eJua8FtR"}, {"inc": 0.49952790572402506, "statCode": "NeIc9MNy"}, {"inc": 0.3792915346271414, "statCode": "NlUAVl3O"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem1' test.out

#- 70 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '74UiRKG1' \
    --body '[{"inc": 0.5802262135852115, "statCode": "NrQb7sYW"}, {"inc": 0.5106806628934535, "statCode": "Bi33SL1s"}, {"inc": 0.05129744596414365, "statCode": "RMkS4mfx"}]' \
    > test.out 2>&1
eval_tap $? 70 'BulkIncUserStatItemValue2' test.out

#- 71 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1tFXT3Sg' \
    --body '[{"statCode": "XybGCM7M"}, {"statCode": "EVuHXUDG"}, {"statCode": "NdgjFV5y"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem3' test.out

#- 72 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UfmEx5Oa' \
    --userId 'qnKvIG3P' \
    > test.out 2>&1
eval_tap $? 72 'PublicCreateUserStatItem' test.out

#- 73 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '9zUzFejh' \
    --userId 'PxWUZIXi' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems1' test.out

#- 74 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Fd4Q3r0K' \
    --userId 'Qge8dFNV' \
    --body '{"inc": 0.32269707290594474}' \
    > test.out 2>&1
eval_tap $? 74 'PublicIncUserStatItem' test.out

#- 75 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mMTbwZlx' \
    --userId '0qlcuSUP' \
    --body '{"inc": 0.987712195932821}' \
    > test.out 2>&1
eval_tap $? 75 'PublicIncUserStatItemValue' test.out

#- 76 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YFRgbNcF' \
    --userId 'xLoh5Onm' \
    > test.out 2>&1
eval_tap $? 76 'ResetUserStatItemValue1' test.out

#- 77 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"IoprKDGg": {}, "9vppzd8n": {}, "oVvGdsks": {}}, "additionalKey": "6uUv0mZ8", "statCode": "5TWGqP4q", "updateStrategy": "MIN", "userId": "WV9yAbWr", "value": 0.4043498233400966}, {"additionalData": {"4SnfDkhX": {}, "g7S8BDjH": {}, "2AEVBDqK": {}}, "additionalKey": "OSymGbPP", "statCode": "D3psGxhH", "updateStrategy": "MAX", "userId": "2n4gLJhl", "value": 0.46011564803853977}, {"additionalData": {"XJbtElhs": {}, "ytb3Bzyf": {}, "ah2cCwWZ": {}}, "additionalKey": "DqemHadA", "statCode": "AkbZGYFQ", "updateStrategy": "MAX", "userId": "5WpfxbGP", "value": 0.7537368108252998}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItemV2' test.out

#- 78 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'KCnGX8zl' \
    --statCode 'DfKSc4Q4' \
    --userIds 'U3LCiCMP,og8r60CU,BE2gy6pS' \
    > test.out 2>&1
eval_tap $? 78 'BulkFetchOrDefaultStatItems1' test.out

#- 79 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'CiQc468Y' \
    --additionalKey '1yZiVUD3' \
    --body '[{"additionalData": {"CPR6JBBz": {}, "dHRcNQAg": {}, "ElSOj0bt": {}}, "statCode": "AfquyRb1", "updateStrategy": "INCREMENT", "value": 0.33430519803582415}, {"additionalData": {"xnSO8oPC": {}, "FgCLHA2a": {}, "Mrjtc4DS": {}}, "statCode": "MOv5Ew4W", "updateStrategy": "OVERRIDE", "value": 0.19848076122218217}, {"additionalData": {"Az27OTIW": {}, "N8Yb4ybN": {}, "UJkJ7GWG": {}}, "statCode": "isnjasEg", "updateStrategy": "OVERRIDE", "value": 0.3054096714373403}]' \
    > test.out 2>&1
eval_tap $? 79 'BulkUpdateUserStatItem' test.out

#- 80 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'KBX62nVr' \
    --additionalKey 'TPEKX2oz' \
    --body '[{"additionalData": {"WPtyIzxa": {}, "TzA53iIH": {}, "27dStoZW": {}}, "statCode": "3ut9loi7"}, {"additionalData": {"bmxJpr5l": {}, "RJDy2TKf": {}, "M4bnOf7E": {}}, "statCode": "soZcLqfI"}, {"additionalData": {"hzDuzXdM": {}, "mvWBahL8": {}, "SVb7dUFt": {}}, "statCode": "XD3B7P1P"}]' \
    > test.out 2>&1
eval_tap $? 80 'BulkResetUserStatItemValues' test.out

#- 81 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bYB6BrOO' \
    --userId 'XnU4lmMU' \
    --additionalKey 'BgvAcHal' \
    > test.out 2>&1
eval_tap $? 81 'DeleteUserStatItems2' test.out

#- 82 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'R1NgeXDV' \
    --userId 'a8ywtOlW' \
    --additionalKey '1gjl7YyX' \
    --body '{"additionalData": {"eKcAZKfi": {}, "xAeDEG9V": {}, "dsbCZJq5": {}}, "updateStrategy": "MAX", "value": 0.012700100801065761}' \
    > test.out 2>&1
eval_tap $? 82 'UpdateUserStatItemValue' test.out

#- 83 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"0EVDkxXf": {}, "LkcLiod9": {}, "lz7GMlcn": {}}, "additionalKey": "yBLUtuNi", "statCode": "l3O9PSiV", "updateStrategy": "INCREMENT", "userId": "OSqhrVWV", "value": 0.8719498573194282}, {"additionalData": {"jFFTXmjs": {}, "4naUsqTb": {}, "PsiDjtjI": {}}, "additionalKey": "gptJHdP5", "statCode": "KHFtxvXV", "updateStrategy": "INCREMENT", "userId": "GURb5gZq", "value": 0.10364256431401386}, {"additionalData": {"6n6p8E2x": {}, "vnfMF6mM": {}, "p8WgSE8m": {}}, "additionalKey": "TPpphq4N", "statCode": "47Nq06Nb", "updateStrategy": "MIN", "userId": "6AnmQhqs", "value": 0.05115669203434847}]' \
    > test.out 2>&1
eval_tap $? 83 'BulkUpdateUserStatItem1' test.out

#- 84 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'enBfoUKu' \
    --additionalKey '1Huz33Be' \
    --statCodes 'tOihypvX,CFwUZLSr,6vOjOsgx' \
    --tags 'VZ4JN8r1,Bs0S1CYR,hxoHTM23' \
    > test.out 2>&1
eval_tap $? 84 'PublicQueryUserStatItems2' test.out

#- 85 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o2CDklxB' \
    --additionalKey 'POM7f3u8' \
    --body '[{"additionalData": {"vieziZNz": {}, "wtxIOF3X": {}, "ev0f12Q6": {}}, "statCode": "sWMWmT25", "updateStrategy": "MIN", "value": 0.7317073244050043}, {"additionalData": {"cGnFPJQB": {}, "4YIVJnO2": {}, "MsKXEA5u": {}}, "statCode": "uLcR2jzb", "updateStrategy": "INCREMENT", "value": 0.8364539257046839}, {"additionalData": {"K5IQaFfb": {}, "EJbDKKh1": {}, "EGsHvBIY": {}}, "statCode": "gTkRMGuk", "updateStrategy": "MIN", "value": 0.6563313567936561}]' \
    > test.out 2>&1
eval_tap $? 85 'BulkUpdateUserStatItem2' test.out

#- 86 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ugbkRkNK' \
    --userId 'IWU3EQ5w' \
    --additionalKey 'de4JuFiG' \
    --body '{"additionalData": {"9SY5CSH1": {}, "4qr4kNaD": {}, "OzxbS8TL": {}}, "updateStrategy": "OVERRIDE", "value": 0.6188710680349307}' \
    > test.out 2>&1
eval_tap $? 86 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE