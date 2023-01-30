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
echo "1..78"

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
    --body '{"maxSlotSize": 16, "maxSlots": 89}' \
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
    --userId 'KtmFeu3o' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'vhSgv2WC' \
    --body '{"maxSlotSize": 100, "maxSlots": 9}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'rxeE5Sow' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'HubRHdL4' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '9K2IP2VU' \
    --userId 'LrmUzUlh' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '9uebCuMb' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '5E1oQAHJ' \
    --userId 'cba3M8nV' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'nAP7BXg3,H9wqJKm6,M2tTS7cR' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '4aB2Yl9i' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'LCR56g1C' \
    --body '{"achievements": ["LnWKv8Gt", "Br0lUCZD", "1lLO2SOP"], "attributes": {"0gWUU3uy": "5cyYNDvZ", "0jq50WVY": "3dNKDsmO", "EnmGG1Jg": "rnYIeGe5"}, "avatarUrl": "QywBNZLu", "inventories": ["sgZA2xso", "930bNkTF", "vxusUHYZ"], "label": "xwcuwH5C", "profileName": "hmT2F1v0", "statistics": ["5FpaGHhr", "5Ly3uPG3", "YoRVAykG"], "tags": ["hct3t9kP", "W0YEK2O8", "tHhbjNvW"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'rqoj3mY9' \
    --userId 'FQdpqbQy' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ySZDvMaA' \
    --userId 'QTMyI5jZ' \
    --body '{"achievements": ["E9p872Xb", "FFmxubVR", "7VoKTPcJ"], "attributes": {"xduF3p9Z": "MvB7xVwl", "4miYlE9m": "51o1oJTc", "FlRtySbD": "Adnc7OFJ"}, "avatarUrl": "cWI5jTeb", "inventories": ["ObMgVc4X", "sHBxRqty", "PQ88GYXS"], "label": "z0dRhPfk", "profileName": "7x17yHqB", "statistics": ["hG2QV8kO", "Mm0BSHmg", "v4uhzxYV"], "tags": ["PVRc7s9h", "lCv9XfOu", "4iGALETM"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'N3zyweHL' \
    --userId '5FWnM6ux' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'EJv5vqda' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'dyiEW13I' \
    --userId 'smfens3J' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'TYgQsBcj' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'U1cIuHmn' \
    --userId 'fWnnbD7w' \
    --body '{"name": "CladkF6m", "value": "SfCQqHQd"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'yb4c7sRg' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'CrxZ87nw' \
    --label 'spYTQf66' \
    --tags '8FsDjGy7,i6FHrtI5,vq8WvrUk' \
    --checksum 'NO0wMYPk' \
    --customAttribute 'zKDhEJXH' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'OxSUuJ2A' \
    --userId 'wLRQGOUE' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'SAFKSDd5' \
    --userId 'VGlzZIvD' \
    --label 'Tg1iyMmN' \
    --tags 'VReUtfym,rpqlRF7p,zpd3HjMN' \
    --checksum 'GpTMsI2f' \
    --customAttribute 'e8BrV9Th' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'D2AEzVmI' \
    --userId 'ucloYPRR' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'MRM5Rz9o' \
    --userId '5q5xxX1U' \
    --body '{"customAttribute": "RzKXjoKP", "label": "BqGZ2nty", "tags": ["TEiqyblE", "2myH4Ws1", "VHcFsC7x"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '27' \
    --statCodes 'tqyauKTQ' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nedtZ4xn' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Um5VlzLH' \
    --userIds 'd2At3R1b' \
    > test.out 2>&1
eval_tap $? 28 'BulkFetchStatItems' test.out

#- 29 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9264741826892733, "statCode": "zAlNAcrF", "userId": "jSjpadoB"}, {"inc": 0.9316377503706924, "statCode": "wvEG66xE", "userId": "sJiQcciO"}, {"inc": 0.12418113538506714, "statCode": "ZcqpKZo8", "userId": "jtOB65DA"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItem' test.out

#- 30 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5254353078694532, "statCode": "vRvnVQTb", "userId": "nXCPfolM"}, {"inc": 0.25565492026934733, "statCode": "4kICNCLU", "userId": "XvmdTnwr"}, {"inc": 0.8972809022495694, "statCode": "0KFbi2bo", "userId": "JTBoGEz0"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkIncUserStatItemValue' test.out

#- 31 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'sIQbVdCj' \
    --userIds 'hywQmgGx,ZAYvDeH1,puvQlp7E' \
    > test.out 2>&1
eval_tap $? 31 'BulkFetchOrDefaultStatItems' test.out

#- 32 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Ug7x9DEo", "userId": "JC4QxZVw"}, {"statCode": "93JDHrow", "userId": "SIVfTfFi"}, {"statCode": "0R6ep2Jl", "userId": "4D03MwJm"}]' \
    > test.out 2>&1
eval_tap $? 32 'BulkResetUserStatItem' test.out

#- 33 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 33 'GetStats' test.out

#- 34 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.8108827456699584, "description": "8NpdgL0m", "incrementOnly": false, "maximum": 0.9361482455644157, "minimum": 0.61756017706166, "name": "aWIxusmk", "setAsGlobal": false, "setBy": "SERVER", "statCode": "eB90Kq6b", "tags": ["gp9dpfT1", "BN9ga3vx", "DPDII2VR"]}' \
    > test.out 2>&1
eval_tap $? 34 'CreateStat' test.out

#- 35 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'ExportStats' test.out

#- 36 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 36 'ImportStats' test.out

#- 37 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '11' \
    --keyword 'c6jciPqw' \
    > test.out 2>&1
eval_tap $? 37 'QueryStats' test.out

#- 38 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Btdm5ZQ7' \
    > test.out 2>&1
eval_tap $? 38 'GetStat' test.out

#- 39 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '9Q6IvbHX' \
    > test.out 2>&1
eval_tap $? 39 'DeleteStat' test.out

#- 40 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OsGd9L0Y' \
    --body '{"defaultValue": 0.4086044193837871, "description": "w6uFhxgg", "name": "KYrFlbLc", "tags": ["nrpFTiaD", "6BvwN6eP", "3QSexj5B"]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateStat' test.out

#- 41 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '2DTv7WdY' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTiedStat' test.out

#- 42 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'hdrXCPUe' \
    --limit '13' \
    --offset '58' \
    --statCodes 'a5JFq2s8' \
    --tags 'Sjqvn19C' \
    > test.out 2>&1
eval_tap $? 42 'GetUserStatItems' test.out

#- 43 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'aLWQdIfP' \
    --body '[{"statCode": "JpPBktbv"}, {"statCode": "WXpe9omp"}, {"statCode": "Wu13ICHl"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkCreateUserStatItems' test.out

#- 44 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WlqunX9h' \
    --body '[{"inc": 0.7834891537254892, "statCode": "fJe77Lll"}, {"inc": 0.7351691589699517, "statCode": "9WI78Pn1"}, {"inc": 0.5253686899232449, "statCode": "nkOVoKgw"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItem1' test.out

#- 45 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gxIqSwSr' \
    --body '[{"inc": 0.3236221841440272, "statCode": "PwRmschD"}, {"inc": 0.5792894242632579, "statCode": "X1CrbPGb"}, {"inc": 0.35004538585818734, "statCode": "hWUhhUwj"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkIncUserStatItemValue1' test.out

#- 46 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vj1CfMwO' \
    --body '[{"statCode": "Nk1cxKmX"}, {"statCode": "k9YOqTfW"}, {"statCode": "QzZl1ALz"}]' \
    > test.out 2>&1
eval_tap $? 46 'BulkResetUserStatItem1' test.out

#- 47 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '9u9rbjnY' \
    --userId 'TwzHXiZ6' \
    > test.out 2>&1
eval_tap $? 47 'CreateUserStatItem' test.out

#- 48 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JV4wNJyG' \
    --userId 'JqU6Yj92' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserStatItems' test.out

#- 49 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XhU8KXIf' \
    --userId 'w1a8k0lK' \
    --body '{"inc": 0.19829093697657907}' \
    > test.out 2>&1
eval_tap $? 49 'IncUserStatItemValue' test.out

#- 50 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'x56FHsFp' \
    --userId 'PNkCc4N7' \
    --additionalKey 'Z5AJGUte' \
    --body '{"additionalData": {"79iKJgr6": {}, "gPeV68NT": {}, "JBazllXC": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'ResetUserStatItemValue' test.out

#- 51 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '17' \
    --statCodes 'TjF3pG6U' \
    > test.out 2>&1
eval_tap $? 51 'GetGlobalStatItems1' test.out

#- 52 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'brLPoR1u' \
    > test.out 2>&1
eval_tap $? 52 'GetGlobalStatItemByStatCode1' test.out

#- 53 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '7KLu7H8E' \
    --userIds 'fwR7jhUo' \
    > test.out 2>&1
eval_tap $? 53 'BulkFetchStatItems1' test.out

#- 54 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.36297983481545093, "statCode": "KHyUD4ns", "userId": "viLnaLBj"}, {"inc": 0.1860419996697663, "statCode": "6BDMqsHl", "userId": "OikGHruo"}, {"inc": 0.3754437802027192, "statCode": "1Bfo3rOD", "userId": "GoPvhmEi"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkIncUserStatItem' test.out

#- 55 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5671464923035293, "statCode": "o1REvX6Z", "userId": "70aggvOJ"}, {"inc": 0.6160868085641618, "statCode": "Vp072me4", "userId": "JZ1Pl6TT"}, {"inc": 0.24482822338831722, "statCode": "F4FQ6N31", "userId": "vmqXsQHk"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItemValue' test.out

#- 56 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "UDeJ7ixH", "userId": "Io28axvV"}, {"statCode": "WDRHpN2p", "userId": "QkVFvlCV"}, {"statCode": "VsFZoB99", "userId": "GjFNe923"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkResetUserStatItem2' test.out

#- 57 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.8732695945554032, "description": "9hpFjEBu", "incrementOnly": false, "maximum": 0.4140190023577215, "minimum": 0.7070740805817485, "name": "ar0FlDd8", "setAsGlobal": true, "setBy": "SERVER", "statCode": "alLOSTeB", "tags": ["46PUI6c6", "eBnvFqn7", "FAJkZsI0"]}' \
    > test.out 2>&1
eval_tap $? 57 'CreateStat1' test.out

#- 58 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'JcyM0F0h' \
    --limit '27' \
    --offset '41' \
    --statCodes 'PE8CH9Bf' \
    --tags 'Yb8CEP6z' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryUserStatItems' test.out

#- 59 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'BIFtcS9J' \
    --body '[{"statCode": "6JvFZDzs"}, {"statCode": "YiT4sdOM"}, {"statCode": "GeqMWUqJ"}]' \
    > test.out 2>&1
eval_tap $? 59 'PublicBulkCreateUserStatItems' test.out

#- 60 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '82MG7VsH' \
    --statCodes 'XhIU3nQg,hjRrRZkA,XTECdfJt' \
    --tags 'P36calo8,0jI2U81m,8sMONzej' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryUserStatItems1' test.out

#- 61 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ksh0p6dz' \
    --body '[{"inc": 0.6805545489578969, "statCode": "wK2Kkba4"}, {"inc": 0.628330927920394, "statCode": "gamYUrYD"}, {"inc": 0.6867613216421663, "statCode": "QmzXM4pv"}]' \
    > test.out 2>&1
eval_tap $? 61 'PublicBulkIncUserStatItem1' test.out

#- 62 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BteQpbwO' \
    --body '[{"inc": 0.3766012489285271, "statCode": "jIBkpFzs"}, {"inc": 0.44535225772016396, "statCode": "tfw9Xvyi"}, {"inc": 0.7165138002540665, "statCode": "58FTkVey"}]' \
    > test.out 2>&1
eval_tap $? 62 'BulkIncUserStatItemValue2' test.out

#- 63 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ak9E3b2f' \
    --body '[{"statCode": "f3jdxXZ5"}, {"statCode": "8PJ6kRqK"}, {"statCode": "VOEHs7WO"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkResetUserStatItem3' test.out

#- 64 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PeD7xQwc' \
    --userId '8oI6wwK3' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserStatItem' test.out

#- 65 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'I78uG6DS' \
    --userId 'YCdptkZl' \
    > test.out 2>&1
eval_tap $? 65 'DeleteUserStatItems1' test.out

#- 66 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vvtvSyyr' \
    --userId 'Dyz6RSpV' \
    --body '{"inc": 0.6576253514686272}' \
    > test.out 2>&1
eval_tap $? 66 'PublicIncUserStatItem' test.out

#- 67 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BTU6M8ZV' \
    --userId 'yWJ7NXFX' \
    --body '{"inc": 0.4721930841717652}' \
    > test.out 2>&1
eval_tap $? 67 'PublicIncUserStatItemValue' test.out

#- 68 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'm2fJ9kA6' \
    --userId 'VJ5pfWF1' \
    > test.out 2>&1
eval_tap $? 68 'ResetUserStatItemValue1' test.out

#- 69 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"GLQYEAHk": {}, "6TL6Ggi4": {}, "t5Jjtfer": {}}, "additionalKey": "aa26sjap", "statCode": "zqA79yHB", "updateStrategy": "MIN", "userId": "kSY0a2ml", "value": 0.6204441058158655}, {"additionalData": {"wOrp7I9L": {}, "Vn1z4K28": {}, "6I0VQmIN": {}}, "additionalKey": "AHxbe3jS", "statCode": "oB0g47Mk", "updateStrategy": "INCREMENT", "userId": "MLWB7H7j", "value": 0.6469812928730034}, {"additionalData": {"ZW1EtNSz": {}, "iSDgOqHf": {}, "fD8boksR": {}}, "additionalKey": "BQum4LzL", "statCode": "0CFdq8Rd", "updateStrategy": "INCREMENT", "userId": "phnudk5K", "value": 0.058437030883598196}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItemV2' test.out

#- 70 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'l0A3hdnt' \
    --statCode 'Qr9MgxiC' \
    --userIds 'msSQkp8Y,DXd7TaF2,4yh560ds' \
    > test.out 2>&1
eval_tap $? 70 'BulkFetchOrDefaultStatItems1' test.out

#- 71 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'KGMzlFbq' \
    --additionalKey '05wIToWX' \
    --body '[{"additionalData": {"xGH2LwXY": {}, "a13MqO0M": {}, "O20KXGYO": {}}, "statCode": "MMTRM7aZ", "updateStrategy": "MAX", "value": 0.1474247666996138}, {"additionalData": {"LX4pDf7G": {}, "hTBiNWBu": {}, "s3bGDV2e": {}}, "statCode": "CWv408kJ", "updateStrategy": "INCREMENT", "value": 0.9296968782510527}, {"additionalData": {"kV6UWPSB": {}, "5NY8D5dN": {}, "Z8CpshNL": {}}, "statCode": "3oftfQGv", "updateStrategy": "OVERRIDE", "value": 0.8602269821735908}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem' test.out

#- 72 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'VYcsVqgD' \
    --additionalKey 'VfbEbiWv' \
    --body '[{"additionalData": {"rNXnfYyM": {}, "hAdDZa2N": {}, "bEvfH5l2": {}}, "statCode": "LVVG769s"}, {"additionalData": {"6GNDuMLO": {}, "mtmoAmT7": {}, "5Zj9mrQU": {}}, "statCode": "DC7EHcTZ"}, {"additionalData": {"46ri1FQ1": {}, "XRsCbGGv": {}, "fwqmFcom": {}}, "statCode": "rli6Z54s"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItemValues' test.out

#- 73 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EHWxhtUu' \
    --userId 'Kzx7bp1i' \
    --additionalKey 'wiaICoY9' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems2' test.out

#- 74 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'X8fKV68V' \
    --userId 'Cu087x9c' \
    --additionalKey 'WRXnlPes' \
    --body '{"additionalData": {"FHFb7Rxd": {}, "O9xVIZMT": {}, "SpPgYjUS": {}}, "updateStrategy": "INCREMENT", "value": 0.479377392554333}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue' test.out

#- 75 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"lB8ZPp6R": {}, "VJBDonJa": {}, "wfTruvjv": {}}, "additionalKey": "W7gCxOn1", "statCode": "t77BoSip", "updateStrategy": "INCREMENT", "userId": "PMWXjX3K", "value": 0.21524049142862722}, {"additionalData": {"Smgl8mNp": {}, "hcgwJcYn": {}, "2l403g6i": {}}, "additionalKey": "y0861gca", "statCode": "ECfn3MGV", "updateStrategy": "MAX", "userId": "RpTpC9Ni", "value": 0.7228163208735833}, {"additionalData": {"uhltZdqz": {}, "9lvZcMBy": {}, "gDKbNoig": {}}, "additionalKey": "FO65DhId", "statCode": "cw2vAeqX", "updateStrategy": "MIN", "userId": "V9tU2eKg", "value": 0.7611159843704174}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkUpdateUserStatItem1' test.out

#- 76 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBPxYZKC' \
    --additionalKey 'IWsoU1Ci' \
    --statCodes 'TRQ7rHIX,poIo3aOb,8fH8Iqym' \
    --tags 'Kl4HUOqb,RceJEclj,Givvd8gl' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems2' test.out

#- 77 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KRT1RxhE' \
    --additionalKey 'NgpVirvG' \
    --body '[{"additionalData": {"baydjeN7": {}, "3Sa1mAal": {}, "E0DSAZf8": {}}, "statCode": "8wd2jzYS", "updateStrategy": "MIN", "value": 0.332668217707512}, {"additionalData": {"kKqwe6lO": {}, "jG6r98dB": {}, "ndFpt67J": {}}, "statCode": "h6fMFdBX", "updateStrategy": "INCREMENT", "value": 0.40385401164093226}, {"additionalData": {"dOclahqn": {}, "ia7uhwYQ": {}, "A5T61g2i": {}}, "statCode": "lqo7jPIk", "updateStrategy": "MAX", "value": 0.6128714004428478}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItem2' test.out

#- 78 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FBVAtHEc' \
    --userId 'ss0aHzdx' \
    --additionalKey 'qmzRIxQH' \
    --body '{"additionalData": {"kYLSYn2Y": {}, "KQ1ggnPA": {}, "ZDrvQGwW": {}}, "updateStrategy": "MIN", "value": 0.10098834956308023}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE