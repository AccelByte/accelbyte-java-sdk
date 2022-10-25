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
echo "1..75"

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
    --body '{"maxSlotSize": 73, "maxSlots": 25}' \
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
    --userId 'Y9i2F2Ql' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'vTgAePqt' \
    --body '{"maxSlotSize": 96, "maxSlots": 82}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'ioVbdsdA' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'KJTzNRjj' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'jIXmrDkY' \
    --userId 'rpblfcJQ' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'ggZ18vRs' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'edDw3Lev' \
    --userId 'GmBMJw5K' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'RO1PyQkZ,nSzycT2x,DGxPRdqN' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'gNmkr7P9' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'K0jY350i' \
    --body '{"achievements": ["UPV8IDTP", "nJPZbkhy", "QCL7Itds"], "attributes": {"RI5PuFQL": "SrILuiNe", "oVy8MYAF": "QNGCSw46", "Vyxhu9J5": "Kio0Nw10"}, "avatarUrl": "GKZ639pO", "inventories": ["VXozkFsJ", "VYMnJCkO", "7QpHvhC6"], "label": "XKtAGhCr", "profileName": "Sfvw2kNK", "statistics": ["o4zdqqyE", "sp6Qa7Ow", "TOTETr8d"], "tags": ["U8eecsdH", "1rmmNZFI", "kEHHuMR9"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ATW5wFfx' \
    --userId 'oaNNUxHf' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'UtJnIvif' \
    --userId 'PO8K2GQ4' \
    --body '{"achievements": ["Q11Ih83D", "C7XF0BP4", "pdVjMoqK"], "attributes": {"yT4Yx2Rz": "153r7QT0", "MKFFe1Vu": "DgXxR04P", "AjpfuKZy": "Ol5pxXjk"}, "avatarUrl": "Ms05VZvJ", "inventories": ["SkmsQChM", "RlRP6oXX", "l1pXSme3"], "label": "NqAIEbqq", "profileName": "ZiivQ2ev", "statistics": ["wEiXmQ4R", "n32DS5bt", "NBAIvGAd"], "tags": ["yrpppNOW", "qPVQPxrs", "sLc7DUbV"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'epdShpVe' \
    --userId 'N9FxDt2D' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '5SsBt7c2' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'GG6l7i5B' \
    --userId 'gTRQ18B7' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'b2ocLcgf' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'A0gYvYMS' \
    --userId 'mFiMQOCA' \
    --body '{"name": "g5hD3fhN", "value": "EPReQFJn"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'eDfAy4PH' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'eWuPw6WT' \
    --label 'PW1LANl7' \
    --tags 'bBoq3pQo,QSFmPBkU,emLgwPnK' \
    --checksum 'RIr2VvrQ' \
    --customAttribute 'q80TrdpP' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'gq5pdRTA' \
    --userId 'XkNFjp5Q' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'pVErjduO' \
    --userId '8F6IWWWE' \
    --label 'Z2R06JNz' \
    --tags 'IVyBL1JR,iFoerf1R,zF5ydENw' \
    --checksum 'ucfZu2KX' \
    --customAttribute 'jcACC8Vc' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'owwEb07S' \
    --userId '7Y32bqIU' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId '9DQS6O6Y' \
    --userId 'ORCwlqdm' \
    --body '{"customAttribute": "gWiXXDP3", "label": "dQ1ciu5T", "tags": ["8tWb75BX", "trfDuWQW", "0J9u48IH"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DnkeX94U' \
    --userIds 'Mfa7vKSI' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7887556576283425, "statCode": "QrGepeaD", "userId": "XkG0SKQ1"}, {"inc": 0.13468362839346437, "statCode": "23v4vkgm", "userId": "KIoR6tbS"}, {"inc": 0.547387025414781, "statCode": "OPFX9hlA", "userId": "keC2gUoO"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4739858575396677, "statCode": "lTABmCEA", "userId": "pS7FiRSm"}, {"inc": 0.6899107898735559, "statCode": "PCZ3PXGe", "userId": "edk86G8s"}, {"inc": 0.7925829565577743, "statCode": "fqiWYv4A", "userId": "o1R8z7c3"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lPD6uUCp' \
    --userIds 'JsdFIfB0,MLAnSHah,4AnDfqQH' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "zWSG12K2", "userId": "llENTzpD"}, {"statCode": "E2uajQjt", "userId": "hp2jF67Z"}, {"statCode": "oGzaTORF", "userId": "puSrOtDc"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '1' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.854876979399316, "description": "7Q0wdv5g", "incrementOnly": true, "maximum": 0.30779578463918034, "minimum": 0.8481230286350974, "name": "xtoOLU3j", "setAsGlobal": false, "setBy": "SERVER", "statCode": "OcEcaOGe", "tags": ["lZKcDCnU", "sKsavxji", "ZTSzMKW3"]}' \
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
    --limit '52' \
    --offset '55' \
    --keyword 'vsmlg3Bf' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'i7qvpuh7' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'l0CioBoX' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oRKntPrc' \
    --body '{"defaultValue": 0.7052569255962835, "description": "CCW96VC9", "name": "yzveM1mP", "tags": ["ArfzsAcZ", "Jo6j0NLa", "wG6qHDbc"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OVitqiP2' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'mCoD76t3' \
    --limit '63' \
    --offset '93' \
    --statCodes '3Qlm3jLQ' \
    --tags 'D4aYgxP8' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'gQH6DzVf' \
    --body '[{"statCode": "urUfmYZk"}, {"statCode": "tLmUd7dC"}, {"statCode": "OSDuddyF"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LYJgqP9m' \
    --body '[{"inc": 0.46645845948706377, "statCode": "Tl5qiVGi"}, {"inc": 0.1580536898780196, "statCode": "K5bMg06L"}, {"inc": 0.22873336589895743, "statCode": "0v2lI9Ok"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'y0xIlwj4' \
    --body '[{"inc": 0.7591681683982513, "statCode": "Q6cyhoIR"}, {"inc": 0.15975560426940372, "statCode": "XryFlhRq"}, {"inc": 0.7670274046555854, "statCode": "a5BPplsK"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4cKl55Hk' \
    --body '[{"statCode": "ap39qrtR"}, {"statCode": "BHXPXi64"}, {"statCode": "LXUurzTz"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pyNXHBfS' \
    --userId 'a2z3rYef' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cVfqOQJ4' \
    --userId '72KgePT9' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '88u14zrN' \
    --userId 'GYM6uVxz' \
    --body '{"inc": 0.1734079463168312}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'y9fbzggR' \
    --userId 'jsnQPG1y' \
    --additionalKey '5IihRPWo' \
    --body '{"additionalData": {"fMCYyPrP": {}, "fvrBLt9L": {}, "ZhCInyok": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qohMlUD9' \
    --userIds 'zZPtGx8T' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7860523470461909, "statCode": "NX2vBq4Z", "userId": "exn41Brx"}, {"inc": 0.43454997658868777, "statCode": "r19XNSBH", "userId": "PtrNt8aO"}, {"inc": 0.0742512632703376, "statCode": "2kVju0XM", "userId": "ZZlNGT0L"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.534246178736212, "statCode": "x1ioyBBA", "userId": "3SCU6qHs"}, {"inc": 0.23939394419421456, "statCode": "cFyUr2BZ", "userId": "ZfcA5d2A"}, {"inc": 0.9165193267186058, "statCode": "o7BkhHgs", "userId": "Zjn21wVv"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "InvZQ8uh", "userId": "1WPzh0un"}, {"statCode": "EJHRexdW", "userId": "vyuURzCV"}, {"statCode": "2mSNhLr1", "userId": "LAXAOkb1"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.36898325469255744, "description": "VbWdLzcg", "incrementOnly": true, "maximum": 0.6025866923929947, "minimum": 0.5160587264880899, "name": "vWrMGCuM", "setAsGlobal": true, "setBy": "SERVER", "statCode": "HFCgeuia", "tags": ["pjCzI44W", "RmueyYpT", "lyHwX2XO"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'lRQNcjLL' \
    --limit '87' \
    --offset '64' \
    --statCodes 'qCbjbeY5' \
    --tags 'D2mh6Icx' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gz9ncE7o' \
    --body '[{"statCode": "tC3iIeya"}, {"statCode": "HBedRBAj"}, {"statCode": "EOo5KY3C"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'BamOM8E9' \
    --statCodes 'uW6W5d60,5QqjpqX6,hOJTY1Kj' \
    --tags 'MhAUI5PP,5TECdaxq,b56ByOks' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DI2jpUPm' \
    --body '[{"inc": 0.24855395677982395, "statCode": "IbHdAOOL"}, {"inc": 0.6442748020218049, "statCode": "OPK9VagE"}, {"inc": 0.8533478498768721, "statCode": "ordhEJph"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jn7qMI7L' \
    --body '[{"inc": 0.14852623156750122, "statCode": "t8Xvtvti"}, {"inc": 0.3815308376545885, "statCode": "DsV8uvMx"}, {"inc": 0.5323784058689842, "statCode": "GBwQWBPN"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oHLED8AJ' \
    --body '[{"statCode": "kFJzddgi"}, {"statCode": "EkQA05c6"}, {"statCode": "OF29MgDV"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YdBdXdjQ' \
    --userId 'DY1ckR1e' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NBEPs48O' \
    --userId 'mLSIkisJ' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p48VqYAC' \
    --userId 'GjGTTmfU' \
    --body '{"inc": 0.9942495825428939}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZeA17zvx' \
    --userId 'ye5RKHiW' \
    --body '{"inc": 0.18895740314054965}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'o4ZJZibB' \
    --userId 'q4QggUWm' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"eCBTHSKB": {}, "luukrCQ4": {}, "9rnnRplt": {}}, "additionalKey": "D1YWWKNU", "statCode": "PWS67QHV", "updateStrategy": "MAX", "userId": "7L7ojDtI", "value": 0.628668180106348}, {"additionalData": {"IiK36ObZ": {}, "aBew6vEu": {}, "ovLZ1UL1": {}}, "additionalKey": "JifQf2Yc", "statCode": "tGFg1awO", "updateStrategy": "MAX", "userId": "yll2tyR4", "value": 0.047999861586310755}, {"additionalData": {"AbMN7lsr": {}, "RiconnKs": {}, "eIa5kBJe": {}}, "additionalKey": "z9MK0XcR", "statCode": "22TjE5Qd", "updateStrategy": "MIN", "userId": "HC3ig5VP", "value": 0.6297485353882695}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'qCVaX8hn' \
    --statCode 'u0pUrVxh' \
    --userIds 'w8Y9TouK,mkYyw28y,xt10iyqI' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 's8VtFlmB' \
    --additionalKey 'saKgQo5P' \
    --body '[{"additionalData": {"obkClJuy": {}, "IBEtvnwp": {}, "vQkdMfBN": {}}, "statCode": "uEQbP1yT", "updateStrategy": "INCREMENT", "value": 0.18929056711311376}, {"additionalData": {"n8N1O1AB": {}, "t5bHTjjS": {}, "XfMrC7al": {}}, "statCode": "FBaLiU2T", "updateStrategy": "MIN", "value": 0.567009789740447}, {"additionalData": {"YD9TYZgO": {}, "hrpSSS1Z": {}, "SFoSIOIY": {}}, "statCode": "QLiiomkS", "updateStrategy": "OVERRIDE", "value": 0.7577621644696397}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'grntS6J0' \
    --additionalKey 'Hb7rjZfA' \
    --body '[{"additionalData": {"CeEUe6Tc": {}, "c94gRKkz": {}, "rJxHn7Eh": {}}, "statCode": "hNDUGn1I"}, {"additionalData": {"ZMeuAMnM": {}, "95rWFkC7": {}, "4el07WEr": {}}, "statCode": "6oraIGfr"}, {"additionalData": {"dNZsm4fo": {}, "ZigSLgLn": {}, "AUt3JcIa": {}}, "statCode": "kJV84Rxo"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lfWXWmU2' \
    --userId 'ajDzfc0k' \
    --additionalKey 'uJTGlgtx' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jngGSCYm' \
    --userId 'rMN9PxfV' \
    --additionalKey 'RSAPfvP1' \
    --body '{"additionalData": {"AQFow2qJ": {}, "NwxovDjf": {}, "MbcILKix": {}}, "updateStrategy": "MAX", "value": 0.31079896612867064}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"lyXi68tL": {}, "AmxbZZhP": {}, "QiTGPvcB": {}}, "additionalKey": "VukZmdz0", "statCode": "L0Ejs7qY", "updateStrategy": "MAX", "userId": "uNgBxGlY", "value": 0.45503187898558006}, {"additionalData": {"hXWkdYjy": {}, "Qg8rqRAl": {}, "RtAGkU8U": {}}, "additionalKey": "xm1oB58b", "statCode": "eDObS26L", "updateStrategy": "MAX", "userId": "P1ZVf4It", "value": 0.5306185188598169}, {"additionalData": {"QGcMraFU": {}, "kmpOYIuy": {}, "h5FC864E": {}}, "additionalKey": "WCqoeklI", "statCode": "9AU2XMDM", "updateStrategy": "MAX", "userId": "DrDJ9TYj", "value": 0.9613609984234462}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Er5GRLqI' \
    --additionalKey 'QuDGc75g' \
    --statCodes 'MoP0wkIT,LhC8tAXR,LDjiJHFb' \
    --tags 'CMlVQPAN,g4HkGXNB,e27WFcAr' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Dgj66wKM' \
    --additionalKey 'xiXQLret' \
    --body '[{"additionalData": {"IOjXJv88": {}, "jWZQcpsS": {}, "yqsnHDzk": {}}, "statCode": "5CYvTWCQ", "updateStrategy": "OVERRIDE", "value": 0.829508711783124}, {"additionalData": {"HRL4GjUU": {}, "d1YF2RC0": {}, "TPgNMRdm": {}}, "statCode": "cJJWLUvf", "updateStrategy": "OVERRIDE", "value": 0.22383765955355672}, {"additionalData": {"Uw0iPvjm": {}, "Jj6k9XzO": {}, "Es7auwF7": {}}, "statCode": "UpxRtcJZ", "updateStrategy": "MIN", "value": 0.20070280861702894}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tXA3PtMb' \
    --userId 'ceHdKcqq' \
    --additionalKey 'qJIp18tg' \
    --body '{"additionalData": {"SUbH3PJl": {}, "hRkuTqp5": {}, "c19JP1Jc": {}}, "updateStrategy": "OVERRIDE", "value": 0.6331578651697777}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE