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
echo "1..96"

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
    --body '{"file_type": "IC32ogW7olvbTgrh", "key": "RTcPiSuL0Sly6XM4", "set_by": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPostGameBinaryRecordV1' test.out

#- 10 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key 'I18mAQLnzjMf8GZ2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGameBinaryRecordV1' test.out

#- 11 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key 'WBZqxYG3aREAu2D6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "QVKNCWP75TB0i7pK", "file_location": "xR8dl0zRVW4EZG9m"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutGameBinaryRecordV1' test.out

#- 12 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key '0XcgGVbMqSszE8GH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGameBinaryRecordV1' test.out

#- 13 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key 'avj7AorKsxwkosAV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key 'ecdKi5r6QEa1ysLE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "zth6mXhzkzWkFeZS"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key 'oEAcBdW19m4eu6d5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "tA5jUmiTqpyhPFdx", "value": {"LzFQN05MYzYiKWe5": {}, "dNRljv7IPrDQQRga": {}, "t0SevkLGMS0lyuI9": {}}}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 16 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'a2I9u6Vpbsx5w8hq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT", "updatedAt": "I06UpOXGSLmCVuHO", "value": {"PlLlkvR8sKgnuRkg": {}, "ghGoYupD391C2qtP": {}, "YokahFjkQsfCaTmt": {}}}' \
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
    --body '{"appConfig": {"appName": "1d67FXGk2s9Q0mPV"}, "customConfig": {"GRPCAddress": "o3twu0MesTCf9x4r"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": false, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "fYakUCTqGkE7wcWf"}, "customConfig": {"GRPCAddress": "DslpJSqGAXQ0yYoN"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": true, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": true, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 20 'UpdatePluginConfig' test.out

#- 21 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'cYEzfTD1ZBm3MqHc' \
    --limit '95' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 21 'ListGameRecordsHandlerV1' test.out

#- 22 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'mLZZbSqb8RwNmn9H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'AdminGetGameRecordHandlerV1' test.out

#- 23 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'rNQy4uZAAiE0mit9' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 23 'AdminPutGameRecordHandlerV1' test.out

#- 24 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'RGCCHYzUOcEdscKH' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPostGameRecordHandlerV1' test.out

#- 25 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'PEqgA8yu7Vk6Jt4Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'AdminDeleteGameRecordHandlerV1' test.out

#- 26 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'mos9Jcdos4fYcTVU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["6RBt0zYoMcHyCUEX", "lAvxJMdalwSyliWM", "NW5NyLu0M3VHh2EI"]}' \
    > test.out 2>&1
eval_tap $? 26 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 27 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["8JlDbPWbQ6Q9lNmq", "RBaAkLnvxkT1X68c", "mDc3fxU8MyKrQpM4"], "user_id": "hkkK6KKXNB3Gv0Iq"}, {"keys": ["mF51TkhjYnaq6foW", "vXa3bMrXsDr6kILs", "SSyDdmykmoPYgc2L"], "user_id": "4jk4Lo0LSP0pf4Ix"}, {"keys": ["jUkl535X3ateEKDp", "ADz1x3poD3Qgb3bo", "LQQ1MzH7Qm8bwbmX"], "user_id": "gdAPh1EThG96gAFK"}]}' \
    > test.out 2>&1
eval_tap $? 27 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 28 ListPlayerRecordHandlerV1
eval_tap 0 28 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 29 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'K2WDgCcxvONZm3Ee' \
    --limit '62' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 29 'AdminListAdminUserRecordsV1' test.out

#- 30 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RmDnyeFoF7VSZ6pf' \
    --body '{"keys": ["3vneSD2Tb3g7mSQU", "hAEtrmjqU6YE3p4l", "Sck0ZHn5GI39YBHq"]}' \
    > test.out 2>&1
eval_tap $? 30 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 31 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'aTHeKtW18iGeUlc9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'd9sogWa24CKNS0Gq' \
    > test.out 2>&1
eval_tap $? 31 'AdminGetAdminPlayerRecordV1' test.out

#- 32 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'VvUfHQvsHXNUNe4m' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hgo5QB65lSAiYnNj' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 32 'AdminPutAdminPlayerRecordV1' test.out

#- 33 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'kfZrQvGgbLdLsFzH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kBMr1yrOMlNFSrUE' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'AdminPostPlayerAdminRecordV1' test.out

#- 34 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'irnjX9fDmIbeZxzf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TcyiuATus9hsfpFD' \
    > test.out 2>&1
eval_tap $? 34 'AdminDeleteAdminPlayerRecordV1' test.out

#- 35 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cSDG8aMVGLiBNrDj' \
    --limit '34' \
    --offset '2' \
    --query 'oxcwgGLXpUL4pp2n' \
    > test.out 2>&1
eval_tap $? 35 'AdminListPlayerBinaryRecordsV1' test.out

#- 36 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'cYAHdNzDmeIP6rOv' \
    --body '{"file_type": "Dz9KOsb392k6YmJF", "is_public": false, "key": "uySj29a9LJE8HoRS", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 36 'AdminPostPlayerBinaryRecordV1' test.out

#- 37 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'AAMwzHPxB1UskYs4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Yw20DOqOBSC2DKHR' \
    > test.out 2>&1
eval_tap $? 37 'AdminGetPlayerBinaryRecordV1' test.out

#- 38 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'uPMMWH8Yb33T5UBJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CjfcnLRfxeCSz9WE' \
    --body '{"content_type": "i8KlloeH0JT1ydua", "file_location": "t2vQR3biBfsu4jms"}' \
    > test.out 2>&1
eval_tap $? 38 'AdminPutPlayerBinaryRecordV1' test.out

#- 39 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'RE2w1yEkLgh3tIYt' \
    --namespace "$AB_NAMESPACE" \
    --userId '4SqYUTLDx9gIiDan' \
    > test.out 2>&1
eval_tap $? 39 'AdminDeletePlayerBinaryRecordV1' test.out

#- 40 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'dpGT2t24aOMh5eC3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IHeHSKLCa3xreNDU' \
    --body '{"is_public": false, "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 41 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'mx40NLRc6m8heKnW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hzfe2NubeoKFeIaF' \
    --body '{"file_type": "QCYoDPICpnduEEQl"}' \
    > test.out 2>&1
eval_tap $? 41 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 42 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'ULdJz4mnRBkMNxvv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KgAT8mJrYq6hRklo' \
    --responseBody  \
    --body '{"updatedAt": "qxM3gpwxcfMy9Xzj", "value": {"jI5YbsKoADkzJEN2": {}, "VHzih3bit0VWn3CO": {}, "39PXDNxtXgeO3Fgk": {}}}' \
    > test.out 2>&1
eval_tap $? 42 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 43 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'XhjDzaQY3snn2ZkP' \
    --namespace "$AB_NAMESPACE" \
    --userId '7cFdP43e5dC9XIBu' \
    --responseBody  \
    --body '{"set_by": "CLIENT", "updatedAt": "RVhyaKwwrAP2aMlu", "value": {"7WtjCtoYetOO847g": {}, "8OudOfjnCuHZ3c46": {}, "IjGa23YvYmmDg7VY": {}}}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 44 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'PXIuvUYTZBRujIUE' \
    --namespace "$AB_NAMESPACE" \
    --userId '1Tq5jyAZvkRCMNFI' \
    --responseBody  \
    --body '{"set_by": "SERVER", "updatedAt": "Sp7gh4TeUTkOkAYf", "value": {"JB8AT9t4Tv207Y2Q": {}, "D3oD5fLCr3OOlXVv": {}, "8ZGF7uYnGzpipNDi": {}}}' \
    > test.out 2>&1
eval_tap $? 44 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 45 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'gNJma1MbqqZtfNWq' \
    --limit '24' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 45 'AdminRetrievePlayerRecords' test.out

#- 46 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4nmwAft4gqkNNlWk' \
    --body '{"data": [{"key": "D9eOziYRFOn0jJLH", "value": {"C9LxhvNXTwGBCtoh": {}, "Ltl9Zuhytm5UDrT6": {}, "QXCs5SPBbRPZTF6o": {}}}, {"key": "QAXVG7tnsZg5QgXj", "value": {"vyGJPN4eXbJE5Vs2": {}, "GcyomQoIXimBJehy": {}, "xlNsjUgxBkF6wFPo": {}}}, {"key": "JeQediogEhhM2rIi", "value": {"zGdKvOPdq5xrgxSm": {}, "y1DN9LFkYW5DQyj4": {}, "bj5Ro2ogaKt2ujQS": {}}}]}' \
    > test.out 2>&1
eval_tap $? 46 'AdminPutPlayerRecordsHandlerV1' test.out

#- 47 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'a3Zdb65UXmy0Zp6i' \
    --body '{"keys": ["IaTIKUkmkk9QM0NB", "MA9ORxpzwLR2AK6e", "XUGPJsw1fiP80G9P"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminGetPlayerRecordsHandlerV1' test.out

#- 48 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'clxcft2ulIJzPyrV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EiOG4UcqsuGKHhMR' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetPlayerRecordHandlerV1' test.out

#- 49 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'WLVd3DlhLuIpomM8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sm1MiaI1mX2tJoAR' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutPlayerRecordHandlerV1' test.out

#- 50 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'tdbBe7udsMrok0Wv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GYYnx4V709xbnGez' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPostPlayerRecordHandlerV1' test.out

#- 51 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'KsDwG2omOR2nvYI9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVqJdvzcWbfUpaXp' \
    > test.out 2>&1
eval_tap $? 51 'AdminDeletePlayerRecordHandlerV1' test.out

#- 52 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '5JMl5LL4bTxBmZjd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rrIxsB0NRsB1fPqq' \
    > test.out 2>&1
eval_tap $? 52 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 53 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'RRulpqpymDkQhtrH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WwRVnwVBOqOHi8pW' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 54 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'Gd1juYhiqjRJOqB5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F93zFQbJndUDpdON' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 54 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 55 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'neAczbBdHb2slt71' \
    --namespace "$AB_NAMESPACE" \
    --userId 'B1SmZp2JZp50CnPb' \
    > test.out 2>&1
eval_tap $? 55 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 56 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key '71ORYcmQbTU5JX8c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cLjMXJRk0eaKQDOJ' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 57 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '70' \
    --query 'rTefglSs6g4iY9u0' \
    > test.out 2>&1
eval_tap $? 57 'ListGameBinaryRecordsV1' test.out

#- 58 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "2aCNYIWekp18lOC3", "key": "mNqF7Bl0LcghVHfP"}' \
    > test.out 2>&1
eval_tap $? 58 'PostGameBinaryRecordV1' test.out

#- 59 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["EspxwhRON0bc1eMb", "EIjowLqc3ecjXJbZ", "DKKoxLE1Y3Dymtj3"]}' \
    > test.out 2>&1
eval_tap $? 59 'BulkGetGameBinaryRecordV1' test.out

#- 60 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'giPg4x4yiPX6ues1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'GetGameBinaryRecordV1' test.out

#- 61 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'Hhhkg1yLVbLFzHEP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "8cM4NTwr0KHaAsmT", "file_location": "ej52WKi6tArAURt9"}' \
    > test.out 2>&1
eval_tap $? 61 'PutGameBinaryRecordV1' test.out

#- 62 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'plCSVq8PdH6hJPUA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteGameBinaryRecordV1' test.out

#- 63 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'c0RVwXgAgntLMCua' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "XBWQi6BqPg4xr0lC"}' \
    > test.out 2>&1
eval_tap $? 63 'PostGameBinaryPresignedURLV1' test.out

#- 64 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'ancUZGCHsZYoLfR1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "KtOv7Zy0b65uvuKN", "value": {"uy0ytZQ7M6Nzy1ad": {}, "nSKOLFKx1dX4LuWJ": {}, "u3pDMUAeeZ97SBRO": {}}}' \
    > test.out 2>&1
eval_tap $? 64 'PutGameRecordConcurrentHandlerV1' test.out

#- 65 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["PYuG6XqP6oo7G73z", "dxTgOfnwIdlNa29f", "DLh741IslKHzGlLK"]}' \
    > test.out 2>&1
eval_tap $? 65 'GetGameRecordsBulk' test.out

#- 66 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'WUtDQs61OQAoxyyQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 66 'GetGameRecordHandlerV1' test.out

#- 67 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'pRWCiiPDGQhNPEwi' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 67 'PutGameRecordHandlerV1' test.out

#- 68 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'JCf2XJVrlzqQls1o' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 68 'PostGameRecordHandlerV1' test.out

#- 69 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'zhLVA3kE8jKvgatO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameRecordHandlerV1' test.out

#- 70 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'EBM70TdlNBJYOmpu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["1VCarzBsV6xnZ5Jr", "zzjrcaug6CWVG8SW", "P3glU6muswVJnNnN"]}' \
    > test.out 2>&1
eval_tap $? 70 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 71 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key '7kAa7j0riFc5HTHQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["IoVsGo7dwV9DBqFK", "HQkETJyTlUrwDTno", "ujQD4IEiH9Z5qXn3"]}' \
    > test.out 2>&1
eval_tap $? 71 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 72 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '5' \
    --query 'oRtlqOECohViHA5C' \
    > test.out 2>&1
eval_tap $? 72 'ListMyBinaryRecordsV1' test.out

#- 73 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["zgFSy8X1A3PrIfap", "q5AAeMe4L3mDWORB", "VXTIIJM9XsYIIZxi"]}' \
    > test.out 2>&1
eval_tap $? 73 'BulkGetMyBinaryRecordV1' test.out

#- 74 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 74 'RetrievePlayerRecords' test.out

#- 75 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["371W9G4AvQkqsGnm", "yo5JJTUVmb8GEXFT", "lEMEsFzYqwgK1Np5"]}' \
    > test.out 2>&1
eval_tap $? 75 'GetPlayerRecordsBulkHandlerV1' test.out

#- 76 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'nodqpLm7FhJBNXzA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 77 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FdO0Khqf6kiTdSGv' \
    --body '{"file_type": "2LFjAKY7CbgsWqFW", "is_public": true, "key": "X7kPBom8F9GLLTG8"}' \
    > test.out 2>&1
eval_tap $? 77 'PostPlayerBinaryRecordV1' test.out

#- 78 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'phc3n4iLoIllKlpO' \
    --limit '25' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 78 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'guB8FOTjMLo4b9rI' \
    --body '{"keys": ["zqYkEpstyVTBcrM8", "rG0rH0zcswwVeMK6", "MbGIVIu8vvwLc7KY"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 80 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key '3uVoJXTIMtpgkieD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yF97lGdMiHKxbWCY' \
    > test.out 2>&1
eval_tap $? 80 'GetPlayerBinaryRecordV1' test.out

#- 81 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'zo8yO2KTK9tmmOnY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nOpas6ghP1y4Zi7s' \
    --body '{"content_type": "7QBlk44Z44B1GZgK", "file_location": "g4uKxaCgcGLuC3br"}' \
    > test.out 2>&1
eval_tap $? 81 'PutPlayerBinaryRecordV1' test.out

#- 82 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'WdTYCfHkIySok5Di' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XZtLW87rGysryod3' \
    > test.out 2>&1
eval_tap $? 82 'DeletePlayerBinaryRecordV1' test.out

#- 83 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'dNQrmsApRA6HX3Rw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rKt2ecozL0TOg54v' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 83 'PutPlayerBinaryRecorMetadataV1' test.out

#- 84 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key '2W7l6jHMA2rG3nak' \
    --namespace "$AB_NAMESPACE" \
    --userId 'opAywelu01nryEJ0' \
    --body '{"file_type": "NqoTow0qiOiC4j0i"}' \
    > test.out 2>&1
eval_tap $? 84 'PostPlayerBinaryPresignedURLV1' test.out

#- 85 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'ktm0ZPLkLOsp0LZ5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'njN86Hl8kUXzt6bS' \
    > test.out 2>&1
eval_tap $? 85 'GetPlayerPublicBinaryRecordsV1' test.out

#- 86 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'c6bWvgpVyW9dD1kO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mvrAejcq2LgkQuaS' \
    --responseBody  \
    --body '{"updatedAt": "7RBx3vim02jBOxrZ", "value": {"DyvpcLYOWA8NjxOn": {}, "aEok4nOOCzfsflhj": {}, "bngJOUn18G5MlfDT": {}}}' \
    > test.out 2>&1
eval_tap $? 86 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 87 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'k8aG40NlncceIZSw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gAIkgzh4pTU0Am4D' \
    --responseBody  \
    --body '{"updatedAt": "Zhl0bQxFJ3sWCqQp", "value": {"Q2FbKPFMycMSQ4qf": {}, "AacR0LgB5BUXvjcu": {}, "2s6w3VifnKqmTSoG": {}}}' \
    > test.out 2>&1
eval_tap $? 87 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 88 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H1XEfY6QAYn6WQ5U' \
    --limit '56' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 88 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 89 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vSkVFWdsbYuVEGVx' \
    --body '{"keys": ["YheR3j5mNZ6vwv7K", "8Asvt1j1Rx59hesN", "Wy2NvZ85DDKDAF8K"]}' \
    > test.out 2>&1
eval_tap $? 89 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 90 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'DsBZOuYQJ03BAHZ7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c53q7akMpcmnnx6R' \
    > test.out 2>&1
eval_tap $? 90 'GetPlayerRecordHandlerV1' test.out

#- 91 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'VBrop9v7aZK3h65h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bN15zfQSfQrtfF3T' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerRecordHandlerV1' test.out

#- 92 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'QN0OcNDLr36vzohZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yjMQAg5mPYhrLTyU' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerRecordHandlerV1' test.out

#- 93 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key '8OhgfY9JQYGF4bYX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EcENx9xZlAchob44' \
    > test.out 2>&1
eval_tap $? 93 'DeletePlayerRecordHandlerV1' test.out

#- 94 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'lONDDwMvgI0HlyPR' \
    --namespace "$AB_NAMESPACE" \
    --userId '7wZNiVsF6xG2mXEQ' \
    > test.out 2>&1
eval_tap $? 94 'GetPlayerPublicRecordHandlerV1' test.out

#- 95 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'dbzIVy8alncV7vWg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SHdfo07UctPErqxy' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordHandlerV1' test.out

#- 96 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'MyOK06MqQBErxgjV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BycvU4PbmRDcrg0D' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 96 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE