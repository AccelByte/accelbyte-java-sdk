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
    --body '{"maxSlotSize": 52, "maxSlots": 65}' \
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
    --userId 'Dq2sSIHq' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'KsiiamF4' \
    --body '{"maxSlotSize": 16, "maxSlots": 77}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'tq6Yhcob' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '5lRNCe3D' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'fPe7tuot' \
    --userId 'y5DEZw1y' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'WRT9rody' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'BAUl61Uj' \
    --userId '2xtu8sNl' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'dyddLbuK,R0FhXWnd,Y4pbFNi2' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'aU4DaJYS' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '38rL5IPg' \
    --body '{"achievements": ["a0PTYeLe", "n4iPaHrb", "bZlC4hx0"], "attributes": {"8P7ZEaIf": "m2L2dEPx", "e8sCeV6N": "kdHL1Bos", "yNtIgX6A": "8SZsAO7C"}, "avatarUrl": "Wv1Zlm2P", "inventories": ["QdYh9Jkd", "VRFzKBlp", "tMF6NW2P"], "label": "ndAqmGIa", "profileName": "g2DH1hMZ", "statistics": ["bVqzRGOd", "WsOBk4gV", "oSjUARwu"], "tags": ["NHqx48TA", "NNSWYvNK", "k6godddK"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'fzzX3Ko8' \
    --userId 'LGObxLE0' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'hm2psbzx' \
    --userId 'KvGVXjjx' \
    --body '{"achievements": ["UVGGMNKy", "gGQnX5xo", "MFdcsCNc"], "attributes": {"B7exroDz": "3MFs457T", "Oa2COeSU": "kgP4V0eR", "TUrXnyu4": "7H5PbBZm"}, "avatarUrl": "Sa3GGm84", "inventories": ["UEwcaHLe", "NP6LVep2", "e2Epyuwe"], "label": "AQaHFbfq", "profileName": "qj7Gu6nJ", "statistics": ["64TcOkKa", "188NcSwo", "8xSa3nAi"], "tags": ["neBE0UqE", "PmxmSjEn", "gVBUnDNN"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '7NFjp4sr' \
    --userId '8TRsYvZ3' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'tZA9hxwe' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'cTzNVlll' \
    --userId 'vXyw9l1O' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName '3dSv9tHu' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'nvU9zAdQ' \
    --userId 'fV8Y5tmx' \
    --body '{"name": "Rl1mg4GA", "value": "jf8VMbaa"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '7gJKQxDC' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'xES1STIv' \
    --label 'm1GaCebG' \
    --tags 'XjT9r0QH,P95H1eHv,mB5BwtpU' \
    --checksum 'qRGSshoT' \
    --customAttribute 'Farl0jdi' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'SIssmziT' \
    --userId 'PfYzISpX' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'YhOgV8Jm' \
    --userId '3pdY62xe' \
    --label '1Dv5SKN7' \
    --tags 'lgFOVh4h,kztmQksO,VuH6UzLT' \
    --checksum 'OGpR5bqD' \
    --customAttribute 'qc8tiBgo' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'MiwcxoAk' \
    --userId 'cXJU56OX' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'Wix3tQoa' \
    --userId 'xqGOcunY' \
    --body '{"customAttribute": "cuIShVHc", "label": "pwAB5TG1", "tags": ["CHdDMb3j", "RslqmELT", "rv012ZyX"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mz44Csx8' \
    --userIds 'eIznTiVP' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.17873013276169225, "statCode": "Ep8nu8ta", "userId": "C6ufkWPv"}, {"inc": 0.13162237071385097, "statCode": "uGp8iHWU", "userId": "nlsZTNSm"}, {"inc": 0.8907563661283242, "statCode": "edj1gJCb", "userId": "Cu17nEyA"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5134914286886134, "statCode": "5xRTvVBp", "userId": "lmrRFVTC"}, {"inc": 0.10097568728567619, "statCode": "H1GmDSVH", "userId": "k1NRGRmb"}, {"inc": 0.6789803277175788, "statCode": "3TZBArnT", "userId": "sk7LCxf7"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'C7EaGqxH' \
    --userIds 'MHoFEolm,oJDZ0GVz,UkRS2Cly' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "LXuLaZXc", "userId": "1YJZitT6"}, {"statCode": "Gz2iShu3", "userId": "QdBk56Xk"}, {"statCode": "3d4xZajd", "userId": "ZEQjzcTg"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '14' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.24488929253409775, "description": "tyGvnd9c", "incrementOnly": false, "maximum": 0.7207006608783318, "minimum": 0.47164666950262657, "name": "RzJAgV1D", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "8ePjWXru", "tags": ["zTJr3Jjc", "YrTEFGWv", "Q5xMW9L5"]}' \
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
    --limit '18' \
    --offset '13' \
    --keyword 'hrJKEGhL' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RzylAJ78' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'u4muOWsU' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'yvP8Apr9' \
    --body '{"description": "X3GEBCL6", "name": "z8NknY4d", "tags": ["CGtIxXUS", "Ixfae4co", "6OTbYWB9"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'LUHJXztH' \
    --limit '48' \
    --offset '60' \
    --statCodes 'eoNa6G5L' \
    --tags 'nxzaebR8' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'mhh7Kol9' \
    --body '[{"statCode": "Rod7bCc2"}, {"statCode": "Y7wcU3F7"}, {"statCode": "s7qEOomZ"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ctoYRFxP' \
    --body '[{"inc": 0.21629735429142738, "statCode": "Qvck6iC6"}, {"inc": 0.10813542568016066, "statCode": "TMzX6WM0"}, {"inc": 0.3484129449123339, "statCode": "hjdrKsP3"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QnSNyvNk' \
    --body '[{"inc": 0.22408957746184732, "statCode": "Nha2TOVM"}, {"inc": 0.8327362434984251, "statCode": "SyF0o9HM"}, {"inc": 0.12708603641856475, "statCode": "hGiZNsco"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R0D0PvQj' \
    --body '[{"statCode": "yZarykNV"}, {"statCode": "EkWFLAab"}, {"statCode": "4Kr9Li6e"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ch3iA0kq' \
    --userId 'oKSoLBIl' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'iCsHaga6' \
    --userId 'ThIQWQj8' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jpHDC6qM' \
    --userId 'xunop7Qd' \
    --body '{"inc": 0.4962997141559983}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'kxLHE9fR' \
    --userId '7ptc2GJW' \
    --additionalKey '2qLWBHG1' \
    --body '{"additionalData": {"txo16GOt": {}, "s4OCrsNS": {}, "g0XnFQgY": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'rdwwCuYR' \
    --userIds 'JGrguLJd' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4051495210694206, "statCode": "Lbbfew82", "userId": "ueMAUv1C"}, {"inc": 0.46938665201244234, "statCode": "OsOyLdIA", "userId": "IMMH0jSy"}, {"inc": 0.09029008973717922, "statCode": "WkblKl5P", "userId": "iSJBNR60"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7264721288375369, "statCode": "gkehuMiR", "userId": "fbzzW3OV"}, {"inc": 0.697535990223313, "statCode": "vPzHCfRa", "userId": "oKY039JR"}, {"inc": 0.7694971161571835, "statCode": "gYSnREey", "userId": "cQozHLIM"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "kqaFsLsb", "userId": "PFTm2fgr"}, {"statCode": "TjCr8ieo", "userId": "8H6TepSh"}, {"statCode": "FrVR80S1", "userId": "5Xbp9Eax"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.25067413429781804, "description": "fkrAe2mq", "incrementOnly": true, "maximum": 0.9301630212668056, "minimum": 0.24947974017025376, "name": "oTjsLmzO", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "JnAZDTsS", "tags": ["Ci1KIKRY", "OjVcE1B5", "OSlfi9TB"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'NFYrQM8k' \
    --limit '41' \
    --offset '15' \
    --statCodes 'OCFp51iJ' \
    --tags 'NLLSuHxd' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'rZQgA5h4' \
    --body '[{"statCode": "qPb2rySp"}, {"statCode": "pOILcblN"}, {"statCode": "5kVB71fY"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qHT58d3m' \
    --statCodes 'CmFsBZLR,N45BjQsG,S4bBMQjO' \
    --tags 'YeBRXyHh,OQN024ZN,RCymDpHe' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQKwSmS7' \
    --body '[{"inc": 0.6894181921350597, "statCode": "PI8S3zRP"}, {"inc": 0.6785250915048493, "statCode": "9mCApeph"}, {"inc": 0.02842359690583751, "statCode": "tCDLcaJs"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ndha0tza' \
    --body '[{"inc": 0.34214734913204636, "statCode": "gaAEI3J9"}, {"inc": 0.5369018004098284, "statCode": "stMrd1T2"}, {"inc": 0.0977970017830857, "statCode": "1DWo15QO"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AdpwJ53a' \
    --body '[{"statCode": "gk0E7u4J"}, {"statCode": "Rs2fnd68"}, {"statCode": "TIEitpWP"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DOI908eY' \
    --userId 'ANCwik6d' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'j6Qoo1oz' \
    --userId 'f7yV3uc3' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bn5e6Xp3' \
    --userId 'zHfGqnFF' \
    --body '{"inc": 0.9509775368220377}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cRgLWUVM' \
    --userId 'mCh5yq7H' \
    --body '{"inc": 0.5156676350751768}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'TrO3abvy' \
    --userId 'fdXGB0WN' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"8MYtPd4o": {}, "TPgGRHDe": {}, "HuSwMymd": {}}, "additionalKey": "XcGoIiWI", "statCode": "aGpVp13N", "updateStrategy": "MAX", "userId": "XcM55G7A", "value": 0.7071706926572132}, {"additionalData": {"Zw0POahU": {}, "jNz4FLDF": {}, "kOz1FGS6": {}}, "additionalKey": "TVTgZyjg", "statCode": "0KjBJ43h", "updateStrategy": "MIN", "userId": "gmqOGeyF", "value": 0.24555323606486867}, {"additionalData": {"iQoIZbMS": {}, "368K4bOd": {}, "9YFgAJvx": {}}, "additionalKey": "TFnhYnpg", "statCode": "aJp0HI0A", "updateStrategy": "MAX", "userId": "yZiCf3rz", "value": 0.16715308290968334}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '8X1gYONW' \
    --statCode '47xuXeBR' \
    --userIds 'n0HbYrou,75o7fasz,4dzOFujS' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'EM1xElVj' \
    --additionalKey 'jbHsRma0' \
    --body '[{"additionalData": {"NOqacByX": {}, "TbtqfbqO": {}, "l5F3l9f3": {}}, "statCode": "PnkgrJer", "updateStrategy": "OVERRIDE", "value": 0.965434613042746}, {"additionalData": {"xodNjmAR": {}, "6ydJqroK": {}, "unGtEA57": {}}, "statCode": "k8FrmoI1", "updateStrategy": "MIN", "value": 0.378331319736096}, {"additionalData": {"lgCwML94": {}, "ldm9oN1q": {}, "l8eE03Gx": {}}, "statCode": "q5c6eiFU", "updateStrategy": "MIN", "value": 0.3081100383812492}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '1rhVNpng' \
    --additionalKey 'VFKad7w7' \
    --body '[{"additionalData": {"QsNDNxpy": {}, "c4U8dAOq": {}, "lkbqSRLM": {}}, "statCode": "mM2yJlYg"}, {"additionalData": {"isF1uUCL": {}, "2dLt0zOf": {}, "B1YWcnlt": {}}, "statCode": "Zcj5IiLl"}, {"additionalData": {"WeopYL84": {}, "06OvOqTW": {}, "GgU1J2dA": {}}, "statCode": "OA3F6nTr"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tvSGJw51' \
    --userId 'CrpOI1Ru' \
    --additionalKey 'MgG7fWn7' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'pxfEH6vz' \
    --userId 'Q7nQSAR3' \
    --additionalKey 'UPHutCnh' \
    --body '{"additionalData": {"knmyDghN": {}, "clz1aWtj": {}, "kYObBXE8": {}}, "updateStrategy": "INCREMENT", "value": 0.6617806992537396}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"rMnHDJOf": {}, "TjaUaCTT": {}, "q1jXp4s4": {}}, "additionalKey": "ZeABAf34", "statCode": "9PNzJmU2", "updateStrategy": "MAX", "userId": "UQQbpMky", "value": 0.44580597997766724}, {"additionalData": {"t4OxVvW8": {}, "3xlg2dFI": {}, "0vA8gxeB": {}}, "additionalKey": "QO0LRA8O", "statCode": "iD6Jtpeh", "updateStrategy": "OVERRIDE", "userId": "sqpmaHqC", "value": 0.9098301733500795}, {"additionalData": {"vmeB7vQv": {}, "nWhFPDN0": {}, "PKGrNxda": {}}, "additionalKey": "ldDipQH0", "statCode": "RMNfn4LW", "updateStrategy": "MAX", "userId": "LRvt499Q", "value": 0.5726391012669596}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'itB7cLQa' \
    --additionalKey 'RsRb9vzq' \
    --statCodes 'CL8OSdyH,4xfhu6uA,A6G3duwR' \
    --tags 'XVwhyph7,NCNm6LXQ,datQwIFF' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xLaXfqnu' \
    --additionalKey 'gr3JZNmg' \
    --body '[{"additionalData": {"Cj3BmqMK": {}, "jwXj7jek": {}, "77AywTMv": {}}, "statCode": "rEFpltae", "updateStrategy": "MIN", "value": 0.9439971951112118}, {"additionalData": {"s1nqvwRA": {}, "Wu2KG508": {}, "BeJnglVL": {}}, "statCode": "Aw4xCzMC", "updateStrategy": "MAX", "value": 0.8616743235192146}, {"additionalData": {"ZPTsxkcf": {}, "uv6N9Vxb": {}, "4Hs3IZZh": {}}, "statCode": "DkPAUWmx", "updateStrategy": "MIN", "value": 0.6517814942478607}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'joPiHdZK' \
    --userId '9NrMi64t' \
    --additionalKey '9I4HSIaU' \
    --body '{"additionalData": {"8oz5E7tP": {}, "zB3Dj8R0": {}, "l2QXWyeH": {}}, "updateStrategy": "MIN", "value": 0.9175319947342127}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE