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
echo "1..74"

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
    --body '{"maxSlotSize": 77, "maxSlots": 0}' \
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
    --userId 'phHtzsvb' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '1CvL5LfI' \
    --body '{"maxSlotSize": 29, "maxSlots": 16}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'jDVxB43E' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'EN4YA4jV' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Hx7dAVa1' \
    --userId 'kjq3mL6j' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'Qxl1fFTb' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'GnJjrqi7' \
    --userId 'aUjeZl9W' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds '0cwW5B6P,dA1gqTkT,wFUpEI3z' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lxf0jAQL' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'YJmSZPt2' \
    --body '{"achievements": ["EhOjP1Yw", "hI8W0kkX", "63UqfLG9"], "attributes": {"rT6JG6xQ": "ui24kMvc", "6cSODq1z": "PZ2QDxp7", "M5yWNULZ": "8Z1L1aLW"}, "avatarUrl": "LFcwiD4p", "inventories": ["RaTLXSBI", "kYiwKzK7", "vsuTFxjI"], "label": "pn582iUT", "profileName": "OxRY4TfR", "statistics": ["9CErfyRS", "CUBZ2r6l", "AKsrFoW7"], "tags": ["vTzT63i1", "jBDU7Lqq", "0rfnQRxV"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'KooDEN3B' \
    --userId 'j9s1Tx05' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'VbRgjfAZ' \
    --userId 'voFaDMHV' \
    --body '{"achievements": ["icN6Wcec", "eJpziDBG", "3tZfoVNK"], "attributes": {"h2xXu6zE": "YWsYpzfa", "isSdie3u": "8Fb6XPLM", "61kbPMf5": "2uH0yZ1y"}, "avatarUrl": "BVPDAhby", "inventories": ["oZbJJHAp", "wnN3GWra", "BXt5uODO"], "label": "fhB3Mqh3", "profileName": "diuV8qMt", "statistics": ["jcsWed61", "GIPBxdtq", "GDY1yaig"], "tags": ["tStLgM1r", "v6p04vEW", "4DXrpu06"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'JlL4UMy7' \
    --userId 'ATUqCFwu' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'HO70PnmS' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'S1PCJaDV' \
    --userId '3Xyw3KqE' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '0dSHJgil' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'p4F8ePGW' \
    --userId 'Jezm6OXS' \
    --body '{"name": "rqaEdRpZ", "value": "nyyY4tVB"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '98H0xOaF' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q49HWRZM' \
    --label 'cFcWCN1T' \
    --tags '02OLvxIK,75Ooe9sF,PRznnAlm' \
    --checksum 'YGMLtswj' \
    --customAttribute 'DJfGD8Bz' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'B1FqTxMp' \
    --userId 'HWmEDxR3' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'CmxnTn6p' \
    --userId 'vQf75gQb' \
    --label 'o4l6ici3' \
    --tags 'tNqMIZ5n,yC85adMI,bjpvyDBR' \
    --checksum 'iIVPyBNU' \
    --customAttribute 'v8OoScn4' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'suxzp8bv' \
    --userId '6VPpAhHb' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'wiAVV460' \
    --userId 'KuntLOUr' \
    --body '{"customAttribute": "Lh2SD5CL", "label": "J29T9hzX", "tags": ["aA2otfhC", "IucgeEZw", "uVqjVHCz"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '24Bt7nAx' \
    --userIds 'IfPAUeEO' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9606754387130515, "statCode": "CFij4DL4", "userId": "c3ooFbhv"}, {"inc": 0.6001788049495451, "statCode": "kiq03xn9", "userId": "GMsGTi5O"}, {"inc": 0.022893550037672128, "statCode": "v2yRrmIK", "userId": "HNQUmfwx"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3310827278273092, "statCode": "t19GSbbV", "userId": "Qt4qb7Ar"}, {"inc": 0.7363957201610437, "statCode": "HQDCQXoR", "userId": "UvoGKzGp"}, {"inc": 0.11260246919330164, "statCode": "KRDiwnru", "userId": "AFpn2pjH"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zUiv9Jrt' \
    --userIds 'URNCOZUO,EbKvQ61R,q0ss7x1i' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Ms0dF4hG", "userId": "ZgYdZJGC"}, {"statCode": "P9RdKl3Z", "userId": "HdXXygeh"}, {"statCode": "5oMa2wbF", "userId": "HYNPFtpO"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.5665018600073449, "description": "LXi9JHwe", "incrementOnly": false, "maximum": 0.7591641189725519, "minimum": 0.26431376846777077, "name": "qpkuQKhi", "setAsGlobal": true, "setBy": "SERVER", "statCode": "UxJdRwhn", "tags": ["N19wJ7B8", "xBtSkufr", "7f3l7dxD"]}' \
    > test.out 2>&1
eval_tap $? 33 'CreateStat' test.out

#- 34 ExportStats
./ng net.accelbyte.sdk.cli.Main social exportStats \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 34 'ExportStats' test.out

#- 35 ImportStats
./ng net.accelbyte.sdk.cli.Main social importStats \
    --namespace "$AB_NAMESPACE" \
    --replaceExisting  \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 35 'ImportStats' test.out

#- 36 QueryStats
./ng net.accelbyte.sdk.cli.Main social queryStats \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '95' \
    --keyword 'EshDdDfZ' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mXqxAXp4' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XOQPoSgk' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'q0tGGIyz' \
    --body '{"description": "GUn1cPK3", "name": "RkuDsQ3x", "tags": ["hcOmAAHU", "WHsIGSjM", "c0jiHqHF"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'j2ulqry6' \
    --limit '31' \
    --offset '58' \
    --statCodes 'jQi13l50' \
    --tags 'A2EzPYJ8' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'IV9QMKcH' \
    --body '[{"statCode": "fhHdUsgW"}, {"statCode": "GRxxp58R"}, {"statCode": "zPNu3Esc"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mIeZuZs8' \
    --body '[{"inc": 0.08554460765722194, "statCode": "QBfeOHA6"}, {"inc": 0.4256351951691788, "statCode": "nPXrjz7E"}, {"inc": 0.12826796046271116, "statCode": "1TsymYjJ"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ML9baB0V' \
    --body '[{"inc": 0.09584984724612766, "statCode": "D7nOv5pl"}, {"inc": 0.9250188638086401, "statCode": "FbuqtVwK"}, {"inc": 0.8209197294346021, "statCode": "MguhCuKT"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4EAQNcC8' \
    --body '[{"statCode": "AwBl8lfx"}, {"statCode": "qSKpUDzU"}, {"statCode": "QZZbDgbg"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BxDKUu8H' \
    --userId 'onvpu7OL' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eXY5Q032' \
    --userId 'f8zmHJLM' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Oe1hSXCa' \
    --userId '81GcFS1t' \
    --body '{"inc": 0.10365414794762529}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wmCZqKTw' \
    --userId 'lKETP9gw' \
    --additionalKey 'ZEErEyye' \
    --body '{"additionalData": {"JebXQawi": {}, "OaCv2xei": {}, "jJiMZE0R": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LJplit8d' \
    --userIds 'SfSHZrl5' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7185655408152622, "statCode": "3w8CD10e", "userId": "W1WGFfxt"}, {"inc": 0.046496315529848675, "statCode": "5WFu0toQ", "userId": "cNmgkwbE"}, {"inc": 0.3049647496675658, "statCode": "lxzKqK2g", "userId": "F2QE8dIv"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9547331152990545, "statCode": "2qAHR0o9", "userId": "hJyDXskv"}, {"inc": 0.19277047383640766, "statCode": "xgRgZApA", "userId": "jea8GrRg"}, {"inc": 0.625214677871065, "statCode": "6Tm3JDQO", "userId": "SyjfyPYT"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "m2JzqqXk", "userId": "gJeh7RdU"}, {"statCode": "ilfwGWQR", "userId": "wRlL4CnT"}, {"statCode": "Yfji8y4x", "userId": "4iCTJEcT"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.9890988838185049, "description": "txfJENjf", "incrementOnly": true, "maximum": 0.012239791562562607, "minimum": 0.8302409611866588, "name": "t940eGYl", "setAsGlobal": true, "setBy": "SERVER", "statCode": "ckpeqX6L", "tags": ["nzhsi6j3", "gX3utoBh", "Wm8l5kRk"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '6tU2bXbB' \
    --limit '97' \
    --offset '26' \
    --statCodes '2MoTE64L' \
    --tags 'rWcWu2MW' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'wZFLfVd3' \
    --body '[{"statCode": "nheNbfZz"}, {"statCode": "XsBdQrFD"}, {"statCode": "58buQrAZ"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXRh32nZ' \
    --statCodes 'JvZEu7bq,OHMsEoVB,Dr9cxwVB' \
    --tags 'XGkATaEE,Gd3nmtIY,ZtpcQpel' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bA2ISl9M' \
    --body '[{"inc": 0.73098286757783, "statCode": "VDcNRDYz"}, {"inc": 0.6331728137706631, "statCode": "phlmtE3R"}, {"inc": 0.3506190903396893, "statCode": "Dr1ExNYP"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oJaZ43TP' \
    --body '[{"inc": 0.6903720246548843, "statCode": "sU40wr0h"}, {"inc": 0.394556221082069, "statCode": "P2wwhbe0"}, {"inc": 0.649734198544955, "statCode": "wrjl7lR4"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GD3A9hFM' \
    --body '[{"statCode": "nVj4TWFe"}, {"statCode": "2EHKPeJO"}, {"statCode": "oCNJJxSG"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yjGIPsfE' \
    --userId '3SyMGHY9' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QqCoTVNc' \
    --userId 'dA7ukvk7' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vcYCypVa' \
    --userId '76vUBdmc' \
    --body '{"inc": 0.08057818958707841}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zgohOJVZ' \
    --userId 'Tvzb31r8' \
    --body '{"inc": 0.6728548913518138}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uqCzE9rx' \
    --userId 'JnJv1Gmv' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"0jlvnxLh": {}, "oUAKGHTQ": {}, "XFnQmL5B": {}}, "additionalKey": "MA8B2lO3", "statCode": "zxJlkH0e", "updateStrategy": "MAX", "userId": "6CksrEaF", "value": 0.10931452098989458}, {"additionalData": {"bHNKm80D": {}, "Gyh6OT7Y": {}, "88YtSivR": {}}, "additionalKey": "NR0p9CJ5", "statCode": "zE6AmY70", "updateStrategy": "MAX", "userId": "K4gV3WC7", "value": 0.19529030348253373}, {"additionalData": {"rLoHUKXO": {}, "D3I4e2Dr": {}, "KZUSbtt2": {}}, "additionalKey": "C8sgilaY", "statCode": "snvhJPFj", "updateStrategy": "MIN", "userId": "Swims1wI", "value": 0.5368505115825609}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '4BIy9kjm' \
    --statCode 'laxSXHb4' \
    --userIds 'ho7iAeoj,KJEEA8sy,eufwuHK2' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'QtGH6ZYX' \
    --additionalKey 'DVbScbyB' \
    --body '[{"additionalData": {"lT6X4sbF": {}, "jZRVelXW": {}, "FxMdVhi9": {}}, "statCode": "eH1rj8Dp", "updateStrategy": "INCREMENT", "value": 0.454104419068445}, {"additionalData": {"Vul9evcq": {}, "2ZwMutOC": {}, "x7g9Djz9": {}}, "statCode": "uo0okxPf", "updateStrategy": "OVERRIDE", "value": 0.503370540607749}, {"additionalData": {"DEXorRa8": {}, "0oMVDDdw": {}, "8hhOQo5a": {}}, "statCode": "PTmZGPA5", "updateStrategy": "MIN", "value": 0.814092436921357}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kl06A11v' \
    --additionalKey 'V4akIrc7' \
    --body '[{"additionalData": {"3Q5cSsHu": {}, "FjmGKoGP": {}, "qa8ohPbl": {}}, "statCode": "I8J7JZqa"}, {"additionalData": {"Zy7c7GFK": {}, "kUB7hdWN": {}, "AnzxxR3M": {}}, "statCode": "MMCRt1Q1"}, {"additionalData": {"ye93KTIz": {}, "MJCBsuQZ": {}, "hCNH5Rbb": {}}, "statCode": "P8v2C75M"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ITOKNY8v' \
    --userId 'Ier7Yo1B' \
    --additionalKey 'FPnuHtVm' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Jm4AlI07' \
    --userId 'qEAyo1pK' \
    --additionalKey 'EcMPQhg6' \
    --body '{"additionalData": {"IbnDnaNO": {}, "IQbxxF90": {}, "xWGpSIrS": {}}, "updateStrategy": "OVERRIDE", "value": 0.9591302869882894}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"sBPMIIqH": {}, "5RAtzrkF": {}, "seLBDFSO": {}}, "additionalKey": "okrpxfzK", "statCode": "dTaAOui7", "updateStrategy": "OVERRIDE", "userId": "yzBNRiJO", "value": 0.9986379498090052}, {"additionalData": {"wCmsHqAa": {}, "h1ijEVob": {}, "06pEgFuh": {}}, "additionalKey": "y0k81XPt", "statCode": "RFfG611e", "updateStrategy": "MIN", "userId": "NElg8WRw", "value": 0.03177886948471753}, {"additionalData": {"GVk28em4": {}, "yYYtLFBN": {}, "Au0DLvXp": {}}, "additionalKey": "3386N9GW", "statCode": "Ly2QWkIp", "updateStrategy": "OVERRIDE", "userId": "4air1M79", "value": 0.14994134685687766}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wDqIF8mY' \
    --additionalKey 'wjZe46YP' \
    --statCodes 'vmfB7OST,Dumj0Upi,u7lxTGN5' \
    --tags 'jcxlwsZv,ZU6ke0At,TAsRh5G1' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'B9GCVtmD' \
    --additionalKey 'IRJ0S9m8' \
    --body '[{"additionalData": {"sZyysjq9": {}, "HNMGpJMD": {}, "yCyAezK0": {}}, "statCode": "QX3w4DC2", "updateStrategy": "OVERRIDE", "value": 0.28168440437771836}, {"additionalData": {"KWUoCBsQ": {}, "oiSMYfvL": {}, "VbvT5HNJ": {}}, "statCode": "sEq2AfYs", "updateStrategy": "INCREMENT", "value": 0.7986155126386232}, {"additionalData": {"hhYZwLnn": {}, "aqlBDDWi": {}, "aRtkfvxs": {}}, "statCode": "NZ4CL5sT", "updateStrategy": "MAX", "value": 0.415856188240726}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EqMRolwo' \
    --userId 'JwdLWtMD' \
    --additionalKey 'heUrlxpA' \
    --body '{"additionalData": {"VJAu2S14": {}, "AVVEggXW": {}, "MI745ekS": {}}, "updateStrategy": "MAX", "value": 0.9657841132506584}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE