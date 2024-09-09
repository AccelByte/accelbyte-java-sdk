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
    --body '{"cycleIds": ["pAnkCmBUqg2SCnqn", "sb392k6YmJFfRByj", "lBiuFM3FIoVk8T3G"]}' \
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
    --body '{"cycleIds": ["E5Vs2GcyomQoIXim", "5QgXjvyGJPN4eXbJ", "BJehyxlNsjUgxBkF"], "defaultValue": 0.9381333499118298, "description": "wFPoJeQediogEhhM", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": false, "maximum": 0.40395239514169357, "minimum": 0.5169368445903353, "name": "dKvOPdq5xrgxSmy1", "setAsGlobal": true, "setBy": "SERVER", "statCode": "N9LFkYW5DQyj4bj5", "tags": ["IKUkmkk9QM0NBMA9", "Ro2ogaKt2ujQSa3Z", "db65UXmy0Zp6iIaT"]}' \
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
    --limit '82' \
    --offset '40' \
    --keyword 'RxpzwLR2AK6eXUGP' \
    > test.out 2>&1
eval_tap $? 47 'QueryStats' test.out

#- 48 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Jsw1fiP80G9Pclxc' \
    > test.out 2>&1
eval_tap $? 48 'GetStat' test.out

#- 49 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ft2ulIJzPyrVEiOG' \
    > test.out 2>&1
eval_tap $? 49 'DeleteStat' test.out

#- 50 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '4UcqsuGKHhMRWLVd' \
    --body '{"cycleIds": ["iaI1mX2tJoARtdbB", "3DlhLuIpomM8sm1M", "e7udsMrok0WvGYYn"], "defaultValue": 0.3817896258195451, "description": "4V709xbnGezKsDwG", "globalAggregationMethod": "MAX", "ignoreAdditionalDataOnValueRejected": false, "isPublic": true, "name": "nvYI9TVqJdvzcWbf", "tags": ["UpaXp5JMl5LL4bTx", "BmZjdrrIxsB0NRsB", "1fPqqRRulpqpymDk"]}' \
    > test.out 2>&1
eval_tap $? 50 'UpdateStat' test.out

#- 51 GetStatItems
./ng net.accelbyte.sdk.cli.Main social getStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QhtrHWwRVnwVBOqO' \
    --limit '68' \
    --offset '46' \
    --sortBy 'i8pWGd1juYhiqjRJ' \
    > test.out 2>&1
eval_tap $? 51 'GetStatItems' test.out

#- 52 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OqB5F93zFQbJndUD' \
    > test.out 2>&1
eval_tap $? 52 'DeleteTiedStat' test.out

#- 53 GetUserStatCycleItems
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems \
    --cycleId 'pdONneAczbBdHb2s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lt71B1SmZp2JZp50' \
    --isPublic  \
    --limit '59' \
    --offset '93' \
    --sortBy 'nPb71ORYcmQbTU5J' \
    --statCodes 'X8ccLjMXJRk0eaKQ' \
    > test.out 2>&1
eval_tap $? 53 'GetUserStatCycleItems' test.out

#- 54 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'DOJvrTefglSs6g4i' \
    --isPublic  \
    --limit '42' \
    --offset '74' \
    --sortBy '02aCNYIWekp18lOC' \
    --statCodes '3mNqF7Bl0LcghVHf' \
    --tags 'PEspxwhRON0bc1eM' \
    > test.out 2>&1
eval_tap $? 54 'GetUserStatItems' test.out

#- 55 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEIjowLqc3ecjXJb' \
    --body '[{"statCode": "ZDKKoxLE1Y3Dymtj"}, {"statCode": "3giPg4x4yiPX6ues"}, {"statCode": "1Hhhkg1yLVbLFzHE"}]' \
    > test.out 2>&1
eval_tap $? 55 'BulkCreateUserStatItems' test.out

#- 56 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'P8cM4NTwr0KHaAsm' \
    --body '[{"inc": 0.7339033146846644, "statCode": "ej52WKi6tArAURt9"}, {"inc": 0.25518285111490535, "statCode": "lCSVq8PdH6hJPUAc"}, {"inc": 0.8416320121496921, "statCode": "RVwXgAgntLMCuaXB"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkIncUserStatItem1' test.out

#- 57 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WQi6BqPg4xr0lCan' \
    --body '[{"inc": 0.04222523148014601, "statCode": "UZGCHsZYoLfR1KtO"}, {"inc": 0.3435770476186564, "statCode": "7Zy0b65uvuKNuy0y"}, {"inc": 0.30898738451212315, "statCode": "ZQ7M6Nzy1adnSKOL"}]' \
    > test.out 2>&1
eval_tap $? 57 'BulkIncUserStatItemValue1' test.out

#- 58 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FKx1dX4LuWJu3pDM' \
    --body '[{"statCode": "UAeeZ97SBROPYuG6"}, {"statCode": "XqP6oo7G73zdxTgO"}, {"statCode": "fnwIdlNa29fDLh74"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkResetUserStatItem1' test.out

#- 59 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '1IslKHzGlLKWUtDQ' \
    --userId 's61OQAoxyyQpRWCi' \
    > test.out 2>&1
eval_tap $? 59 'CreateUserStatItem' test.out

#- 60 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iPDGQhNPEwiJCf2X' \
    --userId 'JVrlzqQls1ozhLVA' \
    > test.out 2>&1
eval_tap $? 60 'DeleteUserStatItems' test.out

#- 61 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '3kE8jKvgatOEBM70' \
    --userId 'TdlNBJYOmpu1VCar' \
    --body '{"inc": 0.4109352733566277}' \
    > test.out 2>&1
eval_tap $? 61 'IncUserStatItemValue' test.out

#- 62 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BsV6xnZ5Jrzzjrca' \
    --userId 'ug6CWVG8SWP3glU6' \
    --additionalKey 'muswVJnNnN7kAa7j' \
    --body '{"additionalData": {"0riFc5HTHQIoVsGo": {}, "7dwV9DBqFKHQkETJ": {}, "yTlUrwDTnoujQD4I": {}}}' \
    > test.out 2>&1
eval_tap $? 62 'ResetUserStatItemValue' test.out

#- 63 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '47' \
    --statCodes 'iH9Z5qXn3aoRtlqO' \
    > test.out 2>&1
eval_tap $? 63 'GetGlobalStatItems1' test.out

#- 64 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ECohViHA5CzgFSy8' \
    > test.out 2>&1
eval_tap $? 64 'GetGlobalStatItemByStatCode1' test.out

#- 65 GetStatCycles1
./ng net.accelbyte.sdk.cli.Main social getStatCycles1 \
    --namespace "$AB_NAMESPACE" \
    --cycleType 'ANNUALLY' \
    --limit '69' \
    --name 'A3PrIfapq5AAeMe4' \
    --offset '76' \
    --sortBy 'mtgWgU4pCAKxeE70' \
    --status 'INIT' \
    > test.out 2>&1
eval_tap $? 65 'GetStatCycles1' test.out

#- 66 BulkGetStatCycle1
./ng net.accelbyte.sdk.cli.Main social bulkGetStatCycle1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["sYIIZxiXNMR9BgaW", "xUMkawaGpAyrIwMi", "cFX3SUBhyoTsMWPA"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetStatCycle1' test.out

#- 67 GetStatCycle1
./ng net.accelbyte.sdk.cli.Main social getStatCycle1 \
    --cycleId 'f3BOdkocVTd4BxqG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetStatCycle1' test.out

#- 68 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WV6mTJ0sQs6XNbjv' \
    --userIds 'qhnUVLWu8olKdxL6' \
    > test.out 2>&1
eval_tap $? 68 'BulkFetchStatItems1' test.out

#- 69 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2405786324693695, "statCode": "zRmDD0jJvlfV5Oem", "userId": "PYdYT7DROCjtuzFM"}, {"inc": 0.018960425495917588, "statCode": "AG9YI89hmguB8FOT", "userId": "jMLo4b9rIzqYkEps"}, {"inc": 0.30936986925911714, "statCode": "yVTBcrM8rG0rH0zc", "userId": "swwVeMK6MbGIVIu8"}]' \
    > test.out 2>&1
eval_tap $? 69 'PublicBulkIncUserStatItem' test.out

#- 70 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3426061312085511, "statCode": "vwLc7KY3uVoJXTIM", "userId": "tpgkieDyF97lGdMi"}, {"inc": 0.5335862102574026, "statCode": "KxbWCYzo8yO2KTK9", "userId": "tmmOnYnOpas6ghP1"}, {"inc": 0.39961345949420046, "statCode": "4Zi7s7QBlk44Z44B", "userId": "1GZgKg4uKxaCgcGL"}]' \
    > test.out 2>&1
eval_tap $? 70 'PublicBulkIncUserStatItemValue' test.out

#- 71 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "uC3brWdTYCfHkIyS", "userId": "ok5DiXZtLW87rGys"}, {"statCode": "ryod3dNQrmsApRA6", "userId": "HX3RwrKt2ecozL0T"}, {"statCode": "Og54vCE48L5oLF6M", "userId": "4lNa4JUMSHNgqRqC"}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkResetUserStatItem2' test.out

#- 72 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"cycleIds": ["9uSybRzWek2gZvRr", "o95HgXqKhTPkwfLM", "V7usamANkZlOX9Sf"], "defaultValue": 0.3435257406244663, "description": "r0n9d9lvccKMLhrT", "globalAggregationMethod": "MIN", "ignoreAdditionalDataOnValueRejected": true, "incrementOnly": false, "isPublic": true, "maximum": 0.17729018246621575, "minimum": 0.651110722653946, "name": "mvrAejcq2LgkQuaS", "setAsGlobal": true, "setBy": "SERVER", "statCode": "Bx3vim02jBOxrZDy", "tags": ["ok4nOOCzfsflhjbn", "vpcLYOWA8NjxOnaE", "gJOUn18G5MlfDTk8"]}' \
    > test.out 2>&1
eval_tap $? 72 'CreateStat1' test.out

#- 73 PublicListMyStatCycleItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatCycleItems \
    --cycleId 'aG40NlncceIZSwgA' \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '61' \
    --sortBy 'kgzh4pTU0Am4DZhl' \
    --statCodes '0bQxFJ3sWCqQpQ2F,bKPFMycMSQ4qfAac,R0LgB5BUXvjcu2s6' \
    > test.out 2>&1
eval_tap $? 73 'PublicListMyStatCycleItems' test.out

#- 74 PublicListMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '47' \
    --offset '50' \
    --sortBy 'VifnKqmTSoGH1XEf' \
    --statCodes 'Y6QAYn6WQ5UBEU1Q,AOHfZiGhxOdcuDXS,xSc3aZPV87pna08g' \
    --tags 'xefTYKhuxaEc7M4P,7UckSC6ePeN8i4Gr,FES9z7xueHpATHcc' \
    > test.out 2>&1
eval_tap $? 74 'PublicListMyStatItems' test.out

#- 75 PublicListAllMyStatItems
./ng net.accelbyte.sdk.cli.Main social publicListAllMyStatItems \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'ee9GXhKcjmSEwdrk' \
    --statCodes 'EnnqKzFsLfYalUlf,wEQKjU7eHGebSVu0,LQ40kepEaC4dfiOM' \
    --tags 'ZfEhHr39pysFO3Zv,c1BZG99LyvfvHEsJ,KQQewVLMUoAnaRcY' \
    > test.out 2>&1
eval_tap $? 75 'PublicListAllMyStatItems' test.out

#- 76 GetUserStatCycleItems1
./ng net.accelbyte.sdk.cli.Main social getUserStatCycleItems1 \
    --cycleId 'p7FUjfIGaffoflEI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ByYqeKN0meGelYF5' \
    --limit '46' \
    --offset '97' \
    --sortBy 'WaDhukU4khGG4vZF' \
    --statCodes 'TYnPkmSu4PWam1jx' \
    > test.out 2>&1
eval_tap $? 76 'GetUserStatCycleItems1' test.out

#- 77 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'R7SETWjteoc8fgvZ' \
    --limit '60' \
    --offset '61' \
    --sortBy 'PbmRDcrg0DjQjBEC' \
    --statCodes 'Xvea7H1m2lJFRZ3Z' \
    --tags 'prZ60zMjhTHeh94T' \
    > test.out 2>&1
eval_tap $? 77 'PublicQueryUserStatItems' test.out

#- 78 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'SenE5hCFkIf5weqZ' \
    --body '[{"statCode": "18MH57l2Zsrh90ET"}, {"statCode": "tYmGukz3MnlrjcHp"}, {"statCode": "6B8Vj7rXFgDnDkdZ"}]' \
    > test.out 2>&1
eval_tap $? 78 'PublicBulkCreateUserStatItems' test.out

#- 79 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9bpjb1tdA3QhjCMW' \
    --additionalKey '64f4XhIjSoTB2NMK' \
    --statCodes 'tezapPr2QEPx3zTx,BGtEJIYppuUSsKoH,w2hyd12uSE7BEv3a' \
    --tags 'evq6iohU1cg4W1IS,3Uv1BpWoJBaqdg2F,HcunsS1lnaO2m9vq' \
    > test.out 2>&1
eval_tap $? 79 'PublicQueryUserStatItems1' test.out

#- 80 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jhbeK2qN8g6x2PyY' \
    --body '[{"inc": 0.4837968379117469, "statCode": "o5R3hLiD5sf5y1Js"}, {"inc": 0.3787840863918154, "statCode": "JNGmyt0SQDUDoWBZ"}, {"inc": 0.7710287560964028, "statCode": "GLlkUetzCAWc9x1a"}]' \
    > test.out 2>&1
eval_tap $? 80 'PublicBulkIncUserStatItem1' test.out

#- 81 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MjgGim51T107XIZR' \
    --body '[{"inc": 0.8330548168862439, "statCode": "7tZdIs0xf4czdt7z"}, {"inc": 0.2634451778263246, "statCode": "mSKxOEQlVcx6GqsB"}, {"inc": 0.26724186836380504, "statCode": "8vdhWVnuYLgpZehK"}]' \
    > test.out 2>&1
eval_tap $? 81 'BulkIncUserStatItemValue2' test.out

#- 82 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '0G2nmyuViB9kRTcS' \
    --body '[{"statCode": "QdTnNYGeAfYFG3wS"}, {"statCode": "kHKufBdS3ZOokZB4"}, {"statCode": "cXnAXyuGz6LlxHv8"}]' \
    > test.out 2>&1
eval_tap $? 82 'BulkResetUserStatItem3' test.out

#- 83 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'SwyagYvDJ3w3UNgI' \
    --userId 'Gj2jZtEYT8sIPSE1' \
    > test.out 2>&1
eval_tap $? 83 'PublicCreateUserStatItem' test.out

#- 84 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XXPzySa0sZoFS6xC' \
    --userId 'OWMpyh9pMsQgb64E' \
    > test.out 2>&1
eval_tap $? 84 'DeleteUserStatItems1' test.out

#- 85 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LbzDMwyo4nIRysQd' \
    --userId 'bufXjYnSoIFeouC2' \
    --body '{"inc": 0.2002420292912006}' \
    > test.out 2>&1
eval_tap $? 85 'PublicIncUserStatItem' test.out

#- 86 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '38kXrDZWlGVE9sJ4' \
    --userId 'NpUtKp6M9I6nEwnZ' \
    --body '{"inc": 0.12553522765828617}' \
    > test.out 2>&1
eval_tap $? 86 'PublicIncUserStatItemValue' test.out

#- 87 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sjwJeGwaPSDMZz95' \
    --userId 'OYKiqaZD63xe5rru' \
    > test.out 2>&1
eval_tap $? 87 'ResetUserStatItemValue1' test.out

#- 88 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"JVfLGea0ZtlzUcuH": {}, "AXz0UV31MfuGaXsA": {}, "uGsZaSHevO0TQNEI": {}}, "additionalKey": "3kfabxJWWSI1ECUo", "statCode": "1NPpeFhUztXDgB7n", "updateStrategy": "MAX", "userId": "C97uAPP8PATLpUpx", "value": 0.06529670825040523}, {"additionalData": {"JlsBJT6Hh3OMjAjq": {}, "2mK8lbSEEelxnb5Q": {}, "xWG2HFnZlA6HKWW4": {}}, "additionalKey": "fI1IQcoBQELcNlZk", "statCode": "qTZrKgXNwvm4e5GX", "updateStrategy": "MIN", "userId": "742OixhtAoKiVm6U", "value": 0.7009993203950355}, {"additionalData": {"T95XhnUcvWB28Mpu": {}, "suhhDJ5slzgiWZEt": {}, "yd56LfxnbY97jjYg": {}}, "additionalKey": "XchCbkXX26uEdCfQ", "statCode": "aMAQuTKfC0I2kNjC", "updateStrategy": "OVERRIDE", "userId": "Lds2DbPcaoMdtRLT", "value": 0.20521171807771532}]' \
    > test.out 2>&1
eval_tap $? 88 'BulkUpdateUserStatItemV2' test.out

#- 89 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'SvTkQQgB7exYvmHM' \
    --statCode 'xr5hPCJJztJBg0tT' \
    --userIds 'Jg46IewOXE2AkCh3,QIZsUf8lGFXcmwTE,RHclOdxIwqejxe18' \
    > test.out 2>&1
eval_tap $? 89 'BulkFetchOrDefaultStatItems1' test.out

#- 90 AdminListUsersStatItems
./ng net.accelbyte.sdk.cli.Main social adminListUsersStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'rNdb8Otq6j1mqUav' \
    --additionalKey '7k05HAQltnSojV4j' \
    --statCodes 'T65yclX2FtAz0vJj,FIYWOaNdsimmkW2m,iH3xRHAKy4QxZkaX' \
    --tags 'Z7vmiEd0JPxVyQps,haDwNqTbbFMXAMfV,Xe0GZeMgsRsmH1EQ' \
    > test.out 2>&1
eval_tap $? 90 'AdminListUsersStatItems' test.out

#- 91 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'rYmkPKTPOlhTtSiZ' \
    --additionalKey 'NCxuogFteTHJe4Bh' \
    --body '[{"additionalData": {"SSQkQD6WmOt6D7uf": {}, "FVTOhvQpfbBke8aE": {}, "dd36xj6wySoltDxs": {}}, "statCode": "bzxrlaKEfkoYjY2o", "updateStrategy": "MAX", "value": 0.3323245296287791}, {"additionalData": {"fwLYkqIgLuZS6hsQ": {}, "ryiEtOAbpeUNf26U": {}, "qkCfgCUYBn2xaOBd": {}}, "statCode": "PF0JmX8qwU1cTuHH", "updateStrategy": "MAX", "value": 0.43840634928490696}, {"additionalData": {"5S3DvPRCzBrVUxmD": {}, "Oj3cvRFaTC11W0TG": {}, "TCm4fZWuk6pQxDQp": {}}, "statCode": "KqxLGeMvr9TsvcMQ", "updateStrategy": "INCREMENT", "value": 0.0011654976139443551}]' \
    > test.out 2>&1
eval_tap $? 91 'BulkUpdateUserStatItem' test.out

#- 92 BulkGetOrDefaultByUserId
./ng net.accelbyte.sdk.cli.Main social bulkGetOrDefaultByUserId \
    --namespace "$AB_NAMESPACE" \
    --userId '6iZ5uFRYNn3SHiWx' \
    --additionalKey 'F0YbuU5ar5qTLWUC' \
    --body '{"statCodes": ["1e94mQjVOOBnIWhu", "y0Afgc050XIZRW49", "nElqZUodp3IhtCSH"]}' \
    > test.out 2>&1
eval_tap $? 92 'BulkGetOrDefaultByUserId' test.out

#- 93 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'y1ei1fIrPvfHnRN0' \
    --additionalKey '6EjRwEQlNapJRfk4' \
    --body '[{"additionalData": {"f9Zcw1pEHAyNFxcV": {}, "TKuAQTGh5BxjWOoz": {}, "GoDtsUuYo5p8ED5Q": {}}, "statCode": "ZAufwNa8lzfjv9oY"}, {"additionalData": {"MXMjlVHY1AHwF3vG": {}, "oav7MK0PcLnEkcok": {}, "KwcQ0baDT9OyJ2h2": {}}, "statCode": "3GUS2amU7syGlElX"}, {"additionalData": {"dEAOrVSnLocLVVYa": {}, "mQc4wcG5nDBLJoJH": {}, "biQ5duE5p4cfs2E4": {}}, "statCode": "1cK8QTwiIAvxSvND"}]' \
    > test.out 2>&1
eval_tap $? 93 'BulkResetUserStatItemValues' test.out

#- 94 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lmM5nQFMGzs7fzjg' \
    --userId 'yc44mEh9tRk8knYS' \
    --additionalKey 'V30lnroQehMDli6t' \
    > test.out 2>&1
eval_tap $? 94 'DeleteUserStatItems2' test.out

#- 95 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '9unQLYXxm09wpGAb' \
    --userId 'pEmDY9vLh3u6EDsU' \
    --additionalKey 'mrV6kH4OotKwG3UC' \
    --body '{"additionalData": {"6XCnnZxF8CmQr17W": {}, "65br34rBBN9tU6TD": {}, "m5GloFSKWM1eym5y": {}}, "updateStrategy": "INCREMENT", "value": 0.14467306032470983}' \
    > test.out 2>&1
eval_tap $? 95 'UpdateUserStatItemValue' test.out

#- 96 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"SGIiKFtWtn4Yr2sv": {}, "KM6pqLGZ0TBujELA": {}, "UK6mQ5iZgbwwm5iG": {}}, "additionalKey": "zXtcknrgidKupvXO", "statCode": "6aj4hCmTC34jxW4p", "updateStrategy": "OVERRIDE", "userId": "DwdqXpmRmut9H9Xy", "value": 0.7781473168767928}, {"additionalData": {"I8bp8fQxRuX91uYm": {}, "trHJbEGTUj7YjERL": {}, "1rEQG02zccA8wvLs": {}}, "additionalKey": "WUNd6lPKvqDejvqk", "statCode": "lTSvDwuOrP9lzpiX", "updateStrategy": "OVERRIDE", "userId": "uFpZum7izxe7NPzj", "value": 0.6558020679623522}, {"additionalData": {"a8E7wY76PxLv9HBE": {}, "Ue89AwEw1HO4FnKt": {}, "x4XLKAmlDr19uJ3n": {}}, "additionalKey": "q6VerzVCcI8y3Cz0", "statCode": "YqCKUh5RD9vNAp4j", "updateStrategy": "MAX", "userId": "oiIPp1yvfAHS0VgL", "value": 0.3362184768962113}]' \
    > test.out 2>&1
eval_tap $? 96 'BulkUpdateUserStatItem1' test.out

#- 97 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '11A3HTovFi4tPAGf' \
    --additionalKey 'leyCA6jEtcqsnzoV' \
    --statCodes 'ILjkwW61duF87aUy,rdt4XSpWBAetsanz,qP8oxfrtbECD1CYP' \
    --tags 'waiBAxfYL8Avt70Z,UT2fSk3LL0calqxE,ewuGS469k2hG0WKt' \
    > test.out 2>&1
eval_tap $? 97 'PublicQueryUserStatItems2' test.out

#- 98 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId '4sUmanYxM0UHZVNY' \
    --additionalKey 'zGMNIpWoSLkUrfuf' \
    --body '[{"additionalData": {"4U3WeYeA9t2ENKKW": {}, "rFtHIi1CMgKAOG5i": {}, "DcCR5PbCvDLil8wj": {}}, "statCode": "9cKM3Ar6MF35hCER", "updateStrategy": "OVERRIDE", "value": 0.21715671246784018}, {"additionalData": {"GmWGgTJfHlJl4tHG": {}, "a4XfZcd9CVnGqMX9": {}, "FieeEssWEUl07bhw": {}}, "statCode": "ntCVqiYOJf5KwMZQ", "updateStrategy": "MAX", "value": 0.6075874448423523}, {"additionalData": {"4X3LLaGPGdqLE8So": {}, "hhhuiTnJarYYkHBD": {}, "dSzBXdxapwhd5IQY": {}}, "statCode": "BQuxLvPuWYvE3fsN", "updateStrategy": "OVERRIDE", "value": 0.941077902857312}]' \
    > test.out 2>&1
eval_tap $? 98 'BulkUpdateUserStatItem2' test.out

#- 99 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QXmpZ9X3fUSR1l9x' \
    --userId 'LPBsmAUrD9L1IiD6' \
    --additionalKey 'MlcEPhMDFzjHZ3sI' \
    --body '{"additionalData": {"hzOx2CXKlvIomU3p": {}, "IxM9n8D2eLMe3lt9": {}, "qfx2UDcgVE7L9FK6": {}}, "updateStrategy": "INCREMENT", "value": 0.16529070472618634}' \
    > test.out 2>&1
eval_tap $? 99 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE