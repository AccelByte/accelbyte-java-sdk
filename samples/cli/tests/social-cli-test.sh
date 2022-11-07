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
    --body '{"maxSlotSize": 8, "maxSlots": 45}' \
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
    --userId 'G0dQ4wh4' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'MkaRG7dB' \
    --body '{"maxSlotSize": 93, "maxSlots": 20}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'ncsImCwI' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'tXElCYU9' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'Njx7CbTd' \
    --userId 'd9kd1UVD' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '05kvY8tS' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'zTQiTzTN' \
    --userId 'BMd1aIdX' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds '9imx3YLP,dDYsK0Ac,Zw1x7pg7' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'wC3O8x62' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '71SoN7N4' \
    --body '{"achievements": ["Qyop4p8n", "kncBZP16", "OmfG5nE6"], "attributes": {"oxtkA4tj": "rJ07e4d3", "TCI3LIe4": "HlHnp1pb", "QOyvt6at": "gHseQpdw"}, "avatarUrl": "ftAYBRyk", "inventories": ["GQUemVMH", "6LIllkjL", "qeS7fZeN"], "label": "dRCcR0eQ", "profileName": "vxsSXdAw", "statistics": ["gXg6j1kK", "JzEfuLDK", "cq4wtZt9"], "tags": ["D3aXI54H", "FHGjagsW", "js44aA5S"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'wk5roumc' \
    --userId 'aylNQR6h' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'yUVTs9Vx' \
    --userId 'lPQ3GZY7' \
    --body '{"achievements": ["vP9GBjSC", "HHT0kohf", "OhMbPj4T"], "attributes": {"G0XBXoNu": "6nbYohQR", "sPHtVPwh": "5RmKjCpK", "PZqSYZAm": "cuAIRtmI"}, "avatarUrl": "e1EFFpGY", "inventories": ["cQns2FKD", "YOk0SirL", "bfZaQH7W"], "label": "EYVxoBQA", "profileName": "lP34SIzw", "statistics": ["xvjpD8pf", "wzs3Y8jH", "xl56hsUM"], "tags": ["tsbtHjgJ", "lxpqHYf6", "nXomxrSq"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'qwKW8AhK' \
    --userId '3jRYbPuF' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'r5ydMN61' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'wjLgw5t7' \
    --userId 'vGnUdycE' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'OaZvjwnY' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'dERX4nZ7' \
    --userId 'CTAKDJKp' \
    --body '{"name": "bQbMpXfp", "value": "2we9zNu4"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'fVh6ivg6' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'BniWZD4c' \
    --label '1I00IRHF' \
    --tags 'vRaMD5Gs,VuZZA7He,iHpdpTcI' \
    --checksum 'WxZ8COSU' \
    --customAttribute '6gcelDmH' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'utLSzek8' \
    --userId 'yoAB3dyG' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'n65IDkZA' \
    --userId 'Y8lTtsTj' \
    --label 'ecMfqt2H' \
    --tags 'boB4oofi,wvCScbve,vAktb3af' \
    --checksum 'T9a62XUk' \
    --customAttribute '09EU9kIl' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'ZFVclymC' \
    --userId 'r37jG9RM' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'tFSJrS0n' \
    --userId 'xKfpFtJ8' \
    --body '{"customAttribute": "s5pwmniI", "label": "WcYGdKWd", "tags": ["bDPqXTrx", "1onrm9Jc", "nBKvMOHH"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ICRFzeVY' \
    --userIds 'xvEIr67B' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.12978960673215412, "statCode": "AL8glwsr", "userId": "qrgDGmPi"}, {"inc": 0.8905979284946106, "statCode": "ngAfNYZg", "userId": "20XEPiGn"}, {"inc": 0.25681536328481935, "statCode": "PBckVgh9", "userId": "vQvjbDK9"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.3588012012578715, "statCode": "sPegZD9C", "userId": "HPKeho4g"}, {"inc": 0.9022828660092029, "statCode": "ylmZBPsh", "userId": "HcZsPBxV"}, {"inc": 0.6241578933887552, "statCode": "qLpSsRMl", "userId": "XYpG7eqV"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hTEMBSH7' \
    --userIds 'AZ6S3FNX,z5MWX2UA,8CUL42pl' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "qkH6ICEq", "userId": "AjP1Uu74"}, {"statCode": "REZj8DnJ", "userId": "bM5ZyL7N"}, {"statCode": "DjE98rUH", "userId": "ANYszrDQ"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.8245326586604788, "description": "esKDeZlx", "incrementOnly": true, "maximum": 0.10026633619406156, "minimum": 0.9382007774950619, "name": "7B6xrQOF", "setAsGlobal": true, "setBy": "SERVER", "statCode": "TS5ylYkc", "tags": ["kPzNTkTa", "aV2jN9Zl", "apDskHeZ"]}' \
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
    --limit '4' \
    --offset '80' \
    --keyword 'PiJsrKBa' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tu0HRMSa' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '20qnF6WP' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'j389qDQi' \
    --body '{"defaultValue": 0.06628047639494539, "description": "QtThxD0h", "name": "6xwjJ2R7", "tags": ["ddrCAMj2", "wYvkRBn0", "BsZexLYC"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vJ4O9cx7' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'pM0dycMO' \
    --limit '97' \
    --offset '49' \
    --statCodes 'jWNlXiQL' \
    --tags 'XbS2bFh4' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'V4FPUswj' \
    --body '[{"statCode": "q3UaiWGC"}, {"statCode": "xLiguKnB"}, {"statCode": "h9jiHNkr"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Hn18F0As' \
    --body '[{"inc": 0.8912210984453742, "statCode": "fXcgwl3V"}, {"inc": 0.8966082287862877, "statCode": "TU2s1Hd8"}, {"inc": 0.5418386225962032, "statCode": "XcPESzKt"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sGLw3iXL' \
    --body '[{"inc": 0.2043119051779565, "statCode": "0J5MsNLR"}, {"inc": 0.5072695097798564, "statCode": "a56c2U35"}, {"inc": 0.46913025209679493, "statCode": "H5wak0px"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MNBpQxHK' \
    --body '[{"statCode": "b7Nrcfk4"}, {"statCode": "0UB19aqY"}, {"statCode": "H6I3fpT1"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'baDFi5zz' \
    --userId 'zbtfncs0' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hezsTCTl' \
    --userId 'bHjlMHS9' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'j16ZSi7f' \
    --userId 'rfl5JPsn' \
    --body '{"inc": 0.5720559213287488}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'eetivYlZ' \
    --userId '65EeufKW' \
    --additionalKey 'CRL1r0Fv' \
    --body '{"additionalData": {"6Xmw6BcV": {}, "6J5Pz7f5": {}, "Mfpi9jPN": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '36MJCfXn' \
    --userIds 'b8emXhPl' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4992095166258165, "statCode": "rinUBJ38", "userId": "SYxibcMp"}, {"inc": 0.022344890004255324, "statCode": "cWEDs638", "userId": "EwvxO1Na"}, {"inc": 0.17774865097720338, "statCode": "Vz0rMpbl", "userId": "XCeZqUBz"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.16403509038733965, "statCode": "NTwuocz7", "userId": "AOf7oq55"}, {"inc": 0.8003419184686846, "statCode": "cjaGsYM3", "userId": "AbgSbS6c"}, {"inc": 0.07316990689451386, "statCode": "GJOjDC3V", "userId": "EmBeZFVW"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "rG317x8r", "userId": "Mpb2S7PG"}, {"statCode": "OZOvG9Iv", "userId": "3VKWnBnJ"}, {"statCode": "G3NnzmGS", "userId": "KnsDnhZr"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.27246480055547573, "description": "jQoXg4VA", "incrementOnly": false, "maximum": 0.7903152677447282, "minimum": 0.6976296276299073, "name": "SmW7rjQv", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "LYctjWEL", "tags": ["C6YwsUWH", "sAVFwRt8", "rfo02yv1"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'aFYuvtUA' \
    --limit '58' \
    --offset '29' \
    --statCodes 'dyvzPubR' \
    --tags 'aDdcmzWQ' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'hWrTBY0P' \
    --body '[{"statCode": "ko6fPgJ0"}, {"statCode": "csIbmOX5"}, {"statCode": "SlQpuK5S"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '65Pp866K' \
    --statCodes 'sroAELPh,5TI0Di4M,eWdIkwVq' \
    --tags 'PZpw05LA,5MnMTbdT,jtdTBOtu' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'zpc6wlWu' \
    --body '[{"inc": 0.8394058277366796, "statCode": "jNBsGD5k"}, {"inc": 0.4724000760073195, "statCode": "c3q6gfjD"}, {"inc": 0.7233478060824935, "statCode": "XgxaX0vs"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wNz6H9oe' \
    --body '[{"inc": 0.5197288249364059, "statCode": "m1t7qUOa"}, {"inc": 0.8117829970104197, "statCode": "7Jb4uZGY"}, {"inc": 0.5479067031646169, "statCode": "zZ0txo0s"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ONLyQV68' \
    --body '[{"statCode": "rgtfhRzX"}, {"statCode": "VtHDaOvq"}, {"statCode": "SEdr6pRe"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ya3kwGuP' \
    --userId '7s3C2Rvb' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f2ZhhQNS' \
    --userId 'Y2lAYHJ6' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vRWnu0kn' \
    --userId 'TsV1dItp' \
    --body '{"inc": 0.45944318877030643}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'c5i10KbB' \
    --userId 'O4BLjToc' \
    --body '{"inc": 0.4236957632306665}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'fr9p80Qo' \
    --userId '99HdEH8X' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"fsiQu0qo": {}, "1NQ06kvo": {}, "646FmpMs": {}}, "additionalKey": "Chl26tFy", "statCode": "hvygZJIB", "updateStrategy": "INCREMENT", "userId": "k2zz2pmM", "value": 0.47328193091320714}, {"additionalData": {"NvmW1C0b": {}, "CFHCSHym": {}, "K4kuKQBG": {}}, "additionalKey": "KbUCKcZ5", "statCode": "uLdImx7j", "updateStrategy": "MAX", "userId": "BHTjSMlr", "value": 0.6551754049864247}, {"additionalData": {"30KrR6fw": {}, "QyH8BqRv": {}, "LlMtzxwt": {}}, "additionalKey": "J2BTyLCB", "statCode": "01M5Y0d5", "updateStrategy": "OVERRIDE", "userId": "Z0YiaKhB", "value": 0.0714306352033156}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey '4J717rvP' \
    --statCode 'bS4eKfpL' \
    --userIds 'nKXwiQUy,bENSI72t,41VN0Cc5' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'FsdW8hBl' \
    --additionalKey 'pQ6zdpvD' \
    --body '[{"additionalData": {"ELQQEjI8": {}, "Itq3qCL7": {}, "6MNNnn7n": {}}, "statCode": "fkGRAkpJ", "updateStrategy": "MAX", "value": 0.37318205393307347}, {"additionalData": {"idbBGr2Y": {}, "5Necf7zR": {}, "TtXGjIe7": {}}, "statCode": "MOKTP5jZ", "updateStrategy": "OVERRIDE", "value": 0.6560248134844132}, {"additionalData": {"ZI5U7kcZ": {}, "zD88BizA": {}, "AnZz8ciM": {}}, "statCode": "ym8d3wkY", "updateStrategy": "INCREMENT", "value": 0.07136937308241154}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'tweLo9Vj' \
    --additionalKey 'al5Pyysr' \
    --body '[{"additionalData": {"SU7lIlVf": {}, "bXq3oz9c": {}, "aDli6g0p": {}}, "statCode": "rNM04TxY"}, {"additionalData": {"h4iw8Qig": {}, "E9zdlloE": {}, "KXlm24pg": {}}, "statCode": "cHBgEdXl"}, {"additionalData": {"qsbGWoRa": {}, "x6mRe2Yq": {}, "FRFF0y1W": {}}, "statCode": "Teb74cpF"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'hQgKrENL' \
    --userId 'Tn33mkVp' \
    --additionalKey '3OJzZfYM' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'PI9F7qlj' \
    --userId '6aA4DFxz' \
    --additionalKey 'R0Wrv4pg' \
    --body '{"additionalData": {"aurJuL3U": {}, "9Id1uTBl": {}, "jJEpVdou": {}}, "updateStrategy": "MIN", "value": 0.17937183681075708}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"nbz0V7Qz": {}, "BsHXW5CO": {}, "j5sR4e4Y": {}}, "additionalKey": "QkofNrxS", "statCode": "xbdPvyKQ", "updateStrategy": "INCREMENT", "userId": "ZGTZzrag", "value": 0.19263667207799695}, {"additionalData": {"InkMJzj8": {}, "vTB1Kl7U": {}, "VUzcTyFn": {}}, "additionalKey": "08tvn02i", "statCode": "RdESowSe", "updateStrategy": "MAX", "userId": "tvmb3jvg", "value": 0.36448768018195954}, {"additionalData": {"qZEvMvY3": {}, "N8yWXwml": {}, "eH1HCtea": {}}, "additionalKey": "gkQtqEn7", "statCode": "4ms14dPq", "updateStrategy": "MAX", "userId": "eJjAERyo", "value": 0.4388658534000398}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uDtekl5y' \
    --additionalKey 'vE6GSE7D' \
    --statCodes 'HkyQ93vk,kwYsZuun,94tOZjwe' \
    --tags 'gE1u7BV7,KtkCYCAJ,i2DPgfo4' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UebqRqdu' \
    --additionalKey 'UBRcxut9' \
    --body '[{"additionalData": {"kYsfwSud": {}, "cIjzf9AS": {}, "ipSpBEJK": {}}, "statCode": "DaCOP2d5", "updateStrategy": "MAX", "value": 0.06115039906533615}, {"additionalData": {"AyuM9esE": {}, "5Iipr1aO": {}, "Om7Nml0d": {}}, "statCode": "GNJwIphj", "updateStrategy": "INCREMENT", "value": 0.8351838730474909}, {"additionalData": {"PUktyDKx": {}, "MlvIH5Op": {}, "1gZKXfrE": {}}, "statCode": "rQeQeOx3", "updateStrategy": "OVERRIDE", "value": 0.7071087695255183}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wq2ZTwmU' \
    --userId 'MMH9XUCo' \
    --additionalKey '5LsAu0UD' \
    --body '{"additionalData": {"M82dz90O": {}, "vjqLLc4M": {}, "J2Q0wUVi": {}}, "updateStrategy": "MAX", "value": 0.9233652562426847}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE