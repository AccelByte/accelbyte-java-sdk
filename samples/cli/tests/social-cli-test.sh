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
    --body '{"maxSlotSize": 54, "maxSlots": 6}' \
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
    --userId '1y02Gj2n' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fhc1nFGJ' \
    --body '{"maxSlotSize": 46, "maxSlots": 8}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId 'suzjTRLT' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId '6yImA6j0' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'DB83gT2r' \
    --userId 'YyX51Sui' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'oUalH8yL' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'FNyEDi8l' \
    --userId '2PUqnL9t' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'bxU8BWLT,AXCfnuPK,PRBlrahe' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'HZCTidYP' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId '0PzaJseW' \
    --body '{"achievements": ["CFmJ3Jba", "6KnO7Hxw", "ObFUHi6w"], "attributes": {"aNq3satz": "LzKWnSAk", "KlYP3fEE": "Yc1e3SKY", "rECu2qav": "Ditwk2Me"}, "avatarUrl": "F0EZJiyI", "inventories": ["rsBeqRVn", "qLdHvslN", "thD8suDY"], "label": "YXEC4SF5", "profileName": "uwS9gjo0", "statistics": ["3jL3sZAZ", "4F3eHDtO", "7F8zsSCh"], "tags": ["gZPcO4Si", "xrJgvrJN", "rGxDlqO2"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'gJQQnZRW' \
    --userId '70o6aaLx' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId '4C8TgzHr' \
    --userId 'Gom6IXQ5' \
    --body '{"achievements": ["P5ljU3Pw", "dpEi2qat", "uOdydHG6"], "attributes": {"bODqW0z5": "jIyEc8c3", "74qW2zY5": "8SaAHmu4", "kXGFThIf": "vtCoHJPE"}, "avatarUrl": "PMBVB2by", "inventories": ["gqr6vuaG", "VfVsywRB", "6wSkbG75"], "label": "ruyfwDNU", "profileName": "tlx7k1sG", "statistics": ["wWBNbLw1", "fTt2ZhDI", "eDfxB03a"], "tags": ["YHmZbwv6", "tPNeMF8F", "xaBwncSh"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'b5LAgGbx' \
    --userId 'UCtrvB1J' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName '2fLb7fYC' \
    --namespace "$AB_NAMESPACE" \
    --profileId '3oMxi6PN' \
    --userId 'MZ864adq' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'PuLQ31hZ' \
    --namespace "$AB_NAMESPACE" \
    --profileId '8JgnMBqb' \
    --userId 'WNmocP1W' \
    --body '{"name": "36YVXPUi", "value": "97YFGex9"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId '8L7FhllV' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId '89yTFEsG' \
    --label 'NPfOserM' \
    --tags 'O8NLqCKL,v564LJUE,3g36yVwi' \
    --checksum 'Upj0wWGt' \
    --customAttribute 'zoKQFkAE' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'f2tGImr9' \
    --userId 'Ku28W9Ix' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'B8VJounA' \
    --userId 'ygbQizZR' \
    --label 'YfbrN0Fp' \
    --tags '7QgQDrHQ,N0kd1JlM,Oso89d9x' \
    --checksum 'eTY4F5Jn' \
    --customAttribute 'AB3IBlAn' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'zn4xjBbi' \
    --userId '6eWHxc1K' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId 'BTMmhh0B' \
    --userId 'ERLtVwRW' \
    --body '{"customAttribute": "wgEX3Pd0", "label": "sbb7MPMK", "tags": ["xowCAlsY", "kLMHJvnb", "Rw5FsZk5"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '18' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'wAE4Mirg' \
    --userIds 'hDCn8VDG' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.09176277087641516, "statCode": "RLddxsf7", "userId": "XAeBNlqr"}, {"inc": 0.6711364322117039, "statCode": "CbmaXcpM", "userId": "8cYbwl36"}, {"inc": 0.9330557389489611, "statCode": "WuS77EdJ", "userId": "YzUjuwKh"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.2613117938499946, "statCode": "PRsEMRV3", "userId": "CFCPCVcZ"}, {"inc": 0.6445308730390124, "statCode": "MbCnIrKG", "userId": "cD0LwEPQ"}, {"inc": 0.3841094082718792, "statCode": "3Ca2W0g8", "userId": "KnSV0Mfh"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'B37movHg' \
    --userIds 'WQ67fP6X,bW4BmQpe,Em5tDZbd' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "7A4ZRqpf", "userId": "p9wzLZ28"}, {"statCode": "45rD2tHX", "userId": "xeIElGxn"}, {"statCode": "kj0RJQDH", "userId": "C46EMlYK"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.14481313698894072, "description": "NxkxeeKK", "incrementOnly": true, "maximum": 0.952183505979219, "minimum": 0.8404696746306999, "name": "rxXAUQpZ", "setAsGlobal": true, "setBy": "CLIENT", "statCode": "FcQjYkQF", "tags": ["FxtcGHEP", "s6ttwPTA", "HuaBqpgK"]}' \
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
    --limit '39' \
    --offset '56' \
    --keyword 'PVYOZGdc' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jx7PkXru' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'CwsPGyX3' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'WymiywSL' \
    --body '{"defaultValue": 0.650512243165612, "description": "4whk0UuT", "name": "1IrwiFCH", "tags": ["svdxaWSk", "uL7jwkaP", "zhZ4wJsq"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 DeleteTiedStat
./ng net.accelbyte.sdk.cli.Main social deleteTiedStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'S1iGCuBH' \
    > test.out 2>&1
eval_tap $? 40 'DeleteTiedStat' test.out

#- 41 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZK8aXHuK' \
    --limit '58' \
    --offset '12' \
    --statCodes 'TbSFLdHE' \
    --tags '6Hn7QlTK' \
    > test.out 2>&1
eval_tap $? 41 'GetUserStatItems' test.out

#- 42 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'PzOKIzD4' \
    --body '[{"statCode": "tz92YQvw"}, {"statCode": "CnYZCfqB"}, {"statCode": "ddLLUTSm"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkCreateUserStatItems' test.out

#- 43 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dlN8QoV5' \
    --body '[{"inc": 0.5789895213111838, "statCode": "PQEqT9sW"}, {"inc": 0.6557268842358325, "statCode": "Vdtjyamp"}, {"inc": 0.6809469084184478, "statCode": "LrvGbiD8"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItem1' test.out

#- 44 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qaQ0ywTW' \
    --body '[{"inc": 0.24197617760390233, "statCode": "bjcJ9FY2"}, {"inc": 0.9797422006059945, "statCode": "r6QU2ajQ"}, {"inc": 0.10083210326818615, "statCode": "Wdol41lF"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkIncUserStatItemValue1' test.out

#- 45 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gy72UPgq' \
    --body '[{"statCode": "P2rlu7Dn"}, {"statCode": "9ltMSndl"}, {"statCode": "YL2nDQFH"}]' \
    > test.out 2>&1
eval_tap $? 45 'BulkResetUserStatItem1' test.out

#- 46 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'JsqcB68c' \
    --userId 'KaAa5gTk' \
    > test.out 2>&1
eval_tap $? 46 'CreateUserStatItem' test.out

#- 47 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'gTowWYzb' \
    --userId 'aHAzKMoc' \
    > test.out 2>&1
eval_tap $? 47 'DeleteUserStatItems' test.out

#- 48 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KMFZbBAr' \
    --userId 'eSXWjw11' \
    --body '{"inc": 0.9380707619532312}' \
    > test.out 2>&1
eval_tap $? 48 'IncUserStatItemValue' test.out

#- 49 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'h4X4EWkJ' \
    --userId 'yzWsBKO8' \
    --additionalKey '1OvCaWdB' \
    --body '{"additionalData": {"5BZB7M5L": {}, "NuqQj0Ve": {}, "ecFk9Kfi": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'ResetUserStatItemValue' test.out

#- 50 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'GkIwgPxB' \
    --userIds 'JY5uaAGJ' \
    > test.out 2>&1
eval_tap $? 50 'BulkFetchStatItems1' test.out

#- 51 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.624123798592121, "statCode": "2zxg49xl", "userId": "XNMxjIZ7"}, {"inc": 0.650212296168678, "statCode": "ha4lgbMf", "userId": "d5RXkQy6"}, {"inc": 0.020614147166676755, "statCode": "8SdQMJ8X", "userId": "ecEWluXa"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItem' test.out

#- 52 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.4194234211879866, "statCode": "tlrdf5Lc", "userId": "VWd34XgC"}, {"inc": 0.4647400862975436, "statCode": "3rtC3zEJ", "userId": "HIeQ94Pi"}, {"inc": 0.9847069135990609, "statCode": "Qy50IdGH", "userId": "czYnElfc"}]' \
    > test.out 2>&1
eval_tap $? 52 'PublicBulkIncUserStatItemValue' test.out

#- 53 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "XBaWteGp", "userId": "XykGwLNv"}, {"statCode": "x6NmkxnK", "userId": "wXhymUIE"}, {"statCode": "GQqKRMZu", "userId": "syoo3rKB"}]' \
    > test.out 2>&1
eval_tap $? 53 'BulkResetUserStatItem2' test.out

#- 54 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.1784151687863227, "description": "Hb0sCBxc", "incrementOnly": false, "maximum": 0.8323808696500408, "minimum": 0.639193951698413, "name": "M0u4U3zo", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "DmviRmeC", "tags": ["klFV0sVK", "HlwRYktI", "gCBVP5jH"]}' \
    > test.out 2>&1
eval_tap $? 54 'CreateStat1' test.out

#- 55 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'utvgCszK' \
    --limit '49' \
    --offset '4' \
    --statCodes 'pHpwVmUi' \
    --tags 'RMfUbw10' \
    > test.out 2>&1
eval_tap $? 55 'PublicQueryUserStatItems' test.out

#- 56 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJ9V7r9Y' \
    --body '[{"statCode": "zvVrR1Kb"}, {"statCode": "KPSKFgoc"}, {"statCode": "AkVR4BRm"}]' \
    > test.out 2>&1
eval_tap $? 56 'PublicBulkCreateUserStatItems' test.out

#- 57 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7o5shj1P' \
    --statCodes 'Y5r3rXx5,k6NdPsoa,UGEF69V5' \
    --tags 'zpPSZWfn,JkdC3TmU,mOtvJa2v' \
    > test.out 2>&1
eval_tap $? 57 'PublicQueryUserStatItems1' test.out

#- 58 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'LPSEwQWj' \
    --body '[{"inc": 0.799587884356109, "statCode": "Olh7yFPp"}, {"inc": 0.015886353790721786, "statCode": "Cshm3895"}, {"inc": 0.7878358973346774, "statCode": "7EPGjGW0"}]' \
    > test.out 2>&1
eval_tap $? 58 'PublicBulkIncUserStatItem1' test.out

#- 59 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VR9P6bb4' \
    --body '[{"inc": 0.934606312266715, "statCode": "cfavALvn"}, {"inc": 0.7411879339493538, "statCode": "3XeqSxb2"}, {"inc": 0.7959908327563555, "statCode": "cJ2AbqYc"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkIncUserStatItemValue2' test.out

#- 60 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'lOxtwfcv' \
    --body '[{"statCode": "fil1l8dF"}, {"statCode": "WHalwi7R"}, {"statCode": "0xbjsHf5"}]' \
    > test.out 2>&1
eval_tap $? 60 'BulkResetUserStatItem3' test.out

#- 61 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'oRBy1B7J' \
    --userId 'w94Qpcqf' \
    > test.out 2>&1
eval_tap $? 61 'PublicCreateUserStatItem' test.out

#- 62 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tJoQYqZc' \
    --userId 'HTvP9T6j' \
    > test.out 2>&1
eval_tap $? 62 'DeleteUserStatItems1' test.out

#- 63 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'f8hzRGsm' \
    --userId '2frU8TYy' \
    --body '{"inc": 0.1963011991568313}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItem' test.out

#- 64 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'uTQrTP0y' \
    --userId 'Nud58Btv' \
    --body '{"inc": 0.2779532615165179}' \
    > test.out 2>&1
eval_tap $? 64 'PublicIncUserStatItemValue' test.out

#- 65 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'vWFWqSX5' \
    --userId 'URDcKIIX' \
    > test.out 2>&1
eval_tap $? 65 'ResetUserStatItemValue1' test.out

#- 66 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"zpHcO1X5": {}, "RNnCP5uc": {}, "fUG6Gfou": {}}, "additionalKey": "31KQ2I1N", "statCode": "NY41LLLR", "updateStrategy": "OVERRIDE", "userId": "WuSIRLAN", "value": 0.0474689700887172}, {"additionalData": {"xObVMYtt": {}, "qfgDg1Fe": {}, "HTkyShOQ": {}}, "additionalKey": "RQx5TYtQ", "statCode": "c0NylF84", "updateStrategy": "MAX", "userId": "3Hqs7zPi", "value": 0.38587982647943353}, {"additionalData": {"duWbFNcA": {}, "eOsWSyfS": {}, "5o4d2hj1": {}}, "additionalKey": "rYHtfw83", "statCode": "JMXgfHRF", "updateStrategy": "MIN", "userId": "MH810PAe", "value": 0.4389266915618416}]' \
    > test.out 2>&1
eval_tap $? 66 'BulkUpdateUserStatItemV2' test.out

#- 67 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'mjSEclm8' \
    --statCode 'A4rv8Vi5' \
    --userIds 'z1HwOYe6,1szylPSy,raS5d8So' \
    > test.out 2>&1
eval_tap $? 67 'BulkFetchOrDefaultStatItems1' test.out

#- 68 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'ssJGu8X0' \
    --additionalKey '2KYUa5sf' \
    --body '[{"additionalData": {"rbujw7bB": {}, "5wdAZ2mH": {}, "Hl15W34Z": {}}, "statCode": "zlm3xYuA", "updateStrategy": "OVERRIDE", "value": 0.6915570234991141}, {"additionalData": {"uiXBuHHI": {}, "q0Zjhwt8": {}, "x0k67Mr1": {}}, "statCode": "Jku2tQqN", "updateStrategy": "MIN", "value": 0.4744866259646683}, {"additionalData": {"QcIFGysC": {}, "w6PQE7VY": {}, "biztNukw": {}}, "statCode": "EsuIZxDx", "updateStrategy": "OVERRIDE", "value": 0.6548411661359167}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkUpdateUserStatItem' test.out

#- 69 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId '55jXgJ77' \
    --additionalKey 'fA1nhORv' \
    --body '[{"additionalData": {"cGiwtVV1": {}, "GsxVVNPU": {}, "JF7bpHzV": {}}, "statCode": "dJBoNzoh"}, {"additionalData": {"CqxZP1gg": {}, "0mwDpqVV": {}, "QVyru3Zj": {}}, "statCode": "myelw1uI"}, {"additionalData": {"wYbTNnaU": {}, "WV0thOqy": {}, "ORAxk44H": {}}, "statCode": "t85J2qoY"}]' \
    > test.out 2>&1
eval_tap $? 69 'BulkResetUserStatItemValues' test.out

#- 70 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'szQLOYFv' \
    --userId 'RUraXL8Z' \
    --additionalKey 'ovoHVQiD' \
    > test.out 2>&1
eval_tap $? 70 'DeleteUserStatItems2' test.out

#- 71 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'VQbnBtHP' \
    --userId '8jwc3orv' \
    --additionalKey '7sppk0MS' \
    --body '{"additionalData": {"d7mEkGNH": {}, "ykiwrguG": {}, "VSiLZxQE": {}}, "updateStrategy": "INCREMENT", "value": 0.21783955970283364}' \
    > test.out 2>&1
eval_tap $? 71 'UpdateUserStatItemValue' test.out

#- 72 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"uViYGwIF": {}, "FCFes67j": {}, "qkfMZBlI": {}}, "additionalKey": "GMm6BWZz", "statCode": "m85VNyN7", "updateStrategy": "INCREMENT", "userId": "CO8cAyOP", "value": 0.49299911689565834}, {"additionalData": {"OibsHGsY": {}, "YsBmgkVd": {}, "qo0f6Mkg": {}}, "additionalKey": "qnVgdGiv", "statCode": "NXtVJ9jI", "updateStrategy": "MIN", "userId": "QPF5rBUH", "value": 0.666402029224553}, {"additionalData": {"vMwvbhWy": {}, "TRPchrfW": {}, "K8VXtdGk": {}}, "additionalKey": "vnme0Kwf", "statCode": "zcWpn7Lg", "updateStrategy": "OVERRIDE", "userId": "Nk6JI7pS", "value": 0.0556317275371806}]' \
    > test.out 2>&1
eval_tap $? 72 'BulkUpdateUserStatItem1' test.out

#- 73 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'oaqgkMss' \
    --additionalKey 'EgCEnmRW' \
    --statCodes 'dLcAa97O,SFZNvx8z,OaSW8WMh' \
    --tags 'nvcfwvHe,nMQVwq2d,1YDtl4y3' \
    > test.out 2>&1
eval_tap $? 73 'PublicQueryUserStatItems2' test.out

#- 74 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId '35xelW0L' \
    --additionalKey '1wG1Z32c' \
    --body '[{"additionalData": {"VmY8C5CH": {}, "DtGRxqNp": {}, "TkP6HFbm": {}}, "statCode": "sLI3KrcW", "updateStrategy": "MIN", "value": 0.9485392506029299}, {"additionalData": {"YHiJJ0fq": {}, "ERKeNqWk": {}, "8vC39EYg": {}}, "statCode": "fr1iBCiP", "updateStrategy": "MAX", "value": 0.9267067976408789}, {"additionalData": {"LdmrJji7": {}, "yzGMtjKH": {}, "cU5ugHTC": {}}, "statCode": "eJKYEaFA", "updateStrategy": "INCREMENT", "value": 0.5558777468235087}]' \
    > test.out 2>&1
eval_tap $? 74 'BulkUpdateUserStatItem2' test.out

#- 75 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'maWAu22p' \
    --userId 'tC1Kcbwb' \
    --additionalKey 'CN33yhpD' \
    --body '{"additionalData": {"EN3Hcl8g": {}, "05S74ifU": {}, "Gz88djc3": {}}, "updateStrategy": "MAX", "value": 0.6822075093793758}' \
    > test.out 2>&1
eval_tap $? 75 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE