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
    --body '{"maxSlotSize": 51, "maxSlots": 72}' \
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
    --userId '6jUIPJob' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wou50tzp' \
    --body '{"maxSlotSize": 93, "maxSlots": 37}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'N1l3qLgU' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'kQOFQR41' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'WtJzlak7' \
    --userId 'mXakkT79' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'AXY6cPqk' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'qyLNuDUD' \
    --userId 'kw0qu7GA' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'jjgsOSTk,XD38RuNs,iyfonFTP' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'NZ8o8P00' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'DMxjvA4V' \
    --body '{"achievements": ["KuhSh7F5", "IUycSImH", "ftVxIMNl"], "attributes": {"KQANviyJ": "8KL24mMk", "Qlw7M0jN": "c4UprgUE", "tQujgI9j": "dAEyd7SV"}, "avatarUrl": "5iAg34ua", "inventories": ["ajJ4QNbq", "w92bEJWu", "wYixXu4b"], "label": "YH6IBWAm", "profileName": "o1pZPGLP", "statistics": ["bA60nhzk", "oXDaXtMI", "2KMckBvW"], "tags": ["ohwsEtpE", "nfafpCcQ", "x0bUDjo5"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'c7t1xuHX' \
    --userId 'JCZsxawS' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'vLUsfjnG' \
    --userId 'QxohFc2r' \
    --body '{"achievements": ["OLf0hzqT", "OtkvGPej", "FxxdQcJs"], "attributes": {"bcUFFXRm": "NUTlJtG8", "c5n5YDf5": "lia7eo5C", "Kj3OQyVe": "Kkqu7H2k"}, "avatarUrl": "oX3gYI72", "inventories": ["tifvE7Mt", "OlBp7WYI", "UvzfVl0p"], "label": "Ohk2XVEL", "profileName": "ww4zYD8v", "statistics": ["bE6ujLMN", "RqlKSWwi", "1Ml4z7yJ"], "tags": ["D0gUathJ", "bMnUpbDT", "zspxyFqp"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'hssmfYKb' \
    --userId '8PuHzVKU' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'bgOuwBBc' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'k2AMRL9l' \
    --userId 'cJ0ngczU' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'myniSTVz' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'm3fz4tTw' \
    --userId 'Vs6mWFXG' \
    --body '{"name": "r4Q8AfO6", "value": "ZBRW4ry2"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmDVYUED' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId '8mU1dROF' \
    --label 'k7FxhVUz' \
    --tags 'xOMIJyKK,RC2yFPvy,zjwafeGV' \
    --checksum 'cRn3OHV3' \
    --customAttribute 'FYdafhGB' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'NGUeJ2vc' \
    --userId 'KJkvBZc8' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'HnqmbXEP' \
    --userId 'pxLcEyIv' \
    --label 'pbwWgsGz' \
    --tags 'PVUZh8bp,ZJ1CAfuY,pIfeBxhj' \
    --checksum 'oZW2j5jl' \
    --customAttribute 'VBfI1hZn' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'jwe7sDfy' \
    --userId 'TIQQVhuN' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'H0nEEdSQ' \
    --userId 'mb7CQEEi' \
    --body '{"customAttribute": "Dc8BtSVt", "label": "q31dfjtr", "tags": ["SlrxJuxm", "uWTrJR2Y", "t7K3I5QP"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '73' \
    --statCodes '1oivZMGv' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 GetGlobalStatItemByStatCode
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode \
    --namespace "$AB_NAMESPACE" \
    --statCode 'HAcjBOHk' \
    > test.out 2>&1
eval_tap $? 27 'GetGlobalStatItemByStatCode' test.out

#- 28 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode '5Lp0ceMg' \
    --userIds 'L0PkxVPI' \
    > test.out 2>&1
eval_tap $? 28 'BulkFetchStatItems' test.out

#- 29 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7590400408013318, "statCode": "iFjzmqtr", "userId": "a5rD3Eqr"}, {"inc": 0.6513755221399549, "statCode": "Ckk5EDPg", "userId": "lQRmuTuf"}, {"inc": 0.2726124230884225, "statCode": "JYcI9G7n", "userId": "Xu2XkkXr"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItem' test.out

#- 30 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.24034228792104262, "statCode": "tcNjDy11", "userId": "TtAOANFT"}, {"inc": 0.534988942677099, "statCode": "mlDyQzGd", "userId": "pkTfMWJa"}, {"inc": 0.25008657796972567, "statCode": "NRAxyYn0", "userId": "GTqVQ46B"}]' \
    > test.out 2>&1
eval_tap $? 30 'BulkIncUserStatItemValue' test.out

#- 31 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'krRwLCRQ' \
    --userIds '9B24Jk2X,oaxwnKys,4VuiVYC3' \
    > test.out 2>&1
eval_tap $? 31 'BulkFetchOrDefaultStatItems' test.out

#- 32 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "wypfUQ41", "userId": "1RvWQMWX"}, {"statCode": "IkNo3fjM", "userId": "CeMafw2x"}, {"statCode": "L8Tu7fly", "userId": "7rEO4EN3"}]' \
    > test.out 2>&1
eval_tap $? 32 'BulkResetUserStatItem' test.out

#- 33 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '58' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 33 'GetStats' test.out

#- 34 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.6749392240772714, "description": "cmi0rq5u", "incrementOnly": true, "maximum": 0.7954257224702489, "minimum": 0.8185138962069385, "name": "ApI5x2AC", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "DhUwqIgj", "tags": ["Eyl5rdV2", "xw9C0nxO", "tZd52w7O"]}' \
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
    --limit '99' \
    --offset '68' \
    --keyword 'w1HnwBdP' \
    > test.out 2>&1
eval_tap $? 37 'QueryStats' test.out

#- 38 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '0ZFisvHn' \
    > test.out 2>&1
eval_tap $? 38 'GetStat' test.out

#- 39 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode '2AqkoqyC' \
    > test.out 2>&1
eval_tap $? 39 'DeleteStat' test.out

#- 40 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'paHwp3R0' \
    --body '{"defaultValue": 0.4408060326077995, "description": "jEfCCrUQ", "name": "AVw8CNfG", "tags": ["YIjCurEP", "euDEjPse", "qrfYfs6k"]}' \
    > test.out 2>&1
eval_tap $? 40 'UpdateStat' test.out

#- 41 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'Y6xz0ehU' \
    > test.out 2>&1
eval_tap $? 41 'DeleteTiedStat' test.out

#- 42 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'e8FvLj2r' \
    --limit '92' \
    --offset '73' \
    --statCodes 'dve46ZNI' \
    --tags 'eGJRTTPu' \
    > test.out 2>&1
eval_tap $? 42 'GetUserStatItems' test.out

#- 43 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId '1ovEs4Sh' \
    --body '[{"statCode": "t0omMJ66"}, {"statCode": "XAIejCm0"}, {"statCode": "gWijGc1d"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkCreateUserStatItems' test.out

#- 44 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYPG5g9j' \
    --body '[{"inc": 0.20585234061206414, "statCode": "F6DnUjtx"}, {"inc": 0.5193390902545084, "statCode": "pm5hU2sz"}, {"inc": 0.926556009045557, "statCode": "bNIy4oE0"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItem1' test.out

#- 45 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7eKjpg4R' \
    --body '[{"inc": 0.8192281030496469, "statCode": "nSPbLtq4"}, {"inc": 0.8437959453346793, "statCode": "zNxEqf2A"}, {"inc": 0.794223713784253, "statCode": "BIYeBib5"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkIncUserStatItemValue1' test.out

#- 46 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kofyet4x' \
    --body '[{"statCode": "2R2nqFDa"}, {"statCode": "ckCoCuPO"}, {"statCode": "Cu94gRvD"}]' \
    > test.out 2>&1
eval_tap $? 46 'BulkResetUserStatItem1' test.out

#- 47 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'bokPNy0K' \
    --userId 'QV5KeaDW' \
    > test.out 2>&1
eval_tap $? 47 'CreateUserStatItem' test.out

#- 48 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ieVXoLsO' \
    --userId 'BpPZsoxn' \
    > test.out 2>&1
eval_tap $? 48 'DeleteUserStatItems' test.out

#- 49 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lpO4NqJc' \
    --userId 'OCsCRd0i' \
    --body '{"inc": 0.358418672699263}' \
    > test.out 2>&1
eval_tap $? 49 'IncUserStatItemValue' test.out

#- 50 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EIyL5Z25' \
    --userId 'cKrWbG7z' \
    --additionalKey 'xbn7La3P' \
    --body '{"additionalData": {"T93sFiP1": {}, "Ok4g78Xk": {}, "pAuKRG2h": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'ResetUserStatItemValue' test.out

#- 51 GetGlobalStatItems1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --limit '31' \
    --offset '78' \
    --statCodes 'EBU4bNK6' \
    > test.out 2>&1
eval_tap $? 51 'GetGlobalStatItems1' test.out

#- 52 GetGlobalStatItemByStatCode1
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItemByStatCode1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'XArukQNv' \
    > test.out 2>&1
eval_tap $? 52 'GetGlobalStatItemByStatCode1' test.out

#- 53 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'BYsEzOml' \
    --userIds 'FFEmMSkd' \
    > test.out 2>&1
eval_tap $? 53 'BulkFetchStatItems1' test.out

#- 54 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.9960090485426903, "statCode": "ENIyezZe", "userId": "XcECS6P6"}, {"inc": 0.7403236526645969, "statCode": "gDTvNSPO", "userId": "wcjgWyi5"}, {"inc": 0.32608235966164767, "statCode": "w6Z4f8NS", "userId": "fs4K0jBS"}]' \
    > test.out 2>&1
eval_tap $? 54 'PublicBulkIncUserStatItem' test.out

#- 55 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4978221459208013, "statCode": "aQMgk0QJ", "userId": "WPZ6vJLD"}, {"inc": 0.8707753379834224, "statCode": "J4XPbWl6", "userId": "5UYiyBrV"}, {"inc": 0.9561575762118627, "statCode": "H02UAAXR", "userId": "41mMFxbu"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkIncUserStatItemValue' test.out

#- 56 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "nFWWCtLi", "userId": "6fO7XfzN"}, {"statCode": "iCQwkBec", "userId": "IJib9Yma"}, {"statCode": "OW6Sb6cP", "userId": "diaEFmsc"}]' \
    > test.out 2>&1
eval_tap $? 56 'BulkResetUserStatItem2' test.out

#- 57 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.10550499978664452, "description": "SVT9XBCT", "incrementOnly": true, "maximum": 0.4236510477166028, "minimum": 0.07833331084146189, "name": "ODjTK5ln", "setAsGlobal": true, "setBy": "SERVER", "statCode": "XKBLCW83", "tags": ["E9fnK6Uy", "cOfg0Tx0", "KxGN3igw"]}' \
    > test.out 2>&1
eval_tap $? 57 'CreateStat1' test.out

#- 58 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'Nz9STUWU' \
    --limit '86' \
    --offset '43' \
    --statCodes '1vNzqGF9' \
    --tags 'GjUzxpEn' \
    > test.out 2>&1
eval_tap $? 58 'PublicQueryUserStatItems' test.out

#- 59 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'RSL2jUTI' \
    --body '[{"statCode": "RPTb8Jix"}, {"statCode": "RwRZHkWS"}, {"statCode": "ZpcDtw6i"}]' \
    > test.out 2>&1
eval_tap $? 59 'PublicBulkCreateUserStatItems' test.out

#- 60 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ny7L1CY5' \
    --statCodes 'aO6rJuNw,9n8LQq2U,O2MTwNr4' \
    --tags 'fs9VB609,HFKyWwLe,bZWRPVwd' \
    > test.out 2>&1
eval_tap $? 60 'PublicQueryUserStatItems1' test.out

#- 61 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ypBamgHN' \
    --body '[{"inc": 0.8386366450619663, "statCode": "UwYVdaZ3"}, {"inc": 0.8601346482665357, "statCode": "0TCN1I5a"}, {"inc": 0.1477611600942973, "statCode": "hiepAvhb"}]' \
    > test.out 2>&1
eval_tap $? 61 'PublicBulkIncUserStatItem1' test.out

#- 62 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId '3wXcU4Va' \
    --body '[{"inc": 0.02947341659607894, "statCode": "Gzpq4Zx3"}, {"inc": 0.9805409179356653, "statCode": "OhgMnwrA"}, {"inc": 0.9218942098562108, "statCode": "TKFezscH"}]' \
    > test.out 2>&1
eval_tap $? 62 'BulkIncUserStatItemValue2' test.out

#- 63 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vDFxaOaX' \
    --body '[{"statCode": "PiLUG3AF"}, {"statCode": "crcxX8BG"}, {"statCode": "mosFeAKW"}]' \
    > test.out 2>&1
eval_tap $? 63 'BulkResetUserStatItem3' test.out

#- 64 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'OcDqLwSr' \
    --userId '3ivdt7pj' \
    > test.out 2>&1
eval_tap $? 64 'PublicCreateUserStatItem' test.out

#- 65 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '1HuF1FGt' \
    --userId '3meAK67k' \
    > test.out 2>&1
eval_tap $? 65 'DeleteUserStatItems1' test.out

#- 66 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'boVMmdlK' \
    --userId 'WGEkG3Bd' \
    --body '{"inc": 0.19901033088490394}' \
    > test.out 2>&1
eval_tap $? 66 'PublicIncUserStatItem' test.out

#- 67 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'c1TRxyAc' \
    --userId 'yIwfgLGk' \
    --body '{"inc": 0.9649139730617611}' \
    > test.out 2>&1
eval_tap $? 67 'PublicIncUserStatItemValue' test.out

#- 68 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'B2PW46Ls' \
    --userId 'SsZBP5CC' \
    > test.out 2>&1
eval_tap $? 68 'ResetUserStatItemValue1' test.out

#- 69 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"vfsxMXfK": {}, "qp7DSMZJ": {}, "OZxwSB5j": {}}, "additionalKey": "Bq0aiF88", "statCode": "bG9zev0m", "updateStrategy": "INCREMENT", "userId": "Y5wzCOH3", "value": 0.995768567372255}, {"additionalData": {"YngWCGPx": {}, "J96I8Jsk": {}, "5XVL7Rvu": {}}, "additionalKey": "9brZdYoB", "statCode": "Mtoq7SpA", "updateStrategy": "INCREMENT", "userId": "UC0BHC88", "value": 0.7721515069358773}, {"additionalData": {"DrfB5jDg": {}, "irgzRhuv": {}, "LqxIfbR9": {}}, "additionalKey": "KcmDSwOX", "statCode": "JMo4WInw", "updateStrategy": "MIN", "userId": "IxP8oaI2", "value": 0.8024129875499383}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkUpdateUserStatItemV2' test.out

#- 70 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'FzONO83s' \
    --statCode 'BCRkFz9y' \
    --userIds '4AaZNGem,LjyGMVfq,I9vlZRxD' \
    > test.out 2>&1
eval_tap $? 70 'BulkFetchOrDefaultStatItems1' test.out

#- 71 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'yuba5VXl' \
    --additionalKey 'iBcTbDDu' \
    --body '[{"additionalData": {"DxM4rJU9": {}, "XQWAmx6B": {}, "bL7qCAsY": {}}, "statCode": "D51VYezL", "updateStrategy": "MIN", "value": 0.909869863840816}, {"additionalData": {"uew0ePmH": {}, "HOrzQ1k9": {}, "hflEXACf": {}}, "statCode": "N6lMtFyi", "updateStrategy": "MIN", "value": 0.20212920554258107}, {"additionalData": {"HcJfhSVx": {}, "ZISZm8Tl": {}, "sylecC5N": {}}, "statCode": "0efyKXcq", "updateStrategy": "INCREMENT", "value": 0.450585262292182}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem' test.out

#- 72 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'vIFSVSAJ' \
    --additionalKey 'uIzz4OG2' \
    --body '[{"additionalData": {"i9oiJKT4": {}, "SftGpgKy": {}, "wQYkkPr2": {}}, "statCode": "2b6C8Zqo"}, {"additionalData": {"auSLiVuc": {}, "AOF6caMQ": {}, "LrCfDzoY": {}}, "statCode": "QtiLehnw"}, {"additionalData": {"zfxURDpi": {}, "RtKH6pZr": {}, "vPvNcQwW": {}}, "statCode": "213ZjbkJ"}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkResetUserStatItemValues' test.out

#- 73 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cmyq1Ewn' \
    --userId '6u7ctR5t' \
    --additionalKey 'ChARBFZx' \
    > test.out 2>&1
eval_tap $? 73 'DeleteUserStatItems2' test.out

#- 74 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'IWH1Cm84' \
    --userId 'Zd20V15R' \
    --additionalKey 'lmZvD6Im' \
    --body '{"additionalData": {"BtGThbBu": {}, "xARQqYGO": {}, "HSaJXq35": {}}, "updateStrategy": "MIN", "value": 0.1908906406990285}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue' test.out

#- 75 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"ytiuVnyX": {}, "KVFRXyjP": {}, "guxP8OIE": {}}, "additionalKey": "j6DTnqQz", "statCode": "pXIivGuT", "updateStrategy": "MIN", "userId": "axo63Oof", "value": 0.9613326646893818}, {"additionalData": {"EkB3c9nh": {}, "RvSwwKuY": {}, "KV8iDCSc": {}}, "additionalKey": "TJ5ITKoB", "statCode": "H4fB21DO", "updateStrategy": "INCREMENT", "userId": "qrIPR9AD", "value": 0.5894742660713639}, {"additionalData": {"MFS4OdGd": {}, "kFaJA0it": {}, "kOLksATI": {}}, "additionalKey": "EILTQ2S3", "statCode": "sm1WN726", "updateStrategy": "MAX", "userId": "dvEPZqck", "value": 0.7558377220458838}]' \
    > test.out 2>&1
eval_tap $? 75 'BulkUpdateUserStatItem1' test.out

#- 76 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ajfBTMw2' \
    --additionalKey 'wSk8vxmb' \
    --statCodes 'tdl13RqU,HVx2WeMr,Vjk3AYW3' \
    --tags 'n21hmMYs,Y4P8naHV,FDLXPBMO' \
    > test.out 2>&1
eval_tap $? 76 'PublicQueryUserStatItems2' test.out

#- 77 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ts0fPT8P' \
    --additionalKey '5R27qNhD' \
    --body '[{"additionalData": {"net13ZC5": {}, "uC363Kgy": {}, "7gE64Qrn": {}}, "statCode": "Cef51VrS", "updateStrategy": "OVERRIDE", "value": 0.09307479317314837}, {"additionalData": {"MwXYATyG": {}, "5pI9H7Dj": {}, "9MazJbdD": {}}, "statCode": "Ayhk9vjN", "updateStrategy": "MAX", "value": 0.4907736086337998}, {"additionalData": {"S7kga0Gi": {}, "sCiXWfQD": {}, "lbN8ReqS": {}}, "statCode": "qFOxPktT", "updateStrategy": "MIN", "value": 0.12095643423663183}]' \
    > test.out 2>&1
eval_tap $? 77 'BulkUpdateUserStatItem2' test.out

#- 78 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CrDJsUf7' \
    --userId '2lu9eL7r' \
    --additionalKey '3k6bD80l' \
    --body '{"additionalData": {"1TNAl5sT": {}, "IpHLy28U": {}, "vUp444ZL": {}}, "updateStrategy": "OVERRIDE", "value": 0.8774289425483015}' \
    > test.out 2>&1
eval_tap $? 78 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE