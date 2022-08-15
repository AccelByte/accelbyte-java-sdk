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
    --body '{"maxSlotSize": 60, "maxSlots": 46}' \
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
    --userId 'bQ9kWx84' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'yByromay' \
    --body '{"maxSlotSize": 66, "maxSlots": 100}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'NCARRLXm' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'Js7DQ0Oo' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '8sHkknkl' \
    --userId 'NjEYCZh6' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '8i6e08yL' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'QzJXjqZQ' \
    --userId 'SxcI3Fyq' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'E59lEiVT,LDh1JVWK,bjOOdhkN' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '7pCypagn' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z3bzwYeS' \
    --body '{"achievements": ["fyZNmIr4", "jWhjy5Mi", "PPOwYoaN"], "attributes": {"0gcMN3HZ": "2Ol4Jutr", "Frdt0m8G": "FPNP4kgp", "cm00PIly": "M0JOIUIL"}, "avatarUrl": "rpqWOy0R", "inventories": ["EePVi06l", "PMThzmjs", "lp4t7RJh"], "label": "SIgUJJqb", "profileName": "Gly31oND", "statistics": ["VjvtvJYr", "XO0FYLfa", "RzmJQN8P"], "tags": ["8NRLyiLL", "qUBII3pF", "HWNJ67we"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'bDgSXkuk' \
    --userId 'f0nj9Ujn' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'XDBeO4M9' \
    --userId 'CLzoP9BK' \
    --body '{"achievements": ["7fsAhWMd", "AGuLAfwz", "LdZO3mTD"], "attributes": {"Je3F9bwS": "gauTzFXN", "Va9CGwn1": "zA03GGM7", "1McfVabT": "xIXEX0o5"}, "avatarUrl": "B5bosMRm", "inventories": ["hqyIwygc", "y2U4HcNW", "7NqQZTfn"], "label": "QqW46mls", "profileName": "27fiHD6T", "statistics": ["pdpDam5K", "XBRyca6n", "KnwSDXYA"], "tags": ["QPacqNLY", "LbmkwaMT", "IBKSdnoN"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'pIw6ekv7' \
    --userId '6WmMpreB' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'ArdnEq6K' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'JPuVCH9P' \
    --userId 'bFBfeis1' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'RzvENjmG' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'q01BhsGH' \
    --userId 'iYYNaz06' \
    --body '{"name": "iBowwHOb", "value": "GAnStTFQ"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'zTfCywb0' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'KPW8BwTY' \
    --label '95U4A06L' \
    --tags 'KfMxHyPC,QZvzU2So,kK8e5KZl' \
    --checksum 'IXY5N9JA' \
    --customAttribute 'sS3rKZJm' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'va22Kvq5' \
    --userId '3S0vUYf1' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'I4Rmkj6L' \
    --userId '092ZCkfQ' \
    --label '3KCNmWiu' \
    --tags 'yJpP15fo,gi42qy8x,58dI89Jz' \
    --checksum 'NgxH9tka' \
    --customAttribute '5s9jB3a1' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'o90S6jui' \
    --userId 'HcBJhPVY' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'Zf9FohL2' \
    --userId 'YZlMbx76' \
    --body '{"customAttribute": "iaEzeOEi", "label": "KoMfE4Of", "tags": ["IAGlnOic", "bwBDGbEc", "k0eIi8i5"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uQic80mY' \
    --userIds 'UZyyIyhr' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3226962278524338, "statCode": "Ozi4Sz2e", "userId": "N4pdatVQ"}, {"inc": 0.7997217517232582, "statCode": "mbfnKmR2", "userId": "PVr1H6HK"}, {"inc": 0.9095172784900208, "statCode": "QXINyJGC", "userId": "IkCjHagr"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8156794982759922, "statCode": "tgPX4cIC", "userId": "VXstHqIW"}, {"inc": 0.5810493534321498, "statCode": "nVMvUrNi", "userId": "WzGQXEg2"}, {"inc": 0.03370299594826265, "statCode": "OS0HZKds", "userId": "wjMHldo7"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ntYtTyH1' \
    --userIds 'FE8k42t2,vrW3Hbzb,rPE65djE' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "eDSgiE0Y", "userId": "MArUYcTZ"}, {"statCode": "J0YmeaiR", "userId": "1sX23TV1"}, {"statCode": "N6aOl4Lu", "userId": "4fmSkx9o"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.2507059722892072, "description": "eNzeFYWX", "incrementOnly": true, "maximum": 0.0816868713043204, "minimum": 0.5808828930102731, "name": "8CYkplon", "setAsGlobal": false, "setBy": "SERVER", "statCode": "9fCng8Xt", "tags": ["lO6ncZEk", "wKdTLpBz", "f4X1kEBN"]}' \
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
    --limit '49' \
    --offset '25' \
    --keyword 'kgbbNsb4' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '1wI0naE5' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '01uUSJ5N' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NcS70T1m' \
    --body '{"description": "gifjOMNb", "name": "hL8OJDSb", "tags": ["Yy62dalu", "nwwhw4HO", "l2wfY3yB"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '0YMFAUt8' \
    --limit '28' \
    --offset '9' \
    --statCodes 'lk8cCGhc' \
    --tags 'UINL85Ma' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'c5wEx1UN' \
    --body '[{"statCode": "jUVURxhO"}, {"statCode": "JKUhdZOB"}, {"statCode": "EaTJveOA"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V8brNvt6' \
    --body '[{"inc": 0.8472400086477407, "statCode": "E5U7NY5T"}, {"inc": 0.21054499092088308, "statCode": "N0edFpqg"}, {"inc": 0.7032547315876918, "statCode": "hmYwOgVi"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yh0lSVpY' \
    --body '[{"inc": 0.939187145545095, "statCode": "l82cVYu6"}, {"inc": 0.13026938608831284, "statCode": "Agtb6usJ"}, {"inc": 0.9051624205521422, "statCode": "6AgVY8Pq"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v4rHLIcT' \
    --body '[{"statCode": "SjkaYcow"}, {"statCode": "AJ9m0bjQ"}, {"statCode": "Jou1LkFr"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RX2na3NB' \
    --userId 'LC00Isjk' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Y4scgymm' \
    --userId 'QwvdHlFJ' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hXHE7CZ1' \
    --userId 'KN80suue' \
    --body '{"inc": 0.5054040022566096}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Kyn8iwHx' \
    --userId 'R3RFEAAM' \
    --additionalKey 'f6Uhd62c' \
    --body '{"additionalData": {"TrPAgwyU": {}, "T4Kz6aIC": {}, "f5LMmse9": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'LHk6ZWlR' \
    --userIds 'sof5ew3W' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7043246311526505, "statCode": "UewTHvth", "userId": "PD3ntXHj"}, {"inc": 0.6664816154688324, "statCode": "CQl6zHql", "userId": "VE0ahNFJ"}, {"inc": 0.6340336814511618, "statCode": "WMJr3udv", "userId": "VQPqS5Ud"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.8919853980012046, "statCode": "fqKxQcKw", "userId": "q7ylnpUU"}, {"inc": 0.044817829895867245, "statCode": "lVK2zSUT", "userId": "IRcB5YRT"}, {"inc": 0.2743799128090294, "statCode": "fYG9Bzwn", "userId": "jbn0Dfg5"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "ehfByfkb", "userId": "bunIgfNW"}, {"statCode": "n4L90B5o", "userId": "cKl1x4Tc"}, {"statCode": "CuijuwYe", "userId": "17ZVdaQo"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.5974292339792904, "description": "SAHGuIZv", "incrementOnly": true, "maximum": 0.5285316028967441, "minimum": 0.9863444167284491, "name": "uB1liILP", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "7do6YLNr", "tags": ["CfGRdJnr", "58JvUnJN", "QQw8Dcbf"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'bInfT0jm' \
    --limit '89' \
    --offset '55' \
    --statCodes 'WqF6IvQv' \
    --tags 'g9WRUL2R' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'juh1RmyT' \
    --body '[{"statCode": "c1AV6mo4"}, {"statCode": "3WOSaEEf"}, {"statCode": "dLOWgMDz"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IiJj3leU' \
    --statCodes 'aoFE4hwM,d97Za03K,LpOh5XMB' \
    --tags '9B2OfbRP,I8AOLqQX,jiOM2kXa' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'IC8KFf5D' \
    --body '[{"inc": 0.18312677974741032, "statCode": "Wpbh2x7D"}, {"inc": 0.30596397011239285, "statCode": "oaNg8TuO"}, {"inc": 0.5440657249721832, "statCode": "9QTIcOzU"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KEfEEvXF' \
    --body '[{"inc": 0.7129473387286481, "statCode": "t5QN6lUR"}, {"inc": 0.4758851834725474, "statCode": "3NGfR1rP"}, {"inc": 0.5318179597330666, "statCode": "eEQzh2QY"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId '73gbxRqi' \
    --body '[{"statCode": "SSz2xEto"}, {"statCode": "FdJxF40n"}, {"statCode": "wkia7w8y"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'o0vlKTja' \
    --userId 'J8lMDqOQ' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'au6LBRx5' \
    --userId '4b9UVlMw' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nhs0Jeq9' \
    --userId 'QnMpj8SU' \
    --body '{"inc": 0.8575006112321898}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '01olxPbR' \
    --userId 'kuca1Coa' \
    --body '{"inc": 0.3294790107042347}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '9wc7bJQf' \
    --userId 'DoPNfdXt' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"k1KiRgYK": {}, "OCBiG5cL": {}, "5xTji7Zg": {}}, "additionalKey": "sN7m6VZ8", "statCode": "raE2P23D", "updateStrategy": "OVERRIDE", "userId": "6WdhJlaN", "value": 0.3921638842510464}, {"additionalData": {"KPm1RSKz": {}, "yVhUVsAg": {}, "wmGsoJ4S": {}}, "additionalKey": "AegFhGo4", "statCode": "Uuwi0Mg5", "updateStrategy": "MAX", "userId": "OZzbsG2y", "value": 0.6008389530391317}, {"additionalData": {"4NtWeOjL": {}, "UPlP4cgu": {}, "JBWzSbST": {}}, "additionalKey": "NNpJwdD4", "statCode": "JFvITs2Y", "updateStrategy": "OVERRIDE", "userId": "9Gvpks8M", "value": 0.5065604794445003}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'yJsaOjUW' \
    --statCode 'nudW5q0K' \
    --userIds 'Auws4BGx,zwi5MZgn,nJz5Xz6F' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId '5sDqoL7b' \
    --additionalKey 'gsFLSijK' \
    --body '[{"additionalData": {"DkFTFDTO": {}, "BraNn6R1": {}, "lJRNvU74": {}}, "statCode": "lQ76CmnR", "updateStrategy": "INCREMENT", "value": 0.7261829000505913}, {"additionalData": {"k0ro8OtD": {}, "MZkUFN2O": {}, "ePx1AGMo": {}}, "statCode": "Q7keyNRZ", "updateStrategy": "MAX", "value": 0.05647503779826302}, {"additionalData": {"b4oXtwdB": {}, "QbntusEq": {}, "SKxXoWFv": {}}, "statCode": "fv3pnBxA", "updateStrategy": "OVERRIDE", "value": 0.4419799184072115}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'pQI3uJn1' \
    --additionalKey '9RhxB8f9' \
    --body '[{"additionalData": {"4A12FUtu": {}, "ce0ZJtkC": {}, "zCkxZ2Ro": {}}, "statCode": "M1utZtwv"}, {"additionalData": {"YIbFDY9t": {}, "NttKobwY": {}, "jCGcAHB0": {}}, "statCode": "1YkFnVpA"}, {"additionalData": {"Ivyl1aVC": {}, "apBA8US8": {}, "6raG3mgF": {}}, "statCode": "8JQlfYOm"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f78NnKCa' \
    --userId 'Yj1nvvKY' \
    --additionalKey 'xg49JIuK' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Gu8uaq3s' \
    --userId 'YtKA0rt8' \
    --additionalKey 'G3Q8O3Eg' \
    --body '{"additionalData": {"hVZujO6U": {}, "JoXQP1hg": {}, "gWLh1Zri": {}}, "updateStrategy": "MIN", "value": 0.39315170294750035}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"7jTjt6ux": {}, "QBKMkCf6": {}, "beh7fHBE": {}}, "additionalKey": "F9y68vKF", "statCode": "HJyn3TnP", "updateStrategy": "MIN", "userId": "01hCn5B4", "value": 0.8616282159405994}, {"additionalData": {"oZMxl6UB": {}, "WNhkOru8": {}, "yqkN3s8l": {}}, "additionalKey": "SAjkiLxp", "statCode": "5uh1KncE", "updateStrategy": "MAX", "userId": "PPDhakCo", "value": 0.33793721394737575}, {"additionalData": {"XwoQbRq3": {}, "PIAf017S": {}, "zQA2dQYa": {}}, "additionalKey": "KXarzVbW", "statCode": "f0MOIOE0", "updateStrategy": "MAX", "userId": "a32XybnR", "value": 0.7618485357586298}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId '7j1nv2Y4' \
    --additionalKey '7QVXH2TL' \
    --statCodes 'FRbeZSep,rKpdQpHW,aSKhAHOe' \
    --tags '8687yItQ,K3LstAlr,WIzgbBGw' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NGYtEMZ8' \
    --additionalKey 'sNIcrp80' \
    --body '[{"additionalData": {"lmeIrWbx": {}, "AvjH2A1f": {}, "M98pvGkS": {}}, "statCode": "0DJg44hv", "updateStrategy": "MIN", "value": 0.7699006637295273}, {"additionalData": {"aLSK7V8Z": {}, "96gHf5O4": {}, "LjqyK1t1": {}}, "statCode": "IG70zYJI", "updateStrategy": "MAX", "value": 0.3216210280265017}, {"additionalData": {"Vqqa8h5K": {}, "emvlDqZj": {}, "u1FZhOpY": {}}, "statCode": "b1FIA5b8", "updateStrategy": "INCREMENT", "value": 0.8092422081208858}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'xklzUcMB' \
    --userId 'VvDDD8V6' \
    --additionalKey 'tYIKsNEA' \
    --body '{"additionalData": {"FVdlcYZ9": {}, "4C69ZvFu": {}, "Y5XynAHj": {}}, "updateStrategy": "OVERRIDE", "value": 0.16425749026919345}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE