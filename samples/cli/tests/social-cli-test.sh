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
echo "1..99"

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
    --body '{"cycleType": "ANNUALLY", "description": "QG26yUZNmTBcvrbY", "end": "1985-08-27T00:00:00Z", "id": "wZtxFHyPLtI8ilby", "name": "DPUIj88cekdqCt81", "resetDate": 86, "resetDay": 54, "resetMonth": 68, "resetTime": "ktfIovmv9gsR5cJc", "seasonPeriod": 69, "start": "1991-04-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 29 'CreateStatCycle' test.out

#- 30 BulkGetStatCycle
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["sb392k6YmJFfRByj", "lBiuFM3FIoVk8T3G", "pAnkCmBUqg2SCnqn"]}' \
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
    --cycleId 'tX9y1aZSWMiVi10s' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 33 'GetStatCycle' test.out

#- 34 UpdateStatCycle
./ng net.accelbyte.sdk.cli.Main social updateStatCycle \
    --cycleId 'G6vxkfUcmqRRbceJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleType": "SEASONAL", "description": "i0EeDxOgBnhhqElI", "end": "1971-08-31T00:00:00Z", "name": "KlloeH0JT1yduat2", "resetDate": 43, "resetDay": 88, "resetMonth": 100, "resetTime": "R3biBfsu4jmsRE2w", "seasonPeriod": 82, "start": "1983-09-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateStatCycle' test.out

#- 35 DeleteStatCycle
./ng net.accelbyte.sdk.cli.Main social deleteStatCycle \
    --cycleId 'QAk4mqrxzTtuLl4X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteStatCycle' test.out

#- 36 BulkAddStats
./ng net.accelbyte.sdk.cli.Main social bulkAddStats \
    --cycleId 'lbGL8QOxtjzm8y2w' \
    --namespace "$AB_NAMESPACE" \
    --body '{"statCodes": ["NhmwoYZyI4EFZKBc", "YrCEAE7WIsfmx40N", "LRc6m8heKnWhzfe2"]}' \
    > test.out 2>&1
eval_tap $? 36 'BulkAddStats' test.out

#- 37 StopStatCycle
./ng net.accelbyte.sdk.cli.Main social stopStatCycle \
    --cycleId 'NubeoKFeIaFQCYoD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'StopStatCycle' test.out

#- 38 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PICpnduEEQlULdJz' \
    --userIds '4mnRBkMNxvvKgAT8' \
    > test.out 2>&1
eval_tap $? 38 'BulkFetchStatItems' test.out

#- 39 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2072593422443899, "statCode": "JrYq6hRkloqxM3gp", "userId": "wxcfMy9XzjjI5Ybs"}, {"inc": 0.5855707421112814, "statCode": "oADkzJEN2VHzih3b", "userId": "it0VWn3CO39PXDNx"}, {"inc": 0.31445948628705644, "statCode": "XgeO3FgkXhjDzaQY", "userId": "3snn2ZkP7cFdP43e"}]' \
    > test.out 2>&1
eval_tap $? 39 'BulkIncUserStatItem' test.out

#- 40 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9352307170056495, "statCode": "dC9XIBudfZgrbHDI", "userId": "Dm4hMzF4TxodenSr"}, {"inc": 0.7558294483300658, "statCode": "TvfqU0bfoMm5cTtF", "userId": "WbotQyXJRcQWsmqP"}, {"inc": 0.6392875552519923, "statCode": "s92epxk0i8VxsZNe", "userId": "reSvf9699mCEHThU"}]' \
    > test.out 2>&1
eval_tap $? 40 'BulkIncUserStatItemValue' test.out

#- 41 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JkETAsSp7gh4TeUT' \
    --userIds 'kOkAYfJB8AT9t4Tv,207Y2QD3oD5fLCr3,OOlXVv8ZGF7uYnGz' \
    > test.out 2>&1
eval_tap $? 41 'BulkFetchOrDefaultStatItems' test.out

#- 42 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "pipNDigNJma1Mbqq", "userId": "ZtfNWql4nmwAft4g"}, {"statCode": "qkNNlWkD9eOziYRF", "userId": "On0jJLHC9LxhvNXT"}, {"statCode": "wGBCtohLtl9Zuhyt", "userId": "m5UDrT6QXCs5SPBb"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkResetUserStatItem' test.out

#- 43 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --cycleIds 'RPZTF6oQAXVG7tns' \
    --isGlobal  \
    --isPublic  \
    --limit '12' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 43 'GetStats' test.out

#- 44 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["gXjvyGJPN4eXbJE5", "Vs2GcyomQoIXimBJ", "ehyxlNsjUgxBkF6w"], "cycleOverrides": [{"cycleId": "FPoJeQediogEhhM2", "maximum": 0.28292168216448643, "minimum": 0.5519187890438363}, {"cycleId": "izGdKvOPdq5xrgxS", "maximum": 0.20024791841532885, "minimum": 0.39927947554987975}, {"cycleId": "1DN9LFkYW5DQyj4b", "maximum": 0.1493656822084305, "minimum": 0.9215884839002186}], "defaultValue": 0.7008037581789699, "description": "o2ogaKt2ujQSa3Zd", "globalAggregationMethod": "LAST", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.19835491899032331, "minimum": 0.3949463209979448, "name": "0Zp6iIaTIKUkmkk9", "setAsGlobal": true, "setBy": "SERVER", "statCode": "nb76tFkEORV3bu1b", "tags": ["NCtX7W40V6Do5sYa", "DXuNFviMarv8mnfH", "dCCFrHHC3DpZxkrQ"], "visibility": "SHOWALL"}' \
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
    --limit '97' \
    --offset '59' \
    --keyword 'd3DlhLuIpomM8sm1' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MiaI1mX2tJoARtdb' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Be7udsMrok0WvGYY' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nx4V709xbnGezKsD' \
    --body '{"capCycleOverride": true, "cycleIds": ["ZpjvsugAOS7u8RiW", "H24T805tVg8JqU0j", "yerCSa8SRgwsAj1i"], "cycleOverrides": [{"cycleId": "k1jglaDXTvKCWwNT", "maximum": 0.422660196252412, "minimum": 0.12713480198062088}, {"cycleId": "d2wrS0uPdjhdinpn", "maximum": 0.10228951106599649, "minimum": 0.9333933028392105}, {"cycleId": "BLy8wbhMssAHjapI", "maximum": 0.17726375362031255, "minimum": 0.8122441258875425}], "defaultValue": 0.9898263565785143, "description": "Rf4wP57dBZNR88Yb", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "isPublic": true, "name": "pdONneAczbBdHb2s", "tags": ["CnPb71ORYcmQbTU5", "JX8ccLjMXJRk0eaK", "lt71B1SmZp2JZp50"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DOJvrTefglSs6g4i' \
    --limit '42' \
    --offset '74' \
    --sortBy '02aCNYIWekp18lOC' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '3mNqF7Bl0LcghVHf' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'PEspxwhRON0bc1eM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEIjowLqc3ecjXJb' \
    --isPublic  \
    --limit '30' \
    --offset '61' \
    --sortBy 'bBEG8X645xpdXpai' \
    --statCodes '0rYaT5hOPjaf3H0t' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'YighU0VUfcYHJbBf' \
    --isPublic  \
    --limit '54' \
    --offset '4' \
    --sortBy 'KSiPW3VgsZXiR1DJ' \
    --statCodes '7HVWqMkNSawQUWDF' \
    --tags 'JvJBWic7UkBeIXuq' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'DuAXI66bQ71w0deo' \
    --body '[{"statCode": "V9Lx5RDA1l2Xcrci"}, {"statCode": "YNEzvSZIPkhSgORc"}, {"statCode": "z5S5BvmgBLxh4ijF"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'nE3Tam69qSZ7PC6f' \
    --body '[{"inc": 0.9400821818564666, "statCode": "QkmZXElW9YfRSse6"}, {"inc": 0.4274383669678242, "statCode": "Az3S4czz0QKFlAVm"}, {"inc": 0.7585503528797803, "statCode": "Lu4AOec0z8eBeeoi"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'p68J1nsv4W2OJhta' \
    --body '[{"inc": 0.08971603859038635, "statCode": "xMSJlHeb34sZKHcl"}, {"inc": 0.9209923590847402, "statCode": "LLLOexL4fZvWtND2"}, {"inc": 0.31569708491266013, "statCode": "cBFpX8lNtFEJ7tnk"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Y6Mca5afj12K2Izr' \
    --body '[{"statCode": "BvvWm4udE0OXudXg"}, {"statCode": "Nne8kJATwlc6esUp"}, {"statCode": "6Sw1I98jeZQ7hfxn"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hLd3Knaknoed9DHh' \
    --userId 'LOqQGhCUr6iTrjyE' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'garAdNJOIG36I6tR' \
    --userId 'bRcrEveMdAdiPKDU' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VSC00PYeDcagginx' \
    --userId 'nFIna3yddcbsPheT' \
    --body '{"inc": 0.5455204059662524}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '26IUJNvYuGRUvpZa' \
    --userId 'HCuESOiIZsMfB4ZH' \
    --additionalKey '3mtgWgU4pCAKxeE7' \
    --body '{"additionalData": {"0CaunQNxot371W9G": {}, "4AvQkqsGnmyo5JJT": {}, "UVmb8GEXFTlEMEsF": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '16' \
    --statCodes 'YqwgK1Np5nodqpLm' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '7FhJBNXzAFdO0Khq' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '34' \
    --name '6kiTdSGv2LFjAKY7' \
    --offset '58' \
    --sortBy 'zRmDD0jJvlfV5Oem' \
    --status 'STOPPED' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["WGRaoQomSJC4DdrK", "F9GLLTG8phc3n4iL", "oIllKlpO2pqiXJF3"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'F7SUQPLG59e0k5Zt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X6wK7PpUlcIW32iK' \
    --userIds '7MGt1ixY5rA1WoVe' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5719335269747439, "statCode": "IePF8ZrQzP4zvtdx", "userId": "dbZUpd6FJtHJ1pyV"}, {"inc": 0.3626168861703444, "statCode": "yKQLY6FEO65Rb3z7", "userId": "CYLM8IlsHqffnrfs"}, {"inc": 0.5192439624029966, "statCode": "lfPaZKBwa3Ddb60u", "userId": "fPpzwj1QGIFmlVf4"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.16005552346134255, "statCode": "vapseE9LN9bvhOrH", "userId": "flIOd6X3viLvtEk4"}, {"inc": 0.19524199918195917, "statCode": "TIpUA9gxo8SV38nE", "userId": "hoXmM2W7l6jHMA2r"}, {"inc": 0.5299632339050114, "statCode": "3nakopAywelu01nr", "userId": "yEJ0NqoTow0qiOiC"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "4j0iktm0ZPLkLOsp", "userId": "0LZ5njN86Hl8kUXz"}, {"statCode": "t6bSc6bWvgpVyW9d", "userId": "D1kOmvrAejcq2Lgk"}, {"statCode": "QuaS7RBx3vim02jB", "userId": "OxrZDyvpcLYOWA8N"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"capCycleOverride": false, "cycleIds": ["xqMPpcVfRwNj547f", "cAXXKlhvyH8paOJt", "2faXUr9Sk4lq2faB"], "cycleOverrides": [{"cycleId": "H0XrKEDpEY8VnocG", "maximum": 0.42948707340141545, "minimum": 0.14969447940092295}, {"cycleId": "ci0V3tBf2jnHGKXp", "maximum": 0.11887405254403627, "minimum": 0.2157839438662068}, {"cycleId": "50c9tNLDljhZ2jxL", "maximum": 0.6960989983003227, "minimum": 0.8008065674014959}], "defaultValue": 0.8881282486098104, "description": "z46OCaGBeMfPlNos", "globalAggregationMethod": "TOTAL", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.1468829528915243, "minimum": 0.28043854670283297, "name": "ERHEonAZR8GmEu0q", "setAsGlobal": false, "setBy": "SERVER", "statCode": "6WQ5UBEU1QAOHfZi", "tags": ["huxaEc7M4P7UckSC", "PV87pna08gxefTYK", "GhxOdcuDXSxSc3aZ"], "visibility": "SERVERONLY"}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'DAF8KDsBZOuYQJ03' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '9' \
    --sortBy 'AHZ7c53q7akMpcmn' \
    --statCodes 'nx6RVBrop9v7aZK3,h65hbN15zfQSfQrt,fF3TQN0OcNDLr36v' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '57' \
    --sortBy 'ohZyjMQAg5mPYhrL' \
    --statCodes 'TyU8OhgfY9JQYGF4,bYXEcENx9xZlAcho,b44lONDDwMvgI0Hl' \
    --tags 'yPR7wZNiVsF6xG2m,XEQdbzIVy8alncV7,vWgSHdfo07UctPEr' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'qxyMyOK06MqQBErx' \
    --statCodes 'gjVBycvU4PbmRDcr,g0DjQjBECXvea7H1,m2lJFRZ3ZprZ60zM' \
    --tags 'jhTHeh94TSenE5hC,FkIf5weqZ18MH57l,2Zsrh90ETtYmGukz' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId '3MnlrjcHp6B8Vj7r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XFgDnDkdZ9bpjb1t' \
    --limit '6' \
    --offset '0' \
    --sortBy 'A3QhjCMW64f4XhIj' \
    --statCodes 'SoTB2NMKtezapPr2' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'QEPx3zTxBGtEJIYp' \
    --limit '31' \
    --offset '8' \
    --sortBy 'uUSsKoHw2hyd12uS' \
    --statCodes 'E7BEv3aevq6iohU1' \
    --tags 'cg4W1IS3Uv1BpWoJ' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Baqdg2FHcunsS1ln' \
    --body '[{"statCode": "aO2m9vqjhbeK2qN8"}, {"statCode": "g6x2PyYDo5R3hLiD"}, {"statCode": "5sf5y1JsxJNGmyt0"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SQDUDoWBZVGLlkUe' \
    --additionalKey 'tzCAWc9x1aMjgGim' \
    --statCodes '51T107XIZRZ7tZdI,s0xf4czdt7zqmSKx,OEQlVcx6GqsBq8vd' \
    --tags 'hWVnuYLgpZehK0G2,nmyuViB9kRTcSQdT,nNYGeAfYFG3wSkHK' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ufBdS3ZOokZB4cXn' \
    --body '[{"inc": 0.43401637744370924, "statCode": "XyuGz6LlxHv8Swya"}, {"inc": 0.09886936280205294, "statCode": "YvDJ3w3UNgIGj2jZ"}, {"inc": 0.32096327409851166, "statCode": "EYT8sIPSE1XXPzyS"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a0sZoFS6xCOWMpyh' \
    --body '[{"inc": 0.9957312201544063, "statCode": "pMsQgb64ELbzDMwy"}, {"inc": 0.23561639097982312, "statCode": "4nIRysQdbufXjYnS"}, {"inc": 0.23051266922816183, "statCode": "IFeouC2m38kXrDZW"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lGVE9sJ4NpUtKp6M' \
    --body '[{"statCode": "9I6nEwnZhsjwJeGw"}, {"statCode": "aPSDMZz95OYKiqaZ"}, {"statCode": "D63xe5rruJVfLGea"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '0ZtlzUcuHAXz0UV3' \
    --userId '1MfuGaXsAuGsZaSH' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'evO0TQNEI3kfabxJ' \
    --userId 'WWSI1ECUo1NPpeFh' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UztXDgB7n4C97uAP' \
    --userId 'P8PATLpUpxeJlsBJ' \
    --body '{"inc": 0.7397714696435936}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '6Hh3OMjAjq2mK8lb' \
    --userId 'SEEelxnb5QxWG2HF' \
    --body '{"inc": 0.21969228946333352}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZlA6HKWW4fI1IQco' \
    --userId 'BQELcNlZkqTZrKgX' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"Nwvm4e5GX6H742Oi": {}, "xhtAoKiVm6URT95X": {}, "hnUcvWB28Mpusuhh": {}}, "additionalKey": "DJ5slzgiWZEtyd56", "statCode": "LfxnbY97jjYgXchC", "updateStrategy": "INCREMENT", "userId": "C7eGL5YhJDWh9YWq", "value": 0.04212590113688652}, {"additionalData": {"0qgV6d9yOfIMLds2": {}, "DbPcaoMdtRLTmSvT": {}, "kQQgB7exYvmHMxr5": {}}, "additionalKey": "hPCJJztJBg0tTJg4", "statCode": "6IewOXE2AkCh3QIZ", "updateStrategy": "MIN", "userId": "0kg16yUSpSOAjHJW", "value": 0.36562365032915967}, {"additionalData": {"fCjYwWkLob9gKLqs": {}, "2nEZhpByfHZinxNf": {}, "gPAwkMBsznlBUqnL": {}}, "additionalKey": "T4AbGptKaWNvPbpg", "statCode": "7yrRvXfZ6rvgvEY3", "updateStrategy": "INCREMENT", "userId": "AKy4QxZkaXZ7vmiE", "value": 0.05947269991860793}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '0JPxVyQpshaDwNqT' \
    --statCode 'bbFMXAMfVXe0GZeM' \
    --userIds 'gsRsmH1EQrYmkPKT,POlhTtSiZNCxuogF,teTHJe4BhSSQkQD6' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'WmOt6D7ufFVTOhvQ' \
    --additionalKey 'pfbBke8aEdd36xj6' \
    --statCodes 'wySoltDxsbzxrlaK,EfkoYjY2o6ouRW9U,tNquwC3WgumrIz4N' \
    --tags 'hGztZpr4U4fwQIiL,XgmRasvjO4lj8m3X,EwP2b4gd3xOeii8J' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'nmssep2xD2NY0kAB' \
    --additionalKey 'eGs9yxahld1pO0Gy' \
    --body '[{"additionalData": {"f5PO3COyMvczgEpz": {}, "Z3FbtxfhcRC7IVYa": {}, "6iZ5uFRYNn3SHiWx": {}}, "statCode": "F0YbuU5ar5qTLWUC", "updateStrategy": "OVERRIDE", "value": 0.7082167033426856}, {"additionalData": {"rbk6C2cVWf6ttvbU": {}, "1PO6ApCD2VXidT7w": {}, "0Oc15N8WXBPp17PA": {}}, "statCode": "ewqSm5x3B4t7WQnp", "updateStrategy": "MAX", "value": 0.1497089244388432}, {"additionalData": {"XZedgt5cyNe27HLt": {}, "wtVOaxgP6Jbct8pu": {}, "MybYGxD9IPmmsLmu": {}}, "statCode": "3kaPj0O4zd8Tb7cU", "updateStrategy": "MIN", "value": 0.5218718248961778}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId 'PTBxiFFCrn7djjs6' \
    --additionalKey '9FTFVGUVhvKhJCme' \
    --body '{"statCodes": ["isql14mUHVbMPimN", "kiFAamqvZI2KwjqP", "hcZsU3VAdMDcb4ql"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'BiWXade41s3rH34m' \
    --additionalKey 'B2yPlRpWjmHZAAvK' \
    --body '[{"additionalData": {"TH8MuqIg0Czkguwu": {}, "JCW7EEFB67AODbi9": {}, "BzupBsFpYc77GtRU": {}}, "statCode": "cCFeY5g4XgBsbfzq"}, {"additionalData": {"xBPNe8ae1Il4aAtE": {}, "bu4IjGdqthRxTjQ7": {}, "gkZEY8rG0q0Q2Qd2": {}}, "statCode": "JzRbkF2I03dIjvBb"}, {"additionalData": {"A6bfbYaJCJjfk2TU": {}, "vn95FhO7VW3mbDVM": {}, "Du87t0ldWf7iSGIi": {}}, "statCode": "KFtWtn4Yr2svKM6p"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qLGZ0TBujELAUK6m' \
    --userId 'Q5iZgbwwm5iGzXtc' \
    --additionalKey 'knrgidKupvXO6aj4' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hCmTC34jxW4pIDwd' \
    --userId 'qXpmRmut9H9XyWI8' \
    --additionalKey 'bp8fQxRuX91uYmtr' \
    --body '{"additionalData": {"HJbEGTUj7YjERL1r": {}, "EQG02zccA8wvLsWU": {}, "Nd6lPKvqDejvqklT": {}}, "updateStrategy": "INCREMENT", "value": 0.3402656093317026}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"DwuOrP9lzpiX0VuF": {}, "pZum7izxe7NPzjOa": {}, "8E7wY76PxLv9HBEU": {}}, "additionalKey": "e89AwEw1HO4FnKtx", "statCode": "4XLKAmlDr19uJ3nq", "updateStrategy": "MAX", "userId": "erzVCcI8y3Cz0YqC", "value": 0.5877901505078305}, {"additionalData": {"Uh5RD9vNAp4jinFp": {}, "nQ5xF9wwbvMZyeDe": {}, "RnVfPUa6xVVBcq3w": {}}, "additionalKey": "ZpFIYeAg79HcLJXJ", "statCode": "7mpVI6eTYAjdPlCi", "updateStrategy": "OVERRIDE", "userId": "SpWBAetsanzqP8ox", "value": 0.09481599602593327}, {"additionalData": {"rtbECD1CYPwaiBAx": {}, "fYL8Avt70ZUT2fSk": {}, "3LL0calqxEewuGS4": {}}, "additionalKey": "69k2hG0WKt4sUman", "statCode": "YxM0UHZVNYzGMNIp", "updateStrategy": "MAX", "userId": "IdhevfZvyV7Acodc", "value": 0.8259520754144503}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wKjYDdmJOlzwm9Su' \
    --additionalKey '4FnS98QqftSjq7sn' \
    --statCodes '8yreciPLfkVyyJsb,GpO6JgehDJxEN7Jl,Zc8LMq1o2jZWu4yA' \
    --tags '3r0u4q1bTHXIjfJK,yFlM0u1uuoVdn9yV,oSlKNchPHNL4X3LL' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'aGPGdqLE8Sohhhui' \
    --additionalKey 'TnJarYYkHBDdSzBX' \
    --body '[{"additionalData": {"dxapwhd5IQYBQuxL": {}, "vPuWYvE3fsNy9Z9O": {}, "hxXvCp9y7fLD2qfC": {}}, "statCode": "XnlUnqxT1WsRNMZc", "updateStrategy": "OVERRIDE", "value": 0.6665634139722615}, {"additionalData": {"hMDFzjHZ3sIhzOx2": {}, "CXKlvIomU3pIxM9n": {}, "8D2eLMe3lt9qfx2U": {}}, "statCode": "DcgVE7L9FK6e0MrP", "updateStrategy": "INCREMENT", "value": 0.003865971529527168}, {"additionalData": {"MYvNQOsDa4bkcgep": {}, "qtxjbrztee7QLTGA": {}, "ak7Kaol01DK97D2x": {}}, "statCode": "nik42miteR5eQAe1", "updateStrategy": "MIN", "value": 0.8615295470392992}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'MWVTHG0qHJCWEfOJ' \
    --userId 'pZm9yEYWNGMy2pgS' \
    --additionalKey 'GSUOK68eqGJtWf1Y' \
    --body '{"additionalData": {"bgg8rdwY9bmrvHmO": {}, "07KNqX9LM2IwEsdO": {}, "GBXBwnzDX8v3xgC1": {}}, "updateStrategy": "INCREMENT", "value": 0.6917685790965827}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE