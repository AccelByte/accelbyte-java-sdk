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
echo "1..95"

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
    --body '{"maxSlotSize": 62, "maxSlots": 39}' \
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
    --userId 'AxcVpFrttufHIRdH' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '9UzVRiXbqlAw7r6W' \
    --body '{"maxSlotSize": 9, "maxSlots": 20}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'HpzSn3ZPUdc0qh4n' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '8mzZ0m8SAMTwE6I5' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '6IaRDBXxyaNoMR6h' \
    --userId 'kspInrAip6lyzSxw' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'ElFHHdgs21Jub74C' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'UkNmKJfh5pUkHODp' \
    --userId 'oMF78NY4YkHs1cnz' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds '1JSDgY1TXp38zsCT,CrbCbPOyNQkT7Nvy,E3cwyALczNIicXm7' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'agSrjJW2OQNOs1PX' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'hT5FvdiRilZ7oFgx' \
    --body '{"achievements": ["4c8OumKtPDKJDXn7", "Z4U68su8XfqlqNiT", "vB6SdAdIhUDrwoZ5"], "attributes": {"MecdKi5r6QEa1ysL": "Ezth6mXhzkzWkFeZ", "SoEAcBdW19m4eu6d": "5tA5jUmiTqpyhPFd", "xLzFQN05MYzYiKWe": "5dNRljv7IPrDQQRg"}, "avatarUrl": "at0SevkLGMS0lyuI", "inventories": ["9a2I9u6Vpbsx5w8h", "qUI06UpOXGSLmCVu", "HOPlLlkvR8sKgnuR"], "label": "kgghGoYupD391C2q", "profileName": "tPYokahFjkQsfCaT", "statistics": ["mt1d67FXGk2s9Q0m", "PVo3twu0MesTCf9x", "4rt69lna7qxNeIxP"], "tags": ["z6MbwL6IY69z1UaL", "qYSYWytLPziZMdjx", "cBZufQxGiHPllG4c"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'YEzfTD1ZBm3MqHcU' \
    --userId 'mLZZbSqb8RwNmn9H' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'rNQy4uZAAiE0mit9' \
    --userId 'RGCCHYzUOcEdscKH' \
    --body '{"achievements": ["PEqgA8yu7Vk6Jt4Y", "mos9Jcdos4fYcTVU", "6RBt0zYoMcHyCUEX"], "attributes": {"lAvxJMdalwSyliWM": "NW5NyLu0M3VHh2EI", "8JlDbPWbQ6Q9lNmq": "RBaAkLnvxkT1X68c", "mDc3fxU8MyKrQpM4": "hkkK6KKXNB3Gv0Iq"}, "avatarUrl": "mF51TkhjYnaq6foW", "inventories": ["vXa3bMrXsDr6kILs", "SSyDdmykmoPYgc2L", "4jk4Lo0LSP0pf4Ix"], "label": "jUkl535X3ateEKDp", "profileName": "ADz1x3poD3Qgb3bo", "statistics": ["LQQ1MzH7Qm8bwbmX", "gdAPh1EThG96gAFK", "K2WDgCcxvONZm3Ee"], "tags": ["ERmDnyeFoF7VSZ6p", "f3vneSD2Tb3g7mSQ", "UhAEtrmjqU6YE3p4"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'lSck0ZHn5GI39YBH' \
    --userId 'qaTHeKtW18iGeUlc' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '9d9sogWa24CKNS0G' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'qVvUfHQvsHXNUNe4' \
    --userId 'mhgo5QB65lSAiYnN' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'jkfZrQvGgbLdLsFz' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'HkBMr1yrOMlNFSrU' \
    --userId 'EirnjX9fDmIbeZxz' \
    --body '{"name": "fTcyiuATus9hsfpF", "value": "DcSDG8aMVGLiBNrD"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'jqoxcwgGLXpUL4pp' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId '2ncYAHdNzDmeIP6r' \
    --label 'OvDz9KOsb392k6Ym' \
    --tags 'JFfRByjlBiuFM3FI,oVk8T3GpAnkCmBUq,g2SCnqntX9y1aZSW' \
    --checksum 'MiVi10sG6vxkfUcm' \
    --customAttribute 'qRRbceJ5i0EeDxOg' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'BnhhqElIaDml48wd' \
    --userId 'NFLTm5T50x9WT0Gf' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'H2rtOa4EXsXzOXQA' \
    --userId 'k4mqrxzTtuLl4Xlb' \
    --label 'GL8QOxtjzm8y2wNh' \
    --tags 'mwoYZyI4EFZKBcYr,CEAE7WIsfmx40NLR,c6m8heKnWhzfe2Nu' \
    --checksum 'beoKFeIaFQCYoDPI' \
    --customAttribute 'CpnduEEQlULdJz4m' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'nRBkMNxvvKgAT8mJ' \
    --userId 'rYq6hRkloqxM3gpw' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'xcfMy9XzjjI5YbsK' \
    --userId 'oADkzJEN2VHzih3b' \
    --body '{"customAttribute": "it0VWn3CO39PXDNx", "label": "tXgeO3FgkXhjDzaQ", "tags": ["Y3snn2ZkP7cFdP43", "e5dC9XIBudfZgrbH", "DIDm4hMzF4Txoden"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '35' \
    --statCodes 'etOO847g8OudOfjn' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CuHZ3c46IjGa23Yv' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '81' \
    --name 'mDg7VYPXIuvUYTZB' \
    --offset '89' \
    --sortBy 'reSvf9699mCEHThU' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "kETAsSp7gh4TeUTk", "end": "1991-03-24T00:00:00Z", "name": "kAYfJB8AT9t4Tv20", "resetDate": 91, "resetDay": 85, "resetMonth": 33, "resetTime": "QD3oD5fLCr3OOlXV", "seasonPeriod": 45, "start": "1993-07-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["NJma1MbqqZtfNWql", "4nmwAft4gqkNNlWk", "ZGF7uYnGzpipNDig"]}' \
    > test.out 2>&1
eval_tap $? 30 'BulkGetStatCycle' test.out

#- 31 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'D9eOziYRFOn0jJLH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetStatCycle' test.out

#- 32 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'C9LxhvNXTwGBCtoh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "fl7MUBG7qtPu64yA", "end": "1981-08-21T00:00:00Z", "name": "RKLRkb738HGS6rDg", "resetDate": 80, "resetDay": 97, "resetMonth": 7, "resetTime": "G7tnsZg5QgXjvyGJ", "seasonPeriod": 85, "start": "1994-11-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateStatCycle' test.out

#- 33 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'a1PsKc50Kv6ecnEe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteStatCycle' test.out

#- 34 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'vcAx2K2zkRenmPZn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["GBt4P7WnbdSJtjX7", "ZshZyZl5x4bRXBHU", "TrDzZSKscfOcYu3d"]}' \
    > test.out 2>&1
eval_tap $? 34 'BulkAddStats' test.out

#- 35 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'pCROYqUiGKXVFCmp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'StopStatCycle' test.out

#- 36 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'o6sPwVOEDSJsEK5Q' \
    --userIds 'pNhlI2iS5EpGhhvX' \
    > test.out 2>&1
eval_tap $? 36 'BulkFetchStatItems' test.out

#- 37 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8168303755042315, "statCode": "ck0upMzUYnb76tFk", "userId": "EORV3bu1bNCtX7W4"}, {"inc": 0.8483396684290279, "statCode": "V6Do5sYadCCFrHHC", "userId": "3DpZxkrQDXuNFviM"}, {"inc": 0.006470458958401926, "statCode": "rv8mnfHK8CCmE2lP", "userId": "nsbD3SGEdlwuUccE"}]' \
    > test.out 2>&1
eval_tap $? 37 'BulkIncUserStatItem' test.out

#- 38 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9266155049376656, "statCode": "36ugBp3HBvepnDCj", "userId": "gyJlXe36mgWjLfFm"}, {"inc": 0.30774451334653796, "statCode": "eue9nzJ6fH24T805", "userId": "tVg8JqU0jZpjvsug"}, {"inc": 0.4305197428458377, "statCode": "OS7u8RiWyerCSa8S", "userId": "RgwsAj1ik1jglaDX"}]' \
    > test.out 2>&1
eval_tap $? 38 'BulkIncUserStatItemValue' test.out

#- 39 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TvKCWwNTAhd2wrS0' \
    --userIds 'uPdjhdinpng5BLy8,wbhMssAHjapIkY9R,f4wP57dBZNR88YbC' \
    > test.out 2>&1
eval_tap $? 39 'BulkFetchOrDefaultStatItems' test.out

#- 40 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "tmKy8M9zVrjfGXZn", "userId": "qAQUoY1GjlIIk0iK"}, {"statCode": "oTTS1j02o7JjTXAQ", "userId": "N0qdskdQV0TqI8EF"}, {"statCode": "nmDbxIxi4YKlONk2", "userId": "Q5Y4Jvaizwiilatu"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkResetUserStatItem' test.out

#- 41 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'Ujjt9lIMGql5ElEa' \
    --isGlobal  \
    --isPublic  \
    --limit '15' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 41 'GetStats' test.out

#- 42 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["XJbZDKKoxLE1Y3Dy", "1eMbEIjowLqc3ecj", "VHfPEspxwhRON0bc"], "defaultValue": 0.2078213154618923, "description": "tj3giPg4x4yiPX6u", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": true, "maximum": 0.5432299733932602, "minimum": 0.12199928719409914, "name": "hkg1yLVbLFzHEP8c", "setAsGlobal": false, "setBy": "SERVER", "statCode": "3VgsZXiR1DJ7HVWq", "tags": ["ic7UkBeIXuqDuAXI", "66bQ71w0deoV9Lx5", "MkNSawQUWDFJvJBW"]}' \
    > test.out 2>&1
eval_tap $? 42 'CreateStat' test.out

#- 43 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'ExportStats' test.out

#- 44 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 44 'ImportStats' test.out

#- 45 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '90' \
    --offset '33' \
    --keyword 'DA1l2XcrciYNEzvS' \
    > test.out 2>&1
eval_tap $? 45 'QueryStats' test.out

#- 46 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZIPkhSgORcz5S5Bv' \
    > test.out 2>&1
eval_tap $? 46 'GetStat' test.out

#- 47 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mgBLxh4ijFnE3Tam' \
    > test.out 2>&1
eval_tap $? 47 'DeleteStat' test.out

#- 48 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '69qSZ7PC6f6QkmZX' \
    --body '{"cycleIds": ["AOec0z8eBeeoip68", "4czz0QKFlAVmVLu4", "ElW9YfRSse6AAz3S"], "defaultValue": 0.5710583818094697, "description": "1nsv4W2OJhtafxMS", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "eb34sZKHcl5LLLOe", "tags": ["xL4fZvWtND2tcBFp", "a5afj12K2IzrBvvW", "X8lNtFEJ7tnkY6Mc"]}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateStat' test.out

#- 49 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'm4udE0OXudXgNne8' \
    > test.out 2>&1
eval_tap $? 49 'DeleteTiedStat' test.out

#- 50 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'kJATwlc6esUp6Sw1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I98jeZQ7hfxnhLd3' \
    --isPublic  \
    --limit '75' \
    --offset '67' \
    --sortBy 'naknoed9DHhLOqQG' \
    --statCodes 'hCUr6iTrjyEgarAd' \
    > test.out 2>&1
eval_tap $? 50 'GetUserStatCycleItems' test.out

#- 51 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJOIG36I6tRbRcrE' \
    --isPublic  \
    --limit '44' \
    --offset '33' \
    --sortBy 'eMdAdiPKDUVSC00P' \
    --statCodes 'YeDcagginxnFIna3' \
    --tags 'yddcbsPheTH26IUJ' \
    > test.out 2>&1
eval_tap $? 51 'GetUserStatItems' test.out

#- 52 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvYuGRUvpZaHCuES' \
    --body '[{"statCode": "OiIZsMfB4ZH3mtgW"}, {"statCode": "gU4pCAKxeE70Caun"}, {"statCode": "QNxot371W9G4AvQk"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkCreateUserStatItems' test.out

#- 53 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qsGnmyo5JJTUVmb8' \
    --body '[{"inc": 0.5212088153600677, "statCode": "EXFTlEMEsFzYqwgK"}, {"inc": 0.8586996136121736, "statCode": "Np5nodqpLm7FhJBN"}, {"inc": 0.7960938725429499, "statCode": "zAFdO0Khqf6kiTdS"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkIncUserStatItem1' test.out

#- 54 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gv2LFjAKY7CbgsWq' \
    --body '[{"inc": 0.5069338840170367, "statCode": "WZX7kPBom8F9GLLT"}, {"inc": 0.530110044097101, "statCode": "8phc3n4iLoIllKlp"}, {"inc": 0.6562097305584481, "statCode": "2pqiXJF3WGRaoQom"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkIncUserStatItemValue1' test.out

#- 55 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SJC4DdrKF7SUQPLG' \
    --body '[{"statCode": "59e0k5ZtX6wK7PpU"}, {"statCode": "lcIW32iK7MGt1ixY"}, {"statCode": "5rA1WoVeJIePF8Zr"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkResetUserStatItem1' test.out

#- 56 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QzP4zvtdxdbZUpd6' \
    --userId 'FJtHJ1pyVwyKQLY6' \
    > test.out 2>&1
eval_tap $? 56 'CreateUserStatItem' test.out

#- 57 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FEO65Rb3z7CYLM8I' \
    --userId 'lsHqffnrfsGlfPaZ' \
    > test.out 2>&1
eval_tap $? 57 'DeleteUserStatItems' test.out

#- 58 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KBwa3Ddb60ufPpzw' \
    --userId 'j1QGIFmlVf4jvaps' \
    --body '{"inc": 0.07083368406806057}' \
    > test.out 2>&1
eval_tap $? 58 'IncUserStatItemValue' test.out

#- 59 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'E9LN9bvhOrHflIOd' \
    --userId '6X3viLvtEk4mTIpU' \
    --additionalKey 'A9gxo8SV38nEhoXm' \
    --body '{"additionalData": {"M2W7l6jHMA2rG3na": {}, "kopAywelu01nryEJ": {}, "0NqoTow0qiOiC4j0": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'ResetUserStatItemValue' test.out

#- 60 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '21' \
    --statCodes 'qKhTPkwfLM9uSybR' \
    > test.out 2>&1
eval_tap $? 60 'GetGlobalStatItems1' test.out

#- 61 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zWek2gZvRrvr0n9d' \
    > test.out 2>&1
eval_tap $? 61 'GetGlobalStatItemByStatCode1' test.out

#- 62 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '2' \
    --name 'vccKMLhrTrcBE2It' \
    --offset '57' \
    --sortBy 'Aejcq2LgkQuaS7RB' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 62 'GetStatCycles1' test.out

#- 63 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["ME74HUtipUWYhWV1", "Sk4lq2faBcAXXKlh", "qx8CzPML52faXUr9"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetStatCycle1' test.out

#- 64 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'vyH8paOJtxqMPpcV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetStatCycle1' test.out

#- 65 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fRwNj547fH0XrKED' \
    --userIds 'pEY8VnocGAjci0V3' \
    > test.out 2>&1
eval_tap $? 65 'BulkFetchStatItems1' test.out

#- 66 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3219542058101499, "statCode": "Bf2jnHGKXphn50c9", "userId": "tNLDljhZ2jxLRX3z"}, {"inc": 0.9091012299365985, "statCode": "6OCaGBeMfPlNos4y", "userId": "BRjrERHEonAZR8Gm"}, {"inc": 0.4900015811729306, "statCode": "u0q1p6QCyY6vSkVF", "userId": "WdsbYuVEGVxYheR3"}]' \
    > test.out 2>&1
eval_tap $? 66 'PublicBulkIncUserStatItem' test.out

#- 67 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.15809820624387738, "statCode": "5mNZ6vwv7K8Asvt1", "userId": "j1Rx59hesNWy2NvZ"}, {"inc": 0.9829227564580245, "statCode": "5DDKDAF8KDsBZOuY", "userId": "QJ03BAHZ7c53q7ak"}, {"inc": 0.6254134759112442, "statCode": "pcmnnx6RVBrop9v7", "userId": "aZK3h65hbN15zfQS"}]' \
    > test.out 2>&1
eval_tap $? 67 'PublicBulkIncUserStatItemValue' test.out

#- 68 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "fQrtfF3TQN0OcNDL", "userId": "r36vzohZyjMQAg5m"}, {"statCode": "PYhrLTyU8OhgfY9J", "userId": "QYGF4bYXEcENx9xZ"}, {"statCode": "lAchob44lONDDwMv", "userId": "gI0HlyPR7wZNiVsF"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItem2' test.out

#- 69 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["6xG2mXEQdbzIVy8a", "ctPErqxyMyOK06Mq", "lncV7vWgSHdfo07U"], "defaultValue": 0.6813226172842516, "description": "BErxgjVBycvU4Pbm", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.2817686318307818, "minimum": 0.10814999242564793, "name": "0DjQjBECXvea7H1m", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "wxxElpMYSWIeVzm7", "tags": ["RY2VN4ZONJREdUQ3", "z9noowmlTIKVowi0", "z9F1BxNNgnke4akn"]}' \
    > test.out 2>&1
eval_tap $? 69 'CreateStat1' test.out

#- 70 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'cw7wu9TmXfJWBPrx' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '81' \
    --sortBy 'nDkdZ9bpjb1tdA3Q' \
    --statCodes 'hjCMW64f4XhIjSoT,B2NMKtezapPr2QEP,x3zTxBGtEJIYppuU' \
    > test.out 2>&1
eval_tap $? 70 'PublicListMyStatCycleItems' test.out

#- 71 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '46' \
    --sortBy 'sKoHw2hyd12uSE7B' \
    --statCodes 'Ev3aevq6iohU1cg4,W1IS3Uv1BpWoJBaq,dg2FHcunsS1lnaO2' \
    --tags 'm9vqjhbeK2qN8g6x,2PyYDo5R3hLiD5sf,5y1JsxJNGmyt0SQD' \
    > test.out 2>&1
eval_tap $? 71 'PublicListMyStatItems' test.out

#- 72 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'UDoWBZVGLlkUetzC' \
    --statCodes 'AWc9x1aMjgGim51T,107XIZRZ7tZdIs0x,f4czdt7zqmSKxOEQ' \
    --tags 'lVcx6GqsBq8vdhWV,nuYLgpZehK0G2nmy,uViB9kRTcSQdTnNY' \
    > test.out 2>&1
eval_tap $? 72 'PublicListAllMyStatItems' test.out

#- 73 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'GeAfYFG3wSkHKufB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dS3ZOokZB4cXnAXy' \
    --limit '42' \
    --offset '44' \
    --sortBy 'Gz6LlxHv8SwyagYv' \
    --statCodes 'DJ3w3UNgIGj2jZtE' \
    > test.out 2>&1
eval_tap $? 73 'GetUserStatCycleItems1' test.out

#- 74 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'YT8sIPSE1XXPzySa' \
    --limit '3' \
    --offset '38' \
    --sortBy 'mu8ePWlQMVDXEHei' \
    --statCodes 'GTnwyEw6hIWDZrpP' \
    --tags '7rz3ISW510kHr4is' \
    > test.out 2>&1
eval_tap $? 74 'PublicQueryUserStatItems' test.out

#- 75 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'TKWjmv67nuHCXWfw' \
    --body '[{"statCode": "nwGioVwVzmmBVVFf"}, {"statCode": "pqx1AeLtzcPJ3jtD"}, {"statCode": "YBo4FUTH7CGfKSyx"}]' \
    > test.out 2>&1
eval_tap $? 75 'PublicBulkCreateUserStatItems' test.out

#- 76 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gRR1DiCqSMzpqIFG' \
    --additionalKey 'LkDs7ACC1RgBfoNr' \
    --statCodes 'HlFi2qJLgmBLE35Y,hyiDV90SeI5yppBH,oytVznCgNyx9fbT6' \
    --tags '3ShEh8PbGikLjgjc,j34uulU6FYBZsWFb,r3RSP0W9nBhvhf8Q' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems1' test.out

#- 77 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0DtJMcYQdN66bswA' \
    --body '[{"inc": 0.10137190297573373, "statCode": "t65X4N1LQZmB61JM"}, {"inc": 0.05843194748976366, "statCode": "twCVUrYQue84dwmb"}, {"inc": 0.36282359535798936, "statCode": "FEnAZaWsQJtRYoag"}]' \
    > test.out 2>&1
eval_tap $? 77 'PublicBulkIncUserStatItem1' test.out

#- 78 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RJK5PX9UcOvhPyE1' \
    --body '[{"inc": 0.8582151921198851, "statCode": "TRT2SKseoe8VLie0"}, {"inc": 0.6093386778853495, "statCode": "Ba36KNzjf005CXNG"}, {"inc": 0.06634041829341941, "statCode": "hQ2aTjTDfKFDXC7e"}]' \
    > test.out 2>&1
eval_tap $? 78 'BulkIncUserStatItemValue2' test.out

#- 79 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GL5YhJDWh9YWqc0q' \
    --body '[{"statCode": "gV6d9yOfIMLds2Db"}, {"statCode": "PcaoMdtRLTmSvTkQ"}, {"statCode": "QgB7exYvmHMxr5hP"}]' \
    > test.out 2>&1
eval_tap $? 79 'BulkResetUserStatItem3' test.out

#- 80 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CJJztJBg0tTJg46I' \
    --userId 'ewOXE2AkCh3QIZsU' \
    > test.out 2>&1
eval_tap $? 80 'PublicCreateUserStatItem' test.out

#- 81 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f8lGFXcmwTERHclO' \
    --userId 'dxIwqejxe18rNdb8' \
    > test.out 2>&1
eval_tap $? 81 'DeleteUserStatItems1' test.out

#- 82 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Otq6j1mqUav7k05H' \
    --userId 'AQltnSojV4jT65yc' \
    --body '{"inc": 0.18745043807665662}' \
    > test.out 2>&1
eval_tap $? 82 'PublicIncUserStatItem' test.out

#- 83 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X2FtAz0vJjFIYWOa' \
    --userId 'NdsimmkW2miH3xRH' \
    --body '{"inc": 0.43348375195078226}' \
    > test.out 2>&1
eval_tap $? 83 'PublicIncUserStatItemValue' test.out

#- 84 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ky4QxZkaXZ7vmiEd' \
    --userId '0JPxVyQpshaDwNqT' \
    > test.out 2>&1
eval_tap $? 84 'ResetUserStatItemValue1' test.out

#- 85 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"bbFMXAMfVXe0GZeM": {}, "gsRsmH1EQrYmkPKT": {}, "POlhTtSiZNCxuogF": {}}, "additionalKey": "teTHJe4BhSSQkQD6", "statCode": "WmOt6D7ufFVTOhvQ", "updateStrategy": "MIN", "userId": "xEQdf3ewoGGoY7xm", "value": 0.5145991474575027}, {"additionalData": {"NAmjDDCvs78mcMdi": {}, "S76YApGJ9ufwLYkq": {}, "IgLuZS6hsQryiEtO": {}}, "additionalKey": "AbpeUNf26UqkCfgC", "statCode": "UYBn2xaOBdPF0JmX", "updateStrategy": "MIN", "userId": "2b4gd3xOeii8Jnms", "value": 0.30258764098345503}, {"additionalData": {"ep2xD2NY0kABeGs9": {}, "yxahld1pO0Gyf5PO": {}, "3COyMvczgEpzZ3Fb": {}}, "additionalKey": "txfhcRC7IVYa6iZ5", "statCode": "uFRYNn3SHiWxF0Yb", "updateStrategy": "MIN", "userId": "T1Nxw0v1dMQ9Rrbk", "value": 0.9362374100399995}]' \
    > test.out 2>&1
eval_tap $? 85 'BulkUpdateUserStatItemV2' test.out

#- 86 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'C2cVWf6ttvbU1PO6' \
    --statCode 'ApCD2VXidT7w0Oc1' \
    --userIds '5N8WXBPp17PAewqS,m5x3B4t7WQnp8jXZ,edgt5cyNe27HLtwt' \
    > test.out 2>&1
eval_tap $? 86 'BulkFetchOrDefaultStatItems1' test.out

#- 87 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'VOaxgP6Jbct8puMy' \
    --additionalKey 'bYGxD9IPmmsLmu3k' \
    --statCodes 'aPj0O4zd8Tb7cUNG,PTBxiFFCrn7djjs6,9FTFVGUVhvKhJCme' \
    --tags 'isql14mUHVbMPimN,hcZsU3VAdMDcb4ql,kiFAamqvZI2KwjqP' \
    > test.out 2>&1
eval_tap $? 87 'AdminListUsersStatItems' test.out

#- 88 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'BiWXade41s3rH34m' \
    --additionalKey 'B2yPlRpWjmHZAAvK' \
    --body '[{"additionalData": {"TH8MuqIg0Czkguwu": {}, "JCW7EEFB67AODbi9": {}, "BzupBsFpYc77GtRU": {}}, "statCode": "cCFeY5g4XgBsbfzq", "updateStrategy": "OVERRIDE", "value": 0.2399766478028662}, {"additionalData": {"QehMDli6t9unQLYX": {}, "xm09wpGAbpEmDY9v": {}, "Lh3u6EDsUmrV6kH4": {}}, "statCode": "OotKwG3UC6XCnnZx", "updateStrategy": "INCREMENT", "value": 0.9821915633189054}, {"additionalData": {"CmQr17W65br34rBB": {}, "N9tU6TDm5GloFSKW": {}, "M1eym5ydC6p25xCW": {}}, "statCode": "TqUOYZENJ1QHZQxP", "updateStrategy": "OVERRIDE", "value": 0.951740170473551}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItem' test.out

#- 89 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'uxBJEECQE1li3Bg7' \
    --additionalKey 'Jxc9pUnZmvhidwCk' \
    --body '[{"additionalData": {"ZwqjYLfTiCO1NDBv": {}, "QvRPnAz4VzW0CpoB": {}, "CbyJsF5IjF1c0W33": {}}, "statCode": "8HS6CBgVRyihYNZ8"}, {"additionalData": {"4CVhziXV8HwSmvcv": {}, "cDKF19yVRafCjOuS": {}, "Yht83AdvBaagTiRJ": {}}, "statCode": "8daGTVX3Bb7jlz5I"}, {"additionalData": {"fHgKjI9mwJSrN8jk": {}, "IykR2zbaI6PD7fEs": {}, "cShnGUGUtV9GJ279": {}}, "statCode": "GDbLNwjm3FK0nnX2"}]' \
    > test.out 2>&1
eval_tap $? 89 'BulkResetUserStatItemValues' test.out

#- 90 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'poMfZ1hDHtbh4HtM' \
    --userId 'lFgvh2Dp2SoiIPp1' \
    --additionalKey 'yvfAHS0VgLu11A3H' \
    > test.out 2>&1
eval_tap $? 90 'DeleteUserStatItems2' test.out

#- 91 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TovFi4tPAGfleyCA' \
    --userId '6jEtcqsnzoVILjkw' \
    --additionalKey 'W61duF87aUyrdt4X' \
    --body '{"additionalData": {"SpWBAetsanzqP8ox": {}, "frtbECD1CYPwaiBA": {}, "xfYL8Avt70ZUT2fS": {}}, "updateStrategy": "MAX", "value": 0.3649868733300631}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserStatItemValue' test.out

#- 92 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"C3IN6tvKgLB9QmJI": {}, "Oq9dP5szG71utjsQ": {}, "4CrRb9gUCeVz7fWb": {}}, "additionalKey": "ZIdhevfZvyV7Acod", "statCode": "cZwKjYDdmJOlzwm9", "updateStrategy": "OVERRIDE", "userId": "u4FnS98QqftSjq7s", "value": 0.21619428950368613}, {"additionalData": {"8yreciPLfkVyyJsb": {}, "GpO6JgehDJxEN7Jl": {}, "Zc8LMq1o2jZWu4yA": {}}, "additionalKey": "3r0u4q1bTHXIjfJK", "statCode": "yFlM0u1uuoVdn9yV", "updateStrategy": "MAX", "userId": "OJf5KwMZQjzvjSoz", "value": 0.35070664829549025}, {"additionalData": {"6CTRDl0zp9CzHFwi": {}, "nkBNi4gvqgl6TZ9T": {}, "GVPmv34h6T7Esufm": {}}, "additionalKey": "fxKYB4LM6H6QXmpZ", "statCode": "9X3fUSR1l9xLPBsm", "updateStrategy": "OVERRIDE", "userId": "lUnqxT1WsRNMZcA9", "value": 0.8733292267974704}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkUpdateUserStatItem1' test.out

#- 93 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hzC7MNa8vVe4MHX6' \
    --additionalKey 'AgMep90AyyUJyAK5' \
    --statCodes 'PRMRMwdvl0hv6g62,GxBW2tQF5tkTjgJa,MYvNQOsDa4bkcgep' \
    --tags 'qtxjbrztee7QLTGA,ak7Kaol01DK97D2x,nik42miteR5eQAe1' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryUserStatItems2' test.out

#- 94 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rzmmgqBPRmd6mO4o' \
    --additionalKey 'I8KDqebm83raNBJ5' \
    --body '[{"additionalData": {"y7axEkvI4oxZEDxG": {}, "iBnNbn0zaf7CaOSl": {}, "HXrUSA6sMJzA5mtq": {}}, "statCode": "ISQ83TTbtefXWznD", "updateStrategy": "INCREMENT", "value": 0.8683175214699097}, {"additionalData": {"Ge9PdbTTAJ2Gp1r0": {}, "sVZ6LJAOddIL2l3h": {}, "PjNDKv2LWfXqjr8f": {}}, "statCode": "S79En3wYowBdkaZ3", "updateStrategy": "OVERRIDE", "value": 0.6652129436925215}, {"additionalData": {"L9e4P01vxP8xj1Ly": {}, "EirURERnEMzpImW6": {}, "sjAHyCK5tNanGBrk": {}}, "statCode": "zUvck3xTtmOFMebS", "updateStrategy": "OVERRIDE", "value": 0.8773292009244622}]' \
    > test.out 2>&1
eval_tap $? 94 'BulkUpdateUserStatItem2' test.out

#- 95 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lzxl0yF5m77TTh4g' \
    --userId 'Uoj8u2WRcLiEtzVl' \
    --additionalKey 'nkflfn7pHY48F1dl' \
    --body '{"additionalData": {"1q92m3iRlfnBAk0C": {}, "wiAsR65yQ9ssuHdG": {}, "mxncCEr0KcgeqzGb": {}}, "updateStrategy": "MIN", "value": 0.6408216754775174}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE