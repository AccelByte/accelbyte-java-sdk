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
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'EAxcVpFrttufHIRd' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'H9UzVRiXbqlAw7r6' \
    --userId 'W2ktQG0h5JAav5kR' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
eval_tap 0 10 'GetUserNamespaceSlots # SKIP deprecated' test.out

#- 11 GetSlotData
eval_tap 0 11 'GetSlotData # SKIP deprecated' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'a62WopBJHPtcDs8b,BZLCXLx8bbgorQeF,bQ1g7qbPngUNB1vR' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'odwpzS6DaDpv8N7Z' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'QVqGj6oDLjWjkY1a' \
    --body '{"achievements": ["XlFcDtgOjchIua5t", "WEIC32ogW7olvbTg", "rhRTcPiSuL0Sly6X"], "attributes": {"M4OI18mAQLnzjMf8": "GZ2WBZqxYG3aREAu", "2D6QVKNCWP75TB0i": "7pKxR8dl0zRVW4EZ", "G9m0XcgGVbMqSszE": "8GHavj7AorKsxwko"}, "avatarUrl": "sAVerXpc1C8XfwHu", "inventories": ["Keb9l3rGN9A3sNm8", "4hddSpHt0P7MIIR7", "CkyF6C7duuyZ0GhD"], "label": "ogqrhBRd8lDR6qVN", "profileName": "PRZYdFLIAjGGJddV", "statistics": ["Cvu9vx5KQ7KYnIuM", "BvaO35llzQRaT5kP", "xUfofvnnSuB0y5WU"], "tags": ["lrMdI4sNveabntBS", "xTeIv53HGCiljvjK", "oyD6SCwGrncqmLtj"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'QHAf8TgoNm03VLis' \
    --userId 'V6zwPuo3td6TC6I3' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'lMjGSWN2laRlxfcj' \
    --userId 'HfYakUCTqGkE7wcW' \
    --body '{"achievements": ["fDslpJSqGAXQ0yYo", "NRKd3IL5TAQ6iiPl", "SC2uE4o5Vwdo3feP"], "attributes": {"qIJA8IHtrkmu0hpD": "DWVAla2l5BYNtIuS", "5S5XUdjsoqwGyzzW": "i9gwQYv7t1o7TTr1", "DmrhZv15T7quIOvB": "McaYmvCkGZ5dAgqx"}, "avatarUrl": "pBFmaLoxozr6wfNP", "inventories": ["X2bOItRMvqtlB2jJ", "CSQT279ZZPYGu0rd", "lgdWyOtXi3choQrp"], "label": "OsDBU5SepjChB3V0", "profileName": "v52Dlym6puQ23xoJ", "statistics": ["8aeCnaLpUKp44YUD", "jasWIPUvmEejtGeo", "yIPa8ZRrvjj7il35"], "tags": ["MXbN9oCMNqq98SjT", "vhZNkSQ70D0H6BXk", "sUC9b6i5lZC9xv32"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'e8c5csSovoqsZNBd' \
    --userId 'te9NDUPVJf6c2Z0Q' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'ZxfgPubTDIHrvqAT' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'huwjRHpKKTlmVr9X' \
    --userId 'uoJbRFQSKVPHbn4X' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'xtu7LQRENjEEztx1' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'WsYSiZqan0nSBJro' \
    --userId 'av91GXlvPG6bFYRe' \
    --body '{"name": "VHQipcCx9Zw5D2L7", "value": "vIYhGGSyEW4ZJJ42"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

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
    --limit '7' \
    --offset '8' \
    --statCodes '3PBddN8S48l9lyNA' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pflxqMrj3oZk03QX' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 GetStatCycles
./ng net.accelbyte.sdk.cli.Main social getStatCycles \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '51' \
    --name 'KMDYDDxHSZjtqXyJ' \
    --offset '63' \
    --sortBy '8f7Gc26SaiGVkydw' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 28 'GetStatCycles' test.out

#- 29 CreateStatCycle
./ng net.accelbyte.sdk.cli.Main social createStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "ANNUALLY", "description": "QG26yUZNmTBcvrbY", "end": "1985-08-27T00:00:00Z", "name": "wZtxFHyPLtI8ilby", "resetDate": 60, "resetDay": 5, "resetMonth": 85, "resetTime": "wgGLXpUL4pp2ncYA", "seasonPeriod": 68, "start": "1976-01-31T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["m3SZLxoRDFuuuySj", "tfIovmv9gsR5cJcH", "29a9LJE8HoRS1X2P"]}' \
    > test.out 2>&1
eval_tap $? 30 'BulkGetStatCycle' test.out

#- 31 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'FAAMwzHPxB1UskYs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'GetStatCycle' test.out

#- 32 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId '4Yw20DOqOBSC2DKH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "uPMMWH8Yb33T5UBJ", "end": "1985-03-05T00:00:00Z", "name": "jfcnLRfxeCSz9WEi", "resetDate": 60, "resetDay": 75, "resetMonth": 25, "resetTime": "lloeH0JT1yduat2v", "seasonPeriod": 88, "start": "1996-12-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 32 'UpdateStatCycle' test.out

#- 33 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'T0GfH2rtOa4EXsXz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'DeleteStatCycle' test.out

#- 34 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'OXQAk4mqrxzTtuLl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["4XlbGL8QOxtjzm8y", "2wNhmwoYZyI4EFZK", "BcYrCEAE7WIsfmx4"]}' \
    > test.out 2>&1
eval_tap $? 34 'BulkAddStats' test.out

#- 35 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId '0NLRc6m8heKnWhzf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'StopStatCycle' test.out

#- 36 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'e2NubeoKFeIaFQCY' \
    --userIds 'oDPICpnduEEQlULd' \
    > test.out 2>&1
eval_tap $? 36 'BulkFetchStatItems' test.out

#- 37 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5759879194169657, "statCode": "z4mnRBkMNxvvKgAT", "userId": "8mJrYq6hRkloqxM3"}, {"inc": 0.10367847984225909, "statCode": "pwxcfMy9XzjjI5Yb", "userId": "sKoADkzJEN2VHzih"}, {"inc": 0.8987529913916946, "statCode": "bit0VWn3CO39PXDN", "userId": "xtXgeO3FgkXhjDza"}]' \
    > test.out 2>&1
eval_tap $? 37 'BulkIncUserStatItem' test.out

#- 38 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6803796842611485, "statCode": "Y3snn2ZkP7cFdP43", "userId": "e5dC9XIBudfZgrbH"}, {"inc": 0.4761565428598199, "statCode": "IDm4hMzF4TxodenS", "userId": "rUTvfqU0bfoMm5cT"}, {"inc": 0.31915056307206535, "statCode": "FWbotQyXJRcQWsmq", "userId": "PNs92epxk0i8VxsZ"}]' \
    > test.out 2>&1
eval_tap $? 38 'BulkIncUserStatItemValue' test.out

#- 39 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NereSvf9699mCEHT' \
    --userIds 'hUJkETAsSp7gh4Te,UTkOkAYfJB8AT9t4,Tv207Y2QD3oD5fLC' \
    > test.out 2>&1
eval_tap $? 39 'BulkFetchOrDefaultStatItems' test.out

#- 40 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "r3OOlXVv8ZGF7uYn", "userId": "GzpipNDigNJma1Mb"}, {"statCode": "qqZtfNWql4nmwAft", "userId": "4gqkNNlWkD9eOziY"}, {"statCode": "RFOn0jJLHC9LxhvN", "userId": "XTwGBCtohLtl9Zuh"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkResetUserStatItem' test.out

#- 41 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'ytm5UDrT6QXCs5SP' \
    --isGlobal  \
    --isPublic  \
    --limit '56' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 41 'GetStats' test.out

#- 42 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["sZg5QgXjvyGJPN4e", "XbJE5Vs2GcyomQoI", "bRPZTF6oQAXVG7tn"], "defaultValue": 0.8000271572434526, "description": "imBJehyxlNsjUgxB", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.515988595940881, "minimum": 0.6762168411735996, "name": "oJeQediogEhhM2rI", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "zGdKvOPdq5xrgxSm", "tags": ["a3Zdb65UXmy0Zp6i", "bj5Ro2ogaKt2ujQS", "y1DN9LFkYW5DQyj4"]}' \
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
    --limit '71' \
    --offset '66' \
    --keyword 'aTIKUkmkk9QM0NBM' \
    > test.out 2>&1
eval_tap $? 45 'QueryStats' test.out

#- 46 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'A9ORxpzwLR2AK6eX' \
    > test.out 2>&1
eval_tap $? 46 'GetStat' test.out

#- 47 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UGPJsw1fiP80G9Pc' \
    > test.out 2>&1
eval_tap $? 47 'DeleteStat' test.out

#- 48 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lxcft2ulIJzPyrVE' \
    --body '{"cycleIds": ["iOG4UcqsuGKHhMRW", "LVd3DlhLuIpomM8s", "m1MiaI1mX2tJoARt"], "defaultValue": 0.06079653984735289, "description": "bBe7udsMrok0WvGY", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "WjLfFmteue9nzJ6f", "tags": ["H24T805tVg8JqU0j", "ZpjvsugAOS7u8RiW", "yerCSa8SRgwsAj1i"]}' \
    > test.out 2>&1
eval_tap $? 48 'UpdateStat' test.out

#- 49 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'k1jglaDXTvKCWwNT' \
    > test.out 2>&1
eval_tap $? 49 'DeleteTiedStat' test.out

#- 50 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'Ahd2wrS0uPdjhdin' \
    --namespace "$AB_NAMESPACE" \
    --userId 'png5BLy8wbhMssAH' \
    --isPublic  \
    --limit '19' \
    --offset '41' \
    --sortBy 'apIkY9Rf4wP57dBZ' \
    --statCodes 'NR88YbCtmKy8M9zV' \
    > test.out 2>&1
eval_tap $? 50 'GetUserStatCycleItems' test.out

#- 51 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'rjfGXZnqAQUoY1Gj' \
    --isPublic  \
    --limit '23' \
    --offset '31' \
    --sortBy 'IIk0iKoTTS1j02o7' \
    --statCodes 'JjTXAQN0qdskdQV0' \
    --tags 'TqI8EFnmDbxIxi4Y' \
    > test.out 2>&1
eval_tap $? 51 'GetUserStatItems' test.out

#- 52 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'KlONk2Q5Y4Jvaizw' \
    --body '[{"statCode": "iilatuUjjt9lIMGq"}, {"statCode": "l5ElEa9EIIlGcHB3"}, {"statCode": "CfR3ncDlwi3v3MFF"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkCreateUserStatItems' test.out

#- 53 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J1KesKoELCpobBEG' \
    --body '[{"inc": 0.9782256380106731, "statCode": "X645xpdXpai0rYaT"}, {"inc": 0.9229463704766607, "statCode": "hOPjaf3H0tYighU0"}, {"inc": 0.769705948216814, "statCode": "UfcYHJbBfAKSiPW3"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkIncUserStatItem1' test.out

#- 54 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VgsZXiR1DJ7HVWqM' \
    --body '[{"inc": 0.16279291590410694, "statCode": "NSawQUWDFJvJBWic"}, {"inc": 0.9670067097364041, "statCode": "UkBeIXuqDuAXI66b"}, {"inc": 0.6909777322335666, "statCode": "71w0deoV9Lx5RDA1"}]' \
    > test.out 2>&1
eval_tap $? 54 'BulkIncUserStatItemValue1' test.out

#- 55 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l2XcrciYNEzvSZIP' \
    --body '[{"statCode": "khSgORcz5S5BvmgB"}, {"statCode": "Lxh4ijFnE3Tam69q"}, {"statCode": "SZ7PC6f6QkmZXElW"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkResetUserStatItem1' test.out

#- 56 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '9YfRSse6AAz3S4cz' \
    --userId 'z0QKFlAVmVLu4AOe' \
    > test.out 2>&1
eval_tap $? 56 'CreateUserStatItem' test.out

#- 57 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'c0z8eBeeoip68J1n' \
    --userId 'sv4W2OJhtafxMSJl' \
    > test.out 2>&1
eval_tap $? 57 'DeleteUserStatItems' test.out

#- 58 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Heb34sZKHcl5LLLO' \
    --userId 'exL4fZvWtND2tcBF' \
    --body '{"inc": 0.24664860692685509}' \
    > test.out 2>&1
eval_tap $? 58 'IncUserStatItemValue' test.out

#- 59 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X8lNtFEJ7tnkY6Mc' \
    --userId 'a5afj12K2IzrBvvW' \
    --additionalKey 'm4udE0OXudXgNne8' \
    --body '{"additionalData": {"kJATwlc6esUp6Sw1": {}, "I98jeZQ7hfxnhLd3": {}, "Knaknoed9DHhLOqQ": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'ResetUserStatItemValue' test.out

#- 60 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '66' \
    --offset '28' \
    --statCodes 'hCUr6iTrjyEgarAd' \
    > test.out 2>&1
eval_tap $? 60 'GetGlobalStatItems1' test.out

#- 61 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NJOIG36I6tRbRcrE' \
    > test.out 2>&1
eval_tap $? 61 'GetGlobalStatItemByStatCode1' test.out

#- 62 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'MONTHLY' \
    --limit '33' \
    --name 'eMdAdiPKDUVSC00P' \
    --offset '28' \
    --sortBy 'eDcagginxnFIna3y' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 62 'GetStatCycles1' test.out

#- 63 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["3aoRtlqOECohViHA", "5CzgFSy8X1A3PrIf", "apq5AAeMe4L3mDWO"]}' \
    > test.out 2>&1
eval_tap $? 63 'BulkGetStatCycle1' test.out

#- 64 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'RBVXTIIJM9XsYIIZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 64 'GetStatCycle1' test.out

#- 65 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xiXNMR9BgaWcFX3S' \
    --userIds 'UBhyoTsMWPAxUMka' \
    > test.out 2>&1
eval_tap $? 65 'BulkFetchStatItems1' test.out

#- 66 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.36654331381836436, "statCode": "aGpAyrIwMif3BOdk", "userId": "ocVTd4BxqGWV6mTJ"}, {"inc": 0.8474363267699179, "statCode": "sQs6XNbjvqhnUVLW", "userId": "u8olKdxL6ozRmDD0"}, {"inc": 0.15898218593841118, "statCode": "JvlfV5OemPYdYT7D", "userId": "ROCjtuzFMbAG9YI8"}]' \
    > test.out 2>&1
eval_tap $? 66 'PublicBulkIncUserStatItem' test.out

#- 67 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9885259841100106, "statCode": "hmguB8FOTjMLo4b9", "userId": "rIzqYkEpstyVTBcr"}, {"inc": 0.6210632989396341, "statCode": "8rG0rH0zcswwVeMK", "userId": "6MbGIVIu8vvwLc7K"}, {"inc": 0.808823155519277, "statCode": "3uVoJXTIMtpgkieD", "userId": "yF97lGdMiHKxbWCY"}]' \
    > test.out 2>&1
eval_tap $? 67 'PublicBulkIncUserStatItemValue' test.out

#- 68 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "zo8yO2KTK9tmmOnY", "userId": "nOpas6ghP1y4Zi7s"}, {"statCode": "7QBlk44Z44B1GZgK", "userId": "g4uKxaCgcGLuC3br"}, {"statCode": "WdTYCfHkIySok5Di", "userId": "XZtLW87rGysryod3"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItem2' test.out

#- 69 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["dNQrmsApRA6HX3Rw", "rKt2ecozL0TOg54v", "CE48L5oLF6M4lNa4"], "defaultValue": 0.5734890418300337, "description": "UMSHNgqRqCV7usam", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": false, "maximum": 0.16524676040011177, "minimum": 0.833758698680912, "name": "lOX9Sfo95HgXqKhT", "setAsGlobal": false, "setBy": "SERVER", "statCode": "kLOsp0LZ5njN86Hl", "tags": ["8kUXzt6bSc6bWvgp", "VyW9dD1kOmvrAejc", "q2LgkQuaS7RBx3vi"]}' \
    > test.out 2>&1
eval_tap $? 69 'CreateStat1' test.out

#- 70 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'm02jBOxrZDyvpcLY' \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --offset '53' \
    --sortBy 'WA8NjxOnaEok4nOO' \
    --statCodes 'CzfsflhjbngJOUn1,8G5MlfDTk8aG40Nl,ncceIZSwgAIkgzh4' \
    > test.out 2>&1
eval_tap $? 70 'PublicListMyStatCycleItems' test.out

#- 71 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '28' \
    --sortBy 'TU0Am4DZhl0bQxFJ' \
    --statCodes '3sWCqQpQ2FbKPFMy,cMSQ4qfAacR0LgB5,BUXvjcu2s6w3Vifn' \
    --tags 'KqmTSoGH1XEfY6QA,Yn6WQ5UBEU1QAOHf,ZiGhxOdcuDXSxSc3' \
    > test.out 2>&1
eval_tap $? 71 'PublicListMyStatItems' test.out

#- 72 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'aZPV87pna08gxefT' \
    --statCodes 'YKhuxaEc7M4P7Uck,SC6ePeN8i4GrFES9,z7xueHpATHccee9G' \
    --tags 'XhKcjmSEwdrkEnnq,KzFsLfYalUlfwEQK,jU7eHGebSVu0LQ40' \
    > test.out 2>&1
eval_tap $? 72 'PublicListAllMyStatItems' test.out

#- 73 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'kepEaC4dfiOMZfEh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hr39pysFO3Zvc1BZ' \
    --limit '66' \
    --offset '87' \
    --sortBy '99LyvfvHEsJKQQew' \
    --statCodes 'VLMUoAnaRcYp7FUj' \
    > test.out 2>&1
eval_tap $? 73 'GetUserStatCycleItems1' test.out

#- 74 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'fIGaffoflEIByYqe' \
    --limit '75' \
    --offset '48' \
    --sortBy 'N0meGelYF5wWaDhu' \
    --statCodes 'kU4khGG4vZFTYnPk' \
    --tags 'mSu4PWam1jxR7SET' \
    > test.out 2>&1
eval_tap $? 74 'PublicQueryUserStatItems' test.out

#- 75 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wjteoc8fgvZDDhoO' \
    --body '[{"statCode": "05oKqymxLD1Lcvw6"}, {"statCode": "T6mZEiwxxElpMYSW"}, {"statCode": "IeVzm7z9noowmlTI"}]' \
    > test.out 2>&1
eval_tap $? 75 'PublicBulkCreateUserStatItems' test.out

#- 76 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KVowi0RY2VN4ZONJ' \
    --additionalKey 'REdUQ3z9F1BxNNgn' \
    --statCodes 'ke4akncw7wu9TmXf,JWBPrx9Ns8eLzYEv,wSWTaLQjctvrK2jh' \
    --tags 'sYpKPlXn77AtYoFz,LAATPY8P8P3cfoiv,vQxevecWw7Rry0KK' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems1' test.out

#- 77 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5rgAGO0dW8rX2MVU' \
    --body '[{"inc": 0.5287246639318656, "statCode": "KSZ4GcLkt4pK32sJ"}, {"inc": 0.3841912243112864, "statCode": "lZcCTpTdRtCHvuk6"}, {"inc": 0.4491071690593442, "statCode": "6XTmSLyn50sigBVZ"}]' \
    > test.out 2>&1
eval_tap $? 77 'PublicBulkIncUserStatItem1' test.out

#- 78 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xiKdV57GvRyd9UuL' \
    --body '[{"inc": 0.8453385765892408, "statCode": "2Le8HSCslsDd4M1F"}, {"inc": 0.927556439057785, "statCode": "qRIblS7Nz81GRazP"}, {"inc": 0.4339088970288959, "statCode": "ANjfBoldFOyqA2cl"}]' \
    > test.out 2>&1
eval_tap $? 78 'BulkIncUserStatItemValue2' test.out

#- 79 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'J5gEOaCgM6Yn6Rug' \
    --body '[{"statCode": "bNEIpGBFUjOn5mM7"}, {"statCode": "k8nbLzvtCIW5ynMK"}, {"statCode": "quUicAeIVXtoWAXh"}]' \
    > test.out 2>&1
eval_tap $? 79 'BulkResetUserStatItem3' test.out

#- 80 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MlW4tLqX7OICf5oD' \
    --userId '1e6oI9FmYel0kOw7' \
    > test.out 2>&1
eval_tap $? 80 'PublicCreateUserStatItem' test.out

#- 81 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '2o8Zkgk0jS6rDWUw' \
    --userId 'fhKvrf2AaH4yCWrH' \
    > test.out 2>&1
eval_tap $? 81 'DeleteUserStatItems1' test.out

#- 82 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SppnIZkNnTn3rzH5' \
    --userId 'NvAtcvNedgS1fUfK' \
    --body '{"inc": 0.20788273509931088}' \
    > test.out 2>&1
eval_tap $? 82 'PublicIncUserStatItem' test.out

#- 83 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ihDbmu8ePWlQMVDX' \
    --userId 'EHeiGTnwyEw6hIWD' \
    --body '{"inc": 0.8370309275725138}' \
    > test.out 2>&1
eval_tap $? 83 'PublicIncUserStatItemValue' test.out

#- 84 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rpP7rz3ISW510kHr' \
    --userId '4isTKWjmv67nuHCX' \
    > test.out 2>&1
eval_tap $? 84 'ResetUserStatItemValue1' test.out

#- 85 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"WfwnwGioVwVzmmBV": {}, "VFfpqx1AeLtzcPJ3": {}, "jtDYBo4FUTH7CGfK": {}}, "additionalKey": "SyxgRR1DiCqSMzpq", "statCode": "IFGLkDs7ACC1RgBf", "updateStrategy": "MAX", "userId": "UV31MfuGaXsAuGsZ", "value": 0.005264199693002958}, {"additionalData": {"SHevO0TQNEI3kfab": {}, "xJWWSI1ECUo1NPpe": {}, "FhUztXDgB7n4C97u": {}}, "additionalKey": "APP8PATLpUpxeJls", "statCode": "BJT6Hh3OMjAjq2mK", "updateStrategy": "MAX", "userId": "0DtJMcYQdN66bswA", "value": 0.10137190297573373}, {"additionalData": {"t65X4N1LQZmB61JM": {}, "dtwCVUrYQue84dwm": {}, "bwFEnAZaWsQJtRYo": {}}, "additionalKey": "agRJK5PX9UcOvhPy", "statCode": "E11TRT2SKseoe8VL", "updateStrategy": "MAX", "userId": "hDJ5slzgiWZEtyd5", "value": 0.9412437587792863}]' \
    > test.out 2>&1
eval_tap $? 85 'BulkUpdateUserStatItemV2' test.out

#- 86 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'LfxnbY97jjYgXchC' \
    --statCode 'bkXX26uEdCfQaMAQ' \
    --userIds 'uTKfC0I2kNjCMDtD,Mrentgn3DhqciwIe,ShF9RKb9vvxuJlhX' \
    > test.out 2>&1
eval_tap $? 86 'BulkFetchOrDefaultStatItems1' test.out

#- 87 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bWhbwPwToC6knjVw' \
    --additionalKey 'VnzaqSfJiQFC2gXo' \
    --statCodes 'da0kg16yUSpSOAjH,JWwfCjYwWkLob9gK,Lqs2nEZhpByfHZin' \
    --tags 'xNfgPAwkMBsznlBU,qnLT4AbGptKaWNvP,bpg7yrRvXfZ6rvgv' \
    > test.out 2>&1
eval_tap $? 87 'AdminListUsersStatItems' test.out

#- 88 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EY3Hht1SwqTsKKKo' \
    --additionalKey '37NHDOQe91Ps3ztU' \
    --body '[{"additionalData": {"IV0dS6hIH9c4Vfky": {}, "rwpuXxbaERbfgPmi": {}, "0eHkt1mr9EOIFg0d": {}}, "statCode": "nWIYN2NVL70Iw157", "updateStrategy": "INCREMENT", "value": 0.6784281719056766}, {"additionalData": {"kQD6WmOt6D7ufFVT": {}, "OhvQpfbBke8aEdd3": {}, "6xj6wySoltDxsbzx": {}}, "statCode": "rlaKEfkoYjY2o6ou", "updateStrategy": "MIN", "value": 0.7866765081773304}, {"additionalData": {"9UtNquwC3WgumrIz": {}, "4NhGztZpr4U4fwQI": {}, "iLXgmRasvjO4lj8m": {}}, "statCode": "3XEwP2b4gd3xOeii", "updateStrategy": "MAX", "value": 0.4699612795906344}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItem' test.out

#- 89 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'vPRCzBrVUxmDOj3c' \
    --additionalKey 'vRFaTC11W0TGTCm4' \
    --body '[{"additionalData": {"fZWuk6pQxDQpKqxL": {}, "GeMvr9TsvcMQ7dBs": {}, "aIecRxIsZvD6rmzV": {}}, "statCode": "r5XT1Nxw0v1dMQ9R"}, {"additionalData": {"rbk6C2cVWf6ttvbU": {}, "1PO6ApCD2VXidT7w": {}, "0Oc15N8WXBPp17PA": {}}, "statCode": "ewqSm5x3B4t7WQnp"}, {"additionalData": {"8jXZedgt5cyNe27H": {}, "LtwtVOaxgP6Jbct8": {}, "puMybYGxD9IPmmsL": {}}, "statCode": "mu3kaPj0O4zd8Tb7"}]' \
    > test.out 2>&1
eval_tap $? 89 'BulkResetUserStatItemValues' test.out

#- 90 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cUNGPTBxiFFCrn7d' \
    --userId 'jjs69FTFVGUVhvKh' \
    --additionalKey 'JCmeisql14mUHVbM' \
    > test.out 2>&1
eval_tap $? 90 'DeleteUserStatItems2' test.out

#- 91 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PimNhcZsU3VAdMDc' \
    --userId 'b4qlkiFAamqvZI2K' \
    --additionalKey 'wjqPBiWXade41s3r' \
    --body '{"additionalData": {"H34mB2yPlRpWjmHZ": {}, "AAvKTH8MuqIg0Czk": {}, "guwuJCW7EEFB67AO": {}}, "updateStrategy": "OVERRIDE", "value": 0.6216570513037439}' \
    > test.out 2>&1
eval_tap $? 91 'UpdateUserStatItemValue' test.out

#- 92 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"5nQFMGzs7fzjgyc4": {}, "4mEh9tRk8knYSV30": {}, "lnroQehMDli6t9un": {}}, "additionalKey": "QLYXxm09wpGAbpEm", "statCode": "DY9vLh3u6EDsUmrV", "updateStrategy": "INCREMENT", "userId": "kH4OotKwG3UC6XCn", "value": 0.21609440462849483}, {"additionalData": {"ZxF8CmQr17W65br3": {}, "4rBBN9tU6TDm5Glo": {}, "FSKWM1eym5ydC6p2": {}}, "additionalKey": "5xCWTqUOYZENJ1QH", "statCode": "ZQxPRXH7uxBJEECQ", "updateStrategy": "OVERRIDE", "userId": "Q5iZgbwwm5iGzXtc", "value": 0.1693140889632596}, {"additionalData": {"nrgidKupvXO6aj4h": {}, "CmTC34jxW4pIDwdq": {}, "XpmRmut9H9XyWI8b": {}}, "additionalKey": "p8fQxRuX91uYmtrH", "statCode": "JbEGTUj7YjERL1rE", "updateStrategy": "MIN", "userId": "G02zccA8wvLsWUNd", "value": 0.9440922920487673}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkUpdateUserStatItem1' test.out

#- 93 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lPKvqDejvqklTSvD' \
    --additionalKey 'wuOrP9lzpiX0VuFp' \
    --statCodes 'Zum7izxe7NPzjOa8,E7wY76PxLv9HBEUe,89AwEw1HO4FnKtx4' \
    --tags 'XLKAmlDr19uJ3nq6,VerzVCcI8y3Cz0Yq,CKUh5RD9vNAp4jin' \
    > test.out 2>&1
eval_tap $? 93 'PublicQueryUserStatItems2' test.out

#- 94 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FpnQ5xF9wwbvMZye' \
    --additionalKey 'DeRnVfPUa6xVVBcq' \
    --body '[{"additionalData": {"3wZpFIYeAg79HcLJ": {}, "XJ7mpVI6eTYAjdPl": {}, "CiQQC35cj4KyOVgv": {}}, "statCode": "nWbfRJtsB7cUQZ2Q", "updateStrategy": "INCREMENT", "value": 0.4311489249350776}, {"additionalData": {"xJrINPXppPNO3Afm": {}, "XcgwC3IN6tvKgLB9": {}, "QmJIOq9dP5szG71u": {}}, "statCode": "tjsQ4CrRb9gUCeVz", "updateStrategy": "INCREMENT", "value": 0.5532526060143027}, {"additionalData": {"pWoSLkUrfuf4U3We": {}, "YeA9t2ENKKWrFtHI": {}, "i1CMgKAOG5iDcCR5": {}}, "statCode": "PbCvDLil8wj9cKM3", "updateStrategy": "OVERRIDE", "value": 0.5659509098161362}]' \
    > test.out 2>&1
eval_tap $? 94 'BulkUpdateUserStatItem2' test.out

#- 95 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sbGpO6JgehDJxEN7' \
    --userId 'JlZc8LMq1o2jZWu4' \
    --additionalKey 'yA3r0u4q1bTHXIjf' \
    --body '{"additionalData": {"JKyFlM0u1uuoVdn9": {}, "yVoSlKNchPHNL4X3": {}, "LLaGPGdqLE8Sohhh": {}}, "updateStrategy": "MIN", "value": 0.5055579553730566}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE