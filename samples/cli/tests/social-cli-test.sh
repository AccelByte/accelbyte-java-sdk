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
    --body '{"maxSlotSize": 33, "maxSlots": 57}' \
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
    --userId 'PhRKSlrY' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'JOQOfPRd' \
    --body '{"maxSlotSize": 40, "maxSlots": 51}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'S6oDg1Zx' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'X0kLJquI' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 't2esPppx' \
    --userId 'oNehQzMi' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '64Ae5Yd0' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId '1Q6bV3aU' \
    --userId 'R6Y3sfra' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'aYYiSSQg,4kLJv5u4,3nxjBmlI' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'oqhAIHSV' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'YdOxLQqv' \
    --body '{"achievements": ["WIUlTPQC", "ctdJ5lHp", "IZZNU8l7"], "attributes": {"j32UMuFF": "kunjQEhD", "QRlVnMpk": "JDdm1XEk", "PYBAnaD6": "Mdp5jAIq"}, "avatarUrl": "4j7ohCov", "inventories": ["nwETKLY0", "sXTQaw39", "cYCYj1XJ"], "label": "ezmjMD6U", "profileName": "TMOQ6zl2", "statistics": ["V15dYK9o", "d2z5Xq5A", "IjO4pVSK"], "tags": ["wphlZRUV", "bhfYNB45", "fpGLriB5"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Kn5lx2jA' \
    --userId 'pO66Y7xh' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'YZdSK2H4' \
    --userId 'uXmUwtbl' \
    --body '{"achievements": ["azPBRGuO", "BgsuGlxz", "QrPoTBTH"], "attributes": {"TuS2OVjc": "2VtDv00p", "ufC9AI1Q": "2t6rB4np", "dhYJhUlQ": "qD0csNzf"}, "avatarUrl": "eqIOk9wY", "inventories": ["CsUfvV5X", "8N4619Yb", "b75qv3Bk"], "label": "8bhOQi3M", "profileName": "E4m6zRKl", "statistics": ["gUb4JeNM", "CqDokTs6", "pmkoNgS6"], "tags": ["c1RJHEtK", "rBStv7wR", "5R5GSY0l"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'YNbhLj1H' \
    --userId 'DKlOt1Es' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'MGNFllyD' \
    --namespace "$AB_NAMESPACE" \
    --profileId '3scpZv7S' \
    --userId 'vwhS0Pza' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'w9gmWAyr' \
    --namespace "$AB_NAMESPACE" \
    --profileId '0dRyf74k' \
    --userId 'EuJupRMD' \
    --body '{"name": "WWIESAwn", "value": "mAl2dnV0"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'e7aplhIL' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'hNn4tudL' \
    --label 'tSUbYIjQ' \
    --tags 'vTmSgW9F,DYJ0GNFc,q98PqVbY' \
    --checksum 'Yd1r3atY' \
    --customAttribute 'FDH4QPy4' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'Hohw1qbC' \
    --userId 'I8rGXiyX' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'Ehi3UbfY' \
    --userId 'ZROqiaXF' \
    --label '9z95HEeN' \
    --tags 'Dx0UBh0U,K66QdtEr,umjee0qn' \
    --checksum 'V2AVsUtI' \
    --customAttribute 'A8PEFWrv' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'ulcXEH6O' \
    --userId 'zDpUB88m' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'DVITv0kb' \
    --userId 'RtFInhPK' \
    --body '{"customAttribute": "d3ggzn8k", "label": "x9RVEMAO", "tags": ["YEVuY1kS", "o3WFpBqM", "9eKddUUC"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wvdUWkYU' \
    --userIds 'sNCR9gHl' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.28594070736844057, "statCode": "HPAUVnc1", "userId": "hbS4dl6q"}, {"inc": 0.371397655151652, "statCode": "DfY4433E", "userId": "wUH9isxo"}, {"inc": 0.13504057334513497, "statCode": "UdwVdCXS", "userId": "lOjnwzEp"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.040697965712055084, "statCode": "hMWhZllx", "userId": "53nE7j4b"}, {"inc": 0.4319508634905337, "statCode": "YSvZkVl2", "userId": "D1rOJF8U"}, {"inc": 0.08174336009228433, "statCode": "ZkQK6K5c", "userId": "sMTAOtAL"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '9LtEZQEX' \
    --userIds 'EHSYhIhj,Y34bHpHS,nnOfCuWX' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "m3vZQjgJ", "userId": "ZrcRpPmM"}, {"statCode": "9WuiMRxr", "userId": "oZjSuL4A"}, {"statCode": "Chg1eLtA", "userId": "EOdpjjPu"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.4942022598417283, "description": "16UjeArm", "incrementOnly": true, "maximum": 0.6952061451166055, "minimum": 0.4104230727116619, "name": "hYZNhAj6", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "XJDEztJD", "tags": ["OuzhuT1M", "YHl8nIfh", "ojlyqdet"]}' \
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
    --limit '76' \
    --offset '67' \
    --keyword 'LyXVmRpG' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'DU99DyIH' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'QEMsVy9M' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '1l56E4CK' \
    --body '{"description": "srNJ9tsX", "name": "erclHjoO", "tags": ["qPa1m6N0", "QOaKYPI6", "Jh1hwPcz"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PN5hqArN' \
    --limit '62' \
    --offset '63' \
    --statCodes 'qRaYzfEI' \
    --tags 'dejVXcCz' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'BrnSLdek' \
    --body '[{"statCode": "KccR7tfI"}, {"statCode": "ffeYLKST"}, {"statCode": "ScCSmKbp"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'pEzoxYW6' \
    --body '[{"inc": 0.2875542458914173, "statCode": "GhPnZn0M"}, {"inc": 0.7394593002628017, "statCode": "QhVQP63m"}, {"inc": 0.7111458947016049, "statCode": "xBMdYhxL"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DeLJx8FE' \
    --body '[{"inc": 0.8748584515733747, "statCode": "bleeFc5W"}, {"inc": 0.1379453996106722, "statCode": "4kBDMoI6"}, {"inc": 0.07821427527835056, "statCode": "2BdLcRm4"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6mYNZMf4' \
    --body '[{"statCode": "L738yhxO"}, {"statCode": "68MLPLyk"}, {"statCode": "4gUkwEuW"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '9EVjVEiv' \
    --userId 'RXZ8qtq9' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Ot8frtUH' \
    --userId 'ooJSiBCQ' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'RseXq8hn' \
    --userId 'ex7vP6kJ' \
    --body '{"inc": 0.06861174454353614}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode '0BEHdKKu' \
    --userId 'b28bwfKJ' \
    --additionalKey 'UTui4b8P' \
    --body '{"additionalData": {"yBgsb1L0": {}, "pBreALIF": {}, "KZzgPn8B": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'dORGUH43' \
    --userIds 'tPSDunSZ' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.5206285423306987, "statCode": "V1KAz3nc", "userId": "H9iI7z59"}, {"inc": 0.4273633676641062, "statCode": "1KwWglCL", "userId": "j8VOCxa1"}, {"inc": 0.4628599377915179, "statCode": "XHgaPTng", "userId": "S7bc8SNe"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9937039652959767, "statCode": "eem4MOXw", "userId": "99vyOP1t"}, {"inc": 0.45868042935329545, "statCode": "5xMXqhSm", "userId": "wC9unEKt"}, {"inc": 0.059679842377756365, "statCode": "gRDlbegV", "userId": "Kux0niGK"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "58uYV4yC", "userId": "vluFQ15L"}, {"statCode": "2ZK41Rrr", "userId": "nCVsX2Ko"}, {"statCode": "QOVFrl31", "userId": "PUFuLlGU"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.5733316741210335, "description": "EiGmfMSp", "incrementOnly": true, "maximum": 0.8249524324271549, "minimum": 0.6012008891170402, "name": "pqNGDuZs", "setAsGlobal": true, "setBy": "SERVER", "statCode": "LhWQGXJb", "tags": ["frrO0Fd0", "qP9G4KmD", "SGMTnzMe"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '2SaeXEg6' \
    --limit '81' \
    --offset '20' \
    --statCodes 'ucL9Silu' \
    --tags 'ijNLufag' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'xoHFVVkp' \
    --body '[{"statCode": "aEV6VZhj"}, {"statCode": "u4fnnON2"}, {"statCode": "RDbFzMFU"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1HcosxEi' \
    --statCodes 'KDey81pN,MFqfequb,xync9V6i' \
    --tags 'G5uQJWcg,QEVHRzFl,V9W2rlu9' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7cD9monG' \
    --body '[{"inc": 0.37202116534039587, "statCode": "JNBHSK56"}, {"inc": 0.3217778874752193, "statCode": "U1PpENEv"}, {"inc": 0.11329010928438765, "statCode": "0WDfcLms"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R2cq8MNK' \
    --body '[{"inc": 0.13831379169940639, "statCode": "cLat94CH"}, {"inc": 0.8464493955118153, "statCode": "PVmABCCk"}, {"inc": 0.8511121898435343, "statCode": "qZfagXnJ"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o9ujszZr' \
    --body '[{"statCode": "NMch5ufb"}, {"statCode": "AeT5Ppk1"}, {"statCode": "AoaCgB8o"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mA9q1Zpc' \
    --userId 'QJZ9czqp' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'IbELOAWk' \
    --userId 'vTSkVoju' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'NdMk5W7S' \
    --userId 'Pwswt60w' \
    --body '{"inc": 0.4661954808149753}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'w6NePxey' \
    --userId 'Flna3Crm' \
    --body '{"inc": 0.8999639140682615}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'mfX7qkiJ' \
    --userId 'q6idyO1n' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"nrsYuoIU": {}, "Mbi7vVJf": {}, "PgMTrCkU": {}}, "additionalKey": "TRY6EFYO", "statCode": "aMniStgO", "updateStrategy": "OVERRIDE", "userId": "4AiN8hNl", "value": 0.6585898447727251}, {"additionalData": {"P7bhL0qx": {}, "DLILM9gx": {}, "AH94F2K7": {}}, "additionalKey": "EzLUyvWO", "statCode": "FQxbaYvQ", "updateStrategy": "INCREMENT", "userId": "38c25iBR", "value": 0.7930658641166021}, {"additionalData": {"AQDQ3Ynj": {}, "4UgrHdXX": {}, "bvGySNHM": {}}, "additionalKey": "gL2VnR0d", "statCode": "bm8o1UBi", "updateStrategy": "INCREMENT", "userId": "tVD7rhMk", "value": 0.7142470056148498}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'f2NKVs6Y' \
    --statCode 'B0BXQSWF' \
    --userIds 'qi70TiiY,fdBzKUiU,LI67NJfk' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'u0P73q21' \
    --additionalKey 'zmtXhDfI' \
    --body '[{"additionalData": {"H3EDomad": {}, "Pzn0fdRy": {}, "OXRWj86Y": {}}, "statCode": "C16xb62h", "updateStrategy": "MIN", "value": 0.056170167402190385}, {"additionalData": {"3KtRG8Nc": {}, "ERoRivGo": {}, "hmuQzHyC": {}}, "statCode": "AWquiNuW", "updateStrategy": "MAX", "value": 0.27002803959250354}, {"additionalData": {"ue4cRtsu": {}, "aBgVr19a": {}, "lDDeYVum": {}}, "statCode": "eb72Bjii", "updateStrategy": "OVERRIDE", "value": 0.013073913908506873}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'Don5g8SW' \
    --additionalKey '8LN2MuLr' \
    --body '[{"additionalData": {"AIS23FXv": {}, "THoaYf3N": {}, "16gfjOQQ": {}}, "statCode": "U1r682ZL"}, {"additionalData": {"MwyvRoFa": {}, "gO9QnDw6": {}, "2rPKP8Pf": {}}, "statCode": "eUyVPsZP"}, {"additionalData": {"S6XCjw2G": {}, "ymE1ceEU": {}, "LpBvl12F": {}}, "statCode": "vK2N3eMc"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Cc1y08ch' \
    --userId 'LsCXMHSQ' \
    --additionalKey 'T7gNiwSG' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'nP4RIikl' \
    --userId 'UjsCsnHj' \
    --additionalKey 'vbVjbPSX' \
    --body '{"additionalData": {"HjniCNPx": {}, "1XjqLBWF": {}, "dTXALbaS": {}}, "updateStrategy": "INCREMENT", "value": 0.6182534509423313}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"EIh4WS4s": {}, "mZvLK6aG": {}, "uuTV2SjN": {}}, "additionalKey": "fLAFd1mV", "statCode": "us4fz74O", "updateStrategy": "OVERRIDE", "userId": "gCfxFF9r", "value": 0.08285254661494912}, {"additionalData": {"JYavkbT8": {}, "G9Ummf4x": {}, "cYWKR079": {}}, "additionalKey": "AOaNev5B", "statCode": "WFs0RJXZ", "updateStrategy": "OVERRIDE", "userId": "YrRzkLoJ", "value": 0.9297288013453044}, {"additionalData": {"TQDe0kfL": {}, "dfVuYYdD": {}, "L9bUGajV": {}}, "additionalKey": "qki3KXNR", "statCode": "VZRFvnbj", "updateStrategy": "OVERRIDE", "userId": "BVHGBK1V", "value": 0.8510600295763374}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'tVTPDkQg' \
    --additionalKey '40Rl6NGz' \
    --statCodes '1QFgULwp,Wh8Bm9ny,AVS9K051' \
    --tags '7Oy2AmXW,okClLGOW,C98Hchdm' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KiX1M1WW' \
    --additionalKey 'fto7NU2g' \
    --body '[{"additionalData": {"fFiQmD8x": {}, "oWMjENUp": {}, "eRgdQf4M": {}}, "statCode": "kbUvQD5D", "updateStrategy": "MIN", "value": 0.050076093218558215}, {"additionalData": {"XWRBYH2i": {}, "MrIf5kpW": {}, "AwvtOqXw": {}}, "statCode": "sZUVgNTK", "updateStrategy": "INCREMENT", "value": 0.18715752221790416}, {"additionalData": {"rQ39waLs": {}, "7C8vYRA7": {}, "oIaJT2vW": {}}, "statCode": "6ozuCH8s", "updateStrategy": "INCREMENT", "value": 0.0008143029263778523}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JqlkHEMx' \
    --userId '1C4lHPHU' \
    --additionalKey 'CuSXTeEX' \
    --body '{"additionalData": {"MkpzOBCI": {}, "Pc8KIKd5": {}, "5RJ692n2": {}}, "updateStrategy": "MIN", "value": 0.10547834313154125}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE