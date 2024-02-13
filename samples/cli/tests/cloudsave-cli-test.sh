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
echo "1..102"

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

#- 8 AdminListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '32' \
    --query 'FcDtgOjchIua5tWE' \
    > test.out 2>&1
eval_tap $? 8 'AdminListGameBinaryRecordsV1' test.out

#- 9 AdminPostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "IC32ogW7olvbTgrh", "key": "RTcPiSuL0Sly6XM4", "set_by": "SERVER", "ttl_config": {"action": "DELETE", "expires_at": "1982-04-09T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPostGameBinaryRecordV1' test.out

#- 10 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key 'yALczNIicXm7agSr' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGameBinaryRecordV1' test.out

#- 11 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key 'jJW2OQNOs1PXhT5F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "vdiRilZ7oFgx4c8O", "file_location": "umKtPDKJDXn7Z4U6"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutGameBinaryRecordV1' test.out

#- 12 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key '8su8XfqlqNiTvB6S' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGameBinaryRecordV1' test.out

#- 13 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key 'dAdIhUDrwoZ5Mecd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT", "ttl_config": {"action": "DELETE", "expires_at": "1998-08-18T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key 'r6QEa1ysLEzth6mX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "hzkzWkFeZSoEAcBd"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 DeleteGameBinaryRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordTTLConfig \
    --key 'W19m4eu6d5tA5jUm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DeleteGameBinaryRecordTTLConfig' test.out

#- 16 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key 'iTqpyhPFdxLzFQN0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "5MYzYiKWe5dNRljv", "value": {"7IPrDQQRgat0Sevk": {}, "LGMS0lyuI9a2I9u6": {}, "Vpbsx5w8hqUI06Up": {}}}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 17 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'OXGSLmCVuHOPlLlk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER", "ttl_config": {"action": "DELETE", "expires_at": "1993-01-04T00:00:00Z"}, "updatedAt": "8sKgnuRkgghGoYup", "value": {"D391C2qtPYokahFj": {}, "kQsfCaTmt1d67FXG": {}, "k2s9Q0mPVo3twu0M": {}}}' \
    > test.out 2>&1
eval_tap $? 17 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 18 GetPluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave getPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetPluginConfig' test.out

#- 19 CreatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave createPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "esTCf9x4rt69lna7"}, "customConfig": {"GRPCAddress": "qxNeIxPz6MbwL6IY"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": false, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": true, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": true, "beforeWriteGameRecord": true, "beforeWritePlayerBinaryRecord": true, "beforeWritePlayerRecord": true}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 19 'CreatePluginConfig' test.out

#- 20 DeletePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deletePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeletePluginConfig' test.out

#- 21 UpdatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave updatePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "0yYoNRKd3IL5TAQ6"}, "customConfig": {"GRPCAddress": "iiPlSC2uE4o5Vwdo"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": false, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": true, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": true, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePluginConfig' test.out

#- 22 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'RwNmn9HrNQy4uZAA' \
    --limit '18' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 22 'ListGameRecordsHandlerV1' test.out

#- 23 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'E0mit9RGCCHYzUOc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminGetGameRecordHandlerV1' test.out

#- 24 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'EdscKHPEqgA8yu7V' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPutGameRecordHandlerV1' test.out

#- 25 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'k6Jt4Ymos9Jcdos4' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPostGameRecordHandlerV1' test.out

#- 26 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'fYcTVU6RBt0zYoMc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'AdminDeleteGameRecordHandlerV1' test.out

#- 27 DeleteGameRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordTTLConfig \
    --key 'HyCUEXlAvxJMdalw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameRecordTTLConfig' test.out

#- 28 AdminListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'AdminListTagsHandlerV1' test.out

#- 29 AdminPostTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "SyliWMNW5NyLu0M3"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminPostTagHandlerV1' test.out

#- 30 AdminDeleteTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --tag 'VHh2EI8JlDbPWbQ6' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTagHandlerV1' test.out

#- 31 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'Q9lNmqRBaAkLnvxk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["T1X68cmDc3fxU8My", "KrQpM4hkkK6KKXNB", "3Gv0IqmF51TkhjYn"]}' \
    > test.out 2>&1
eval_tap $? 31 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 32 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["aq6foWvXa3bMrXsD", "r6kILsSSyDdmykmo", "PYgc2L4jk4Lo0LSP"], "user_id": "0pf4IxjUkl535X3a"}, {"keys": ["teEKDpADz1x3poD3", "Qgb3boLQQ1MzH7Qm", "8bwbmXgdAPh1EThG"], "user_id": "96gAFKK2WDgCcxvO"}, {"keys": ["NZm3EeERmDnyeFoF", "7VSZ6pf3vneSD2Tb", "3g7mSQUhAEtrmjqU"], "user_id": "6YE3p4lSck0ZHn5G"}]}' \
    > test.out 2>&1
eval_tap $? 32 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 33 ListPlayerRecordHandlerV1
eval_tap 0 33 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 34 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'I39YBHqaTHeKtW18' \
    --limit '18' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 34 'AdminListAdminUserRecordsV1' test.out

#- 35 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ReVHQipcCx9Zw5D2' \
    --body '{"keys": ["L7vIYhGGSyEW4ZJJ", "42d3PBddN8S48l9l", "yNApflxqMrj3oZk0"]}' \
    > test.out 2>&1
eval_tap $? 35 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 36 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key '3QXcKMDYDDxHSZjt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qXyJ58f7Gc26SaiG' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetAdminPlayerRecordV1' test.out

#- 37 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'VkydwYWQG26yUZNm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TBcvrbYCwZtxFHyP' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 37 'AdminPutAdminPlayerRecordV1' test.out

#- 38 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'LtI8ilbyDPUIj88c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ekdqCt81P1ktfIov' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 38 'AdminPostPlayerAdminRecordV1' test.out

#- 39 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'mv9gsR5cJcHm3SZL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xoRDFuuuySj29a9L' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeleteAdminPlayerRecordV1' test.out

#- 40 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JE8HoRS1X2PFAAMw' \
    --limit '51' \
    --offset '26' \
    --query 'HPxB1UskYs4Yw20D' \
    > test.out 2>&1
eval_tap $? 40 'AdminListPlayerBinaryRecordsV1' test.out

#- 41 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OqOBSC2DKHRuPMMW' \
    --body '{"file_type": "H8Yb33T5UBJCjfcn", "is_public": true, "key": "RfxeCSz9WEi8Kllo", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 41 'AdminPostPlayerBinaryRecordV1' test.out

#- 42 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'wdNFLTm5T50x9WT0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GfH2rtOa4EXsXzOX' \
    > test.out 2>&1
eval_tap $? 42 'AdminGetPlayerBinaryRecordV1' test.out

#- 43 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'QAk4mqrxzTtuLl4X' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lbGL8QOxtjzm8y2w' \
    --body '{"content_type": "NhmwoYZyI4EFZKBc", "file_location": "YrCEAE7WIsfmx40N"}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPutPlayerBinaryRecordV1' test.out

#- 44 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'LRc6m8heKnWhzfe2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NubeoKFeIaFQCYoD' \
    > test.out 2>&1
eval_tap $? 44 'AdminDeletePlayerBinaryRecordV1' test.out

#- 45 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'PICpnduEEQlULdJz' \
    --namespace "$AB_NAMESPACE" \
    --userId '4mnRBkMNxvvKgAT8' \
    --body '{"is_public": false, "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 45 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 46 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'JrYq6hRkloqxM3gp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wxcfMy9XzjjI5Ybs' \
    --body '{"file_type": "KoADkzJEN2VHzih3"}' \
    > test.out 2>&1
eval_tap $? 46 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 47 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'bit0VWn3CO39PXDN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xtXgeO3FgkXhjDza' \
    --responseBody  \
    --body '{"updatedAt": "QY3snn2ZkP7cFdP4", "value": {"3e5dC9XIBudfZgrb": {}, "HDIDm4hMzF4Txode": {}, "nSrUTvfqU0bfoMm5": {}}}' \
    > test.out 2>&1
eval_tap $? 47 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 48 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'cTtFWbotQyXJRcQW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'smqPNs92epxk0i8V' \
    --responseBody  \
    --body '{"set_by": "SERVER", "ttl_config": {"action": "DELETE", "expires_at": "1994-11-21T00:00:00Z"}, "updatedAt": "BRujIUE1Tq5jyAZv", "value": {"kRCMNFIurjh2imdb": {}, "4rbkXj0ZwsVC0gL9": {}, "7ZVJSPqJiwv1qlYB": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 49 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key '1RSKs6gQxC3Gb7S0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o4zGYY7KQI1AeFgP' \
    --responseBody  \
    --body '{"set_by": "SERVER", "ttl_config": {"action": "DELETE", "expires_at": "1971-12-01T00:00:00Z"}, "updatedAt": "tfNWql4nmwAft4gq", "value": {"kNNlWkD9eOziYRFO": {}, "n0jJLHC9LxhvNXTw": {}, "GBCtohLtl9Zuhytm": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 50 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId '5UDrT6QXCs5SPBbR' \
    --limit '84' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 50 'AdminRetrievePlayerRecords' test.out

#- 51 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TF6oQAXVG7tnsZg5' \
    --body '{"data": [{"key": "QgXjvyGJPN4eXbJE", "value": {"5Vs2GcyomQoIXimB": {}, "JehyxlNsjUgxBkF6": {}, "wFPoJeQediogEhhM": {}}}, {"key": "2rIizGdKvOPdq5xr", "value": {"gxSmy1DN9LFkYW5D": {}, "Qyj4bj5Ro2ogaKt2": {}, "ujQSa3Zdb65UXmy0": {}}}, {"key": "Zp6iIaTIKUkmkk9Q", "value": {"M0NBMA9ORxpzwLR2": {}, "AK6eXUGPJsw1fiP8": {}, "0G9Pclxcft2ulIJz": {}}}]}' \
    > test.out 2>&1
eval_tap $? 51 'AdminPutPlayerRecordsHandlerV1' test.out

#- 52 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'PyrVEiOG4UcqsuGK' \
    --body '{"keys": ["HhMRWLVd3DlhLuIp", "omM8sm1MiaI1mX2t", "JoARtdbBe7udsMro"]}' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPlayerRecordsHandlerV1' test.out

#- 53 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'k0WvGYYnx4V709xb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nGezKsDwG2omOR2n' \
    > test.out 2>&1
eval_tap $? 53 'AdminGetPlayerRecordHandlerV1' test.out

#- 54 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'vYI9TVqJdvzcWbfU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'paXp5JMl5LL4bTxB' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 54 'AdminPutPlayerRecordHandlerV1' test.out

#- 55 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'mZjdrrIxsB0NRsB1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPqqRRulpqpymDkQ' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 55 'AdminPostPlayerRecordHandlerV1' test.out

#- 56 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'htrHWwRVnwVBOqOH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'i8pWGd1juYhiqjRJ' \
    > test.out 2>&1
eval_tap $? 56 'AdminDeletePlayerRecordHandlerV1' test.out

#- 57 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'OqB5F93zFQbJndUD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pdONneAczbBdHb2s' \
    > test.out 2>&1
eval_tap $? 57 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 58 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'lt71B1SmZp2JZp50' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CnPb71ORYcmQbTU5' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 58 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 59 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'JX8ccLjMXJRk0eaK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QDOJvrTefglSs6g4' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 59 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 60 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'iY9u02aCNYIWekp1' \
    --namespace "$AB_NAMESPACE" \
    --userId '8lOC3mNqF7Bl0Lcg' \
    > test.out 2>&1
eval_tap $? 60 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 61 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'hVHfPEspxwhRON0b' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c1eMbEIjowLqc3ec' \
    > test.out 2>&1
eval_tap $? 61 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 62 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '63' \
    --query 'XJbZDKKoxLE1Y3Dy' \
    > test.out 2>&1
eval_tap $? 62 'ListGameBinaryRecordsV1' test.out

#- 63 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "mtj3giPg4x4yiPX6", "key": "ues1Hhhkg1yLVbLF"}' \
    > test.out 2>&1
eval_tap $? 63 'PostGameBinaryRecordV1' test.out

#- 64 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["zHEP8cM4NTwr0KHa", "AsmTej52WKi6tArA", "URt9plCSVq8PdH6h"]}' \
    > test.out 2>&1
eval_tap $? 64 'BulkGetGameBinaryRecordV1' test.out

#- 65 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'JPUAc0RVwXgAgntL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetGameBinaryRecordV1' test.out

#- 66 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'MCuaXBWQi6BqPg4x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "r0lCancUZGCHsZYo", "file_location": "LfR1KtOv7Zy0b65u"}' \
    > test.out 2>&1
eval_tap $? 66 'PutGameBinaryRecordV1' test.out

#- 67 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'vuKNuy0ytZQ7M6Nz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'DeleteGameBinaryRecordV1' test.out

#- 68 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'y1adnSKOLFKx1dX4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "LuWJu3pDMUAeeZ97"}' \
    > test.out 2>&1
eval_tap $? 68 'PostGameBinaryPresignedURLV1' test.out

#- 69 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'SBROPYuG6XqP6oo7' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "G73zdxTgOfnwIdlN", "value": {"a29fDLh741IslKHz": {}, "GlLKWUtDQs61OQAo": {}, "xyyQpRWCiiPDGQhN": {}}}' \
    > test.out 2>&1
eval_tap $? 69 'PutGameRecordConcurrentHandlerV1' test.out

#- 70 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["PEwiJCf2XJVrlzqQ", "ls1ozhLVA3kE8jKv", "gatOEBM70TdlNBJY"]}' \
    > test.out 2>&1
eval_tap $? 70 'GetGameRecordsBulk' test.out

#- 71 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'Ompu1VCarzBsV6xn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 71 'GetGameRecordHandlerV1' test.out

#- 72 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'Z5Jrzzjrcaug6CWV' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 72 'PutGameRecordHandlerV1' test.out

#- 73 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'G8SWP3glU6muswVJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 73 'PostGameRecordHandlerV1' test.out

#- 74 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'nNnN7kAa7j0riFc5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'DeleteGameRecordHandlerV1' test.out

#- 75 PublicListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'PublicListTagsHandlerV1' test.out

#- 76 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'HTHQIoVsGo7dwV9D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["BqFKHQkETJyTlUrw", "DTnoujQD4IEiH9Z5", "qXn3aoRtlqOECohV"]}' \
    > test.out 2>&1
eval_tap $? 76 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 77 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'iHA5CzgFSy8X1A3P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["rIfapq5AAeMe4L3m", "DWORBVXTIIJM9XsY", "IIZxiXNMR9BgaWcF"]}' \
    > test.out 2>&1
eval_tap $? 77 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 78 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '34' \
    --query 'SUBhyoTsMWPAxUMk' \
    > test.out 2>&1
eval_tap $? 78 'ListMyBinaryRecordsV1' test.out

#- 79 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["awaGpAyrIwMif3BO", "dkocVTd4BxqGWV6m", "TJ0sQs6XNbjvqhnU"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetMyBinaryRecordV1' test.out

#- 80 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 80 'RetrievePlayerRecords' test.out

#- 81 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["LWu8olKdxL6ozRmD", "D0jJvlfV5OemPYdY", "T7DROCjtuzFMbAG9"]}' \
    > test.out 2>&1
eval_tap $? 81 'GetPlayerRecordsBulkHandlerV1' test.out

#- 82 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'YI89hmguB8FOTjML' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 82 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 83 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'o4b9rIzqYkEpstyV' \
    --body '{"file_type": "TBcrM8rG0rH0zcsw", "is_public": true, "key": "7PpUlcIW32iK7MGt"}' \
    > test.out 2>&1
eval_tap $? 83 'PostPlayerBinaryRecordV1' test.out

#- 84 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1ixY5rA1WoVeJIeP' \
    --limit '65' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 84 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 85 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8ZrQzP4zvtdxdbZU' \
    --body '{"keys": ["pd6FJtHJ1pyVwyKQ", "LY6FEO65Rb3z7CYL", "M8IlsHqffnrfsGlf"]}' \
    > test.out 2>&1
eval_tap $? 85 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 86 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'PaZKBwa3Ddb60ufP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pzwj1QGIFmlVf4jv' \
    > test.out 2>&1
eval_tap $? 86 'GetPlayerBinaryRecordV1' test.out

#- 87 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'apseE9LN9bvhOrHf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lIOd6X3viLvtEk4m' \
    --body '{"content_type": "TIpUA9gxo8SV38nE", "file_location": "hoXmM2W7l6jHMA2r"}' \
    > test.out 2>&1
eval_tap $? 87 'PutPlayerBinaryRecordV1' test.out

#- 88 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'G3nakopAywelu01n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ryEJ0NqoTow0qiOi' \
    > test.out 2>&1
eval_tap $? 88 'DeletePlayerBinaryRecordV1' test.out

#- 89 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'C4j0iktm0ZPLkLOs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'p0LZ5njN86Hl8kUX' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 89 'PutPlayerBinaryRecorMetadataV1' test.out

#- 90 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key 'r0n9d9lvccKMLhrT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rcBE2ItBS3KtKZWe' \
    --body '{"file_type": "8aoFzAyBME74HUti"}' \
    > test.out 2>&1
eval_tap $? 90 'PostPlayerBinaryPresignedURLV1' test.out

#- 91 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'pUWYhWV1qx8CzPML' \
    --namespace "$AB_NAMESPACE" \
    --userId '52faXUr9Sk4lq2fa' \
    > test.out 2>&1
eval_tap $? 91 'GetPlayerPublicBinaryRecordsV1' test.out

#- 92 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'BcAXXKlhvyH8paOJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'txqMPpcVfRwNj547' \
    --responseBody  \
    --body '{"updatedAt": "fH0XrKEDpEY8Vnoc", "value": {"GAjci0V3tBf2jnHG": {}, "KXphn50c9tNLDljh": {}, "Z2jxLRX3z46OCaGB": {}}}' \
    > test.out 2>&1
eval_tap $? 92 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 93 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'eMfPlNos4yBRjrER' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HEonAZR8GmEu0q1p' \
    --responseBody  \
    --body '{"updatedAt": "6QCyY6vSkVFWdsbY", "value": {"uVEGVxYheR3j5mNZ": {}, "6vwv7K8Asvt1j1Rx": {}, "59hesNWy2NvZ85DD": {}}}' \
    > test.out 2>&1
eval_tap $? 93 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 94 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDAF8KDsBZOuYQJ0' \
    --limit '42' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 94 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 95 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'eHpATHccee9GXhKc' \
    --body '{"keys": ["jmSEwdrkEnnqKzFs", "LfYalUlfwEQKjU7e", "HGebSVu0LQ40kepE"]}' \
    > test.out 2>&1
eval_tap $? 95 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 96 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'aC4dfiOMZfEhHr39' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pysFO3Zvc1BZG99L' \
    > test.out 2>&1
eval_tap $? 96 'GetPlayerRecordHandlerV1' test.out

#- 97 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'yvfvHEsJKQQewVLM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UoAnaRcYp7FUjfIG' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 97 'PutPlayerRecordHandlerV1' test.out

#- 98 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'affoflEIByYqeKN0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'meGelYF5wWaDhukU' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 98 'PostPlayerRecordHandlerV1' test.out

#- 99 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key '4khGG4vZFTYnPkmS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u4PWam1jxR7SETWj' \
    > test.out 2>&1
eval_tap $? 99 'DeletePlayerRecordHandlerV1' test.out

#- 100 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'teoc8fgvZDDhoO05' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oKqymxLD1Lcvw6T6' \
    > test.out 2>&1
eval_tap $? 100 'GetPlayerPublicRecordHandlerV1' test.out

#- 101 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'mZEiwxxElpMYSWIe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Vzm7z9noowmlTIKV' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 101 'PutPlayerPublicRecordHandlerV1' test.out

#- 102 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'owi0RY2VN4ZONJRE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dUQ3z9F1BxNNgnke' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 102 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE