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
    --body '{"cycleIds": ["29a9LJE8HoRS1X2P", "m3SZLxoRDFuuuySj", "tfIovmv9gsR5cJcH"]}' \
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
    --body '{"cycleIds": ["sZg5QgXjvyGJPN4e", "bRPZTF6oQAXVG7tn", "XbJE5Vs2GcyomQoI"], "defaultValue": 0.8000271572434526, "description": "imBJehyxlNsjUgxB", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.6762168411735996, "minimum": 0.23320775263937743, "name": "JeQediogEhhM2rIi", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "BHUTrDzZSKscfOcY", "tags": ["K5QpNhlI2iS5EpGh", "Cmpo6sPwVOEDSJsE", "u3dpCROYqUiGKXVF"]}' \
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
    --limit '16' \
    --offset '71' \
    --keyword 'vXYck0upMzUYnb76' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tFkEORV3bu1bNCtX' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '7W40V6Do5sYadCCF' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rHHC3DpZxkrQDXuN' \
    --body '{"cycleIds": ["uUccE536ugBp3HBv", "FviMarv8mnfHK8CC", "mE2lPnsbD3SGEdlw"], "defaultValue": 0.06522164549941556, "description": "pnDCjgyJlXe36mgW", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "isPublic": false, "name": "9xbnGezKsDwG2omO", "tags": ["R2nvYI9TVqJdvzcW", "bfUpaXp5JMl5LL4b", "TxBmZjdrrIxsB0NR"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sB1fPqqRRulpqpym' \
    --limit '60' \
    --offset '91' \
    --sortBy 'kQhtrHWwRVnwVBOq' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OHi8pWGd1juYhiqj' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'RJOqB5F93zFQbJnd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UDpdONneAczbBdHb' \
    --isPublic  \
    --limit '28' \
    --offset '38' \
    --sortBy 'qAQUoY1GjlIIk0iK' \
    --statCodes 'oTTS1j02o7JjTXAQ' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'N0qdskdQV0TqI8EF' \
    --isPublic  \
    --limit '28' \
    --offset '88' \
    --sortBy 'mDbxIxi4YKlONk2Q' \
    --statCodes '5Y4JvaizwiilatuU' \
    --tags 'jjt9lIMGql5ElEa9' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'EIIlGcHB3CfR3ncD' \
    --body '[{"statCode": "lwi3v3MFFJ1KesKo"}, {"statCode": "ELCpobBEG8X645xp"}, {"statCode": "dXpai0rYaT5hOPja"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'f3H0tYighU0VUfcY' \
    --body '[{"inc": 0.5382502706000669, "statCode": "JbBfAKSiPW3VgsZX"}, {"inc": 0.13428450600754305, "statCode": "R1DJ7HVWqMkNSawQ"}, {"inc": 0.7476560348446734, "statCode": "WDFJvJBWic7UkBeI"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XuqDuAXI66bQ71w0' \
    --body '[{"inc": 0.05640235554242412, "statCode": "eoV9Lx5RDA1l2Xcr"}, {"inc": 0.043169252622150545, "statCode": "iYNEzvSZIPkhSgOR"}, {"inc": 0.045188645440361275, "statCode": "z5S5BvmgBLxh4ijF"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nE3Tam69qSZ7PC6f' \
    --body '[{"statCode": "6QkmZXElW9YfRSse"}, {"statCode": "6AAz3S4czz0QKFlA"}, {"statCode": "VmVLu4AOec0z8eBe"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eoip68J1nsv4W2OJ' \
    --userId 'htafxMSJlHeb34sZ' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KHcl5LLLOexL4fZv' \
    --userId 'WtND2tcBFpX8lNtF' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EJ7tnkY6Mca5afj1' \
    --userId '2K2IzrBvvWm4udE0' \
    --body '{"inc": 0.6558767379908036}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XudXgNne8kJATwlc' \
    --userId '6esUp6Sw1I98jeZQ' \
    --additionalKey '7hfxnhLd3Knaknoe' \
    --body '{"additionalData": {"d9DHhLOqQGhCUr6i": {}, "TrjyEgarAdNJOIG3": {}, "6I6tRbRcrEveMdAd": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '62' \
    --statCodes 'PKDUVSC00PYeDcag' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ginxnFIna3yddcbs' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'DAILY' \
    --limit '15' \
    --name 'qOECohViHA5CzgFS' \
    --offset '50' \
    --sortBy 'pZaHCuESOiIZsMfB' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["E70CaunQNxot371W", "9G4AvQkqsGnmyo5J", "ZH3mtgWgU4pCAKxe"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'JTUVmb8GEXFTlEME' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sFzYqwgK1Np5nodq' \
    --userIds 'pLm7FhJBNXzAFdO0' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5908071996359696, "statCode": "hqf6kiTdSGv2LFjA", "userId": "KY7CbgsWqFWZX7kP"}, {"inc": 0.44389852628706716, "statCode": "om8F9GLLTG8phc3n", "userId": "4iLoIllKlpO2pqiX"}, {"inc": 0.578806411546651, "statCode": "F3WGRaoQomSJC4Dd", "userId": "rKF7SUQPLG59e0k5"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8327543277373785, "statCode": "tX6wK7PpUlcIW32i", "userId": "K7MGt1ixY5rA1WoV"}, {"inc": 0.07365065611297072, "statCode": "JIePF8ZrQzP4zvtd", "userId": "xdbZUpd6FJtHJ1py"}, {"inc": 0.7624366337556376, "statCode": "wyKQLY6FEO65Rb3z", "userId": "7CYLM8IlsHqffnrf"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "sGlfPaZKBwa3Ddb6", "userId": "0ufPpzwj1QGIFmlV"}, {"statCode": "f4jvapseE9LN9bvh", "userId": "OrHflIOd6X3viLvt"}, {"statCode": "Ek4mTIpUA9gxo8SV", "userId": "38nEhoXmM2W7l6jH"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["MA2rG3nakopAywel", "u01nryEJ0NqoTow0", "qiOiC4j0iktm0ZPL"], "defaultValue": 0.1701572171254223, "description": "LOsp0LZ5njN86Hl8", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": true, "isPublic": true, "maximum": 0.28462644901643785, "minimum": 0.8395876432924811, "name": "n9d9lvccKMLhrTrc", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "E2ItBS3KtKZWe8ao", "tags": ["YhWV1qx8CzPML52f", "aXUr9Sk4lq2faBcA", "FzAyBME74HUtipUW"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'XXKlhvyH8paOJtxq' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '94' \
    --sortBy 'PpcVfRwNj547fH0X' \
    --statCodes 'rKEDpEY8VnocGAjc,i0V3tBf2jnHGKXph,n50c9tNLDljhZ2jx' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '54' \
    --sortBy 'RX3z46OCaGBeMfPl' \
    --statCodes 'Nos4yBRjrERHEonA,ZR8GmEu0q1p6QCyY,6vSkVFWdsbYuVEGV' \
    --tags 'xYheR3j5mNZ6vwv7,K8Asvt1j1Rx59hes,NWy2NvZ85DDKDAF8' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'KDsBZOuYQJ03BAHZ' \
    --statCodes '7c53q7akMpcmnnx6,RVBrop9v7aZK3h65,hbN15zfQSfQrtfF3' \
    --tags 'TQN0OcNDLr36vzoh,ZyjMQAg5mPYhrLTy,U8OhgfY9JQYGF4bY' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'XEcENx9xZlAchob4' \
    --namespace "$AB_NAMESPACE" \
    --userId '4lONDDwMvgI0HlyP' \
    --limit '90' \
    --offset '11' \
    --sortBy '7wZNiVsF6xG2mXEQ' \
    --statCodes 'dbzIVy8alncV7vWg' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'SHdfo07UctPErqxy' \
    --limit '78' \
    --offset '24' \
    --sortBy 'yOK06MqQBErxgjVB' \
    --statCodes 'ycvU4PbmRDcrg0Dj' \
    --tags 'QjBECXvea7H1m2lJ' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'FRZ3ZprZ60zMjhTH' \
    --body '[{"statCode": "eh94TSenE5hCFkIf"}, {"statCode": "5weqZ18MH57l2Zsr"}, {"statCode": "h90ETtYmGukz3Mnl"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rjcHp6B8Vj7rXFgD' \
    --additionalKey 'nDkdZ9bpjb1tdA3Q' \
    --statCodes 'hjCMW64f4XhIjSoT,B2NMKtezapPr2QEP,x3zTxBGtEJIYppuU' \
    --tags 'SsKoHw2hyd12uSE7,BEv3aevq6iohU1cg,4W1IS3Uv1BpWoJBa' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qdg2FHcunsS1lnaO' \
    --body '[{"inc": 0.8828560307982721, "statCode": "m9vqjhbeK2qN8g6x"}, {"inc": 0.8717752766807421, "statCode": "PyYDo5R3hLiD5sf5"}, {"inc": 0.3969892818621281, "statCode": "1JsxJNGmyt0SQDUD"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oWBZVGLlkUetzCAW' \
    --body '[{"inc": 0.036390224355742795, "statCode": "9x1aMjgGim51T107"}, {"inc": 0.7980838974082419, "statCode": "IZRZ7tZdIs0xf4cz"}, {"inc": 0.05249155686249807, "statCode": "t7zqmSKxOEQlVcx6"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GqsBq8vdhWVnuYLg' \
    --body '[{"statCode": "pZehK0G2nmyuViB9"}, {"statCode": "kRTcSQdTnNYGeAfY"}, {"statCode": "FG3wSkHKufBdS3ZO"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'okZB4cXnAXyuGz6L' \
    --userId 'lxHv8SwyagYvDJ3w' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '3UNgIGj2jZtEYT8s' \
    --userId 'IPSE1XXPzySa0sZo' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FS6xCOWMpyh9pMsQ' \
    --userId 'gb64ELbzDMwyo4nI' \
    --body '{"inc": 0.6941109813086678}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ysQdbufXjYnSoIFe' \
    --userId 'ouC2m38kXrDZWlGV' \
    --body '{"inc": 0.4938262271233014}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '9sJ4NpUtKp6M9I6n' \
    --userId 'EwnZhsjwJeGwaPSD' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"MZz95OYKiqaZD63x": {}, "e5rruJVfLGea0Ztl": {}, "zUcuHAXz0UV31Mfu": {}}, "additionalKey": "GaXsAuGsZaSHevO0", "statCode": "TQNEI3kfabxJWWSI", "updateStrategy": "MAX", "userId": "ECUo1NPpeFhUztXD", "value": 0.10241248207315612}, {"additionalData": {"B7n4C97uAPP8PATL": {}, "pUpxeJlsBJT6Hh3O": {}, "MjAjq2mK8lbSEEel": {}}, "additionalKey": "xnb5QxWG2HFnZlA6", "statCode": "HKWW4fI1IQcoBQEL", "updateStrategy": "INCREMENT", "userId": "rYQue84dwmbwFEnA", "value": 0.8260903438542138}, {"additionalData": {"aWsQJtRYoagRJK5P": {}, "X9UcOvhPyE11TRT2": {}, "SKseoe8VLie0LBa3": {}}, "additionalKey": "6KNzjf005CXNGehQ", "statCode": "2aTjTDfKFDXC7eGL", "updateStrategy": "MIN", "userId": "YhJDWh9YWqc0qgV6", "value": 0.06416440662069078}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '9yOfIMLds2DbPcao' \
    --statCode 'MdtRLTmSvTkQQgB7' \
    --userIds 'exYvmHMxr5hPCJJz,tJBg0tTJg46IewOX,E2AkCh3QIZsUf8lG' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'FXcmwTERHclOdxIw' \
    --additionalKey 'qejxe18rNdb8Otq6' \
    --statCodes 'j1mqUav7k05HAQlt,nSojV4jT65yclX2F,tAz0vJjFIYWOaNds' \
    --tags 'immkW2miH3xRHAKy,4QxZkaXZ7vmiEd0J,PxVyQpshaDwNqTbb' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'FMXAMfVXe0GZeMgs' \
    --additionalKey 'RsmH1EQrYmkPKTPO' \
    --body '[{"additionalData": {"lhTtSiZNCxuogFte": {}, "THJe4BhSSQkQD6Wm": {}, "Ot6D7ufFVTOhvQpf": {}}, "statCode": "bBke8aEdd36xj6wy", "updateStrategy": "OVERRIDE", "value": 0.23512266725376607}, {"additionalData": {"ltDxsbzxrlaKEfko": {}, "YjY2o6ouRW9UtNqu": {}, "wC3WgumrIz4NhGzt": {}}, "statCode": "Zpr4U4fwQIiLXgmR", "updateStrategy": "INCREMENT", "value": 0.22549434971953186}, {"additionalData": {"2xaOBdPF0JmX8qwU": {}, "1cTuHHPB5S3DvPRC": {}, "zBrVUxmDOj3cvRFa": {}}, "statCode": "TC11W0TGTCm4fZWu", "updateStrategy": "MAX", "value": 0.6608089204220432}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'yMvczgEpzZ3Fbtxf' \
    --additionalKey 'hcRC7IVYa6iZ5uFR' \
    --body '[{"additionalData": {"YNn3SHiWxF0YbuU5": {}, "ar5qTLWUCy0Afgc0": {}, "50XIZRW491e94mQj": {}}, "statCode": "VOOBnIWhunElqZUo"}, {"additionalData": {"dp3IhtCSHy1ei1fI": {}, "rPvfHnRN06EjRwEQ": {}, "lNapJRfk4f9Zcw1p": {}}, "statCode": "EHAyNFxcVTKuAQTG"}, {"additionalData": {"h5BxjWOozGoDtsUu": {}, "Yo5p8ED5QZAufwNa": {}, "8lzfjv9oYMXMjlVH": {}}, "statCode": "Y1AHwF3vGoav7MK0"}]' \
    > test.out 2>&1
eval_tap $? 92 'BulkResetUserStatItemValues' test.out

#- 93 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PcLnEkcokKwcQ0ba' \
    --userId 'DT9OyJ2h23GUS2am' \
    --additionalKey 'U7syGlElXdEAOrVS' \
    > test.out 2>&1
eval_tap $? 93 'DeleteUserStatItems2' test.out

#- 94 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nLocLVVYamQc4wcG' \
    --userId '5nDBLJoJHbiQ5duE' \
    --additionalKey '5p4cfs2E41cK8QTw' \
    --body '{"additionalData": {"iIAvxSvNDlmM5nQF": {}, "MGzs7fzjgyc44mEh": {}, "9tRk8knYSV30lnro": {}}, "updateStrategy": "INCREMENT", "value": 0.6412203171533929}' \
    > test.out 2>&1
eval_tap $? 94 'UpdateUserStatItemValue' test.out

#- 95 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"e8ae1Il4aAtEbu4I": {}, "jGdqthRxTjQ7gkZE": {}, "Y8rG0q0Q2Qd2JzRb": {}}, "additionalKey": "kF2I03dIjvBbA6bf", "statCode": "bYaJCJjfk2TUvn95", "updateStrategy": "INCREMENT", "userId": "tU6TDm5GloFSKWM1", "value": 0.06781494011958855}, {"additionalData": {"ym5ydC6p25xCWTqU": {}, "OYZENJ1QHZQxPRXH": {}, "7uxBJEECQE1li3Bg": {}}, "additionalKey": "7Jxc9pUnZmvhidwC", "statCode": "kZwqjYLfTiCO1NDB", "updateStrategy": "MIN", "userId": "jxW4pIDwdqXpmRmu", "value": 0.31425287921131007}, {"additionalData": {"9H9XyWI8bp8fQxRu": {}, "X91uYmtrHJbEGTUj": {}, "7YjERL1rEQG02zcc": {}}, "additionalKey": "A8wvLsWUNd6lPKvq", "statCode": "DejvqklTSvDwuOrP", "updateStrategy": "INCREMENT", "userId": "lzpiX0VuFpZum7iz", "value": 0.37812545229933114}]' \
    > test.out 2>&1
eval_tap $? 95 'BulkUpdateUserStatItem1' test.out

#- 96 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e7NPzjOa8E7wY76P' \
    --additionalKey 'xLv9HBEUe89AwEw1' \
    --statCodes 'HO4FnKtx4XLKAmlD,r19uJ3nq6VerzVCc,I8y3Cz0YqCKUh5RD' \
    --tags '9vNAp4jinFpnQ5xF,9wwbvMZyeDeRnVfP,Ua6xVVBcq3wZpFIY' \
    > test.out 2>&1
eval_tap $? 96 'PublicQueryUserStatItems2' test.out

#- 97 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eAg79HcLJXJ7mpVI' \
    --additionalKey '6eTYAjdPlCiQQC35' \
    --body '[{"additionalData": {"cj4KyOVgvnWbfRJt": {}, "sB7cUQZ2QUAxJrIN": {}, "PXppPNO3AfmXcgwC": {}}, "statCode": "3IN6tvKgLB9QmJIO", "updateStrategy": "MIN", "value": 0.17052262271874752}, {"additionalData": {"2hG0WKt4sUmanYxM": {}, "0UHZVNYzGMNIpWoS": {}, "LkUrfuf4U3WeYeA9": {}}, "statCode": "t2ENKKWrFtHIi1CM", "updateStrategy": "INCREMENT", "value": 0.5077600746241056}, {"additionalData": {"nS98QqftSjq7sn8y": {}, "reciPLfkVyyJsbGp": {}, "O6JgehDJxEN7JlZc": {}}, "statCode": "8LMq1o2jZWu4yA3r", "updateStrategy": "MIN", "value": 0.22135143658442347}]' \
    > test.out 2>&1
eval_tap $? 97 'BulkUpdateUserStatItem2' test.out

#- 98 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GqMX9FieeEssWEUl' \
    --userId '07bhwntCVqiYOJf5' \
    --additionalKey 'KwMZQjzvjSozv6CT' \
    --body '{"additionalData": {"RDl0zp9CzHFwinkB": {}, "Ni4gvqgl6TZ9TGVP": {}, "mv34h6T7EsufmfxK": {}}, "updateStrategy": "MIN", "value": 0.4483310988864727}' \
    > test.out 2>&1
eval_tap $? 98 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE