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
echo "1..95"

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
    --body '{"file_type": "IC32ogW7olvbTgrh", "key": "RTcPiSuL0Sly6XM4", "set_by": "OI18mAQLnzjMf8GZ"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPostGameBinaryRecordV1' test.out

#- 10 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key '2WBZqxYG3aREAu2D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGameBinaryRecordV1' test.out

#- 11 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key '6QVKNCWP75TB0i7p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "KxR8dl0zRVW4EZG9", "file_location": "m0XcgGVbMqSszE8G"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutGameBinaryRecordV1' test.out

#- 12 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key 'Havj7AorKsxwkosA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGameBinaryRecordV1' test.out

#- 13 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key 'VerXpc1C8XfwHuKe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "b9l3rGN9A3sNm84h"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key 'ddSpHt0P7MIIR7Ck' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "yF6C7duuyZ0GhDog"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key 'qrhBRd8lDR6qVNPR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "ZYdFLIAjGGJddVCv", "value": {"u9vx5KQ7KYnIuMBv": {}, "aO35llzQRaT5kPxU": {}, "fofvnnSuB0y5WUlr": {}}}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 16 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'MdI4sNveabntBSxT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "eIv53HGCiljvjKoy", "updatedAt": "D6SCwGrncqmLtjQH", "value": {"Af8TgoNm03VLisV6": {}, "zwPuo3td6TC6I3lM": {}, "jGSWN2laRlxfcjHf": {}}}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 17 GetPluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave getPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'GetPluginConfig' test.out

#- 18 CreatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave createPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "YakUCTqGkE7wcWfD"}, "customConfig": {"GRPCAddress": "slpJSqGAXQ0yYoNR"}, "customFunction": {"afterBulkReadGameRecord": false, "afterBulkReadPlayerRecord": false, "afterReadGameRecord": true, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameRecord": true, "beforeWritePlayerRecord": false}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 18 'CreatePluginConfig' test.out

#- 19 DeletePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deletePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeletePluginConfig' test.out

#- 20 UpdatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave updatePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "PllG4cYEzfTD1ZBm"}, "customConfig": {"GRPCAddress": "3MqHcUmLZZbSqb8R"}, "customFunction": {"afterBulkReadGameRecord": true, "afterBulkReadPlayerRecord": false, "afterReadGameRecord": true, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameRecord": true, "beforeWritePlayerRecord": true}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdatePluginConfig' test.out

#- 21 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'NQy4uZAAiE0mit9R' \
    --limit '67' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 21 'ListGameRecordsHandlerV1' test.out

#- 22 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'CCHYzUOcEdscKHPE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetGameRecordHandlerV1' test.out

#- 23 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'qgA8yu7Vk6Jt4Ymo' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 23 'AdminPutGameRecordHandlerV1' test.out

#- 24 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 's9Jcdos4fYcTVU6R' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPostGameRecordHandlerV1' test.out

#- 25 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'Bt0zYoMcHyCUEXlA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteGameRecordHandlerV1' test.out

#- 26 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'vxJMdalwSyliWMNW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["5NyLu0M3VHh2EI8J", "lDbPWbQ6Q9lNmqRB", "aAkLnvxkT1X68cmD"]}' \
    > test.out 2>&1
eval_tap $? 26 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 27 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["c3fxU8MyKrQpM4hk", "kK6KKXNB3Gv0IqmF", "51TkhjYnaq6foWvX"], "user_id": "a3bMrXsDr6kILsSS"}, {"keys": ["yDdmykmoPYgc2L4j", "k4Lo0LSP0pf4IxjU", "kl535X3ateEKDpAD"], "user_id": "z1x3poD3Qgb3boLQ"}, {"keys": ["Q1MzH7Qm8bwbmXgd", "APh1EThG96gAFKK2", "WDgCcxvONZm3EeER"], "user_id": "mDnyeFoF7VSZ6pf3"}]}' \
    > test.out 2>&1
eval_tap $? 27 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 28 ListPlayerRecordHandlerV1
eval_tap 0 28 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 29 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vneSD2Tb3g7mSQUh' \
    --limit '54' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 29 'AdminListAdminUserRecordsV1' test.out

#- 30 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EtrmjqU6YE3p4lSc' \
    --body '{"keys": ["k0ZHn5GI39YBHqaT", "HeKtW18iGeUlc9d9", "sogWa24CKNS0GqVv"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 31 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'UfHQvsHXNUNe4mhg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'o5QB65lSAiYnNjkf' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetAdminPlayerRecordV1' test.out

#- 32 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'ZrQvGgbLdLsFzHkB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mr1yrOMlNFSrUEir' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 32 'AdminPutAdminPlayerRecordV1' test.out

#- 33 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'njX9fDmIbeZxzfTc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yiuATus9hsfpFDcS' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'AdminPostPlayerAdminRecordV1' test.out

#- 34 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'DG8aMVGLiBNrDjqo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xcwgGLXpUL4pp2nc' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAdminPlayerRecordV1' test.out

#- 35 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YAHdNzDmeIP6rOvD' \
    --limit '52' \
    --offset '74' \
    --query '9KOsb392k6YmJFfR' \
    > test.out 2>&1
eval_tap $? 35 'AdminListPlayerBinaryRecordsV1' test.out

#- 36 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ByjlBiuFM3FIoVk8' \
    --body '{"file_type": "T3GpAnkCmBUqg2SC", "is_public": false, "key": "Ys4Yw20DOqOBSC2D", "set_by": "KHRuPMMWH8Yb33T5"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminPostPlayerBinaryRecordV1' test.out

#- 37 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'UBJCjfcnLRfxeCSz' \
    --namespace "$AB_NAMESPACE" \
    --userId '9WEi8KlloeH0JT1y' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerBinaryRecordV1' test.out

#- 38 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'duat2vQR3biBfsu4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jmsRE2w1yEkLgh3t' \
    --body '{"content_type": "IYt4SqYUTLDx9gIi", "file_location": "DandpGT2t24aOMh5"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminPutPlayerBinaryRecordV1' test.out

#- 39 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'eC3IHeHSKLCa3xre' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NDUWehwH3q31A806' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeletePlayerBinaryRecordV1' test.out

#- 40 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'DJgas4b6z3LNUj7f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dgLA84Z8YYk6QEgJ' \
    --body '{"is_public": false, "set_by": "EEQlULdJz4mnRBkM"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 41 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'NxvvKgAT8mJrYq6h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RkloqxM3gpwxcfMy' \
    --body '{"file_type": "9XzjjI5YbsKoADkz"}' \
    > test.out 2>&1
eval_tap $? 41 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 42 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'JEN2VHzih3bit0VW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'n3CO39PXDNxtXgeO' \
    --responseBody  \
    --body '{"updatedAt": "3FgkXhjDzaQY3snn", "value": {"2ZkP7cFdP43e5dC9": {}, "XIBudfZgrbHDIDm4": {}, "hMzF4TxodenSrUTv": {}}}' \
    > test.out 2>&1
eval_tap $? 42 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 43 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'fqU0bfoMm5cTtFWb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'otQyXJRcQWsmqPNs' \
    --responseBody  \
    --body '{"set_by": "92epxk0i8VxsZNer", "updatedAt": "eSvf9699mCEHThUJ", "value": {"kETAsSp7gh4TeUTk": {}, "OkAYfJB8AT9t4Tv2": {}, "07Y2QD3oD5fLCr3O": {}}}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 44 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'OlXVv8ZGF7uYnGzp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ipNDigNJma1MbqqZ' \
    --responseBody  \
    --body '{"set_by": "tfNWql4nmwAft4gq", "updatedAt": "kNNlWkD9eOziYRFO", "value": {"n0jJLHC9LxhvNXTw": {}, "GBCtohLtl9Zuhytm": {}, "5UDrT6QXCs5SPBbR": {}}}' \
    > test.out 2>&1
eval_tap $? 44 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 45 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'PZTF6oQAXVG7tnsZ' \
    --limit '12' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 45 'AdminRetrievePlayerRecords' test.out

#- 46 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5QgXjvyGJPN4eXbJ' \
    --body '{"keys": ["E5Vs2GcyomQoIXim", "BJehyxlNsjUgxBkF", "6wFPoJeQediogEhh"]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminGetPlayerRecordsHandlerV1' test.out

#- 47 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'M2rIizGdKvOPdq5x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rgxSmy1DN9LFkYW5' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerRecordHandlerV1' test.out

#- 48 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'DQyj4bj5Ro2ogaKt' \
    --namespace "$AB_NAMESPACE" \
    --userId '2ujQSa3Zdb65UXmy' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPutPlayerRecordHandlerV1' test.out

#- 49 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key '0Zp6iIaTIKUkmkk9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QM0NBMA9ORxpzwLR' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPostPlayerRecordHandlerV1' test.out

#- 50 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key '2AK6eXUGPJsw1fiP' \
    --namespace "$AB_NAMESPACE" \
    --userId '80G9Pclxcft2ulIJ' \
    > test.out 2>&1
eval_tap $? 50 'AdminDeletePlayerRecordHandlerV1' test.out

#- 51 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'zPyrVEiOG4UcqsuG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KHhMRWLVd3DlhLuI' \
    > test.out 2>&1
eval_tap $? 51 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 52 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'pomM8sm1MiaI1mX2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tJoARtdbBe7udsMr' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 52 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 53 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'ok0WvGYYnx4V709x' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bnGezKsDwG2omOR2' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 54 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'nvYI9TVqJdvzcWbf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UpaXp5JMl5LL4bTx' \
    > test.out 2>&1
eval_tap $? 54 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 55 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'BmZjdrrIxsB0NRsB' \
    --namespace "$AB_NAMESPACE" \
    --userId '1fPqqRRulpqpymDk' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 56 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '42' \
    --query 'htrHWwRVnwVBOqOH' \
    > test.out 2>&1
eval_tap $? 56 'ListGameBinaryRecordsV1' test.out

#- 57 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "i8pWGd1juYhiqjRJ", "key": "OqB5F93zFQbJndUD"}' \
    > test.out 2>&1
eval_tap $? 57 'PostGameBinaryRecordV1' test.out

#- 58 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["pdONneAczbBdHb2s", "lt71B1SmZp2JZp50", "CnPb71ORYcmQbTU5"]}' \
    > test.out 2>&1
eval_tap $? 58 'BulkGetGameBinaryRecordV1' test.out

#- 59 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'JX8ccLjMXJRk0eaK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'GetGameBinaryRecordV1' test.out

#- 60 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'QDOJvrTefglSs6g4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "iY9u02aCNYIWekp1", "file_location": "8lOC3mNqF7Bl0Lcg"}' \
    > test.out 2>&1
eval_tap $? 60 'PutGameBinaryRecordV1' test.out

#- 61 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'hVHfPEspxwhRON0b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteGameBinaryRecordV1' test.out

#- 62 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'c1eMbEIjowLqc3ec' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "jXJbZDKKoxLE1Y3D"}' \
    > test.out 2>&1
eval_tap $? 62 'PostGameBinaryPresignedURLV1' test.out

#- 63 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'ymtj3giPg4x4yiPX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "6ues1Hhhkg1yLVbL", "value": {"FzHEP8cM4NTwr0KH": {}, "aAsmTej52WKi6tAr": {}, "AURt9plCSVq8PdH6": {}}}' \
    > test.out 2>&1
eval_tap $? 63 'PutGameRecordConcurrentHandlerV1' test.out

#- 64 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["hJPUAc0RVwXgAgnt", "LMCuaXBWQi6BqPg4", "xr0lCancUZGCHsZY"]}' \
    > test.out 2>&1
eval_tap $? 64 'GetGameRecordsBulk' test.out

#- 65 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'oLfR1KtOv7Zy0b65' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 65 'GetGameRecordHandlerV1' test.out

#- 66 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'uvuKNuy0ytZQ7M6N' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 66 'PutGameRecordHandlerV1' test.out

#- 67 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'zy1adnSKOLFKx1dX' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 67 'PostGameRecordHandlerV1' test.out

#- 68 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key '4LuWJu3pDMUAeeZ9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'DeleteGameRecordHandlerV1' test.out

#- 69 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key '7SBROPYuG6XqP6oo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["7G73zdxTgOfnwIdl", "Na29fDLh741IslKH", "zGlLKWUtDQs61OQA"]}' \
    > test.out 2>&1
eval_tap $? 69 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 70 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'oxyyQpRWCiiPDGQh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["NPEwiJCf2XJVrlzq", "Qls1ozhLVA3kE8jK", "vgatOEBM70TdlNBJ"]}' \
    > test.out 2>&1
eval_tap $? 70 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 71 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '83' \
    --query 'JATwlc6esUp6Sw1I' \
    > test.out 2>&1
eval_tap $? 71 'ListMyBinaryRecordsV1' test.out

#- 72 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["98jeZQ7hfxnhLd3K", "naknoed9DHhLOqQG", "hCUr6iTrjyEgarAd"]}' \
    > test.out 2>&1
eval_tap $? 72 'BulkGetMyBinaryRecordV1' test.out

#- 73 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 73 'RetrievePlayerRecords' test.out

#- 74 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["JOIG36I6tRbRcrEv", "eMdAdiPKDUVSC00P", "YeDcagginxnFIna3"]}' \
    > test.out 2>&1
eval_tap $? 74 'GetPlayerRecordsBulkHandlerV1' test.out

#- 75 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'yddcbsPheTH26IUJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 75 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 76 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'NvYuGRUvpZaHCuES' \
    --body '{"file_type": "OiIZsMfB4ZH3mtgW", "is_public": false, "key": "ORBVXTIIJM9XsYII"}' \
    > test.out 2>&1
eval_tap $? 76 'PostPlayerBinaryRecordV1' test.out

#- 77 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZxiXNMR9BgaWcFX3' \
    --limit '92' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 77 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 78 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UBhyoTsMWPAxUMka' \
    --body '{"keys": ["waGpAyrIwMif3BOd", "kocVTd4BxqGWV6mT", "J0sQs6XNbjvqhnUV"]}' \
    > test.out 2>&1
eval_tap $? 78 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 79 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'LWu8olKdxL6ozRmD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D0jJvlfV5OemPYdY' \
    > test.out 2>&1
eval_tap $? 79 'GetPlayerBinaryRecordV1' test.out

#- 80 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'T7DROCjtuzFMbAG9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YI89hmguB8FOTjML' \
    --body '{"content_type": "o4b9rIzqYkEpstyV", "file_location": "TBcrM8rG0rH0zcsw"}' \
    > test.out 2>&1
eval_tap $? 80 'PutPlayerBinaryRecordV1' test.out

#- 81 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'wVeMK6MbGIVIu8vv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wLc7KY3uVoJXTIMt' \
    > test.out 2>&1
eval_tap $? 81 'DeletePlayerBinaryRecordV1' test.out

#- 82 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'pgkieDyF97lGdMiH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KxbWCYzo8yO2KTK9' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 82 'PutPlayerBinaryRecorMetadataV1' test.out

#- 83 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key 'QLY6FEO65Rb3z7CY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LM8IlsHqffnrfsGl' \
    --body '{"file_type": "fPaZKBwa3Ddb60uf"}' \
    > test.out 2>&1
eval_tap $? 83 'PostPlayerBinaryPresignedURLV1' test.out

#- 84 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'Ppzwj1QGIFmlVf4j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vapseE9LN9bvhOrH' \
    > test.out 2>&1
eval_tap $? 84 'GetPlayerPublicBinaryRecordsV1' test.out

#- 85 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'flIOd6X3viLvtEk4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mTIpUA9gxo8SV38n' \
    --responseBody  \
    --body '{"updatedAt": "EhoXmM2W7l6jHMA2", "value": {"rG3nakopAywelu01": {}, "nryEJ0NqoTow0qiO": {}, "iC4j0iktm0ZPLkLO": {}}}' \
    > test.out 2>&1
eval_tap $? 85 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 86 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'sp0LZ5njN86Hl8kU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xzt6bSc6bWvgpVyW' \
    --responseBody  \
    --body '{"updatedAt": "9dD1kOmvrAejcq2L", "value": {"gkQuaS7RBx3vim02": {}, "jBOxrZDyvpcLYOWA": {}, "8NjxOnaEok4nOOCz": {}}}' \
    > test.out 2>&1
eval_tap $? 86 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 87 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fsflhjbngJOUn18G' \
    --limit '73' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 87 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 88 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'txqMPpcVfRwNj547' \
    --body '{"keys": ["fH0XrKEDpEY8Vnoc", "GAjci0V3tBf2jnHG", "KXphn50c9tNLDljh"]}' \
    > test.out 2>&1
eval_tap $? 88 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 89 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'Z2jxLRX3z46OCaGB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eMfPlNos4yBRjrER' \
    > test.out 2>&1
eval_tap $? 89 'GetPlayerRecordHandlerV1' test.out

#- 90 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'HEonAZR8GmEu0q1p' \
    --namespace "$AB_NAMESPACE" \
    --userId '6QCyY6vSkVFWdsbY' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 90 'PutPlayerRecordHandlerV1' test.out

#- 91 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'uVEGVxYheR3j5mNZ' \
    --namespace "$AB_NAMESPACE" \
    --userId '6vwv7K8Asvt1j1Rx' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 91 'PostPlayerRecordHandlerV1' test.out

#- 92 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key '59hesNWy2NvZ85DD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KDAF8KDsBZOuYQJ0' \
    > test.out 2>&1
eval_tap $? 92 'DeletePlayerRecordHandlerV1' test.out

#- 93 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key '3BAHZ7c53q7akMpc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mnnx6RVBrop9v7aZ' \
    > test.out 2>&1
eval_tap $? 93 'GetPlayerPublicRecordHandlerV1' test.out

#- 94 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'K3h65hbN15zfQSfQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rtfF3TQN0OcNDLr3' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 94 'PutPlayerPublicRecordHandlerV1' test.out

#- 95 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key '6vzohZyjMQAg5mPY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hrLTyU8OhgfY9JQY' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 95 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE