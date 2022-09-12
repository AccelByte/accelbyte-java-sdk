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
    --body '{"maxSlotSize": 39, "maxSlots": 62}' \
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
    --userId 'lhr0LA6W' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '35J3Ottw' \
    --body '{"maxSlotSize": 12, "maxSlots": 0}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '8N4XLhvA' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'iC6YTIhl' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ZmXiIpaG' \
    --userId 'sepLwqhN' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'eONACeYs' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '5d2zIXku' \
    --userId 'NWfqVnxR' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'IMy2gees,POmyDjcG,V7HkMn8u' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'qEqlEXHX' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'HuTRkRMs' \
    --body '{"achievements": ["FUx8p66J", "qXDXdla7", "Vph7zkdG"], "attributes": {"kc3hfXxN": "pK1DMGMA", "g2ffkB2O": "sVLxgLwe", "n96OWmuy": "trh4vnNc"}, "avatarUrl": "WBmQCBSd", "inventories": ["xaIWiArV", "OuQKgxlz", "wXremnFA"], "label": "CI7MbQfv", "profileName": "jvdBhAGt", "statistics": ["hcHr9yIk", "U9Y5S3OJ", "AuL19PEE"], "tags": ["Gt3UAue8", "pjwKK6Zr", "ZvEJtMyf"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '5JwYoEG3' \
    --userId 'K96BVntb' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'GEcX03EG' \
    --userId '6wUR9rEu' \
    --body '{"achievements": ["gojnGOIJ", "TQI1m2ff", "owmqapiY"], "attributes": {"NKocsd2P": "WvCPXJsR", "8nKEPC6F": "sKbs0TRN", "aqTYX1QN": "n9UwCCgf"}, "avatarUrl": "FrHPHG8R", "inventories": ["htEDS3NZ", "hOSahX8S", "4PrDp7qz"], "label": "0dvRS7X7", "profileName": "PCRnf96x", "statistics": ["3LeMSBNk", "4G4cqb89", "H9FWbf1v"], "tags": ["4XVwHsdo", "LsxztxaK", "lM5Tt8sh"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '2QMuvY3A' \
    --userId 'nrbiKPN2' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'z9fHm0cz' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'k11lvYy7' \
    --userId 'fly2sbO7' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'FEd5mOyV' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'etJ4glYE' \
    --userId 'EwQUBtW6' \
    --body '{"name": "r2g8E6EZ", "value": "yLjJqtva"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'rrCVcoPd' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId '1HdnwQIE' \
    --label 'IjNYdzZ6' \
    --tags 'udd0pPZg,GtncnDVe,dUkFhI3E' \
    --checksum '3nxWCTqv' \
    --customAttribute '9ojG0AGO' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'iV6vwEKG' \
    --userId 'u4FEyeN3' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId '7Yre2B40' \
    --userId 'RAZc5ios' \
    --label 'zmOjCKff' \
    --tags 'ccql2Ss6,5uNzOSNp,7FnHB255' \
    --checksum 'RLVNRmbs' \
    --customAttribute 'LtL7U14v' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId '0XlokSk7' \
    --userId '2n4OnqHQ' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'IWjXxgrj' \
    --userId 'I28dINF3' \
    --body '{"customAttribute": "ZgVOeY0T", "label": "ay1n2aPL", "tags": ["7pWpbvDC", "dYGVrsos", "m41pbvjG"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wBlzOCje' \
    --userIds 'HtduDCS5' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4350811430878184, "statCode": "TCBY72re", "userId": "bgBmNjTh"}, {"inc": 0.8612100725145797, "statCode": "IeoqfikY", "userId": "4bpo0y9Y"}, {"inc": 0.408032532926349, "statCode": "kGIMogaM", "userId": "p9GFVq2z"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.6492200688833374, "statCode": "iWJ82B6s", "userId": "y4NmRBns"}, {"inc": 0.11879793993122911, "statCode": "1V9XEVNY", "userId": "xGSMn5mh"}, {"inc": 0.7797374082249693, "statCode": "MDc8rigr", "userId": "DN3XO0I6"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iGByCrtP' \
    --userIds 'ALO9YjdS,JDJ0bJha,tlO8QiD4' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "zMWBgMVQ", "userId": "jhlfnaWz"}, {"statCode": "GMQb93zf", "userId": "83UEwRQM"}, {"statCode": "DHBKcUMe", "userId": "Wpe4Z79I"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.46906857562254023, "description": "89tOftxU", "incrementOnly": false, "maximum": 0.6053450151246478, "minimum": 0.310585103084986, "name": "DjwySBeV", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "mLk5VajW", "tags": ["UcHJKYgG", "HiLr9DZq", "rvKgbweY"]}' \
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
    --limit '68' \
    --offset '60' \
    --keyword 'GNwELIx6' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YyXE5M75' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yBD8D2Ys' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kaYbZiOH' \
    --body '{"description": "JdlfsuqC", "name": "mPj4Dl7Q", "tags": ["irvwHyut", "FVcoX8Ra", "ZRbujJ7o"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ktv92N9n' \
    --limit '35' \
    --offset '53' \
    --statCodes 'Xk2dN8fL' \
    --tags 'NMlUTOjR' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6KRwZJ0' \
    --body '[{"statCode": "On9ljHpJ"}, {"statCode": "bawSlbyr"}, {"statCode": "DrBAh97h"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'du1ssUkM' \
    --body '[{"inc": 0.44701975576965447, "statCode": "Jt6K5ZDn"}, {"inc": 0.8560899798515786, "statCode": "pmzKvUo2"}, {"inc": 0.04578792257502329, "statCode": "jIXGBQGp"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0wMMLjnQ' \
    --body '[{"inc": 0.5671523656812034, "statCode": "d4AYxC9s"}, {"inc": 0.6687495961121889, "statCode": "roJ95gMs"}, {"inc": 0.8598142284616478, "statCode": "jOetmHjf"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCAzTPIv' \
    --body '[{"statCode": "YLzu9j9A"}, {"statCode": "z1bDHMhh"}, {"statCode": "m172mqgc"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tPFOIo2x' \
    --userId 'd3yMy932' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'G9p35fXp' \
    --userId 'eYBWgWQh' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GhNQbOjb' \
    --userId 'Nb3BCw6r' \
    --body '{"inc": 0.8603119973824767}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ULDdYuXg' \
    --userId 'r9S1Pj7Y' \
    --additionalKey 'NlqhoFb2' \
    --body '{"additionalData": {"OfzLpiga": {}, "Rg4BbfRw": {}, "dLKqsnaZ": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'FtdMdZUO' \
    --userIds 'ShrpATzr' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.21523649436868397, "statCode": "jAuYR57G", "userId": "BGuJc2KN"}, {"inc": 0.4551776417371258, "statCode": "F63uQU7b", "userId": "NRLaRXjx"}, {"inc": 0.7949810281288525, "statCode": "79AzkMdN", "userId": "nl3JQaqf"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8775965606168974, "statCode": "9zGMES73", "userId": "hBtiNXVQ"}, {"inc": 0.9301328423171292, "statCode": "Oh2zfv3c", "userId": "NfmwvMMS"}, {"inc": 0.5771573853849803, "statCode": "zyEn5VN4", "userId": "wWzgXHie"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "4wBpwoH5", "userId": "4DCD0CAu"}, {"statCode": "1s6M8cBG", "userId": "UhZR26ed"}, {"statCode": "SyOk3HhF", "userId": "ZYlcOu09"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.46911600613889937, "description": "UeNAIOxB", "incrementOnly": true, "maximum": 0.37659786023918296, "minimum": 0.36257386994193186, "name": "CiX38j9d", "setAsGlobal": false, "setBy": "SERVER", "statCode": "0ZWiNww8", "tags": ["ZHc4mEnU", "xv0vIOLT", "caXrL5ME"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PHt5vlZb' \
    --limit '57' \
    --offset '54' \
    --statCodes 'yE5pz8Bf' \
    --tags 'nlwclTUB' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'wV2qHZnY' \
    --body '[{"statCode": "6gM31Ty4"}, {"statCode": "JL9zUfn6"}, {"statCode": "nJrdDkxP"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JCLhkU8L' \
    --statCodes '8PJacYw5,KkOMFwR2,iBAHhfj2' \
    --tags 'CQRmGh3P,ncKFMeSs,nSiNIaiz' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xzsADygi' \
    --body '[{"inc": 0.8744917630980089, "statCode": "9lJOssUw"}, {"inc": 0.5795842982142124, "statCode": "JBmWJS4x"}, {"inc": 0.8951751114409706, "statCode": "yrey0Vi5"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '78nui7Sm' \
    --body '[{"inc": 0.845862469046571, "statCode": "AfcQW0RF"}, {"inc": 0.990818565144706, "statCode": "Hz56U3UO"}, {"inc": 0.46707822477801897, "statCode": "SPU8EWmo"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'z0fyllgs' \
    --body '[{"statCode": "W6fjC2R6"}, {"statCode": "xYCPmmuT"}, {"statCode": "Hy5VOFck"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xUcNsq2e' \
    --userId 'b3VsEY16' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f8y8Y9FS' \
    --userId 'PjqXfcIH' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mL5mKVyX' \
    --userId '7LBcBKlD' \
    --body '{"inc": 0.6174933410048185}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yNMTmRdz' \
    --userId 'iOnqg5zn' \
    --body '{"inc": 0.7191960535155775}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Tx91djuh' \
    --userId '2kHok76t' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"7E5Uh1za": {}, "PIKNdizU": {}, "uJbH5bJw": {}}, "additionalKey": "qm928T5h", "statCode": "srHXR19Z", "updateStrategy": "MIN", "userId": "B0AwneRc", "value": 0.8645776065935804}, {"additionalData": {"vqex23PD": {}, "oMfzFteB": {}, "uKs8bW1l": {}}, "additionalKey": "NGOS4SX1", "statCode": "d7C5URgL", "updateStrategy": "MAX", "userId": "nuzpabpe", "value": 0.9550426396449494}, {"additionalData": {"ITILa6Xf": {}, "jJzLy1rP": {}, "IzOoEFVu": {}}, "additionalKey": "0ozknuhq", "statCode": "mWWNNpRh", "updateStrategy": "INCREMENT", "userId": "wR18VgeX", "value": 0.7379492831666102}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'I6Gauedn' \
    --statCode 'fiWgcdTG' \
    --userIds 'KNKh19d6,XD4GoNcU,DL4YXjoZ' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'SWJxP2kR' \
    --additionalKey 'bW1MIlOY' \
    --body '[{"additionalData": {"W74GX8rE": {}, "vZlBfgQl": {}, "oHdU1paf": {}}, "statCode": "g6D8on80", "updateStrategy": "OVERRIDE", "value": 0.11122847821841497}, {"additionalData": {"0wDk8nKW": {}, "rjMK2laX": {}, "XonJxE6v": {}}, "statCode": "aUvf2pUQ", "updateStrategy": "INCREMENT", "value": 0.21954406094130918}, {"additionalData": {"zbm0zJNT": {}, "Q0r1TxVY": {}, "dt3L4vc4": {}}, "statCode": "xtEf4X9C", "updateStrategy": "MAX", "value": 0.6872264760866098}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'f4MeyXsZ' \
    --additionalKey 'T4NbHuXw' \
    --body '[{"additionalData": {"WlfPSvah": {}, "L4X6r5p5": {}, "jue6dRRZ": {}}, "statCode": "bSK5sCwu"}, {"additionalData": {"zvtYzKKB": {}, "diLwZUuN": {}, "xXl57xPw": {}}, "statCode": "kE1Lqmmc"}, {"additionalData": {"xgeLHTTD": {}, "tEA94Imk": {}, "V4i7XeYT": {}}, "statCode": "WN2EMlBq"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode '25V9S1DJ' \
    --userId 'G6tQlrLU' \
    --additionalKey 'nvh5Ws5K' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '6CYbeWvr' \
    --userId 'VyUWv8ue' \
    --additionalKey 'wmqvg6kf' \
    --body '{"additionalData": {"ZvEbo6Mc": {}, "YXGgea5O": {}, "LMlnT8DV": {}}, "updateStrategy": "INCREMENT", "value": 0.4945452522530034}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"sAFDL8EY": {}, "fzuWCIOe": {}, "deTNQTaa": {}}, "additionalKey": "6HrUEGSL", "statCode": "4RGENYq3", "updateStrategy": "INCREMENT", "userId": "Lspc0Hra", "value": 0.15454052176016808}, {"additionalData": {"G6PyYzZI": {}, "8NxR3XPH": {}, "Ukrnyk9G": {}}, "additionalKey": "cY2HKXd7", "statCode": "CM9SOjA1", "updateStrategy": "MAX", "userId": "pJy7y1GQ", "value": 0.7490988382282794}, {"additionalData": {"pwqkcMKG": {}, "UkNHt96z": {}, "ERaXjcdu": {}}, "additionalKey": "7OocStKP", "statCode": "XI5sF5nA", "updateStrategy": "MAX", "userId": "6VIyxXWQ", "value": 0.01751771131443347}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c8CHF6Ct' \
    --additionalKey 'sZqOsAtS' \
    --statCodes 'jDDRZ4xr,KDmcD86R,cwgxPPgg' \
    --tags 'nvdwdLvF,L5iN8UNz,W0V933uz' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId '9atlDsFF' \
    --additionalKey '08PqwuCH' \
    --body '[{"additionalData": {"wl2Ae4jR": {}, "4h5hmaaB": {}, "Z2IaAK7c": {}}, "statCode": "V32HVxcY", "updateStrategy": "INCREMENT", "value": 0.7733240111355615}, {"additionalData": {"dsKb4Oxs": {}, "WcTEHNYG": {}, "QTxcIyjg": {}}, "statCode": "Sja2jpQL", "updateStrategy": "OVERRIDE", "value": 0.871797020820494}, {"additionalData": {"Ls3Y48AI": {}, "apcDmbJ8": {}, "H9keptyG": {}}, "statCode": "WAmHaR31", "updateStrategy": "OVERRIDE", "value": 0.7671138728985433}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ZwKFLKjh' \
    --userId 'sD5LJBeR' \
    --additionalKey 'O4W8b7kX' \
    --body '{"additionalData": {"6KgzYJl1": {}, "ILg9JaNj": {}, "PH9shwgZ": {}}, "updateStrategy": "MIN", "value": 0.5599910954922923}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE