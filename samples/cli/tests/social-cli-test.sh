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
    --body '{"maxSlotSize": 92, "maxSlots": 90}' \
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
    --userId 'iyU8wfpF' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'VlnK5um0' \
    --body '{"maxSlotSize": 30, "maxSlots": 97}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'iasOSmcz' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'x2SEcd3C' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'F6B0Asnb' \
    --userId 'rDQ7iVW2' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'yPM4I6si' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'aDDWH3MD' \
    --userId '0yKemTfI' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'NwvnZhqe,gE2rHvBH,EoBcYnjQ' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1D5jA28' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '45qSwh50' \
    --body '{"achievements": ["lFikmx6a", "SYVFw03C", "TuGWcdWU"], "attributes": {"MaenNKCI": "bIq20Vrj", "ZXOl0M0L": "XizEzqIK", "uc4GUCMQ": "D5qRp2Lt"}, "avatarUrl": "2eUDMwYt", "inventories": ["JWvFzwRN", "liL2fvMn", "T2tFvpMd"], "label": "oLhiiYNZ", "profileName": "AAGyVmc5", "statistics": ["KCLURSwX", "khGtOZ2U", "GAbU71E7"], "tags": ["IhrT4433", "gulhih8F", "EXsB0p7w"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'OoTl7nsC' \
    --userId 'czdyp41G' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '9ndI54x7' \
    --userId '7YokzEC3' \
    --body '{"achievements": ["ni3h8PAY", "7QPWVKej", "WSoskih5"], "attributes": {"03HzuKiN": "Sf8g4OKc", "AQaKBKdq": "kUczeVFr", "uMIIWgqx": "yLVwlUFl"}, "avatarUrl": "iU5mRaN1", "inventories": ["IMteDPu5", "HzWGoNwH", "Nl2kP6qK"], "label": "2PL8NpEl", "profileName": "38Rm1aSb", "statistics": ["YM2fBZkR", "EXcnHMRV", "Q8uC9M6G"], "tags": ["OH9AFR9p", "sK14BS3R", "Q6o29Yw1"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'm7IK8TH0' \
    --userId 'KWcKKFk5' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'DWToHasU' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'i4zUZvQp' \
    --userId 'LuKjJ4cQ' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'R3dLLt7E' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'y37dmDUN' \
    --userId 'Gfo9i4eU' \
    --body '{"name": "rSTdWZRy", "value": "weV67qiD"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '9XoZ931A' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'PLBsu6Fj' \
    --label 'z4qPAiwv' \
    --tags 'bfqzS6jG,FIhrnV9D,nGTs6xaV' \
    --checksum 'hCGMz66s' \
    --customAttribute 'gLPPE8Ec' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'GFLHmE5g' \
    --userId 'mSDjqq6i' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId '8HVVXJ19' \
    --userId 'yMnWgpMW' \
    --label 'wOZrFMXQ' \
    --tags 'fdWQ6tt0,w5eTv2mt,fzRv1KtR' \
    --checksum 'I9UVxdu1' \
    --customAttribute 'aJqrqZN1' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'rMw44x1x' \
    --userId 'XN44l5sm' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'jhe33jp8' \
    --userId 'YUxmGQJN' \
    --body '{"customAttribute": "UvSZgaaP", "label": "IJ2rlXKp", "tags": ["p0qQJhZI", "jD7XsSWT", "0319kFhu"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '55' \
    --statCodes 'w6aDm5SH' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jvUoXYnY' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'O7hP52yz' \
    --userIds 'a8Rc3uQ4' \
    > test.out 2>&1
eval_tap $? 28 'BulkFetchStatItems' test.out

#- 29 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9400882797620447, "statCode": "XGrroZKd", "userId": "l2L75Vgo"}, {"inc": 0.7740053272903635, "statCode": "xXQd1eAu", "userId": "s5nSzhak"}, {"inc": 0.783849723031785, "statCode": "fX13PlXg", "userId": "JGKkG7D3"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItem' test.out

#- 30 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2197076145908856, "statCode": "syjJMKwY", "userId": "3dGF9h1k"}, {"inc": 0.8772935439785674, "statCode": "PTJpEznO", "userId": "ZGXJLlb7"}, {"inc": 0.5208595021178668, "statCode": "6p0u8wz5", "userId": "ix114lQz"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkIncUserStatItemValue' test.out

#- 31 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gdUH3RXv' \
    --userIds 'xBYkwWfX,PR7pYXic,GGXEVENi' \
    > test.out 2>&1
eval_tap $? 31 'BulkFetchOrDefaultStatItems' test.out

#- 32 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "Q6fPsbDX", "userId": "dZl4POyj"}, {"statCode": "ZvMNndMP", "userId": "iX57Ukq9"}, {"statCode": "7zXjP2CD", "userId": "eJmkSWBH"}]' \
    > test.out 2>&1
eval_tap $? 32 'BulkResetUserStatItem' test.out

#- 33 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 33 'GetStats' test.out

#- 34 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.20727716650868178, "description": "hJgmykbc", "incrementOnly": true, "maximum": 0.9569171376915855, "minimum": 0.49552016071352856, "name": "4AJAygty", "setAsGlobal": true, "setBy": "SERVER", "statCode": "CCFFgOkY", "tags": ["1vERuZEd", "Rz1bZlLm", "uYM2bZyZ"]}' \
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
    --limit '53' \
    --offset '77' \
    --keyword '13lqbHtu' \
    > test.out 2>&1
eval_tap $? 37 'QueryStats' test.out

#- 38 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '4pdn23zc' \
    > test.out 2>&1
eval_tap $? 38 'GetStat' test.out

#- 39 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ednLkzy9' \
    > test.out 2>&1
eval_tap $? 39 'DeleteStat' test.out

#- 40 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HJvwnHnf' \
    --body '{"defaultValue": 0.02788067921416093, "description": "mgWYD0ZV", "name": "t6f5dDiV", "tags": ["oVy2zBsg", "C0lAiqH2", "eAbqw5fy"]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateStat' test.out

#- 41 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HOyxMwl2' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTiedStat' test.out

#- 42 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'AWl09wqU' \
    --limit '94' \
    --offset '45' \
    --statCodes 'zbGHZK0H' \
    --tags 'O7blDtHg' \
    > test.out 2>&1
eval_tap $? 42 'GetUserStatItems' test.out

#- 43 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'K7OVayd0' \
    --body '[{"statCode": "qRW7vmZ5"}, {"statCode": "BtjfRh4s"}, {"statCode": "yfGzinqa"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkCreateUserStatItems' test.out

#- 44 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'l7fs5GNq' \
    --body '[{"inc": 0.31329605066651545, "statCode": "wmspGdkB"}, {"inc": 0.5896552914339053, "statCode": "oOMdTwbR"}, {"inc": 0.0762156450727558, "statCode": "11R6B7a4"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItem1' test.out

#- 45 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vZrQkEtF' \
    --body '[{"inc": 0.05376795900823994, "statCode": "FZqULsN6"}, {"inc": 0.5224689041559345, "statCode": "5M3NXgg4"}, {"inc": 0.7327367960736196, "statCode": "NmooT633"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkIncUserStatItemValue1' test.out

#- 46 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NEAdXqEs' \
    --body '[{"statCode": "BrNJSL6t"}, {"statCode": "40RG3hYY"}, {"statCode": "E8YJtSKR"}]' \
    > test.out 2>&1
eval_tap $? 46 'BulkResetUserStatItem1' test.out

#- 47 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'p8K1WaBt' \
    --userId 'KohEyE5U' \
    > test.out 2>&1
eval_tap $? 47 'CreateUserStatItem' test.out

#- 48 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'H7tRe4Hu' \
    --userId 'rSgY5hsp' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserStatItems' test.out

#- 49 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GiWNKba9' \
    --userId 'bAs7tIsL' \
    --body '{"inc": 0.2486777148578132}' \
    > test.out 2>&1
eval_tap $? 49 'IncUserStatItemValue' test.out

#- 50 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'njkQddQ9' \
    --userId 'OzWwsQNO' \
    --additionalKey 'kw9NwdVL' \
    --body '{"additionalData": {"axBKyF9y": {}, "x45Tv7Xo": {}, "hBu3i4jL": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'ResetUserStatItemValue' test.out

#- 51 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '68' \
    --statCodes 'mMo9AzOP' \
    > test.out 2>&1
eval_tap $? 51 'GetGlobalStatItems1' test.out

#- 52 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YbKsOZSf' \
    > test.out 2>&1
eval_tap $? 52 'GetGlobalStatItemByStatCode1' test.out

#- 53 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ww3BW0hE' \
    --userIds 'cn4zp3WU' \
    > test.out 2>&1
eval_tap $? 53 'BulkFetchStatItems1' test.out

#- 54 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7469273376201908, "statCode": "bjZ5uWTm", "userId": "IBAkPT4g"}, {"inc": 0.4868593610619196, "statCode": "VPPA7tP3", "userId": "2nvmSX1k"}, {"inc": 0.4532389495286612, "statCode": "0EyX3T4k", "userId": "34GjVr1M"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkIncUserStatItem' test.out

#- 55 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8927792738728787, "statCode": "8oUz40Pf", "userId": "UaG1e71v"}, {"inc": 0.2681369408968036, "statCode": "uYAXrcKE", "userId": "th52rfBs"}, {"inc": 0.2166938155679402, "statCode": "rv7KU7Kw", "userId": "pJE06Lqo"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItemValue' test.out

#- 56 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "wHoOaTf0", "userId": "u09nXVyk"}, {"statCode": "jCSmNnCa", "userId": "dao3kguc"}, {"statCode": "ysEP34vZ", "userId": "b7kHUOih"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkResetUserStatItem2' test.out

#- 57 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.07520066747817, "description": "o6yad6bw", "incrementOnly": true, "maximum": 0.05316640876270884, "minimum": 0.933540998910816, "name": "aAqgVsqF", "setAsGlobal": true, "setBy": "SERVER", "statCode": "9CSIi29Q", "tags": ["3AI2ufA2", "X5H2IwJ5", "izWnAhOO"]}' \
    > test.out 2>&1
eval_tap $? 57 'CreateStat1' test.out

#- 58 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '8rdY0KmW' \
    --limit '32' \
    --offset '99' \
    --statCodes 'ZWCoxuO6' \
    --tags 'DyJadILV' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryUserStatItems' test.out

#- 59 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'gtUBQu2w' \
    --body '[{"statCode": "A2TcoiFP"}, {"statCode": "oUEGVa3T"}, {"statCode": "YA9Q38wk"}]' \
    > test.out 2>&1
eval_tap $? 59 'PublicBulkCreateUserStatItems' test.out

#- 60 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dB0ZAPFb' \
    --statCodes 'UgxdoUdH,YhoJsABr,f416Gxyo' \
    --tags '02dU7nxm,XHPpW5Vf,UJd26k31' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryUserStatItems1' test.out

#- 61 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AhNkf77r' \
    --body '[{"inc": 0.4238657722967961, "statCode": "q1Qmb8vU"}, {"inc": 0.21932780318062428, "statCode": "0FSOLkcW"}, {"inc": 0.6640332666506359, "statCode": "UizvJ7nB"}]' \
    > test.out 2>&1
eval_tap $? 61 'PublicBulkIncUserStatItem1' test.out

#- 62 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'D8NcCquc' \
    --body '[{"inc": 0.559948672147449, "statCode": "x9EVbQn0"}, {"inc": 0.30895232682973506, "statCode": "E9NT01Of"}, {"inc": 0.14578724609868254, "statCode": "uWfddJmd"}]' \
    > test.out 2>&1
eval_tap $? 62 'BulkIncUserStatItemValue2' test.out

#- 63 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '1904EhrE' \
    --body '[{"statCode": "eXt6DNn2"}, {"statCode": "8lqbuW6T"}, {"statCode": "zkC47WbP"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkResetUserStatItem3' test.out

#- 64 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CeqtgMfF' \
    --userId 'qHnnm9lO' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserStatItem' test.out

#- 65 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EhOmELMx' \
    --userId 'ME3X2Yfz' \
    > test.out 2>&1
eval_tap $? 65 'DeleteUserStatItems1' test.out

#- 66 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QeQdj7sR' \
    --userId '1Q02PJZG' \
    --body '{"inc": 0.8789834539223788}' \
    > test.out 2>&1
eval_tap $? 66 'PublicIncUserStatItem' test.out

#- 67 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LbCqMaDA' \
    --userId '5IyGLHuP' \
    --body '{"inc": 0.04175401556805736}' \
    > test.out 2>&1
eval_tap $? 67 'PublicIncUserStatItemValue' test.out

#- 68 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '0e38uydc' \
    --userId 'AfeDfFaX' \
    > test.out 2>&1
eval_tap $? 68 'ResetUserStatItemValue1' test.out

#- 69 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"fiuvKBDy": {}, "JxaYo4Bx": {}, "noNW5UNK": {}}, "additionalKey": "972tTfiN", "statCode": "KXKKizmr", "updateStrategy": "OVERRIDE", "userId": "sZKMwWsh", "value": 0.8039793776188189}, {"additionalData": {"5zQ2CNNm": {}, "s2u88ToF": {}, "eM7raNN1": {}}, "additionalKey": "HBKoTbkx", "statCode": "TEVakbhX", "updateStrategy": "MIN", "userId": "pQSKXRVQ", "value": 0.5465103759260189}, {"additionalData": {"Z3nGZ15u": {}, "cVB0MFb8": {}, "JNsfIcZ5": {}}, "additionalKey": "SCZiaPSf", "statCode": "yPyyvsur", "updateStrategy": "OVERRIDE", "userId": "05iAiPai", "value": 0.29288296452308904}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItemV2' test.out

#- 70 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'H02hguxX' \
    --statCode 'FHUdscdY' \
    --userIds 'j57u16XB,TFAo7zVO,Jrr2tPpL' \
    > test.out 2>&1
eval_tap $? 70 'BulkFetchOrDefaultStatItems1' test.out

#- 71 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '6zwaaaDf' \
    --additionalKey 'EUIvlzfy' \
    --body '[{"additionalData": {"W0ViBuGh": {}, "wcZEkGhl": {}, "5DEv3e2W": {}}, "statCode": "DiSbOIzC", "updateStrategy": "OVERRIDE", "value": 0.5621132004868311}, {"additionalData": {"PuwbYZka": {}, "TDT7SkLb": {}, "UDiF5U8f": {}}, "statCode": "9DLc9PAI", "updateStrategy": "MAX", "value": 0.5809441135337117}, {"additionalData": {"kHhQZlqR": {}, "xALJ5w4J": {}, "WHZIjW8I": {}}, "statCode": "0CgB7VE6", "updateStrategy": "MAX", "value": 0.25088784501152606}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem' test.out

#- 72 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '8dxO8Iil' \
    --additionalKey 'VyVrqcB5' \
    --body '[{"additionalData": {"sv4DeRpN": {}, "hRNQWr5G": {}, "zbNwowmF": {}}, "statCode": "LbSB3oB0"}, {"additionalData": {"Q2day8Kv": {}, "ULkzom78": {}, "XAW5WyvX": {}}, "statCode": "04mxBoWN"}, {"additionalData": {"BTLDKTcy": {}, "QwuRq23m": {}, "vTgZMIPO": {}}, "statCode": "avxP3pE8"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItemValues' test.out

#- 73 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'YSNcvWdY' \
    --userId '0JWE4pRI' \
    --additionalKey '7Gs9qnRo' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems2' test.out

#- 74 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hCpiumMD' \
    --userId 'eKw6SKzx' \
    --additionalKey 'DY9Gjlbd' \
    --body '{"additionalData": {"rRFQzo4y": {}, "Zbl7E1Q6": {}, "eO1tTtbX": {}}, "updateStrategy": "MIN", "value": 0.1333471802844678}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue' test.out

#- 75 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"5fWd8uQx": {}, "MTymon5c": {}, "1VRoPvlv": {}}, "additionalKey": "L0v0juvV", "statCode": "JebH1qqc", "updateStrategy": "MIN", "userId": "LkLwptNZ", "value": 0.2236418007974731}, {"additionalData": {"MwDjFNZ0": {}, "hUHfUIwo": {}, "piZWVpJl": {}}, "additionalKey": "9sBjZHKm", "statCode": "7ectN7qK", "updateStrategy": "INCREMENT", "userId": "ze3KeVyb", "value": 0.5254511358165012}, {"additionalData": {"fnAZNrXW": {}, "sKhcqfY0": {}, "UJPQRtkk": {}}, "additionalKey": "vKgK21SM", "statCode": "YnHErnzC", "updateStrategy": "OVERRIDE", "userId": "KfIIJBeS", "value": 0.8448255750766577}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkUpdateUserStatItem1' test.out

#- 76 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'e3FiMJrl' \
    --additionalKey 'roQT3hzR' \
    --statCodes 'FDcQrBNt,lCgp7lxt,czKZNttL' \
    --tags 'IOzPPngP,vpmS1CHh,irHEdG0T' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems2' test.out

#- 77 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SvGFQftY' \
    --additionalKey 't13Rejkn' \
    --body '[{"additionalData": {"UX3X7Ldx": {}, "CGTXVk0l": {}, "MwgdURln": {}}, "statCode": "rRxMW3YV", "updateStrategy": "MAX", "value": 0.054289770822337324}, {"additionalData": {"4AIOWHuK": {}, "zBojy2IT": {}, "dzXiLAvk": {}}, "statCode": "IhNzrar2", "updateStrategy": "INCREMENT", "value": 0.4324512918658807}, {"additionalData": {"U2QnUHxO": {}, "hWxCOTMS": {}, "MQ12oh5z": {}}, "statCode": "QUzFmEc4", "updateStrategy": "MIN", "value": 0.5443797305638213}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItem2' test.out

#- 78 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xDBIwZKa' \
    --userId 'GOVSYvI1' \
    --additionalKey 'V69Wv4dS' \
    --body '{"additionalData": {"JjMHfkQn": {}, "z8oFWBhv": {}, "DYXJ8HM2": {}}, "updateStrategy": "INCREMENT", "value": 0.6198189853849749}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE