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
echo "1..61"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminListAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminGameRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '39' \
    --query 'AxcVpFrttufHIRdH' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAdminGameRecordV1' test.out

#- 3 AdminBulkGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminGameRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["9UzVRiXbqlAw7r6W", "2ktQG0h5JAav5kRa", "62WopBJHPtcDs8bB"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminBulkGetAdminGameRecordV1' test.out

#- 4 AdminGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminGameRecordV1 \
    --key 'ZLCXLx8bbgorQeFb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetAdminGameRecordV1' test.out

#- 5 AdminPutAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordV1 \
    --key 'Q1g7qbPngUNB1vRo' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutAdminGameRecordV1' test.out

#- 6 AdminPostAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostAdminGameRecordV1 \
    --key 'dwpzS6DaDpv8N7ZQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostAdminGameRecordV1' test.out

#- 7 AdminDeleteAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminGameRecordV1 \
    --key 'VqGj6oDLjWjkY1aX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteAdminGameRecordV1' test.out

#- 8 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key 'lFcDtgOjchIua5tW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "EIC32ogW7olvbTgr", "value": {"hRTcPiSuL0Sly6XM": {}, "4OI18mAQLnzjMf8G": {}, "Z2WBZqxYG3aREAu2": {}}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 9 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'D6QVKNCWP75TB0i7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "pKxR8dl0zRVW4EZG", "updatedAt": "9m0XcgGVbMqSszE8", "value": {"GHavj7AorKsxwkos": {}, "AVerXpc1C8XfwHuK": {}, "eb9l3rGN9A3sNm84": {}}}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 10 GetPluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave getPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetPluginConfig' test.out

#- 11 CreatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave createPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "hddSpHt0P7MIIR7C"}, "customConfig": {"GRPCAddress": "kyF6C7duuyZ0GhDo"}, "customFunction": {"afterBulkReadAdminGameRecord": false, "afterBulkReadAdminPlayerRecord": false, "afterBulkReadGameRecord": true, "afterBulkReadPlayerRecord": true, "afterReadAdminGameRecord": true, "afterReadAdminPlayerRecord": false, "afterReadGameRecord": true, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameRecord": true, "beforeWritePlayerRecord": true}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 11 'CreatePluginConfig' test.out

#- 12 DeletePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deletePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeletePluginConfig' test.out

#- 13 UpdatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave updatePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "YiKWe5dNRljv7IPr"}, "customConfig": {"GRPCAddress": "DQQRgat0SevkLGMS"}, "customFunction": {"afterBulkReadAdminGameRecord": true, "afterBulkReadAdminPlayerRecord": false, "afterBulkReadGameRecord": true, "afterBulkReadPlayerRecord": true, "afterReadAdminGameRecord": true, "afterReadAdminPlayerRecord": true, "afterReadGameRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameRecord": true, "beforeWritePlayerRecord": true}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePluginConfig' test.out

#- 14 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'aT5kPxUfofvnnSuB' \
    --limit '66' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 14 'ListGameRecordsHandlerV1' test.out

#- 15 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'SLmCVuHOPlLlkvR8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetGameRecordHandlerV1' test.out

#- 16 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'sKgnuRkgghGoYupD' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutGameRecordHandlerV1' test.out

#- 17 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key '391C2qtPYokahFjk' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 17 'AdminPostGameRecordHandlerV1' test.out

#- 18 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'QsfCaTmt1d67FXGk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'AdminDeleteGameRecordHandlerV1' test.out

#- 19 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key '2s9Q0mPVo3twu0Me' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["sTCf9x4rt69lna7q", "xNeIxPz6MbwL6IY6", "9z1UaLqYSYWytLPz"]}' \
    > test.out 2>&1
eval_tap $? 19 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 20 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["iZMdjxcBZufQxGiH", "PllG4cYEzfTD1ZBm", "3MqHcUmLZZbSqb8R"], "user_id": "wNmn9HrNQy4uZAAi"}, {"keys": ["E0mit9RGCCHYzUOc", "EdscKHPEqgA8yu7V", "k6Jt4Ymos9Jcdos4"], "user_id": "fYcTVU6RBt0zYoMc"}, {"keys": ["HyCUEXlAvxJMdalw", "SyliWMNW5NyLu0M3", "VHh2EI8JlDbPWbQ6"], "user_id": "Q9lNmqRBaAkLnvxk"}]}' \
    > test.out 2>&1
eval_tap $? 20 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 21 ListPlayerRecordHandlerV1
eval_tap 0 21 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 22 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'T1X68cmDc3fxU8My' \
    --limit '75' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 22 'AdminListAdminUserRecordsV1' test.out

#- 23 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'V0v52Dlym6puQ23x' \
    --body '{"keys": ["oJ8aeCnaLpUKp44Y", "UDjasWIPUvmEejtG", "eoyIPa8ZRrvjj7il"]}' \
    > test.out 2>&1
eval_tap $? 23 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 24 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key '35MXbN9oCMNqq98S' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jTvhZNkSQ70D0H6B' \
    > test.out 2>&1
eval_tap $? 24 'AdminGetAdminPlayerRecordV1' test.out

#- 25 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'XksUC9b6i5lZC9xv' \
    --namespace "$AB_NAMESPACE" \
    --userId '32e8c5csSovoqsZN' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPutAdminPlayerRecordV1' test.out

#- 26 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'Bdte9NDUPVJf6c2Z' \
    --namespace "$AB_NAMESPACE" \
    --userId '0QZxfgPubTDIHrvq' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 26 'AdminPostPlayerAdminRecordV1' test.out

#- 27 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'AThuwjRHpKKTlmVr' \
    --namespace "$AB_NAMESPACE" \
    --userId '9XuoJbRFQSKVPHbn' \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteAdminPlayerRecordV1' test.out

#- 28 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key '4Xxtu7LQRENjEEzt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x1WsYSiZqan0nSBJ' \
    --body '{"updatedAt": "roav91GXlvPG6bFY", "value": {"ReVHQipcCx9Zw5D2": {}, "L7vIYhGGSyEW4ZJJ": {}, "42d3PBddN8S48l9l": {}}}' \
    > test.out 2>&1
eval_tap $? 28 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 29 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'yNApflxqMrj3oZk0' \
    --namespace "$AB_NAMESPACE" \
    --userId '3QXcKMDYDDxHSZjt' \
    --body '{"set_by": "qXyJ58f7Gc26SaiG", "updatedAt": "VkydwYWQG26yUZNm", "value": {"TBcvrbYCwZtxFHyP": {}, "LtI8ilbyDPUIj88c": {}, "ekdqCt81P1ktfIov": {}}}' \
    > test.out 2>&1
eval_tap $? 29 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 30 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'mv9gsR5cJcHm3SZL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xoRDFuuuySj29a9L' \
    --body '{"set_by": "JE8HoRS1X2PFAAMw", "updatedAt": "zHPxB1UskYs4Yw20", "value": {"DOqOBSC2DKHRuPMM": {}, "WH8Yb33T5UBJCjfc": {}, "nLRfxeCSz9WEi8Kl": {}}}' \
    > test.out 2>&1
eval_tap $? 30 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 31 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'loeH0JT1yduat2vQ' \
    --limit '89' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 31 'AdminRetrievePlayerRecords' test.out

#- 32 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key '3biBfsu4jmsRE2w1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yEkLgh3tIYt4SqYU' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlayerRecordHandlerV1' test.out

#- 33 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'TLDx9gIiDandpGT2' \
    --namespace "$AB_NAMESPACE" \
    --userId 't24aOMh5eC3IHeHS' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'AdminPutPlayerRecordHandlerV1' test.out

#- 34 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'KLCa3xreNDUWehwH' \
    --namespace "$AB_NAMESPACE" \
    --userId '3q31A806DJgas4b6' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPostPlayerRecordHandlerV1' test.out

#- 35 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'z3LNUj7fdgLA84Z8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YYk6QEgJjBbEDoNf' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeletePlayerRecordHandlerV1' test.out

#- 36 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '3n0hEoRCAcf80zfF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yabWAgIUXiI07A68' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 37 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'eaqC2J9jyEW6GLbc' \
    --namespace "$AB_NAMESPACE" \
    --userId '0NaKDUL3sa13lk1d' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 37 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 38 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'QBHO86IlBhnetU4R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wTqUXlTDBzOuYsaZ' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 38 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 39 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'A2yyd4mbqoOfADMM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AXFaY9eKa699bRVh' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 40 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'yaKwwrAP2aMlu7Wt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jCtoYetOO847g8Ou' \
    > test.out 2>&1
eval_tap $? 40 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 41 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'dOfjnCuHZ3c46IjG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "a23YvYmmDg7VYPXI", "value": {"uvUYTZBRujIUE1Tq": {}, "5jyAZvkRCMNFIurj": {}, "h2imdb4rbkXj0Zws": {}}}' \
    > test.out 2>&1
eval_tap $? 41 'PutGameRecordConcurrentHandlerV1' test.out

#- 42 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["VC0gL97ZVJSPqJiw", "v1qlYB1RSKs6gQxC", "3Gb7S0o4zGYY7KQI"]}' \
    > test.out 2>&1
eval_tap $? 42 'GetGameRecordsBulk' test.out

#- 43 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key '1AeFgPqaOkvo1aol' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 43 'GetGameRecordHandlerV1' test.out

#- 44 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'B4lkKB4EYOkQ1jMD' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 44 'PutGameRecordHandlerV1' test.out

#- 45 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key '3cym8xIfkOVW2grR' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 45 'PostGameRecordHandlerV1' test.out

#- 46 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'EOLx0KOww3HICQLf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'DeleteGameRecordHandlerV1' test.out

#- 47 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'l7MUBG7qtPu64yAt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["URKLRkb738HGS6rD", "gMdIIlhS1fSiM933", "1m7Ta1PsKc50Kv6e"]}' \
    > test.out 2>&1
eval_tap $? 47 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 48 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 48 'RetrievePlayerRecords' test.out

#- 49 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["nEevcAx2K2zkRenm", "PZnGBt4P7WnbdSJt", "jX7ZshZyZl5x4bRX"]}' \
    > test.out 2>&1
eval_tap $? 49 'GetPlayerRecordsBulkHandlerV1' test.out

#- 50 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'BHUTrDzZSKscfOcY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 51 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'u3dpCROYqUiGKXVF' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cmpo6sPwVOEDSJsE' \
    --body '{"updatedAt": "K5QpNhlI2iS5EpGh", "value": {"hvXYck0upMzUYnb7": {}, "6tFkEORV3bu1bNCt": {}, "X7W40V6Do5sYadCC": {}}}' \
    > test.out 2>&1
eval_tap $? 51 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 52 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'FrHHC3DpZxkrQDXu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NFviMarv8mnfHK8C' \
    --body '{"updatedAt": "CmE2lPnsbD3SGEdl", "value": {"wuUccE536ugBp3HB": {}, "vepnDCjgyJlXe36m": {}, "gWjLfFmteue9nzJ6": {}}}' \
    > test.out 2>&1
eval_tap $? 52 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 53 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fH24T805tVg8JqU0' \
    --limit '18' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 53 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 54 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZpjvsugAOS7u8RiW' \
    --body '{"keys": ["yerCSa8SRgwsAj1i", "k1jglaDXTvKCWwNT", "Ahd2wrS0uPdjhdin"]}' \
    > test.out 2>&1
eval_tap $? 54 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 55 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'png5BLy8wbhMssAH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'japIkY9Rf4wP57dB' \
    > test.out 2>&1
eval_tap $? 55 'GetPlayerRecordHandlerV1' test.out

#- 56 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'ZNR88YbCtmKy8M9z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VrjfGXZnqAQUoY1G' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 56 'PutPlayerRecordHandlerV1' test.out

#- 57 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'jlIIk0iKoTTS1j02' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o7JjTXAQN0qdskdQ' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'PostPlayerRecordHandlerV1' test.out

#- 58 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'V0TqI8EFnmDbxIxi' \
    --namespace "$AB_NAMESPACE" \
    --userId '4YKlONk2Q5Y4Jvai' \
    > test.out 2>&1
eval_tap $? 58 'DeletePlayerRecordHandlerV1' test.out

#- 59 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'zwiilatuUjjt9lIM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gql5ElEa9EIIlGcH' \
    > test.out 2>&1
eval_tap $? 59 'GetPlayerPublicRecordHandlerV1' test.out

#- 60 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'B3CfR3ncDlwi3v3M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FFJ1KesKoELCpobB' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 60 'PutPlayerPublicRecordHandlerV1' test.out

#- 61 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'EG8X645xpdXpai0r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YaT5hOPjaf3H0tYi' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 61 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE