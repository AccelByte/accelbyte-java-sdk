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
    --body '{"maxSlotSize": 87, "maxSlots": 33}' \
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
    --userId '2gM6xZRs' \
    > test.out 2>&1
eval_tap $? 5 'GetUserSlotConfig' test.out

#- 6 UpdateUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social updateUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '1HLpfddc' \
    --body '{"maxSlotSize": 11, "maxSlots": 79}' \
    > test.out 2>&1
eval_tap $? 6 'UpdateUserSlotConfig' test.out

#- 7 DeleteUserSlotConfig
./ng net.accelbyte.sdk.cli.Main social deleteUserSlotConfig \
    --namespace "$AB_NAMESPACE" \
    --userId '7y2scEgP' \
    > test.out 2>&1
eval_tap $? 7 'DeleteUserSlotConfig' test.out

#- 8 GetUserProfiles
./ng net.accelbyte.sdk.cli.Main social getUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'SRZo5TEV' \
    > test.out 2>&1
eval_tap $? 8 'GetUserProfiles' test.out

#- 9 GetProfile
./ng net.accelbyte.sdk.cli.Main social getProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'WefgR2Eb' \
    --userId '9rcvhaC5' \
    > test.out 2>&1
eval_tap $? 9 'GetProfile' test.out

#- 10 GetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social getUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'SOiwWNHq' \
    > test.out 2>&1
eval_tap $? 10 'GetUserNamespaceSlots' test.out

#- 11 GetSlotData
./ng net.accelbyte.sdk.cli.Main social getSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'NTALO0Br' \
    --userId 'zu0fBkkd' \
    > test.out 2>&1
eval_tap $? 11 'GetSlotData' test.out

#- 12 PublicGetUserGameProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserGameProfiles \
    --namespace "$AB_NAMESPACE" \
    --userIds 'FoQWu1kX", "8RWmYogw", "Vlv1tmY2' \
    > test.out 2>&1
eval_tap $? 12 'PublicGetUserGameProfiles' test.out

#- 13 PublicGetUserProfiles
./ng net.accelbyte.sdk.cli.Main social publicGetUserProfiles \
    --namespace "$AB_NAMESPACE" \
    --userId 'GLTqx5zf' \
    > test.out 2>&1
eval_tap $? 13 'PublicGetUserProfiles' test.out

#- 14 PublicCreateProfile
./ng net.accelbyte.sdk.cli.Main social publicCreateProfile \
    --namespace "$AB_NAMESPACE" \
    --userId 'WCwFJpqz' \
    --body '{"achievements": ["u7lRv6YH", "LmxIuTTV", "ZXbX933g"], "attributes": {"xjM8Li9I": "i1fCoGxE", "9JsBVrsU": "3IX4wfjW", "93kgvKFw": "lwII0iLQ"}, "avatarUrl": "b0L6JPXH", "inventories": ["NlkY1fX8", "JSf0B27x", "Lx9Fm7o7"], "label": "L9DaFP7o", "profileName": "aFZT3a26", "statistics": ["JmIJ9pz8", "NuUP0K5j", "S4zn9hDw"], "tags": ["tRf4j2AP", "kSj5BYpT", "crexmExG"]}' \
    > test.out 2>&1
eval_tap $? 14 'PublicCreateProfile' test.out

#- 15 PublicGetProfile
./ng net.accelbyte.sdk.cli.Main social publicGetProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'tkju1pZv' \
    --userId 'ASzsP8oh' \
    > test.out 2>&1
eval_tap $? 15 'PublicGetProfile' test.out

#- 16 PublicUpdateProfile
./ng net.accelbyte.sdk.cli.Main social publicUpdateProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'c64YQEQb' \
    --userId 'L78bKYhx' \
    --body '{"achievements": ["JeZDTBEs", "TS7SbdVY", "xeeha7Hc"], "attributes": {"TSfR7HpX": "VPysuTXo", "MDgJoBjk": "auq4NV1A", "2GYlFUEF": "yaKH6TkD"}, "avatarUrl": "JdxY9UBK", "inventories": ["Uuz1SpFH", "ofQepLaA", "rT2kKGT8"], "label": "h3yUgXNj", "profileName": "pweAq7U8", "statistics": ["LipBdlNJ", "lMxLEYRg", "Y2jotwjF"], "tags": ["IepQkSiz", "KN38gnoR", "vT8vnXpk"]}' \
    > test.out 2>&1
eval_tap $? 16 'PublicUpdateProfile' test.out

#- 17 PublicDeleteProfile
./ng net.accelbyte.sdk.cli.Main social publicDeleteProfile \
    --namespace "$AB_NAMESPACE" \
    --profileId 'ZahVigat' \
    --userId 'v2woEGkv' \
    > test.out 2>&1
eval_tap $? 17 'PublicDeleteProfile' test.out

#- 18 PublicGetProfileAttribute
./ng net.accelbyte.sdk.cli.Main social publicGetProfileAttribute \
    --attributeName 'zcXO1m5e' \
    --namespace "$AB_NAMESPACE" \
    --profileId 'QlYuFx8v' \
    --userId 'MrNubPcC' \
    > test.out 2>&1
eval_tap $? 18 'PublicGetProfileAttribute' test.out

#- 19 PublicUpdateAttribute
./ng net.accelbyte.sdk.cli.Main social publicUpdateAttribute \
    --attributeName 'WvmHOG5F' \
    --namespace "$AB_NAMESPACE" \
    --profileId '3FeOVeSw' \
    --userId 'udos6dBK' \
    --body '{"name": "fur335eV", "value": "GQZOU9nK"}' \
    > test.out 2>&1
eval_tap $? 19 'PublicUpdateAttribute' test.out

#- 20 PublicGetUserNamespaceSlots
./ng net.accelbyte.sdk.cli.Main social publicGetUserNamespaceSlots \
    --namespace "$AB_NAMESPACE" \
    --userId 'JRTJrLUN' \
    > test.out 2>&1
eval_tap $? 20 'PublicGetUserNamespaceSlots' test.out

#- 21 PublicCreateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicCreateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --userId 'NThSYrf4' \
    --label 'KUxlLiNv' \
    --tags 'tMiFionW", "TQrmTaDC", "4xSJYn0m' \
    --checksum 'RWVIqcjt' \
    --customAttribute 'djFSgeNY' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 21 'PublicCreateUserNamespaceSlot' test.out

#- 22 PublicGetSlotData
./ng net.accelbyte.sdk.cli.Main social publicGetSlotData \
    --namespace "$AB_NAMESPACE" \
    --slotId 'UtWdvDyp' \
    --userId 'dnNnnPJI' \
    > test.out 2>&1
eval_tap $? 22 'PublicGetSlotData' test.out

#- 23 PublicUpdateUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'curjVj0z' \
    --userId 'JAKbcLAv' \
    --label 'wK9LJVMD' \
    --tags 'AA0SymOT", "AyYr2OIZ", "W78Bhggv' \
    --checksum 'WJDREju3' \
    --customAttribute 'TrYo8zXq' \
    --file 'tmp.dat' \
    > test.out 2>&1
eval_tap $? 23 'PublicUpdateUserNamespaceSlot' test.out

#- 24 PublicDeleteUserNamespaceSlot
./ng net.accelbyte.sdk.cli.Main social publicDeleteUserNamespaceSlot \
    --namespace "$AB_NAMESPACE" \
    --slotId 'skSsSgTy' \
    --userId 'NeY5ieD8' \
    > test.out 2>&1
eval_tap $? 24 'PublicDeleteUserNamespaceSlot' test.out

#- 25 PublicUpdateUserNamespaceSlotMetadata
./ng net.accelbyte.sdk.cli.Main social publicUpdateUserNamespaceSlotMetadata \
    --namespace "$AB_NAMESPACE" \
    --slotId '6qr3Gdcy' \
    --userId 'smszIBIN' \
    --body '{"customAttribute": "ASERVzfl", "label": "TAVFAtwC", "tags": ["fnIaamzE", "HMFEMoY1", "rJ09CBR3"]}' \
    > test.out 2>&1
eval_tap $? 25 'PublicUpdateUserNamespaceSlotMetadata' test.out

#- 26 GetGlobalStatItems
./ng net.accelbyte.sdk.cli.Main social getGlobalStatItems \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 26 'GetGlobalStatItems' test.out

#- 27 BulkFetchStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qkgWzDDE' \
    --userIds 'Pqkn6i4x' \
    > test.out 2>&1
eval_tap $? 27 'BulkFetchStatItems' test.out

#- 28 BulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.014824463471589389, "statCode": "6Ex2yDto", "userId": "mpqYhkaL"}, {"inc": 0.8350734922729397, "statCode": "Am8DK3Kc", "userId": "jIUjW4d3"}, {"inc": 0.16045953242151056, "statCode": "hPUZycY9", "userId": "9tPMGSmi"}]' \
    > test.out 2>&1
eval_tap $? 28 'BulkIncUserStatItem' test.out

#- 29 BulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.025780823925751872, "statCode": "8KmNslpa", "userId": "Y6xmUebH"}, {"inc": 0.486134176575717, "statCode": "7QxE3jrt", "userId": "tQ0nK0SK"}, {"inc": 0.23527537979612678, "statCode": "15XtmF5i", "userId": "X7QUn8TP"}]' \
    > test.out 2>&1
eval_tap $? 29 'BulkIncUserStatItemValue' test.out

#- 30 BulkFetchOrDefaultStatItems
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'jZGudIdb' \
    --userIds '4Erv1Uha", "ulVCREfa", "Tn1wap05' \
    > test.out 2>&1
eval_tap $? 30 'BulkFetchOrDefaultStatItems' test.out

#- 31 BulkResetUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "bUIVJGMQ", "userId": "wudQJZdX"}, {"statCode": "BtWXy9fu", "userId": "NfBJQ9W6"}, {"statCode": "l6cJ54jI", "userId": "dw8z8iya"}]' \
    > test.out 2>&1
eval_tap $? 31 'BulkResetUserStatItem' test.out

#- 32 GetStats
./ng net.accelbyte.sdk.cli.Main social getStats \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 32 'GetStats' test.out

#- 33 CreateStat
./ng net.accelbyte.sdk.cli.Main social createStat \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.22719694714760819, "description": "lKZtxAUc", "incrementOnly": false, "maximum": 0.5176040402615583, "minimum": 0.47882778375757107, "name": "EUgyWNZI", "setAsGlobal": false, "setBy": "CLIENT", "statCode": "yw9kqFpy", "tags": ["Twty6cCo", "296I1c7j", "F4geTtym"]}' \
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
    --limit '83' \
    --offset '33' \
    --keyword 'wB21QFNo' \
    > test.out 2>&1
eval_tap $? 36 'QueryStats' test.out

#- 37 GetStat
./ng net.accelbyte.sdk.cli.Main social getStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'KTonsbKy' \
    > test.out 2>&1
eval_tap $? 37 'GetStat' test.out

#- 38 DeleteStat
./ng net.accelbyte.sdk.cli.Main social deleteStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'x9Gr7sxa' \
    > test.out 2>&1
eval_tap $? 38 'DeleteStat' test.out

#- 39 UpdateStat
./ng net.accelbyte.sdk.cli.Main social updateStat \
    --namespace "$AB_NAMESPACE" \
    --statCode 'zfBYbkA7' \
    --body '{"description": "NuGmXG5n", "name": "3hmYAhsh", "tags": ["nxqVPpBp", "2RA1ok5F", "sacZ49Ap"]}' \
    > test.out 2>&1
eval_tap $? 39 'UpdateStat' test.out

#- 40 GetUserStatItems
./ng net.accelbyte.sdk.cli.Main social getUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'sjyhIkpX' \
    --limit '43' \
    --offset '74' \
    --statCodes '9q9uqGKz' \
    --tags 'IUr9LU29' \
    > test.out 2>&1
eval_tap $? 40 'GetUserStatItems' test.out

#- 41 BulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social bulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'KHmQmIdw' \
    --body '[{"statCode": "LCST1atm"}, {"statCode": "RJiAKwlW"}, {"statCode": "HpgTMAFr"}]' \
    > test.out 2>&1
eval_tap $? 41 'BulkCreateUserStatItems' test.out

#- 42 BulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9l2LhtPi' \
    --body '[{"inc": 0.8316520666591479, "statCode": "6kYyKh94"}, {"inc": 0.3524080760621965, "statCode": "zn2l4BhZ"}, {"inc": 0.07582662244007699, "statCode": "x1lxrNZd"}]' \
    > test.out 2>&1
eval_tap $? 42 'BulkIncUserStatItem1' test.out

#- 43 BulkIncUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4BHQSTxK' \
    --body '[{"inc": 0.2576693187531459, "statCode": "GKdaF2cx"}, {"inc": 0.25597790640406826, "statCode": "dg3hfxcP"}, {"inc": 0.22513234894925827, "statCode": "ULcbgauU"}]' \
    > test.out 2>&1
eval_tap $? 43 'BulkIncUserStatItemValue1' test.out

#- 44 BulkResetUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DMKwXxui' \
    --body '[{"statCode": "piTAtLI5"}, {"statCode": "qgQdWgpM"}, {"statCode": "ACbJWPhw"}]' \
    > test.out 2>&1
eval_tap $? 44 'BulkResetUserStatItem1' test.out

#- 45 CreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social createUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'I6poyMZW' \
    --userId 'TPJvNxsP' \
    > test.out 2>&1
eval_tap $? 45 'CreateUserStatItem' test.out

#- 46 DeleteUserStatItems
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --statCode 'P5F22csS' \
    --userId 'xlmv3oep' \
    > test.out 2>&1
eval_tap $? 46 'DeleteUserStatItems' test.out

#- 47 IncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social incUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 's0eCB2U9' \
    --userId 'ZNdQzAYH' \
    --body '{"inc": 0.45337816126876884}' \
    > test.out 2>&1
eval_tap $? 47 'IncUserStatItemValue' test.out

#- 48 ResetUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'lk9t7BOG' \
    --userId 'phMPBdRn' \
    --additionalKey '67MhAF8f' \
    --body '{"additionalData": {"MwaChqr2": {}, "oYRFR2UZ": {}, "QPBtU9Vp": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'ResetUserStatItemValue' test.out

#- 49 BulkFetchStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'aea7pSIR' \
    --userIds 'HDleEvOH' \
    > test.out 2>&1
eval_tap $? 49 'BulkFetchStatItems1' test.out

#- 50 PublicBulkIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.48240877230865187, "statCode": "wCbaSkce", "userId": "bHMalTjO"}, {"inc": 0.7806739414405875, "statCode": "HWnyNuKp", "userId": "vjQSmEFE"}, {"inc": 0.28402003655644525, "statCode": "enRsfO2I", "userId": "APn2FcAH"}]' \
    > test.out 2>&1
eval_tap $? 50 'PublicBulkIncUserStatItem' test.out

#- 51 PublicBulkIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --body '[{"inc": 0.7931454399897672, "statCode": "EF91Uq63", "userId": "qtCBp2zh"}, {"inc": 0.8382657787165622, "statCode": "qJX46Ipo", "userId": "08TeFiB0"}, {"inc": 0.5896844548805582, "statCode": "Iqhw5LiC", "userId": "hjknyAMB"}]' \
    > test.out 2>&1
eval_tap $? 51 'PublicBulkIncUserStatItemValue' test.out

#- 52 BulkResetUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"statCode": "9Uy4EuzJ", "userId": "sCQLme0A"}, {"statCode": "z87sA1em", "userId": "hYI4uEdT"}, {"statCode": "Zt9tJYxs", "userId": "AasCLreW"}]' \
    > test.out 2>&1
eval_tap $? 52 'BulkResetUserStatItem2' test.out

#- 53 CreateStat1
./ng net.accelbyte.sdk.cli.Main social createStat1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"defaultValue": 0.767528605324928, "description": "nRxcCioG", "incrementOnly": true, "maximum": 0.40143542370061125, "minimum": 0.3456404743070661, "name": "Z63qq6JW", "setAsGlobal": false, "setBy": "SERVER", "statCode": "Ahbmw6Ev", "tags": ["9n9s0eux", "sfpVxKwQ", "NQjHchMY"]}' \
    > test.out 2>&1
eval_tap $? 53 'CreateStat1' test.out

#- 54 PublicQueryUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'igj6eqNy' \
    --limit '34' \
    --offset '16' \
    --statCodes 'g97gKtJZ' \
    --tags 'Xlwgo3mc' \
    > test.out 2>&1
eval_tap $? 54 'PublicQueryUserStatItems' test.out

#- 55 PublicBulkCreateUserStatItems
./ng net.accelbyte.sdk.cli.Main social publicBulkCreateUserStatItems \
    --namespace "$AB_NAMESPACE" \
    --userId 'auSOw77j' \
    --body '[{"statCode": "NW9bGDc4"}, {"statCode": "BVCKNRbW"}, {"statCode": "QGuO1zcO"}]' \
    > test.out 2>&1
eval_tap $? 55 'PublicBulkCreateUserStatItems' test.out

#- 56 PublicQueryUserStatItems1
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eWtIZRq3' \
    --statCodes 'yHWCBxOu", "33CNRcVQ", "z09rRbdM' \
    --tags '9YXCYd2G", "z0IzojJD", "zW3zrED5' \
    > test.out 2>&1
eval_tap $? 56 'PublicQueryUserStatItems1' test.out

#- 57 PublicBulkIncUserStatItem1
./ng net.accelbyte.sdk.cli.Main social publicBulkIncUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'VA79oEAV' \
    --body '[{"inc": 0.06356926247725792, "statCode": "4GCEUZeL"}, {"inc": 0.12019301198186172, "statCode": "wsD21Nf8"}, {"inc": 0.4020114425487047, "statCode": "1C7zHqF8"}]' \
    > test.out 2>&1
eval_tap $? 57 'PublicBulkIncUserStatItem1' test.out

#- 58 BulkIncUserStatItemValue2
./ng net.accelbyte.sdk.cli.Main social bulkIncUserStatItemValue2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xh6XEHCx' \
    --body '[{"inc": 0.14274710360942988, "statCode": "yuPqxDy0"}, {"inc": 0.913622652072464, "statCode": "RCC4nJVe"}, {"inc": 0.8776044652572416, "statCode": "2GHZ4QhU"}]' \
    > test.out 2>&1
eval_tap $? 58 'BulkIncUserStatItemValue2' test.out

#- 59 BulkResetUserStatItem3
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItem3 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QU15W1Px' \
    --body '[{"statCode": "3WozMZnB"}, {"statCode": "kAz2kaaf"}, {"statCode": "pr15FePL"}]' \
    > test.out 2>&1
eval_tap $? 59 'BulkResetUserStatItem3' test.out

#- 60 PublicCreateUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicCreateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode '3CU6Jyjd' \
    --userId '5BHwOj2U' \
    > test.out 2>&1
eval_tap $? 60 'PublicCreateUserStatItem' test.out

#- 61 DeleteUserStatItems1
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'cFRcd2Z9' \
    --userId 'gf2glv9g' \
    > test.out 2>&1
eval_tap $? 61 'DeleteUserStatItems1' test.out

#- 62 PublicIncUserStatItem
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --statCode 'UgEqP6ov' \
    --userId 'biSe4Dwa' \
    --body '{"inc": 0.5365297075153541}' \
    > test.out 2>&1
eval_tap $? 62 'PublicIncUserStatItem' test.out

#- 63 PublicIncUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social publicIncUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'ctgr0sid' \
    --userId 'RqO3xJCO' \
    --body '{"inc": 0.21381682011636316}' \
    > test.out 2>&1
eval_tap $? 63 'PublicIncUserStatItemValue' test.out

#- 64 ResetUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social resetUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'EGVvVPA6' \
    --userId 'daUOI1Wr' \
    > test.out 2>&1
eval_tap $? 64 'ResetUserStatItemValue1' test.out

#- 65 BulkUpdateUserStatItemV2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItemV2 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"bbebgC09": {}, "2eKZFtDA": {}, "wBOz6oFs": {}}, "additionalKey": "Ef9hvPwq", "statCode": "Dz2VpTE1", "updateStrategy": "OVERRIDE", "userId": "E4803bTm", "value": 0.7219989098164371}, {"additionalData": {"0wFrMHXM": {}, "sIlQdvFH": {}, "wd9mYIEj": {}}, "additionalKey": "xk8IfHZv", "statCode": "hntdPEaE", "updateStrategy": "MIN", "userId": "GqWfgQzh", "value": 0.731161700987848}, {"additionalData": {"6crSFIzm": {}, "vagdRT8r": {}, "ToE8NJ4k": {}}, "additionalKey": "UWgqmy1W", "statCode": "TA7fN4k4", "updateStrategy": "INCREMENT", "userId": "0Fq7F6N2", "value": 0.2712145613197563}]' \
    > test.out 2>&1
eval_tap $? 65 'BulkUpdateUserStatItemV2' test.out

#- 66 BulkFetchOrDefaultStatItems1
./ng net.accelbyte.sdk.cli.Main social bulkFetchOrDefaultStatItems1 \
    --namespace "$AB_NAMESPACE" \
    --additionalKey 'vvV6nfct' \
    --statCode '3GcZR3a5' \
    --userIds 'i1qzDcpf", "Ha0tyipF", "ecNWvjCb' \
    > test.out 2>&1
eval_tap $? 66 'BulkFetchOrDefaultStatItems1' test.out

#- 67 BulkUpdateUserStatItem
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem \
    --namespace "$AB_NAMESPACE" \
    --userId 'bJmKP9aX' \
    --additionalKey '81VGSGoj' \
    --body '[{"additionalData": {"EInT9cQD": {}, "fn8p3vdE": {}, "MNVgjpyz": {}}, "statCode": "6alJcAb7", "updateStrategy": "MIN", "value": 0.5973550314465239}, {"additionalData": {"6i1Fwc6t": {}, "YLZzbjHC": {}, "TwgCEHM8": {}}, "statCode": "YOUQkRwv", "updateStrategy": "MAX", "value": 0.40780532282053616}, {"additionalData": {"SgVG7Yy8": {}, "kvSGzQem": {}, "OOJIIVUd": {}}, "statCode": "VG7Rxy6v", "updateStrategy": "OVERRIDE", "value": 0.17630717826307307}]' \
    > test.out 2>&1
eval_tap $? 67 'BulkUpdateUserStatItem' test.out

#- 68 BulkResetUserStatItemValues
./ng net.accelbyte.sdk.cli.Main social bulkResetUserStatItemValues \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIEH14eB' \
    --additionalKey 'r9kQUWkd' \
    --body '[{"additionalData": {"rNktbd3W": {}, "aTXhpY0m": {}, "jia3cm1b": {}}, "statCode": "1vAdU8aU"}, {"additionalData": {"YhQCsc5s": {}, "lh3Tcpp8": {}, "aS2Aaauu": {}}, "statCode": "qhpIuK2j"}, {"additionalData": {"ptn9eHwv": {}, "0WDeLVp4": {}, "MgeTP2Sh": {}}, "statCode": "y3LTzoNP"}]' \
    > test.out 2>&1
eval_tap $? 68 'BulkResetUserStatItemValues' test.out

#- 69 DeleteUserStatItems2
./ng net.accelbyte.sdk.cli.Main social deleteUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --statCode 'qkjtM7ja' \
    --userId 'xD3b6vyW' \
    --additionalKey 'AHK5mfjX' \
    > test.out 2>&1
eval_tap $? 69 'DeleteUserStatItems2' test.out

#- 70 UpdateUserStatItemValue
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue \
    --namespace "$AB_NAMESPACE" \
    --statCode 'tNbTCl2v' \
    --userId 'k5iXgU5S' \
    --additionalKey 'KFT8H4kz' \
    --body '{"additionalData": {"GXjtSuvt": {}, "81z8SWuQ": {}, "XbVDMc0k": {}}, "updateStrategy": "OVERRIDE", "value": 0.0873510137505551}' \
    > test.out 2>&1
eval_tap $? 70 'UpdateUserStatItemValue' test.out

#- 71 BulkUpdateUserStatItem1
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem1 \
    --namespace "$AB_NAMESPACE" \
    --body '[{"additionalData": {"psZ5TW07": {}, "Oe5KpNdb": {}, "L9EbKG6W": {}}, "additionalKey": "9ZWkS4Yg", "statCode": "KoEPuYJA", "updateStrategy": "MAX", "userId": "ctTFCtNv", "value": 0.7220942222055964}, {"additionalData": {"Arlr04rV": {}, "OyR7CSeF": {}, "pMhD4TJu": {}}, "additionalKey": "itxYQuDo", "statCode": "2Om2CQeB", "updateStrategy": "MIN", "userId": "HpvZYkD9", "value": 0.7368732157818741}, {"additionalData": {"jfSOO6vP": {}, "MolVKrO4": {}, "yqVdrv8K": {}}, "additionalKey": "7YsX4PVn", "statCode": "liKA26GI", "updateStrategy": "INCREMENT", "userId": "jckA7156", "value": 0.9154645878282749}]' \
    > test.out 2>&1
eval_tap $? 71 'BulkUpdateUserStatItem1' test.out

#- 72 PublicQueryUserStatItems2
./ng net.accelbyte.sdk.cli.Main social publicQueryUserStatItems2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XvWn6MZx' \
    --additionalKey 'a4Xb8wNs' \
    --statCodes 'mCGxrdtU", "pUgXDDbv", "48XnsvB4' \
    --tags 'D2LAtewt", "k6M5i5qB", "lRusykvS' \
    > test.out 2>&1
eval_tap $? 72 'PublicQueryUserStatItems2' test.out

#- 73 BulkUpdateUserStatItem2
./ng net.accelbyte.sdk.cli.Main social bulkUpdateUserStatItem2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v8xnJ0Li' \
    --additionalKey 'y3KfD76g' \
    --body '[{"additionalData": {"Nw5r1pls": {}, "nd0ed7bC": {}, "zHgF991U": {}}, "statCode": "fe9DoT2n", "updateStrategy": "INCREMENT", "value": 0.3690094809323309}, {"additionalData": {"ZlpB0s8R": {}, "2wqcOyGP": {}, "4TNffpXh": {}}, "statCode": "tvOcpPDP", "updateStrategy": "MIN", "value": 0.8860549139124327}, {"additionalData": {"Rt5rXGy3": {}, "6O8u4RL4": {}, "4f0yp9Hr": {}}, "statCode": "dxtcM5Oo", "updateStrategy": "INCREMENT", "value": 0.8099889252524566}]' \
    > test.out 2>&1
eval_tap $? 73 'BulkUpdateUserStatItem2' test.out

#- 74 UpdateUserStatItemValue1
./ng net.accelbyte.sdk.cli.Main social updateUserStatItemValue1 \
    --namespace "$AB_NAMESPACE" \
    --statCode '3XlFccv5' \
    --userId 'gLPlA5sA' \
    --additionalKey '8vbsw3Ij' \
    --body '{"additionalData": {"wOfJoYlR": {}, "lN3dF7sJ": {}, "hBZm1MmD": {}}, "updateStrategy": "MIN", "value": 0.5739345028541774}' \
    > test.out 2>&1
eval_tap $? 74 'UpdateUserStatItemValue1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE