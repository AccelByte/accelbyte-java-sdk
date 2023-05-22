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
echo "1..91"

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
    --body '{"cycleIds": ["NJma1MbqqZtfNWql", "ZGF7uYnGzpipNDig", "4nmwAft4gqkNNlWk"]}' \
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
    --limit '15' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 41 'GetStats' test.out

#- 42 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["VHfPEspxwhRON0bc", "XJbZDKKoxLE1Y3Dy", "1eMbEIjowLqc3ecj"], "defaultValue": 0.2078213154618923, "description": "tj3giPg4x4yiPX6u", "incrementOnly": false, "maximum": 0.5391472973346789, "minimum": 0.8509539653026361, "name": "tYighU0VUfcYHJbB", "setAsGlobal": false, "setBy": "SERVER", "statCode": "cM4NTwr0KHaAsmTe", "tags": ["0RVwXgAgntLMCuaX", "lCSVq8PdH6hJPUAc", "j52WKi6tArAURt9p"]}' \
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
    --limit '56' \
    --offset '98' \
    --keyword 'WQi6BqPg4xr0lCan' \
    > test.out 2>&1
eval_tap $? 45 'QueryStats' test.out

#- 46 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cUZGCHsZYoLfR1Kt' \
    > test.out 2>&1
eval_tap $? 46 'GetStat' test.out

#- 47 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ov7Zy0b65uvuKNuy' \
    > test.out 2>&1
eval_tap $? 47 'DeleteStat' test.out

#- 48 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '0ytZQ7M6Nzy1adnS' \
    --body '{"cycleIds": ["uG6XqP6oo7G73zdx", "pDMUAeeZ97SBROPY", "KOLFKx1dX4LuWJu3"], "defaultValue": 0.726350473124282, "description": "gOfnwIdlNa29fDLh", "name": "741IslKHzGlLKWUt", "tags": ["2XJVrlzqQls1ozhL", "CiiPDGQhNPEwiJCf", "DQs61OQAoxyyQpRW"]}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateStat' test.out

#- 49 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VA3kE8jKvgatOEBM' \
    > test.out 2>&1
eval_tap $? 49 'DeleteTiedStat' test.out

#- 50 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId '70TdlNBJYOmpu1VC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'arzBsV6xnZ5Jrzzj' \
    --limit '35' \
    --offset '16' \
    --sortBy 'caug6CWVG8SWP3gl' \
    --statCodes 'U6muswVJnNnN7kAa' \
    > test.out 2>&1
eval_tap $? 50 'GetUserStatCycleItems' test.out

#- 51 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '7j0riFc5HTHQIoVs' \
    --limit '67' \
    --offset '29' \
    --sortBy 'tRbRcrEveMdAdiPK' \
    --statCodes 'DUVSC00PYeDcaggi' \
    --tags 'nxnFIna3yddcbsPh' \
    > test.out 2>&1
eval_tap $? 51 'GetUserStatItems' test.out

#- 52 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'eTH26IUJNvYuGRUv' \
    --body '[{"statCode": "pZaHCuESOiIZsMfB"}, {"statCode": "4ZH3mtgWgU4pCAKx"}, {"statCode": "eE70CaunQNxot371"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkCreateUserStatItems' test.out

#- 53 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'W9G4AvQkqsGnmyo5' \
    --body '[{"inc": 0.5735788019304249, "statCode": "JTUVmb8GEXFTlEME"}, {"inc": 0.3015110072624618, "statCode": "FzYqwgK1Np5nodqp"}, {"inc": 0.6059084554956198, "statCode": "m7FhJBNXzAFdO0Kh"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkIncUserStatItem1' test.out

#- 54 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qf6kiTdSGv2LFjAK' \
    --body '[{"inc": 0.8133888984926247, "statCode": "7CbgsWqFWZX7kPBo"}, {"inc": 0.1981056794989916, "statCode": "8F9GLLTG8phc3n4i"}, {"inc": 0.6018534527641566, "statCode": "oIllKlpO2pqiXJF3"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkIncUserStatItemValue1' test.out

#- 55 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WGRaoQomSJC4DdrK' \
    --body '[{"statCode": "F7SUQPLG59e0k5Zt"}, {"statCode": "X6wK7PpUlcIW32iK"}, {"statCode": "7MGt1ixY5rA1WoVe"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkResetUserStatItem1' test.out

#- 56 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JIePF8ZrQzP4zvtd' \
    --userId 'xdbZUpd6FJtHJ1py' \
    > test.out 2>&1
eval_tap $? 56 'CreateUserStatItem' test.out

#- 57 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VwyKQLY6FEO65Rb3' \
    --userId 'z7CYLM8IlsHqffnr' \
    > test.out 2>&1
eval_tap $? 57 'DeleteUserStatItems' test.out

#- 58 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fsGlfPaZKBwa3Ddb' \
    --userId '60ufPpzwj1QGIFml' \
    --body '{"inc": 0.773810834907092}' \
    > test.out 2>&1
eval_tap $? 58 'IncUserStatItemValue' test.out

#- 59 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f4jvapseE9LN9bvh' \
    --userId 'OrHflIOd6X3viLvt' \
    --additionalKey 'Ek4mTIpUA9gxo8SV' \
    --body '{"additionalData": {"38nEhoXmM2W7l6jH": {}, "MA2rG3nakopAywel": {}, "u01nryEJ0NqoTow0": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'ResetUserStatItemValue' test.out

#- 60 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '34' \
    --offset '17' \
    --statCodes 'Sfo95HgXqKhTPkwf' \
    > test.out 2>&1
eval_tap $? 60 'GetGlobalStatItems1' test.out

#- 61 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LM9uSybRzWek2gZv' \
    > test.out 2>&1
eval_tap $? 61 'GetGlobalStatItemByStatCode1' test.out

#- 62 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '43' \
    --name 'zt6bSc6bWvgpVyW9' \
    --offset '7' \
    --sortBy 'rcBE2ItBS3KtKZWe' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 62 'GetStatCycles1' test.out

#- 63 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["UWYhWV1qx8CzPML5", "2faXUr9Sk4lq2faB", "aoFzAyBME74HUtip"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetStatCycle1' test.out

#- 64 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'cAXXKlhvyH8paOJt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetStatCycle1' test.out

#- 65 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xqMPpcVfRwNj547f' \
    --userIds 'H0XrKEDpEY8VnocG' \
    > test.out 2>&1
eval_tap $? 65 'BulkFetchStatItems1' test.out

#- 66 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.42948707340141545, "statCode": "jci0V3tBf2jnHGKX", "userId": "phn50c9tNLDljhZ2"}, {"inc": 0.15834228146049167, "statCode": "xLRX3z46OCaGBeMf", "userId": "PlNos4yBRjrERHEo"}, {"inc": 0.21535397707303128, "statCode": "AZR8GmEu0q1p6QCy", "userId": "Y6vSkVFWdsbYuVEG"}]' \
    > test.out 2>&1
eval_tap $? 66 'PublicBulkIncUserStatItem' test.out

#- 67 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7663132401828872, "statCode": "xYheR3j5mNZ6vwv7", "userId": "K8Asvt1j1Rx59hes"}, {"inc": 0.6333677393076275, "statCode": "Wy2NvZ85DDKDAF8K", "userId": "DsBZOuYQJ03BAHZ7"}, {"inc": 0.03549404843356141, "statCode": "53q7akMpcmnnx6RV", "userId": "Brop9v7aZK3h65hb"}]' \
    > test.out 2>&1
eval_tap $? 67 'PublicBulkIncUserStatItemValue' test.out

#- 68 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "N15zfQSfQrtfF3TQ", "userId": "N0OcNDLr36vzohZy"}, {"statCode": "jMQAg5mPYhrLTyU8", "userId": "OhgfY9JQYGF4bYXE"}, {"statCode": "cENx9xZlAchob44l", "userId": "ONDDwMvgI0HlyPR7"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItem2' test.out

#- 69 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["bzIVy8alncV7vWgS", "Hdfo07UctPErqxyM", "wZNiVsF6xG2mXEQd"], "defaultValue": 0.394253409372755, "description": "OK06MqQBErxgjVBy", "incrementOnly": false, "maximum": 0.341978492901322, "minimum": 0.82670863533661, "name": "DDhoO05oKqymxLD1", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "Xvea7H1m2lJFRZ3Z", "tags": ["18MH57l2Zsrh90ET", "SenE5hCFkIf5weqZ", "prZ60zMjhTHeh94T"]}' \
    > test.out 2>&1
eval_tap $? 69 'CreateStat1' test.out

#- 70 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'tYmGukz3MnlrjcHp' \
    --namespace "$AB_NAMESPACE" \
    --userId '6B8Vj7rXFgDnDkdZ' \
    --limit '3' \
    --offset '62' \
    --sortBy 'pjb1tdA3QhjCMW64' \
    --statCodes 'f4XhIjSoTB2NMKte' \
    > test.out 2>&1
eval_tap $? 70 'GetUserStatCycleItems1' test.out

#- 71 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'zapPr2QEPx3zTxBG' \
    --limit '39' \
    --offset '43' \
    --sortBy 'EJIYppuUSsKoHw2h' \
    --statCodes 'yd12uSE7BEv3aevq' \
    --tags '6iohU1cg4W1IS3Uv' \
    > test.out 2>&1
eval_tap $? 71 'PublicQueryUserStatItems' test.out

#- 72 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '1BpWoJBaqdg2FHcu' \
    --body '[{"statCode": "nsS1lnaO2m9vqjhb"}, {"statCode": "eK2qN8g6x2PyYDo5"}, {"statCode": "R3hLiD5sf5y1JsxJ"}]' \
    > test.out 2>&1
eval_tap $? 72 'PublicBulkCreateUserStatItems' test.out

#- 73 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NGmyt0SQDUDoWBZV' \
    --statCodes 'GLlkUetzCAWc9x1a,MjgGim51T107XIZR,Z7tZdIs0xf4czdt7' \
    --tags 'zqmSKxOEQlVcx6Gq,sBq8vdhWVnuYLgpZ,ehK0G2nmyuViB9kR' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems1' test.out

#- 74 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TcSQdTnNYGeAfYFG' \
    --body '[{"inc": 0.897150525333361, "statCode": "wSkHKufBdS3ZOokZ"}, {"inc": 0.4401270545052519, "statCode": "4cXnAXyuGz6LlxHv"}, {"inc": 0.9781256203193315, "statCode": "SwyagYvDJ3w3UNgI"}]' \
    > test.out 2>&1
eval_tap $? 74 'PublicBulkIncUserStatItem1' test.out

#- 75 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gj2jZtEYT8sIPSE1' \
    --body '[{"inc": 0.7951174434625005, "statCode": "XPzySa0sZoFS6xCO"}, {"inc": 0.7898462546516353, "statCode": "Mpyh9pMsQgb64ELb"}, {"inc": 0.40754957340690945, "statCode": "DMwyo4nIRysQdbuf"}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkIncUserStatItemValue2' test.out

#- 76 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XjYnSoIFeouC2m38' \
    --body '[{"statCode": "kXrDZWlGVE9sJ4Np"}, {"statCode": "UtKp6M9I6nEwnZhs"}, {"statCode": "jwJeGwaPSDMZz95O"}]' \
    > test.out 2>&1
eval_tap $? 76 'BulkResetUserStatItem3' test.out

#- 77 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YKiqaZD63xe5rruJ' \
    --userId 'VfLGea0ZtlzUcuHA' \
    > test.out 2>&1
eval_tap $? 77 'PublicCreateUserStatItem' test.out

#- 78 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Xz0UV31MfuGaXsAu' \
    --userId 'GsZaSHevO0TQNEI3' \
    > test.out 2>&1
eval_tap $? 78 'DeleteUserStatItems1' test.out

#- 79 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kfabxJWWSI1ECUo1' \
    --userId 'NPpeFhUztXDgB7n4' \
    --body '{"inc": 0.4648394406405496}' \
    > test.out 2>&1
eval_tap $? 79 'PublicIncUserStatItem' test.out

#- 80 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '97uAPP8PATLpUpxe' \
    --userId 'JlsBJT6Hh3OMjAjq' \
    --body '{"inc": 0.8810432189532968}' \
    > test.out 2>&1
eval_tap $? 80 'PublicIncUserStatItemValue' test.out

#- 81 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mK8lbSEEelxnb5Qx' \
    --userId 'WG2HFnZlA6HKWW4f' \
    > test.out 2>&1
eval_tap $? 81 'ResetUserStatItemValue1' test.out

#- 82 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"I1IQcoBQELcNlZkq": {}, "TZrKgXNwvm4e5GX6": {}, "H742OixhtAoKiVm6": {}}, "additionalKey": "URT95XhnUcvWB28M", "statCode": "pusuhhDJ5slzgiWZ", "updateStrategy": "OVERRIDE", "userId": "f005CXNGehQ2aTjT", "value": 0.4837063558649929}, {"additionalData": {"fKFDXC7eGL5YhJDW": {}, "h9YWqc0qgV6d9yOf": {}, "IMLds2DbPcaoMdtR": {}}, "additionalKey": "LTmSvTkQQgB7exYv", "statCode": "mHMxr5hPCJJztJBg", "updateStrategy": "MAX", "userId": "tTJg46IewOXE2AkC", "value": 0.12873420196197172}, {"additionalData": {"3QIZsUf8lGFXcmwT": {}, "ERHclOdxIwqejxe1": {}, "8rNdb8Otq6j1mqUa": {}}, "additionalKey": "v7k05HAQltnSojV4", "statCode": "jT65yclX2FtAz0vJ", "updateStrategy": "MAX", "userId": "vPbpg7yrRvXfZ6rv", "value": 0.09943930158831127}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkUpdateUserStatItemV2' test.out

#- 83 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'vEY3Hht1SwqTsKKK' \
    --statCode 'o37NHDOQe91Ps3zt' \
    --userIds 'UIV0dS6hIH9c4Vfk,yrwpuXxbaERbfgPm,i0eHkt1mr9EOIFg0' \
    > test.out 2>&1
eval_tap $? 83 'BulkFetchOrDefaultStatItems1' test.out

#- 84 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'dnWIYN2NVL70Iw15' \
    --additionalKey '7g00jr9b8MuYmmeK' \
    --body '[{"additionalData": {"TmBNvGYxEQdf3ewo": {}, "GGoY7xmFNAmjDDCv": {}, "s78mcMdiS76YApGJ": {}}, "statCode": "9ufwLYkqIgLuZS6h", "updateStrategy": "MIN", "value": 0.20155361064053268}, {"additionalData": {"rIz4NhGztZpr4U4f": {}, "wQIiLXgmRasvjO4l": {}, "j8m3XEwP2b4gd3xO": {}}, "statCode": "eii8Jnmssep2xD2N", "updateStrategy": "MAX", "value": 0.8470751977149197}, {"additionalData": {"kABeGs9yxahld1pO": {}, "0Gyf5PO3COyMvczg": {}, "EpzZ3FbtxfhcRC7I": {}}, "statCode": "VYa6iZ5uFRYNn3SH", "updateStrategy": "MAX", "value": 0.2845058126489304}]' \
    > test.out 2>&1
eval_tap $? 84 'BulkUpdateUserStatItem' test.out

#- 85 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'mzVr5XT1Nxw0v1dM' \
    --additionalKey 'Q9Rrbk6C2cVWf6tt' \
    --body '[{"additionalData": {"vbU1PO6ApCD2VXid": {}, "T7w0Oc15N8WXBPp1": {}, "7PAewqSm5x3B4t7W": {}}, "statCode": "Qnp8jXZedgt5cyNe"}, {"additionalData": {"27HLtwtVOaxgP6Jb": {}, "ct8puMybYGxD9IPm": {}, "msLmu3kaPj0O4zd8": {}}, "statCode": "Tb7cUNGPTBxiFFCr"}, {"additionalData": {"n7djjs69FTFVGUVh": {}, "vKhJCmeisql14mUH": {}, "VbMPimNhcZsU3VAd": {}}, "statCode": "MDcb4qlkiFAamqvZ"}]' \
    > test.out 2>&1
eval_tap $? 85 'BulkResetUserStatItemValues' test.out

#- 86 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'I2KwjqPBiWXade41' \
    --userId 's3rH34mB2yPlRpWj' \
    --additionalKey 'mHZAAvKTH8MuqIg0' \
    > test.out 2>&1
eval_tap $? 86 'DeleteUserStatItems2' test.out

#- 87 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CzkguwuJCW7EEFB6' \
    --userId '7AODbi9BzupBsFpY' \
    --additionalKey 'c77GtRUcCFeY5g4X' \
    --body '{"additionalData": {"gBsbfzqxBPNe8ae1": {}, "Il4aAtEbu4IjGdqt": {}, "hRxTjQ7gkZEY8rG0": {}}, "updateStrategy": "MIN", "value": 0.7564266461803699}' \
    > test.out 2>&1
eval_tap $? 87 'UpdateUserStatItemValue' test.out

#- 88 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"mrV6kH4OotKwG3UC": {}, "6XCnnZxF8CmQr17W": {}, "65br34rBBN9tU6TD": {}}, "additionalKey": "m5GloFSKWM1eym5y", "statCode": "dC6p25xCWTqUOYZE", "updateStrategy": "MIN", "userId": "J1QHZQxPRXH7uxBJ", "value": 0.4992520864522154}, {"additionalData": {"ECQE1li3Bg7Jxc9p": {}, "UnZmvhidwCkZwqjY": {}, "LfTiCO1NDBvQvRPn": {}}, "additionalKey": "Az4VzW0CpoBCbyJs", "statCode": "F5IjF1c0W338HS6C", "updateStrategy": "OVERRIDE", "userId": "mtrHJbEGTUj7YjER", "value": 0.6058132484057267}, {"additionalData": {"1rEQG02zccA8wvLs": {}, "WUNd6lPKvqDejvqk": {}, "lTSvDwuOrP9lzpiX": {}}, "additionalKey": "0VuFpZum7izxe7NP", "statCode": "zjOa8E7wY76PxLv9", "updateStrategy": "INCREMENT", "userId": "BEUe89AwEw1HO4Fn", "value": 0.5915133752850122}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItem1' test.out

#- 89 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tx4XLKAmlDr19uJ3' \
    --additionalKey 'nq6VerzVCcI8y3Cz' \
    --statCodes '0YqCKUh5RD9vNAp4,jinFpnQ5xF9wwbvM,ZyeDeRnVfPUa6xVV' \
    --tags 'Bcq3wZpFIYeAg79H,cLJXJ7mpVI6eTYAj,dPlCiQQC35cj4KyO' \
    > test.out 2>&1
eval_tap $? 89 'PublicQueryUserStatItems2' test.out

#- 90 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VgvnWbfRJtsB7cUQ' \
    --additionalKey 'Z2QUAxJrINPXppPN' \
    --body '[{"additionalData": {"O3AfmXcgwC3IN6tv": {}, "KgLB9QmJIOq9dP5s": {}, "zG71utjsQ4CrRb9g": {}}, "statCode": "UCeVz7fWbZIdhevf", "updateStrategy": "MIN", "value": 0.3504203415088929}, {"additionalData": {"yV7AcodcZwKjYDdm": {}, "JOlzwm9Su4FnS98Q": {}, "qftSjq7sn8yreciP": {}}, "statCode": "LfkVyyJsbGpO6Jge", "updateStrategy": "INCREMENT", "value": 0.9155833086542791}, {"additionalData": {"nGmWGgTJfHlJl4tH": {}, "Ga4XfZcd9CVnGqMX": {}, "9FieeEssWEUl07bh": {}}, "statCode": "wntCVqiYOJf5KwMZ", "updateStrategy": "MAX", "value": 0.6075874448423523}]' \
    > test.out 2>&1
eval_tap $? 90 'BulkUpdateUserStatItem2' test.out

#- 91 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '4X3LLaGPGdqLE8So' \
    --userId 'hhhuiTnJarYYkHBD' \
    --additionalKey 'dSzBXdxapwhd5IQY' \
    --body '{"additionalData": {"BQuxLvPuWYvE3fsN": {}, "y9Z9OhxXvCp9y7fL": {}, "D2qfCXnlUnqxT1Ws": {}}, "updateStrategy": "MAX", "value": 0.8325095179911841}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE