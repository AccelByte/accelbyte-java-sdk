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
echo "1..89"

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

#- 30 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'ZGF7uYnGzpipNDig' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'GetStatCycle' test.out

#- 31 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'NJma1MbqqZtfNWql' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "DAILY", "description": "nmwAft4gqkNNlWkD", "end": "1999-01-31T00:00:00Z", "name": "cym8xIfkOVW2grRE", "resetDate": 83, "resetDay": 48, "resetMonth": 77, "resetTime": "hvNXTwGBCtohLtl9", "seasonPeriod": 95, "start": "1981-08-13T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 31 'UpdateStatCycle' test.out

#- 32 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'hytm5UDrT6QXCs5S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'DeleteStatCycle' test.out

#- 33 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'PBbRPZTF6oQAXVG7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["tnsZg5QgXjvyGJPN", "4eXbJE5Vs2GcyomQ", "oIXimBJehyxlNsjU"]}' \
    > test.out 2>&1
eval_tap $? 33 'BulkAddStats' test.out

#- 34 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'gxBkF6wFPoJeQedi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'StopStatCycle' test.out

#- 35 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ogEhhM2rIizGdKvO' \
    --userIds 'Pdq5xrgxSmy1DN9L' \
    > test.out 2>&1
eval_tap $? 35 'BulkFetchStatItems' test.out

#- 36 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.508249472584033, "statCode": "kYW5DQyj4bj5Ro2o", "userId": "gaKt2ujQSa3Zdb65"}, {"inc": 0.7506315120843542, "statCode": "Xmy0Zp6iIaTIKUkm", "userId": "kk9QM0NBMA9ORxpz"}, {"inc": 0.3586384035441087, "statCode": "LR2AK6eXUGPJsw1f", "userId": "iP80G9Pclxcft2ul"}]' \
    > test.out 2>&1
eval_tap $? 36 'BulkIncUserStatItem' test.out

#- 37 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5593678224822503, "statCode": "JzPyrVEiOG4Ucqsu", "userId": "GKHhMRWLVd3DlhLu"}, {"inc": 0.5549671577157492, "statCode": "pomM8sm1MiaI1mX2", "userId": "tJoARtdbBe7udsMr"}, {"inc": 0.23484680488567855, "statCode": "k0WvGYYnx4V709xb", "userId": "nGezKsDwG2omOR2n"}]' \
    > test.out 2>&1
eval_tap $? 37 'BulkIncUserStatItemValue' test.out

#- 38 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vYI9TVqJdvzcWbfU' \
    --userIds 'paXp5JMl5LL4bTxB,mZjdrrIxsB0NRsB1,fPqqRRulpqpymDkQ' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchOrDefaultStatItems' test.out

#- 39 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "htrHWwRVnwVBOqOH", "userId": "i8pWGd1juYhiqjRJ"}, {"statCode": "OqB5F93zFQbJndUD", "userId": "pdONneAczbBdHb2s"}, {"statCode": "lt71B1SmZp2JZp50", "userId": "CnPb71ORYcmQbTU5"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkResetUserStatItem' test.out

#- 40 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'JX8ccLjMXJRk0eaK' \
    --isGlobal  \
    --limit '88' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 40 'GetStats' test.out

#- 41 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["DOJvrTefglSs6g4i", "Y9u02aCNYIWekp18", "lOC3mNqF7Bl0Lcgh"], "defaultValue": 0.7698618065817802, "description": "HfPEspxwhRON0bc1", "incrementOnly": false, "maximum": 0.13973094245656004, "minimum": 0.8879377098372795, "name": "v3MFFJ1KesKoELCp", "setAsGlobal": false, "setBy": "SERVER", "statCode": "bBEG8X645xpdXpai", "tags": ["YighU0VUfcYHJbBf", "0rYaT5hOPjaf3H0t", "AKSiPW3VgsZXiR1D"]}' \
    > test.out 2>&1
eval_tap $? 41 'CreateStat' test.out

#- 42 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'ExportStats' test.out

#- 43 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 43 'ImportStats' test.out

#- 44 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --limit '72' \
    --offset '19' \
    --keyword '7HVWqMkNSawQUWDF' \
    > test.out 2>&1
eval_tap $? 44 'QueryStats' test.out

#- 45 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JvJBWic7UkBeIXuq' \
    > test.out 2>&1
eval_tap $? 45 'GetStat' test.out

#- 46 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DuAXI66bQ71w0deo' \
    > test.out 2>&1
eval_tap $? 46 'DeleteStat' test.out

#- 47 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'V9Lx5RDA1l2Xcrci' \
    --body '{"cycleIds": ["YNEzvSZIPkhSgORc", "z5S5BvmgBLxh4ijF", "nE3Tam69qSZ7PC6f"], "defaultValue": 0.9400821818564666, "description": "QkmZXElW9YfRSse6", "name": "AAz3S4czz0QKFlAV", "tags": ["mVLu4AOec0z8eBee", "tafxMSJlHeb34sZK", "oip68J1nsv4W2OJh"]}' \
    > test.out 2>&1
eval_tap $? 47 'UpdateStat' test.out

#- 48 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Hcl5LLLOexL4fZvW' \
    > test.out 2>&1
eval_tap $? 48 'DeleteTiedStat' test.out

#- 49 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'tND2tcBFpX8lNtFE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'J7tnkY6Mca5afj12' \
    --limit '76' \
    --offset '97' \
    --sortBy '2IzrBvvWm4udE0OX' \
    --statCodes 'udXgNne8kJATwlc6' \
    > test.out 2>&1
eval_tap $? 49 'GetUserStatCycleItems' test.out

#- 50 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'esUp6Sw1I98jeZQ7' \
    --limit '16' \
    --offset '5' \
    --sortBy 'fxnhLd3Knaknoed9' \
    --statCodes 'DHhLOqQGhCUr6iTr' \
    --tags 'jyEgarAdNJOIG36I' \
    > test.out 2>&1
eval_tap $? 50 'GetUserStatItems' test.out

#- 51 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6tRbRcrEveMdAdiP' \
    --body '[{"statCode": "KDUVSC00PYeDcagg"}, {"statCode": "inxnFIna3yddcbsP"}, {"statCode": "heTH26IUJNvYuGRU"}]' \
    > test.out 2>&1
eval_tap $? 51 'BulkCreateUserStatItems' test.out

#- 52 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vpZaHCuESOiIZsMf' \
    --body '[{"inc": 0.44983794593522985, "statCode": "4ZH3mtgWgU4pCAKx"}, {"inc": 0.07274002267489621, "statCode": "E70CaunQNxot371W"}, {"inc": 0.9983907424421475, "statCode": "G4AvQkqsGnmyo5JJ"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkIncUserStatItem1' test.out

#- 53 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TUVmb8GEXFTlEMEs' \
    --body '[{"inc": 0.5039376588469008, "statCode": "zYqwgK1Np5nodqpL"}, {"inc": 0.2085957640265077, "statCode": "7FhJBNXzAFdO0Khq"}, {"inc": 0.0923137834037363, "statCode": "6kiTdSGv2LFjAKY7"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkIncUserStatItemValue1' test.out

#- 54 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CbgsWqFWZX7kPBom' \
    --body '[{"statCode": "8F9GLLTG8phc3n4i"}, {"statCode": "LoIllKlpO2pqiXJF"}, {"statCode": "3WGRaoQomSJC4Ddr"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkResetUserStatItem1' test.out

#- 55 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KF7SUQPLG59e0k5Z' \
    --userId 'tX6wK7PpUlcIW32i' \
    > test.out 2>&1
eval_tap $? 55 'CreateUserStatItem' test.out

#- 56 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'K7MGt1ixY5rA1WoV' \
    --userId 'eJIePF8ZrQzP4zvt' \
    > test.out 2>&1
eval_tap $? 56 'DeleteUserStatItems' test.out

#- 57 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dxdbZUpd6FJtHJ1p' \
    --userId 'yVwyKQLY6FEO65Rb' \
    --body '{"inc": 0.8967075057500808}' \
    > test.out 2>&1
eval_tap $? 57 'IncUserStatItemValue' test.out

#- 58 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'z7CYLM8IlsHqffnr' \
    --userId 'fsGlfPaZKBwa3Ddb' \
    --additionalKey '60ufPpzwj1QGIFml' \
    --body '{"additionalData": {"Vf4jvapseE9LN9bv": {}, "hOrHflIOd6X3viLv": {}, "tEk4mTIpUA9gxo8S": {}}}' \
    > test.out 2>&1
eval_tap $? 58 'ResetUserStatItemValue' test.out

#- 59 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '53' \
    --statCodes '38nEhoXmM2W7l6jH' \
    > test.out 2>&1
eval_tap $? 59 'GetGlobalStatItems1' test.out

#- 60 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MA2rG3nakopAywel' \
    > test.out 2>&1
eval_tap $? 60 'GetGlobalStatItemByStatCode1' test.out

#- 61 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '89' \
    --name '01nryEJ0NqoTow0q' \
    --offset '17' \
    --sortBy 'Sfo95HgXqKhTPkwf' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 61 'GetStatCycles1' test.out

#- 62 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'Osp0LZ5njN86Hl8k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'GetStatCycle1' test.out

#- 63 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UXzt6bSc6bWvgpVy' \
    --userIds 'W9dD1kOmvrAejcq2' \
    > test.out 2>&1
eval_tap $? 63 'BulkFetchStatItems1' test.out

#- 64 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6098222716678012, "statCode": "gkQuaS7RBx3vim02", "userId": "jBOxrZDyvpcLYOWA"}, {"inc": 0.9812048271444653, "statCode": "NjxOnaEok4nOOCzf", "userId": "sflhjbngJOUn18G5"}, {"inc": 0.6154081323388666, "statCode": "lfDTk8aG40Nlncce", "userId": "IZSwgAIkgzh4pTU0"}]' \
    > test.out 2>&1
eval_tap $? 64 'PublicBulkIncUserStatItem' test.out

#- 65 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.42750289611136216, "statCode": "m4DZhl0bQxFJ3sWC", "userId": "qQpQ2FbKPFMycMSQ"}, {"inc": 0.9130853724356165, "statCode": "qfAacR0LgB5BUXvj", "userId": "cu2s6w3VifnKqmTS"}, {"inc": 0.22664462935443197, "statCode": "GH1XEfY6QAYn6WQ5", "userId": "UBEU1QAOHfZiGhxO"}]' \
    > test.out 2>&1
eval_tap $? 65 'PublicBulkIncUserStatItemValue' test.out

#- 66 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "dcuDXSxSc3aZPV87", "userId": "pna08gxefTYKhuxa"}, {"statCode": "Ec7M4P7UckSC6ePe", "userId": "N8i4GrFES9z7xueH"}, {"statCode": "pATHccee9GXhKcjm", "userId": "SEwdrkEnnqKzFsLf"}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkResetUserStatItem2' test.out

#- 67 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["YalUlfwEQKjU7eHG", "ebSVu0LQ40kepEaC", "4dfiOMZfEhHr39py"], "defaultValue": 0.29173142009953046, "description": "FO3Zvc1BZG99Lyvf", "incrementOnly": true, "maximum": 0.7946413795548418, "minimum": 0.4959306678685843, "name": "cENx9xZlAchob44l", "setAsGlobal": false, "setBy": "SERVER", "statCode": "p7FUjfIGaffoflEI", "tags": ["ByYqeKN0meGelYF5", "FTYnPkmSu4PWam1j", "wWaDhukU4khGG4vZ"]}' \
    > test.out 2>&1
eval_tap $? 67 'CreateStat1' test.out

#- 68 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'xR7SETWjteoc8fgv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZDDhoO05oKqymxLD' \
    --limit '62' \
    --offset '77' \
    --sortBy 'CXvea7H1m2lJFRZ3' \
    --statCodes 'ZprZ60zMjhTHeh94' \
    > test.out 2>&1
eval_tap $? 68 'GetUserStatCycleItems1' test.out

#- 69 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'TSenE5hCFkIf5weq' \
    --limit '83' \
    --offset '80' \
    --sortBy 'MH57l2Zsrh90ETtY' \
    --statCodes 'mGukz3MnlrjcHp6B' \
    --tags '8Vj7rXFgDnDkdZ9b' \
    > test.out 2>&1
eval_tap $? 69 'PublicQueryUserStatItems' test.out

#- 70 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pjb1tdA3QhjCMW64' \
    --body '[{"statCode": "f4XhIjSoTB2NMKte"}, {"statCode": "zapPr2QEPx3zTxBG"}, {"statCode": "tEJIYppuUSsKoHw2"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkCreateUserStatItems' test.out

#- 71 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hyd12uSE7BEv3aev' \
    --statCodes 'q6iohU1cg4W1IS3U,v1BpWoJBaqdg2FHc,unsS1lnaO2m9vqjh' \
    --tags 'beK2qN8g6x2PyYDo,5R3hLiD5sf5y1Jsx,JNGmyt0SQDUDoWBZ' \
    > test.out 2>&1
eval_tap $? 71 'PublicQueryUserStatItems1' test.out

#- 72 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VGLlkUetzCAWc9x1' \
    --body '[{"inc": 0.0024608645965629172, "statCode": "MjgGim51T107XIZR"}, {"inc": 0.8330548168862439, "statCode": "7tZdIs0xf4czdt7z"}, {"inc": 0.2634451778263246, "statCode": "mSKxOEQlVcx6GqsB"}]' \
    > test.out 2>&1
eval_tap $? 72 'PublicBulkIncUserStatItem1' test.out

#- 73 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'q8vdhWVnuYLgpZeh' \
    --body '[{"inc": 0.5814448802169676, "statCode": "0G2nmyuViB9kRTcS"}, {"inc": 0.6788300494411952, "statCode": "dTnNYGeAfYFG3wSk"}, {"inc": 0.5414375689761776, "statCode": "KufBdS3ZOokZB4cX"}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkIncUserStatItemValue2' test.out

#- 74 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nAXyuGz6LlxHv8Sw' \
    --body '[{"statCode": "yagYvDJ3w3UNgIGj"}, {"statCode": "2jZtEYT8sIPSE1XX"}, {"statCode": "PzySa0sZoFS6xCOW"}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkResetUserStatItem3' test.out

#- 75 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Mpyh9pMsQgb64ELb' \
    --userId 'zDMwyo4nIRysQdbu' \
    > test.out 2>&1
eval_tap $? 75 'PublicCreateUserStatItem' test.out

#- 76 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fXjYnSoIFeouC2m3' \
    --userId '8kXrDZWlGVE9sJ4N' \
    > test.out 2>&1
eval_tap $? 76 'DeleteUserStatItems1' test.out

#- 77 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pUtKp6M9I6nEwnZh' \
    --userId 'sjwJeGwaPSDMZz95' \
    --body '{"inc": 0.6514310429190261}' \
    > test.out 2>&1
eval_tap $? 77 'PublicIncUserStatItem' test.out

#- 78 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YKiqaZD63xe5rruJ' \
    --userId 'VfLGea0ZtlzUcuHA' \
    --body '{"inc": 0.8031451064835671}' \
    > test.out 2>&1
eval_tap $? 78 'PublicIncUserStatItemValue' test.out

#- 79 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'z0UV31MfuGaXsAuG' \
    --userId 'sZaSHevO0TQNEI3k' \
    > test.out 2>&1
eval_tap $? 79 'ResetUserStatItemValue1' test.out

#- 80 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"fabxJWWSI1ECUo1N": {}, "PpeFhUztXDgB7n4C": {}, "97uAPP8PATLpUpxe": {}}, "additionalKey": "JlsBJT6Hh3OMjAjq", "statCode": "2mK8lbSEEelxnb5Q", "updateStrategy": "OVERRIDE", "userId": "bswAgt65X4N1LQZm", "value": 0.441043440659901}, {"additionalData": {"61JMdtwCVUrYQue8": {}, "4dwmbwFEnAZaWsQJ": {}, "tRYoagRJK5PX9UcO": {}}, "additionalKey": "vhPyE11TRT2SKseo", "statCode": "e8VLie0LBa36KNzj", "updateStrategy": "INCREMENT", "userId": "tyd56LfxnbY97jjY", "value": 0.10335882823705034}, {"additionalData": {"XchCbkXX26uEdCfQ": {}, "aMAQuTKfC0I2kNjC": {}, "MDtDMrentgn3Dhqc": {}}, "additionalKey": "iwIeShF9RKb9vvxu", "statCode": "JlhXbWhbwPwToC6k", "updateStrategy": "MAX", "userId": "tTJg46IewOXE2AkC", "value": 0.12873420196197172}]' \
    > test.out 2>&1
eval_tap $? 80 'BulkUpdateUserStatItemV2' test.out

#- 81 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '3QIZsUf8lGFXcmwT' \
    --statCode 'ERHclOdxIwqejxe1' \
    --userIds '8rNdb8Otq6j1mqUa,v7k05HAQltnSojV4,jT65yclX2FtAz0vJ' \
    > test.out 2>&1
eval_tap $? 81 'BulkFetchOrDefaultStatItems1' test.out

#- 82 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'jFIYWOaNdsimmkW2' \
    --additionalKey 'miH3xRHAKy4QxZka' \
    --body '[{"additionalData": {"XZ7vmiEd0JPxVyQp": {}, "shaDwNqTbbFMXAMf": {}, "VXe0GZeMgsRsmH1E": {}}, "statCode": "QrYmkPKTPOlhTtSi", "updateStrategy": "INCREMENT", "value": 0.4656720028275637}, {"additionalData": {"xuogFteTHJe4BhSS": {}, "QkQD6WmOt6D7ufFV": {}, "TOhvQpfbBke8aEdd": {}}, "statCode": "36xj6wySoltDxsbz", "updateStrategy": "MIN", "value": 0.9713095149988297}, {"additionalData": {"mcMdiS76YApGJ9uf": {}, "wLYkqIgLuZS6hsQr": {}, "yiEtOAbpeUNf26Uq": {}}, "statCode": "kCfgCUYBn2xaOBdP", "updateStrategy": "MAX", "value": 0.8507103540084404}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkUpdateUserStatItem' test.out

#- 83 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'JmX8qwU1cTuHHPB5' \
    --additionalKey 'S3DvPRCzBrVUxmDO' \
    --body '[{"additionalData": {"j3cvRFaTC11W0TGT": {}, "Cm4fZWuk6pQxDQpK": {}, "qxLGeMvr9TsvcMQ7": {}}, "statCode": "dBsaIecRxIsZvD6r"}, {"additionalData": {"mzVr5XT1Nxw0v1dM": {}, "Q9Rrbk6C2cVWf6tt": {}, "vbU1PO6ApCD2VXid": {}}, "statCode": "T7w0Oc15N8WXBPp1"}, {"additionalData": {"7PAewqSm5x3B4t7W": {}, "Qnp8jXZedgt5cyNe": {}, "27HLtwtVOaxgP6Jb": {}}, "statCode": "ct8puMybYGxD9IPm"}]' \
    > test.out 2>&1
eval_tap $? 83 'BulkResetUserStatItemValues' test.out

#- 84 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'msLmu3kaPj0O4zd8' \
    --userId 'Tb7cUNGPTBxiFFCr' \
    --additionalKey 'n7djjs69FTFVGUVh' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems2' test.out

#- 85 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vKhJCmeisql14mUH' \
    --userId 'VbMPimNhcZsU3VAd' \
    --additionalKey 'MDcb4qlkiFAamqvZ' \
    --body '{"additionalData": {"I2KwjqPBiWXade41": {}, "s3rH34mB2yPlRpWj": {}, "mHZAAvKTH8MuqIg0": {}}, "updateStrategy": "OVERRIDE", "value": 0.9082582176378495}' \
    > test.out 2>&1
eval_tap $? 85 'UpdateUserStatItemValue' test.out

#- 86 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"1cK8QTwiIAvxSvND": {}, "lmM5nQFMGzs7fzjg": {}, "yc44mEh9tRk8knYS": {}}, "additionalKey": "V30lnroQehMDli6t", "statCode": "9unQLYXxm09wpGAb", "updateStrategy": "MAX", "userId": "xTjQ7gkZEY8rG0q0", "value": 0.6819806939211146}, {"additionalData": {"2Qd2JzRbkF2I03dI": {}, "jvBbA6bfbYaJCJjf": {}, "k2TUvn95FhO7VW3m": {}}, "additionalKey": "bDVMDu87t0ldWf7i", "statCode": "SGIiKFtWtn4Yr2sv", "updateStrategy": "MIN", "userId": "ZQxPRXH7uxBJEECQ", "value": 0.48604131999003586}, {"additionalData": {"1li3Bg7Jxc9pUnZm": {}, "vhidwCkZwqjYLfTi": {}, "CO1NDBvQvRPnAz4V": {}}, "additionalKey": "zW0CpoBCbyJsF5Ij", "statCode": "F1c0W338HS6CBgVR", "updateStrategy": "OVERRIDE", "userId": "JbEGTUj7YjERL1rE", "value": 0.6929616359301067}]' \
    > test.out 2>&1
eval_tap $? 86 'BulkUpdateUserStatItem1' test.out

#- 87 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G02zccA8wvLsWUNd' \
    --additionalKey '6lPKvqDejvqklTSv' \
    --statCodes 'DwuOrP9lzpiX0VuF,pZum7izxe7NPzjOa,8E7wY76PxLv9HBEU' \
    --tags 'e89AwEw1HO4FnKtx,4XLKAmlDr19uJ3nq,6VerzVCcI8y3Cz0Y' \
    > test.out 2>&1
eval_tap $? 87 'PublicQueryUserStatItems2' test.out

#- 88 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qCKUh5RD9vNAp4ji' \
    --additionalKey 'nFpnQ5xF9wwbvMZy' \
    --body '[{"additionalData": {"eDeRnVfPUa6xVVBc": {}, "q3wZpFIYeAg79HcL": {}, "JXJ7mpVI6eTYAjdP": {}}, "statCode": "lCiQQC35cj4KyOVg", "updateStrategy": "MIN", "value": 0.26971566095026334}, {"additionalData": {"P8oxfrtbECD1CYPw": {}, "aiBAxfYL8Avt70ZU": {}, "T2fSk3LL0calqxEe": {}}, "statCode": "wuGS469k2hG0WKt4", "updateStrategy": "MIN", "value": 0.32557392674841223}, {"additionalData": {"tjsQ4CrRb9gUCeVz": {}, "7fWbZIdhevfZvyV7": {}, "AcodcZwKjYDdmJOl": {}}, "statCode": "zwm9Su4FnS98Qqft", "updateStrategy": "MAX", "value": 0.9310727661204582}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItem2' test.out

#- 89 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PbCvDLil8wj9cKM3' \
    --userId 'Ar6MF35hCER4nGmW' \
    --additionalKey 'GgTJfHlJl4tHGa4X' \
    --body '{"additionalData": {"fZcd9CVnGqMX9Fie": {}, "eEssWEUl07bhwntC": {}, "VqiYOJf5KwMZQjzv": {}}, "updateStrategy": "MAX", "value": 0.8900126868151028}' \
    > test.out 2>&1
eval_tap $? 89 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE