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
echo "1..98"

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
    --body '{"cycleIds": ["m3SZLxoRDFuuuySj", "29a9LJE8HoRS1X2P", "tfIovmv9gsR5cJcH"]}' \
    > test.out 2>&1
eval_tap $? 30 'BulkGetStatCycle' test.out

#- 31 ExportStatCycle
./ng net.accelbyte.sdk.cli.Main social exportStatCycle \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'ExportStatCycle' test.out

#- 32 ImportStatCycle
./ng net.accelbyte.sdk.cli.Main social importStatCycle \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 32 'ImportStatCycle' test.out

#- 33 GetStatCycle
./ng net.accelbyte.sdk.cli.Main social getStatCycle \
    --cycleId 'FAAMwzHPxB1UskYs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId '4Yw20DOqOBSC2DKH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "WEEKLY", "description": "uPMMWH8Yb33T5UBJ", "end": "1985-03-05T00:00:00Z", "name": "jfcnLRfxeCSz9WEi", "resetDate": 60, "resetDay": 75, "resetMonth": 25, "resetTime": "lloeH0JT1yduat2v", "seasonPeriod": 88, "start": "1996-12-20T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'T0GfH2rtOa4EXsXz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'OXQAk4mqrxzTtuLl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["4XlbGL8QOxtjzm8y", "2wNhmwoYZyI4EFZK", "BcYrCEAE7WIsfmx4"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId '0NLRc6m8heKnWhzf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'e2NubeoKFeIaFQCY' \
    --userIds 'oDPICpnduEEQlULd' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5759879194169657, "statCode": "z4mnRBkMNxvvKgAT", "userId": "8mJrYq6hRkloqxM3"}, {"inc": 0.10367847984225909, "statCode": "pwxcfMy9XzjjI5Yb", "userId": "sKoADkzJEN2VHzih"}, {"inc": 0.8987529913916946, "statCode": "bit0VWn3CO39PXDN", "userId": "xtXgeO3FgkXhjDza"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6803796842611485, "statCode": "Y3snn2ZkP7cFdP43", "userId": "e5dC9XIBudfZgrbH"}, {"inc": 0.4761565428598199, "statCode": "IDm4hMzF4TxodenS", "userId": "rUTvfqU0bfoMm5cT"}, {"inc": 0.31915056307206535, "statCode": "FWbotQyXJRcQWsmq", "userId": "PNs92epxk0i8VxsZ"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NereSvf9699mCEHT' \
    --userIds 'hUJkETAsSp7gh4Te,UTkOkAYfJB8AT9t4,Tv207Y2QD3oD5fLC' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "r3OOlXVv8ZGF7uYn", "userId": "GzpipNDigNJma1Mb"}, {"statCode": "qqZtfNWql4nmwAft", "userId": "4gqkNNlWkD9eOziY"}, {"statCode": "RFOn0jJLHC9LxhvN", "userId": "XTwGBCtohLtl9Zuh"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'ytm5UDrT6QXCs5SP' \
    --isGlobal  \
    --isPublic  \
    --limit '56' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["XbJE5Vs2GcyomQoI", "bRPZTF6oQAXVG7tn", "sZg5QgXjvyGJPN4e"], "defaultValue": 0.8000271572434526, "description": "imBJehyxlNsjUgxB", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": true, "isPublic": false, "maximum": 0.515988595940881, "minimum": 0.6762168411735996, "name": "oJeQediogEhhM2rI", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "zGdKvOPdq5xrgxSm", "tags": ["y1DN9LFkYW5DQyj4", "a3Zdb65UXmy0Zp6i", "bj5Ro2ogaKt2ujQS"]}' \
    > test.out 2>&1
eval_tap $? 44 'CreateStat' test.out

#- 45 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 45 'ExportStats' test.out

#- 46 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 46 'ImportStats' test.out

#- 47 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --isGlobal  \
    --isPublic  \
    --limit '71' \
    --offset '66' \
    --keyword 'aTIKUkmkk9QM0NBM' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'A9ORxpzwLR2AK6eX' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UGPJsw1fiP80G9Pc' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lxcft2ulIJzPyrVE' \
    --body '{"cycleIds": ["iOG4UcqsuGKHhMRW", "m1MiaI1mX2tJoARt", "LVd3DlhLuIpomM8s"], "defaultValue": 0.06079653984735289, "description": "bBe7udsMrok0WvGY", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "WjLfFmteue9nzJ6f", "tags": ["yerCSa8SRgwsAj1i", "ZpjvsugAOS7u8RiW", "H24T805tVg8JqU0j"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'k1jglaDXTvKCWwNT' \
    --limit '54' \
    --offset '32' \
    --sortBy 'hd2wrS0uPdjhdinp' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ng5BLy8wbhMssAHj' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'apIkY9Rf4wP57dBZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NR88YbCtmKy8M9zV' \
    --isPublic  \
    --limit '35' \
    --offset '2' \
    --sortBy 'jfGXZnqAQUoY1Gjl' \
    --statCodes 'IIk0iKoTTS1j02o7' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'JjTXAQN0qdskdQV0' \
    --isPublic  \
    --limit '93' \
    --offset '90' \
    --sortBy 'qI8EFnmDbxIxi4YK' \
    --statCodes 'lONk2Q5Y4Jvaizwi' \
    --tags 'ilatuUjjt9lIMGql' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '5ElEa9EIIlGcHB3C' \
    --body '[{"statCode": "fR3ncDlwi3v3MFFJ"}, {"statCode": "1KesKoELCpobBEG8"}, {"statCode": "X645xpdXpai0rYaT"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5hOPjaf3H0tYighU' \
    --body '[{"inc": 0.8513512491761567, "statCode": "VUfcYHJbBfAKSiPW"}, {"inc": 0.9000402113751781, "statCode": "VgsZXiR1DJ7HVWqM"}, {"inc": 0.16279291590410694, "statCode": "NSawQUWDFJvJBWic"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7UkBeIXuqDuAXI66' \
    --body '[{"inc": 0.019085535526272013, "statCode": "Q71w0deoV9Lx5RDA"}, {"inc": 0.8675410666785492, "statCode": "l2XcrciYNEzvSZIP"}, {"inc": 0.16562091737613127, "statCode": "hSgORcz5S5BvmgBL"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xh4ijFnE3Tam69qS' \
    --body '[{"statCode": "Z7PC6f6QkmZXElW9"}, {"statCode": "YfRSse6AAz3S4czz"}, {"statCode": "0QKFlAVmVLu4AOec"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '0z8eBeeoip68J1ns' \
    --userId 'v4W2OJhtafxMSJlH' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eb34sZKHcl5LLLOe' \
    --userId 'xL4fZvWtND2tcBFp' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X8lNtFEJ7tnkY6Mc' \
    --userId 'a5afj12K2IzrBvvW' \
    --body '{"inc": 0.19624458327873529}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '4udE0OXudXgNne8k' \
    --userId 'JATwlc6esUp6Sw1I' \
    --additionalKey '98jeZQ7hfxnhLd3K' \
    --body '{"additionalData": {"naknoed9DHhLOqQG": {}, "hCUr6iTrjyEgarAd": {}, "NJOIG36I6tRbRcrE": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '33' \
    --statCodes 'eMdAdiPKDUVSC00P' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YeDcagginxnFIna3' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'SEASONAL' \
    --limit '27' \
    --name 'ddcbsPheTH26IUJN' \
    --offset '45' \
    --sortBy '5CzgFSy8X1A3PrIf' \
    --status 'ACTIVE' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["4pCAKxeE70CaunQN", "xot371W9G4AvQkqs", "IZsMfB4ZH3mtgWgU"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'Gnmyo5JJTUVmb8GE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XFTlEMEsFzYqwgK1' \
    --userIds 'Np5nodqpLm7FhJBN' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7960938725429499, "statCode": "zAFdO0Khqf6kiTdS", "userId": "Gv2LFjAKY7CbgsWq"}, {"inc": 0.5069338840170367, "statCode": "WZX7kPBom8F9GLLT", "userId": "G8phc3n4iLoIllKl"}, {"inc": 0.24539345494304576, "statCode": "O2pqiXJF3WGRaoQo", "userId": "mSJC4DdrKF7SUQPL"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5232135476251192, "statCode": "59e0k5ZtX6wK7PpU", "userId": "lcIW32iK7MGt1ixY"}, {"inc": 0.9197787702740964, "statCode": "rA1WoVeJIePF8ZrQ", "userId": "zP4zvtdxdbZUpd6F"}, {"inc": 0.5756153495347066, "statCode": "tHJ1pyVwyKQLY6FE", "userId": "O65Rb3z7CYLM8Ils"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "HqffnrfsGlfPaZKB", "userId": "wa3Ddb60ufPpzwj1"}, {"statCode": "QGIFmlVf4jvapseE", "userId": "9LN9bvhOrHflIOd6"}, {"statCode": "X3viLvtEk4mTIpUA", "userId": "9gxo8SV38nEhoXmM"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["2W7l6jHMA2rG3nak", "NqoTow0qiOiC4j0i", "opAywelu01nryEJ0"], "defaultValue": 0.16832769118301072, "description": "tm0ZPLkLOsp0LZ5n", "ignoreAdditionalDataOnValueRejected": false, "incrementOnly": false, "isPublic": false, "maximum": 0.949860147176814, "minimum": 0.5331541531348575, "name": "l8kUXzt6bSc6bWvg", "setAsGlobal": true, "setBy": "SERVER", "statCode": "hrTrcBE2ItBS3KtK", "tags": ["UtipUWYhWV1qx8Cz", "ZWe8aoFzAyBME74H", "PML52faXUr9Sk4lq"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId '2faBcAXXKlhvyH8p' \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '67' \
    --sortBy 'OJtxqMPpcVfRwNj5' \
    --statCodes '47fH0XrKEDpEY8Vn,ocGAjci0V3tBf2jn,HGKXphn50c9tNLDl' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '79' \
    --sortBy 'hZ2jxLRX3z46OCaG' \
    --statCodes 'BeMfPlNos4yBRjrE,RHEonAZR8GmEu0q1,p6QCyY6vSkVFWdsb' \
    --tags 'YuVEGVxYheR3j5mN,Z6vwv7K8Asvt1j1R,x59hesNWy2NvZ85D' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'DKDAF8KDsBZOuYQJ' \
    --statCodes '03BAHZ7c53q7akMp,cmnnx6RVBrop9v7a,ZK3h65hbN15zfQSf' \
    --tags 'QrtfF3TQN0OcNDLr,36vzohZyjMQAg5mP,YhrLTyU8OhgfY9JQ' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'YGF4bYXEcENx9xZl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Achob44lONDDwMvg' \
    --limit '71' \
    --offset '71' \
    --sortBy '0HlyPR7wZNiVsF6x' \
    --statCodes 'G2mXEQdbzIVy8aln' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'cV7vWgSHdfo07Uct' \
    --limit '85' \
    --offset '91' \
    --sortBy 'ErqxyMyOK06MqQBE' \
    --statCodes 'rxgjVBycvU4PbmRD' \
    --tags 'crg0DjQjBECXvea7' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'H1m2lJFRZ3ZprZ60' \
    --body '[{"statCode": "zMjhTHeh94TSenE5"}, {"statCode": "hCFkIf5weqZ18MH5"}, {"statCode": "7l2Zsrh90ETtYmGu"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kz3MnlrjcHp6B8Vj' \
    --additionalKey '7rXFgDnDkdZ9bpjb' \
    --statCodes '1tdA3QhjCMW64f4X,hIjSoTB2NMKtezap,Pr2QEPx3zTxBGtEJ' \
    --tags 'IYppuUSsKoHw2hyd,12uSE7BEv3aevq6i,ohU1cg4W1IS3Uv1B' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pWoJBaqdg2FHcuns' \
    --body '[{"inc": 0.7162480089746949, "statCode": "1lnaO2m9vqjhbeK2"}, {"inc": 0.26004726724090577, "statCode": "N8g6x2PyYDo5R3hL"}, {"inc": 0.14056190009003133, "statCode": "D5sf5y1JsxJNGmyt"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '0SQDUDoWBZVGLlkU' \
    --body '[{"inc": 0.07819987411729168, "statCode": "tzCAWc9x1aMjgGim"}, {"inc": 0.9216017840759192, "statCode": "1T107XIZRZ7tZdIs"}, {"inc": 0.8494977030322283, "statCode": "xf4czdt7zqmSKxOE"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QlVcx6GqsBq8vdhW' \
    --body '[{"statCode": "VnuYLgpZehK0G2nm"}, {"statCode": "yuViB9kRTcSQdTnN"}, {"statCode": "YGeAfYFG3wSkHKuf"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BdS3ZOokZB4cXnAX' \
    --userId 'yuGz6LlxHv8Swyag' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YvDJ3w3UNgIGj2jZ' \
    --userId 'tEYT8sIPSE1XXPzy' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Sa0sZoFS6xCOWMpy' \
    --userId 'h9pMsQgb64ELbzDM' \
    --body '{"inc": 0.36451537373521303}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yo4nIRysQdbufXjY' \
    --userId 'nSoIFeouC2m38kXr' \
    --body '{"inc": 0.4748937941334793}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZWlGVE9sJ4NpUtKp' \
    --userId '6M9I6nEwnZhsjwJe' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"GwaPSDMZz95OYKiq": {}, "aZD63xe5rruJVfLG": {}, "ea0ZtlzUcuHAXz0U": {}}, "additionalKey": "V31MfuGaXsAuGsZa", "statCode": "SHevO0TQNEI3kfab", "updateStrategy": "OVERRIDE", "userId": "HoytVznCgNyx9fbT", "value": 0.9354977393769683}, {"additionalData": {"3ShEh8PbGikLjgjc": {}, "j34uulU6FYBZsWFb": {}, "r3RSP0W9nBhvhf8Q": {}}, "additionalKey": "0DtJMcYQdN66bswA", "statCode": "gt65X4N1LQZmB61J", "updateStrategy": "INCREMENT", "userId": "dtwCVUrYQue84dwm", "value": 0.023270858832416197}, {"additionalData": {"wFEnAZaWsQJtRYoa": {}, "gRJK5PX9UcOvhPyE": {}, "11TRT2SKseoe8VLi": {}}, "additionalKey": "e0LBa36KNzjf005C", "statCode": "XNGehQ2aTjTDfKFD", "updateStrategy": "INCREMENT", "userId": "C7eGL5YhJDWh9YWq", "value": 0.04212590113688652}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '0qgV6d9yOfIMLds2' \
    --statCode 'DbPcaoMdtRLTmSvT' \
    --userIds 'kQQgB7exYvmHMxr5,hPCJJztJBg0tTJg4,6IewOXE2AkCh3QIZ' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'sUf8lGFXcmwTERHc' \
    --additionalKey 'lOdxIwqejxe18rNd' \
    --statCodes 'b8Otq6j1mqUav7k0,5HAQltnSojV4jT65,yclX2FtAz0vJjFIY' \
    --tags 'WOaNdsimmkW2miH3,xRHAKy4QxZkaXZ7v,miEd0JPxVyQpshaD' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNqTbbFMXAMfVXe0' \
    --additionalKey 'GZeMgsRsmH1EQrYm' \
    --body '[{"additionalData": {"kPKTPOlhTtSiZNCx": {}, "uogFteTHJe4BhSSQ": {}, "kQD6WmOt6D7ufFVT": {}}, "statCode": "OhvQpfbBke8aEdd3", "updateStrategy": "MIN", "value": 0.952904255313223}, {"additionalData": {"xmFNAmjDDCvs78mc": {}, "MdiS76YApGJ9ufwL": {}, "YkqIgLuZS6hsQryi": {}}, "statCode": "EtOAbpeUNf26UqkC", "updateStrategy": "INCREMENT", "value": 0.6096819945529608}, {"additionalData": {"XgmRasvjO4lj8m3X": {}, "EwP2b4gd3xOeii8J": {}, "nmssep2xD2NY0kAB": {}}, "statCode": "eGs9yxahld1pO0Gy", "updateStrategy": "INCREMENT", "value": 0.9059559846605265}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'fZWuk6pQxDQpKqxL' \
    --additionalKey 'GeMvr9TsvcMQ7dBs' \
    --body '[{"additionalData": {"aIecRxIsZvD6rmzV": {}, "r5XT1Nxw0v1dMQ9R": {}, "rbk6C2cVWf6ttvbU": {}}, "statCode": "1PO6ApCD2VXidT7w"}, {"additionalData": {"0Oc15N8WXBPp17PA": {}, "ewqSm5x3B4t7WQnp": {}, "8jXZedgt5cyNe27H": {}}, "statCode": "LtwtVOaxgP6Jbct8"}, {"additionalData": {"puMybYGxD9IPmmsL": {}, "mu3kaPj0O4zd8Tb7": {}, "cUNGPTBxiFFCrn7d": {}}, "statCode": "jjs69FTFVGUVhvKh"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JCmeisql14mUHVbM' \
    --userId 'PimNhcZsU3VAdMDc' \
    --additionalKey 'b4qlkiFAamqvZI2K' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wjqPBiWXade41s3r' \
    --userId 'H34mB2yPlRpWjmHZ' \
    --additionalKey 'AAvKTH8MuqIg0Czk' \
    --body '{"additionalData": {"guwuJCW7EEFB67AO": {}, "Dbi9BzupBsFpYc77": {}, "GtRUcCFeY5g4XgBs": {}}, "updateStrategy": "INCREMENT", "value": 0.8541647947750299}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"lnroQehMDli6t9un": {}, "QLYXxm09wpGAbpEm": {}, "DY9vLh3u6EDsUmrV": {}}, "additionalKey": "6kH4OotKwG3UC6XC", "statCode": "nnZxF8CmQr17W65b", "updateStrategy": "MIN", "userId": "TUvn95FhO7VW3mbD", "value": 0.76643211571939}, {"additionalData": {"MDu87t0ldWf7iSGI": {}, "iKFtWtn4Yr2svKM6": {}, "pqLGZ0TBujELAUK6": {}}, "additionalKey": "mQ5iZgbwwm5iGzXt", "statCode": "cknrgidKupvXO6aj", "updateStrategy": "MAX", "userId": "hCmTC34jxW4pIDwd", "value": 0.26199401479434614}, {"additionalData": {"XpmRmut9H9XyWI8b": {}, "p8fQxRuX91uYmtrH": {}, "JbEGTUj7YjERL1rE": {}}, "additionalKey": "QG02zccA8wvLsWUN", "statCode": "d6lPKvqDejvqklTS", "updateStrategy": "MIN", "userId": "agTiRJ8daGTVX3Bb", "value": 0.9654584917629138}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jlz5IfHgKjI9mwJS' \
    --additionalKey 'rN8jkIykR2zbaI6P' \
    --statCodes 'D7fEscShnGUGUtV9,GJ279GDbLNwjm3FK,0nnX2poMfZ1hDHtb' \
    --tags 'h4HtMlFgvh2Dp2So,iIPp1yvfAHS0VgLu,11A3HTovFi4tPAGf' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'leyCA6jEtcqsnzoV' \
    --additionalKey 'ILjkwW61duF87aUy' \
    --body '[{"additionalData": {"rdt4XSpWBAetsanz": {}, "qP8oxfrtbECD1CYP": {}, "waiBAxfYL8Avt70Z": {}}, "statCode": "UT2fSk3LL0calqxE", "updateStrategy": "INCREMENT", "value": 0.44216048986135514}, {"additionalData": {"9QmJIOq9dP5szG71": {}, "utjsQ4CrRb9gUCeV": {}, "z7fWbZIdhevfZvyV": {}}, "statCode": "7AcodcZwKjYDdmJO", "updateStrategy": "MAX", "value": 0.31692278694157394}, {"additionalData": {"HIi1CMgKAOG5iDcC": {}, "R5PbCvDLil8wj9cK": {}, "M3Ar6MF35hCER4nG": {}}, "statCode": "mWGgTJfHlJl4tHGa", "updateStrategy": "MIN", "value": 0.09163138198656717}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Zcd9CVnGqMX9Fiee' \
    --userId 'EssWEUl07bhwntCV' \
    --additionalKey 'qiYOJf5KwMZQjzvj' \
    --body '{"additionalData": {"Sozv6CTRDl0zp9Cz": {}, "HFwinkBNi4gvqgl6": {}, "TZ9TGVPmv34h6T7E": {}}, "updateStrategy": "MIN", "value": 0.37247849502798336}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE