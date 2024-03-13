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
echo "1..104"

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
    --body '{"set_by": "CLIENT", "tags": ["i5r6QEa1ysLEzth6", "mXhzkzWkFeZSoEAc", "BdW19m4eu6d5tA5j"], "ttl_config": {"action": "DELETE", "expires_at": "1977-06-18T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key 'iTqpyhPFdxLzFQN0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "5MYzYiKWe5dNRljv"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 DeleteGameBinaryRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordTTLConfig \
    --key '7IPrDQQRgat0Sevk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DeleteGameBinaryRecordTTLConfig' test.out

#- 16 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key 'LGMS0lyuI9a2I9u6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"tags": ["Vpbsx5w8hqUI06Up", "OXGSLmCVuHOPlLlk", "vR8sKgnuRkgghGoY"], "updatedAt": "upD391C2qtPYokah", "value": {"FjkQsfCaTmt1d67F": {}, "XGk2s9Q0mPVo3twu": {}, "0MesTCf9x4rt69ln": {}}}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 17 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'a7qxNeIxPz6MbwL6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT", "tags": ["Y69z1UaLqYSYWytL", "PziZMdjxcBZufQxG", "iHPllG4cYEzfTD1Z"], "ttl_config": {"action": "DELETE", "expires_at": "1978-04-09T00:00:00Z"}, "updatedAt": "3fePqIJA8IHtrkmu", "value": {"0hpDDWVAla2l5BYN": {}, "tIuS5S5XUdjsoqwG": {}, "yzzWi9gwQYv7t1o7": {}}}' \
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
    --body '{"appConfig": {"appName": "TTr1DmrhZv15T7qu"}, "customConfig": {"GRPCAddress": "IOvBMcaYmvCkGZ5d"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": true, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": true, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": true}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "oxozr6wfNPX2bOIt"}, "customConfig": {"GRPCAddress": "RMvqtlB2jJCSQT27"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": false, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": true, "beforeWritePlayerBinaryRecord": true, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePluginConfig' test.out

#- 22 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'tXi3choQrpOsDBU5' \
    --limit '92' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 22 'ListGameRecordsHandlerV1' test.out

#- 23 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'epjChB3V0v52Dlym' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminGetGameRecordHandlerV1' test.out

#- 24 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key '6puQ23xoJ8aeCnaL' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPutGameRecordHandlerV1' test.out

#- 25 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'pUKp44YUDjasWIPU' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPostGameRecordHandlerV1' test.out

#- 26 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'vmEejtGeoyIPa8ZR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'AdminDeleteGameRecordHandlerV1' test.out

#- 27 DeleteGameRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordTTLConfig \
    --key 'rvjj7il35MXbN9oC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameRecordTTLConfig' test.out

#- 28 AdminListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 28 'AdminListTagsHandlerV1' test.out

#- 29 AdminPostTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "Nqq98SjTvhZNkSQ7"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminPostTagHandlerV1' test.out

#- 30 AdminDeleteTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --tag '0D0H6BXksUC9b6i5' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTagHandlerV1' test.out

#- 31 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'lZC9xv32e8c5csSo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["voqsZNBdte9NDUPV", "Jf6c2Z0QZxfgPubT", "DIHrvqAThuwjRHpK"]}' \
    > test.out 2>&1
eval_tap $? 31 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 32 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["KTlmVr9XuoJbRFQS", "KVPHbn4Xxtu7LQRE", "NjEEztx1WsYSiZqa"], "user_id": "n0nSBJroav91GXlv"}, {"keys": ["PG6bFYReVHQipcCx", "9Zw5D2L7vIYhGGSy", "EW4ZJJ42d3PBddN8"], "user_id": "S48l9lyNApflxqMr"}, {"keys": ["j3oZk03QXcKMDYDD", "xHSZjtqXyJ58f7Gc", "26SaiGVkydwYWQG2"], "user_id": "6yUZNmTBcvrbYCwZ"}]}' \
    > test.out 2>&1
eval_tap $? 32 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 33 ListPlayerRecordHandlerV1
eval_tap 0 33 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 34 AdminBulkPutPlayerRecordsByKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkPutPlayerRecordsByKeyHandlerV1 \
    --key 'txFHyPLtI8ilbyDP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"user_id": "UIj88cekdqCt81P1", "value": {"ktfIovmv9gsR5cJc": {}, "Hm3SZLxoRDFuuuyS": {}, "j29a9LJE8HoRS1X2": {}}}, {"user_id": "PFAAMwzHPxB1UskY", "value": {"s4Yw20DOqOBSC2DK": {}, "HRuPMMWH8Yb33T5U": {}, "BJCjfcnLRfxeCSz9": {}}}, {"user_id": "WEi8KlloeH0JT1yd", "value": {"uat2vQR3biBfsu4j": {}, "msRE2w1yEkLgh3tI": {}, "Yt4SqYUTLDx9gIiD": {}}}]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminBulkPutPlayerRecordsByKeyHandlerV1' test.out

#- 35 AdminBulkGetPlayerRecordsByUserIDsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetPlayerRecordsByUserIDsHandlerV1 \
    --key 'andpGT2t24aOMh5e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["C3IHeHSKLCa3xreN", "DUWehwH3q31A806D", "Jgas4b6z3LNUj7fd"]}' \
    > test.out 2>&1
eval_tap $? 35 'AdminBulkGetPlayerRecordsByUserIDsHandlerV1' test.out

#- 36 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gLA84Z8YYk6QEgJj' \
    --limit '56' \
    --offset '62' \
    > test.out 2>&1
eval_tap $? 36 'AdminListAdminUserRecordsV1' test.out

#- 37 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bEDoNf3n0hEoRCAc' \
    --body '{"keys": ["f80zfFyabWAgIUXi", "I07A68eaqC2J9jyE", "W6GLbc0NaKDUL3sa"]}' \
    > test.out 2>&1
eval_tap $? 37 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 38 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key '13lk1dQBHO86IlBh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'netU4RwTqUXlTDBz' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetAdminPlayerRecordV1' test.out

#- 39 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'OuYsaZA2yyd4mbqo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OfADMMAXFaY9eKa6' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 39 'AdminPutAdminPlayerRecordV1' test.out

#- 40 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key '99bRVhyaKwwrAP2a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mlu7WtjCtoYetOO8' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPostPlayerAdminRecordV1' test.out

#- 41 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key '47g8OudOfjnCuHZ3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c46IjGa23YvYmmDg' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAdminPlayerRecordV1' test.out

#- 42 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7VYPXIuvUYTZBRuj' \
    --limit '72' \
    --offset '44' \
    --query 'UE1Tq5jyAZvkRCMN' \
    > test.out 2>&1
eval_tap $? 42 'AdminListPlayerBinaryRecordsV1' test.out

#- 43 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'FIurjh2imdb4rbkX' \
    --body '{"file_type": "j0ZwsVC0gL97ZVJS", "is_public": true, "key": "QD3oD5fLCr3OOlXV", "set_by": "SERVER"}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPostPlayerBinaryRecordV1' test.out

#- 44 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'QxC3Gb7S0o4zGYY7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KQI1AeFgPqaOkvo1' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPlayerBinaryRecordV1' test.out

#- 45 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'aolB4lkKB4EYOkQ1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jMD3cym8xIfkOVW2' \
    --body '{"content_type": "grREOLx0KOww3HIC", "file_location": "QLfl7MUBG7qtPu64"}' \
    > test.out 2>&1
eval_tap $? 45 'AdminPutPlayerBinaryRecordV1' test.out

#- 46 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'yAtURKLRkb738HGS' \
    --namespace "$AB_NAMESPACE" \
    --userId '6rDgMdIIlhS1fSiM' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeletePlayerBinaryRecordV1' test.out

#- 47 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key '9331m7Ta1PsKc50K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'v6ecnEevcAx2K2zk' \
    --body '{"is_public": true, "set_by": "CLIENT", "tags": ["xlNsjUgxBkF6wFPo", "JeQediogEhhM2rIi", "zGdKvOPdq5xrgxSm"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 48 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'y1DN9LFkYW5DQyj4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bj5Ro2ogaKt2ujQS' \
    --body '{"file_type": "a3Zdb65UXmy0Zp6i"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 49 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'IaTIKUkmkk9QM0NB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MA9ORxpzwLR2AK6e' \
    --responseBody  \
    --body '{"tags": ["XUGPJsw1fiP80G9P", "clxcft2ulIJzPyrV", "EiOG4UcqsuGKHhMR"], "updatedAt": "WLVd3DlhLuIpomM8", "value": {"sm1MiaI1mX2tJoAR": {}, "tdbBe7udsMrok0Wv": {}, "GYYnx4V709xbnGez": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 50 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'KsDwG2omOR2nvYI9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TVqJdvzcWbfUpaXp' \
    --responseBody  \
    --body '{"set_by": "CLIENT", "tags": ["Ml5LL4bTxBmZjdrr", "IxsB0NRsB1fPqqRR", "ulpqpymDkQhtrHWw"], "ttl_config": {"action": "DELETE", "expires_at": "1995-05-02T00:00:00Z"}, "updatedAt": "nwVBOqOHi8pWGd1j", "value": {"uYhiqjRJOqB5F93z": {}, "FQbJndUDpdONneAc": {}, "zbBdHb2slt71B1Sm": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 51 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'Zp2JZp50CnPb71OR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YcmQbTU5JX8ccLjM' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["k0eaKQDOJvrTefgl", "Ss6g4iY9u02aCNYI", "Wekp18lOC3mNqF7B"], "ttl_config": {"action": "DELETE", "expires_at": "1986-04-02T00:00:00Z"}, "updatedAt": "LcghVHfPEspxwhRO", "value": {"N0bc1eMbEIjowLqc": {}, "3ecjXJbZDKKoxLE1": {}, "Y3Dymtj3giPg4x4y": {}}}' \
    > test.out 2>&1
eval_tap $? 51 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 52 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'iPX6ues1Hhhkg1yL' \
    --limit '98' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 52 'AdminRetrievePlayerRecords' test.out

#- 53 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'bLFzHEP8cM4NTwr0' \
    --body '{"data": [{"key": "KHaAsmTej52WKi6t", "value": {"ArAURt9plCSVq8Pd": {}, "H6hJPUAc0RVwXgAg": {}, "ntLMCuaXBWQi6BqP": {}}}, {"key": "g4xr0lCancUZGCHs", "value": {"ZYoLfR1KtOv7Zy0b": {}, "65uvuKNuy0ytZQ7M": {}, "6Nzy1adnSKOLFKx1": {}}}, {"key": "dX4LuWJu3pDMUAee", "value": {"Z97SBROPYuG6XqP6": {}, "oo7G73zdxTgOfnwI": {}, "dlNa29fDLh741Isl": {}}}]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerRecordsHandlerV1' test.out

#- 54 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'KHzGlLKWUtDQs61O' \
    --body '{"keys": ["QAoxyyQpRWCiiPDG", "QhNPEwiJCf2XJVrl", "zqQls1ozhLVA3kE8"]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetPlayerRecordsHandlerV1' test.out

#- 55 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'jKvgatOEBM70TdlN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BJYOmpu1VCarzBsV' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerRecordHandlerV1' test.out

#- 56 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key '6xnZ5Jrzzjrcaug6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CWVG8SWP3glU6mus' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 56 'AdminPutPlayerRecordHandlerV1' test.out

#- 57 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'wVJnNnN7kAa7j0ri' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Fc5HTHQIoVsGo7dw' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'AdminPostPlayerRecordHandlerV1' test.out

#- 58 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'V9DBqFKHQkETJyTl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UrwDTnoujQD4IEiH' \
    > test.out 2>&1
eval_tap $? 58 'AdminDeletePlayerRecordHandlerV1' test.out

#- 59 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '9Z5qXn3aoRtlqOEC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ohViHA5CzgFSy8X1' \
    > test.out 2>&1
eval_tap $? 59 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 60 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'A3PrIfapq5AAeMe4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L3mDWORBVXTIIJM9' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 60 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 61 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'XsYIIZxiXNMR9Bga' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WcFX3SUBhyoTsMWP' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 61 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 62 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'AxUMkawaGpAyrIwM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'if3BOdkocVTd4Bxq' \
    > test.out 2>&1
eval_tap $? 62 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 63 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'GWV6mTJ0sQs6XNbj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vqhnUVLWu8olKdxL' \
    > test.out 2>&1
eval_tap $? 63 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 64 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '58' \
    --query 'zRmDD0jJvlfV5Oem' \
    > test.out 2>&1
eval_tap $? 64 'ListGameBinaryRecordsV1' test.out

#- 65 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "PYdYT7DROCjtuzFM", "key": "bAG9YI89hmguB8FO"}' \
    > test.out 2>&1
eval_tap $? 65 'PostGameBinaryRecordV1' test.out

#- 66 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["TjMLo4b9rIzqYkEp", "styVTBcrM8rG0rH0", "zcswwVeMK6MbGIVI"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetGameBinaryRecordV1' test.out

#- 67 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'u8vvwLc7KY3uVoJX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetGameBinaryRecordV1' test.out

#- 68 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'TIMtpgkieDyF97lG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "dMiHKxbWCYzo8yO2", "file_location": "KTK9tmmOnYnOpas6"}' \
    > test.out 2>&1
eval_tap $? 68 'PutGameBinaryRecordV1' test.out

#- 69 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'ghP1y4Zi7s7QBlk4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameBinaryRecordV1' test.out

#- 70 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key '4Z44B1GZgKg4uKxa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "CgcGLuC3brWdTYCf"}' \
    > test.out 2>&1
eval_tap $? 70 'PostGameBinaryPresignedURLV1' test.out

#- 71 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'HkIySok5DiXZtLW8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "7rGysryod3dNQrms", "value": {"ApRA6HX3RwrKt2ec": {}, "ozL0TOg54vCE48L5": {}, "oLF6M4lNa4JUMSHN": {}}}' \
    > test.out 2>&1
eval_tap $? 71 'PutGameRecordConcurrentHandlerV1' test.out

#- 72 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["gqRqCV7usamANkZl", "OX9Sfo95HgXqKhTP", "kwfLM9uSybRzWek2"]}' \
    > test.out 2>&1
eval_tap $? 72 'GetGameRecordsBulk' test.out

#- 73 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'gZvRrvr0n9d9lvcc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetGameRecordHandlerV1' test.out

#- 74 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'KMLhrTrcBE2ItBS3' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 74 'PutGameRecordHandlerV1' test.out

#- 75 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'KtKZWe8aoFzAyBME' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 75 'PostGameRecordHandlerV1' test.out

#- 76 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key '74HUtipUWYhWV1qx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteGameRecordHandlerV1' test.out

#- 77 PublicListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 77 'PublicListTagsHandlerV1' test.out

#- 78 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'zPML52faXUr9Sk4l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["q2faBcAXXKlhvyH8", "paOJtxqMPpcVfRwN", "j547fH0XrKEDpEY8"]}' \
    > test.out 2>&1
eval_tap $? 78 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'VnocGAjci0V3tBf2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["jnHGKXphn50c9tNL", "DljhZ2jxLRX3z46O", "CaGBeMfPlNos4yBR"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 80 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '28' \
    --query 'rERHEonAZR8GmEu0' \
    > test.out 2>&1
eval_tap $? 80 'ListMyBinaryRecordsV1' test.out

#- 81 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["q1p6QCyY6vSkVFWd", "sbYuVEGVxYheR3j5", "mNZ6vwv7K8Asvt1j"]}' \
    > test.out 2>&1
eval_tap $? 81 'BulkGetMyBinaryRecordV1' test.out

#- 82 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 82 'RetrievePlayerRecords' test.out

#- 83 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["x59hesNWy2NvZ85D", "DKDAF8KDsBZOuYQJ", "03BAHZ7c53q7akMp"]}' \
    > test.out 2>&1
eval_tap $? 83 'GetPlayerRecordsBulkHandlerV1' test.out

#- 84 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'cmnnx6RVBrop9v7a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 85 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZK3h65hbN15zfQSf' \
    --body '{"file_type": "QrtfF3TQN0OcNDLr", "is_public": true, "key": "6vzohZyjMQAg5mPY"}' \
    > test.out 2>&1
eval_tap $? 85 'PostPlayerBinaryRecordV1' test.out

#- 86 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hrLTyU8OhgfY9JQY' \
    --limit '67' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 86 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 87 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F4bYXEcENx9xZlAc' \
    --body '{"keys": ["hob44lONDDwMvgI0", "HlyPR7wZNiVsF6xG", "2mXEQdbzIVy8alnc"]}' \
    > test.out 2>&1
eval_tap $? 87 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 88 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'V7vWgSHdfo07UctP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ErqxyMyOK06MqQBE' \
    > test.out 2>&1
eval_tap $? 88 'GetPlayerBinaryRecordV1' test.out

#- 89 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'rxgjVBycvU4PbmRD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'crg0DjQjBECXvea7' \
    --body '{"content_type": "H1m2lJFRZ3ZprZ60", "file_location": "zMjhTHeh94TSenE5"}' \
    > test.out 2>&1
eval_tap $? 89 'PutPlayerBinaryRecordV1' test.out

#- 90 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'hCFkIf5weqZ18MH5' \
    --namespace "$AB_NAMESPACE" \
    --userId '7l2Zsrh90ETtYmGu' \
    > test.out 2>&1
eval_tap $? 90 'DeletePlayerBinaryRecordV1' test.out

#- 91 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'kz3MnlrjcHp6B8Vj' \
    --namespace "$AB_NAMESPACE" \
    --userId '7rXFgDnDkdZ9bpjb' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerBinaryRecorMetadataV1' test.out

#- 92 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key 'TaLQjctvrK2jhsYp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KPlXn77AtYoFzLAA' \
    --body '{"file_type": "TPY8P8P3cfoivvQx"}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerBinaryPresignedURLV1' test.out

#- 93 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'evecWw7Rry0KK5rg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AGO0dW8rX2MVUGKS' \
    > test.out 2>&1
eval_tap $? 93 'GetPlayerPublicBinaryRecordsV1' test.out

#- 94 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'Z4GcLkt4pK32sJxl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZcCTpTdRtCHvuk6B' \
    --responseBody  \
    --body '{"updatedAt": "6XTmSLyn50sigBVZ", "value": {"xiKdV57GvRyd9UuL": {}, "02Le8HSCslsDd4M1": {}, "F5qRIblS7Nz81GRa": {}}}' \
    > test.out 2>&1
eval_tap $? 94 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 95 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'zPAANjfBoldFOyqA' \
    --namespace "$AB_NAMESPACE" \
    --userId '2clJ5gEOaCgM6Yn6' \
    --responseBody  \
    --body '{"updatedAt": "RugbNEIpGBFUjOn5", "value": {"mM7k8nbLzvtCIW5y": {}, "nMKquUicAeIVXtoW": {}, "AXhMlW4tLqX7OICf": {}}}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 96 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '5oD1e6oI9FmYel0k' \
    --limit '82' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 96 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 97 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'w72o8Zkgk0jS6rDW' \
    --body '{"keys": ["UwfhKvrf2AaH4yCW", "rHSppnIZkNnTn3rz", "H5NvAtcvNedgS1fU"]}' \
    > test.out 2>&1
eval_tap $? 97 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 98 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'fKmihDbmu8ePWlQM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VDXEHeiGTnwyEw6h' \
    > test.out 2>&1
eval_tap $? 98 'GetPlayerRecordHandlerV1' test.out

#- 99 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'IWDZrpP7rz3ISW51' \
    --namespace "$AB_NAMESPACE" \
    --userId '0kHr4isTKWjmv67n' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 99 'PutPlayerRecordHandlerV1' test.out

#- 100 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'uHCXWfwnwGioVwVz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mmBVVFfpqx1AeLtz' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 100 'PostPlayerRecordHandlerV1' test.out

#- 101 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'cPJ3jtDYBo4FUTH7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CGfKSyxgRR1DiCqS' \
    > test.out 2>&1
eval_tap $? 101 'DeletePlayerRecordHandlerV1' test.out

#- 102 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'MzpqIFGLkDs7ACC1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RgBfoNrHlFi2qJLg' \
    > test.out 2>&1
eval_tap $? 102 'GetPlayerPublicRecordHandlerV1' test.out

#- 103 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'mBLE35YhyiDV90Se' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I5yppBHoytVznCgN' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 103 'PutPlayerPublicRecordHandlerV1' test.out

#- 104 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'yx9fbT63ShEh8PbG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ikLjgjcj34uulU6F' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 104 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE