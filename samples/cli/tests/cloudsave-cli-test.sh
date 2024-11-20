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
echo "1..105"

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
    --tags '9UzVRiXbqlAw7r6W,2ktQG0h5JAav5kRa,62WopBJHPtcDs8bB' \
    > test.out 2>&1
eval_tap $? 2 'AdminListAdminGameRecordV1' test.out

#- 3 AdminBulkGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminGameRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["ZLCXLx8bbgorQeFb", "Q1g7qbPngUNB1vRo", "dwpzS6DaDpv8N7ZQ"]}' \
    > test.out 2>&1
eval_tap $? 3 'AdminBulkGetAdminGameRecordV1' test.out

#- 4 AdminGetAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminGameRecordV1 \
    --key 'VqGj6oDLjWjkY1aX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetAdminGameRecordV1' test.out

#- 5 AdminPutAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordV1 \
    --key 'lFcDtgOjchIua5tW' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutAdminGameRecordV1' test.out

#- 6 AdminPostAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostAdminGameRecordV1 \
    --key 'EIC32ogW7olvbTgr' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostAdminGameRecordV1' test.out

#- 7 AdminDeleteAdminGameRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminGameRecordV1 \
    --key 'hRTcPiSuL0Sly6XM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteAdminGameRecordV1' test.out

#- 8 DeleteAdminGameRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteAdminGameRecordTTLConfig \
    --key '4OI18mAQLnzjMf8G' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'DeleteAdminGameRecordTTLConfig' test.out

#- 9 AdminListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '0' \
    --offset '100' \
    --query 'gSrjJW2OQNOs1PXh' \
    --tags 'T5FvdiRilZ7oFgx4,c8OumKtPDKJDXn7Z,4U68su8XfqlqNiTv' \
    > test.out 2>&1
eval_tap $? 9 'AdminListGameBinaryRecordsV1' test.out

#- 10 AdminPostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "B6SdAdIhUDrwoZ5M", "key": "ecdKi5r6QEa1ysLE", "set_by": "SERVER", "ttl_config": {"action": "DELETE", "expires_at": "1980-02-27T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPostGameBinaryRecordV1' test.out

#- 11 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key 'rGN9A3sNm84hddSp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGameBinaryRecordV1' test.out

#- 12 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key 'Ht0P7MIIR7CkyF6C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "7duuyZ0GhDogqrhB", "file_location": "Rd8lDR6qVNPRZYdF"}' \
    > test.out 2>&1
eval_tap $? 12 'AdminPutGameBinaryRecordV1' test.out

#- 13 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key 'LIAjGGJddVCvu9vx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'AdminDeleteGameBinaryRecordV1' test.out

#- 14 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key '5KQ7KYnIuMBvaO35' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT", "tags": ["9u6Vpbsx5w8hqUI0", "6UpOXGSLmCVuHOPl", "LlkvR8sKgnuRkggh"], "ttl_config": {"action": "DELETE", "expires_at": "1987-08-21T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 15 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key 'upD391C2qtPYokah' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "FjkQsfCaTmt1d67F"}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPostGameBinaryPresignedURLV1' test.out

#- 16 DeleteGameBinaryRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordTTLConfig \
    --key 'XGk2s9Q0mPVo3twu' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'DeleteGameBinaryRecordTTLConfig' test.out

#- 17 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key '0MesTCf9x4rt69ln' \
    --namespace "$AB_NAMESPACE" \
    --body '{"tags": ["a7qxNeIxPz6MbwL6", "IY69z1UaLqYSYWyt", "LPziZMdjxcBZufQx"], "ttl_config": {"action": "DELETE", "expires_at": "1988-03-09T00:00:00Z"}, "updatedAt": "1992-03-05T00:00:00Z", "value": {"llG4cYEzfTD1ZBm3": {}, "MqHcUmLZZbSqb8Rw": {}, "Nmn9HrNQy4uZAAiE": {}}}' \
    > test.out 2>&1
eval_tap $? 17 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 18 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key '0mit9RGCCHYzUOcE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CLIENT", "tags": ["zWi9gwQYv7t1o7TT", "r1DmrhZv15T7quIO", "vBMcaYmvCkGZ5dAg"], "ttl_config": {"action": "DELETE", "expires_at": "1985-07-10T00:00:00Z"}, "updatedAt": "1995-05-01T00:00:00Z", "value": {"EXlAvxJMdalwSyli": {}, "WMNW5NyLu0M3VHh2": {}, "EI8JlDbPWbQ6Q9lN": {}}}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 19 GetPluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave getPluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'GetPluginConfig' test.out

#- 20 CreatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave createPluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "mqRBaAkLnvxkT1X6"}, "customConfig": {"GRPCAddress": "8cmDc3fxU8MyKrQp"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": false, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": true, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": true, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 20 'CreatePluginConfig' test.out

#- 21 DeletePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deletePluginConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'DeletePluginConfig' test.out

#- 22 UpdatePluginConfig
./ng net.accelbyte.sdk.cli.Main cloudsave updatePluginConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"appConfig": {"appName": "eCnaLpUKp44YUDja"}, "customConfig": {"GRPCAddress": "sWIPUvmEejtGeoyI"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": true, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": true, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "APP"}' \
    > test.out 2>&1
eval_tap $? 22 'UpdatePluginConfig' test.out

#- 23 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'Ygc2L4jk4Lo0LSP0' \
    --tags 'pf4IxjUkl535X3at,eEKDpADz1x3poD3Q,gb3boLQQ1MzH7Qm8' \
    --limit '4' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 23 'ListGameRecordsHandlerV1' test.out

#- 24 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'wbmXgdAPh1EThG96' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'AdminGetGameRecordHandlerV1' test.out

#- 25 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'gAFKK2WDgCcxvONZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPutGameRecordHandlerV1' test.out

#- 26 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'm3EeERmDnyeFoF7V' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 26 'AdminPostGameRecordHandlerV1' test.out

#- 27 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'SZ6pf3vneSD2Tb3g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AdminDeleteGameRecordHandlerV1' test.out

#- 28 DeleteGameRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordTTLConfig \
    --key '7mSQUhAEtrmjqU6Y' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'DeleteGameRecordTTLConfig' test.out

#- 29 AdminListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 29 'AdminListTagsHandlerV1' test.out

#- 30 AdminPostTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "p4lSck0ZHn5GI39Y"}' \
    > test.out 2>&1
eval_tap $? 30 'AdminPostTagHandlerV1' test.out

#- 31 AdminDeleteTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --tag 'BHqaTHeKtW18iGeU' \
    > test.out 2>&1
eval_tap $? 31 'AdminDeleteTagHandlerV1' test.out

#- 32 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'lc9d9sogWa24CKNS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["0GqVvUfHQvsHXNUN", "e4mhgo5QB65lSAiY", "nNjkfZrQvGgbLdLs"]}' \
    > test.out 2>&1
eval_tap $? 32 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 33 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["FzHkBMr1yrOMlNFS", "rUEirnjX9fDmIbeZ", "xzfTcyiuATus9hsf"], "user_id": "pFDcSDG8aMVGLiBN"}, {"keys": ["rDjqoxcwgGLXpUL4", "pp2ncYAHdNzDmeIP", "6rOvDz9KOsb392k6"], "user_id": "YmJFfRByjlBiuFM3"}, {"keys": ["FIoVk8T3GpAnkCmB", "Uqg2SCnqntX9y1aZ", "SWMiVi10sG6vxkfU"], "user_id": "cmqRRbceJ5i0EeDx"}]}' \
    > test.out 2>&1
eval_tap $? 33 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 34 ListPlayerRecordHandlerV1
eval_tap 0 34 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 35 AdminBulkPutPlayerRecordsByKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkPutPlayerRecordsByKeyHandlerV1 \
    --key 'OgBnhhqElIaDml48' \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"user_id": "wdNFLTm5T50x9WT0", "value": {"GfH2rtOa4EXsXzOX": {}, "QAk4mqrxzTtuLl4X": {}, "lbGL8QOxtjzm8y2w": {}}}, {"user_id": "NhmwoYZyI4EFZKBc", "value": {"YrCEAE7WIsfmx40N": {}, "LRc6m8heKnWhzfe2": {}, "NubeoKFeIaFQCYoD": {}}}, {"user_id": "PICpnduEEQlULdJz", "value": {"4mnRBkMNxvvKgAT8": {}, "mJrYq6hRkloqxM3g": {}, "pwxcfMy9XzjjI5Yb": {}}}]}' \
    > test.out 2>&1
eval_tap $? 35 'AdminBulkPutPlayerRecordsByKeyHandlerV1' test.out

#- 36 AdminBulkGetPlayerRecordsByUserIDsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetPlayerRecordsByUserIDsHandlerV1 \
    --key 'sKoADkzJEN2VHzih' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["3bit0VWn3CO39PXD", "NxtXgeO3FgkXhjDz", "aQY3snn2ZkP7cFdP"]}' \
    > test.out 2>&1
eval_tap $? 36 'AdminBulkGetPlayerRecordsByUserIDsHandlerV1' test.out

#- 37 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '43e5dC9XIBudfZgr' \
    --limit '2' \
    --offset '74' \
    --query 'HDIDm4hMzF4Txode' \
    --tags 'nSrUTvfqU0bfoMm5,cTtFWbotQyXJRcQW,smqPNs92epxk0i8V' \
    > test.out 2>&1
eval_tap $? 37 'AdminListAdminUserRecordsV1' test.out

#- 38 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xsZNereSvf9699mC' \
    --body '{"keys": ["EHThUJkETAsSp7gh", "4TeUTkOkAYfJB8AT", "9t4Tv207Y2QD3oD5"]}' \
    > test.out 2>&1
eval_tap $? 38 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 39 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'fLCr3OOlXVv8ZGF7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uYnGzpipNDigNJma' \
    > test.out 2>&1
eval_tap $? 39 'AdminGetAdminPlayerRecordV1' test.out

#- 40 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key '1MbqqZtfNWql4nmw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Aft4gqkNNlWkD9eO' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPutAdminPlayerRecordV1' test.out

#- 41 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'ziYRFOn0jJLHC9Lx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hvNXTwGBCtohLtl9' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 41 'AdminPostPlayerAdminRecordV1' test.out

#- 42 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'Zuhytm5UDrT6QXCs' \
    --namespace "$AB_NAMESPACE" \
    --userId '5SPBbRPZTF6oQAXV' \
    > test.out 2>&1
eval_tap $? 42 'AdminDeleteAdminPlayerRecordV1' test.out

#- 43 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'G7tnsZg5QgXjvyGJ' \
    --limit '85' \
    --offset '94' \
    --query 'N4eXbJE5Vs2Gcyom' \
    --tags 'QoIXimBJehyxlNsj,UgxBkF6wFPoJeQed,iogEhhM2rIizGdKv' \
    > test.out 2>&1
eval_tap $? 43 'AdminListPlayerBinaryRecordsV1' test.out

#- 44 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OPdq5xrgxSmy1DN9' \
    --body '{"file_type": "LFkYW5DQyj4bj5Ro", "is_public": false, "key": "ogaKt2ujQSa3Zdb6", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 44 'AdminPostPlayerBinaryRecordV1' test.out

#- 45 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'Xmy0Zp6iIaTIKUkm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kk9QM0NBMA9ORxpz' \
    > test.out 2>&1
eval_tap $? 45 'AdminGetPlayerBinaryRecordV1' test.out

#- 46 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'wLR2AK6eXUGPJsw1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fiP80G9Pclxcft2u' \
    --body '{"content_type": "lIJzPyrVEiOG4Ucq", "file_location": "suGKHhMRWLVd3Dlh"}' \
    > test.out 2>&1
eval_tap $? 46 'AdminPutPlayerBinaryRecordV1' test.out

#- 47 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'LuIpomM8sm1MiaI1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mX2tJoARtdbBe7ud' \
    > test.out 2>&1
eval_tap $? 47 'AdminDeletePlayerBinaryRecordV1' test.out

#- 48 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'sMrok0WvGYYnx4V7' \
    --namespace "$AB_NAMESPACE" \
    --userId '09xbnGezKsDwG2om' \
    --body '{"is_public": true, "set_by": "CLIENT", "tags": ["Vg8JqU0jZpjvsugA", "OS7u8RiWyerCSa8S", "RgwsAj1ik1jglaDX"]}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 49 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'TvKCWwNTAhd2wrS0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uPdjhdinpng5BLy8' \
    --body '{"file_type": "wbhMssAHjapIkY9R"}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 50 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'f4wP57dBZNR88YbC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tmKy8M9zVrjfGXZn' \
    --responseBody  \
    --body '{"tags": ["qAQUoY1GjlIIk0iK", "oTTS1j02o7JjTXAQ", "N0qdskdQV0TqI8EF"], "updatedAt": "1978-12-19T00:00:00Z", "value": {"mDbxIxi4YKlONk2Q": {}, "5Y4JvaizwiilatuU": {}, "jjt9lIMGql5ElEa9": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 51 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'EIIlGcHB3CfR3ncD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lwi3v3MFFJ1KesKo' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["XJbZDKKoxLE1Y3Dy", "mtj3giPg4x4yiPX6", "ues1Hhhkg1yLVbLF"], "ttl_config": {"action": "DELETE", "expires_at": "1989-09-29T00:00:00Z"}, "updatedAt": "1971-09-12T00:00:00Z", "value": {"BfAKSiPW3VgsZXiR": {}, "1DJ7HVWqMkNSawQU": {}, "WDFJvJBWic7UkBeI": {}}}' \
    > test.out 2>&1
eval_tap $? 51 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 52 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'XuqDuAXI66bQ71w0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'deoV9Lx5RDA1l2Xc' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["CancUZGCHsZYoLfR", "1KtOv7Zy0b65uvuK", "Nuy0ytZQ7M6Nzy1a"], "ttl_config": {"action": "DELETE", "expires_at": "1977-02-17T00:00:00Z"}, "updatedAt": "1993-10-21T00:00:00Z", "value": {"QkmZXElW9YfRSse6": {}, "AAz3S4czz0QKFlAV": {}, "mVLu4AOec0z8eBee": {}}}' \
    > test.out 2>&1
eval_tap $? 52 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 53 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'oip68J1nsv4W2OJh' \
    --limit '40' \
    --offset '0' \
    --query '41IslKHzGlLKWUtD' \
    --tags 'Qs61OQAoxyyQpRWC,iiPDGQhNPEwiJCf2,XJVrlzqQls1ozhLV' \
    > test.out 2>&1
eval_tap $? 53 'AdminRetrievePlayerRecords' test.out

#- 54 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'A3kE8jKvgatOEBM7' \
    --body '{"data": [{"key": "0TdlNBJYOmpu1VCa", "value": {"rzBsV6xnZ5Jrzzjr": {}, "caug6CWVG8SWP3gl": {}, "U6muswVJnNnN7kAa": {}}}, {"key": "7j0riFc5HTHQIoVs", "value": {"Go7dwV9DBqFKHQkE": {}, "TJyTlUrwDTnoujQD": {}, "4IEiH9Z5qXn3aoRt": {}}}, {"key": "lqOECohViHA5CzgF", "value": {"Sy8X1A3PrIfapq5A": {}, "AeMe4L3mDWORBVXT": {}, "IIJM9XsYIIZxiXNM": {}}}]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminPutPlayerRecordsHandlerV1' test.out

#- 55 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'R9BgaWcFX3SUBhyo' \
    --body '{"keys": ["TsMWPAxUMkawaGpA", "yrIwMif3BOdkocVT", "d4BxqGWV6mTJ0sQs"]}' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerRecordsHandlerV1' test.out

#- 56 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key '6XNbjvqhnUVLWu8o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lKdxL6ozRmDD0jJv' \
    > test.out 2>&1
eval_tap $? 56 'AdminGetPlayerRecordHandlerV1' test.out

#- 57 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'lfV5OemPYdYT7DRO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CjtuzFMbAG9YI89h' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'AdminPutPlayerRecordHandlerV1' test.out

#- 58 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'mguB8FOTjMLo4b9r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IzqYkEpstyVTBcrM' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 58 'AdminPostPlayerRecordHandlerV1' test.out

#- 59 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key '8rG0rH0zcswwVeMK' \
    --namespace "$AB_NAMESPACE" \
    --userId '6MbGIVIu8vvwLc7K' \
    > test.out 2>&1
eval_tap $? 59 'AdminDeletePlayerRecordHandlerV1' test.out

#- 60 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'Y3uVoJXTIMtpgkie' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DyF97lGdMiHKxbWC' \
    > test.out 2>&1
eval_tap $? 60 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 61 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'Yzo8yO2KTK9tmmOn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YnOpas6ghP1y4Zi7' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 61 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 62 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 's7QBlk44Z44B1GZg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Kg4uKxaCgcGLuC3b' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 62 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 63 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'rWdTYCfHkIySok5D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iXZtLW87rGysryod' \
    > test.out 2>&1
eval_tap $? 63 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 64 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key '3dNQrmsApRA6HX3R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrKt2ecozL0TOg54' \
    > test.out 2>&1
eval_tap $? 64 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 65 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '44' \
    --offset '78' \
    --query 'CE48L5oLF6M4lNa4' \
    --tags 'JUMSHNgqRqCV7usa,mANkZlOX9Sfo95Hg,XqKhTPkwfLM9uSyb' \
    > test.out 2>&1
eval_tap $? 65 'ListGameBinaryRecordsV1' test.out

#- 66 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "RzWek2gZvRrvr0n9", "key": "d9lvccKMLhrTrcBE"}' \
    > test.out 2>&1
eval_tap $? 66 'PostGameBinaryRecordV1' test.out

#- 67 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["2ItBS3KtKZWe8aoF", "zAyBME74HUtipUWY", "hWV1qx8CzPML52fa"]}' \
    > test.out 2>&1
eval_tap $? 67 'BulkGetGameBinaryRecordV1' test.out

#- 68 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'XUr9Sk4lq2faBcAX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 68 'GetGameBinaryRecordV1' test.out

#- 69 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'XKlhvyH8paOJtxqM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "PpcVfRwNj547fH0X", "file_location": "rKEDpEY8VnocGAjc"}' \
    > test.out 2>&1
eval_tap $? 69 'PutGameBinaryRecordV1' test.out

#- 70 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'i0V3tBf2jnHGKXph' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 70 'DeleteGameBinaryRecordV1' test.out

#- 71 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'n50c9tNLDljhZ2jx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "LRX3z46OCaGBeMfP"}' \
    > test.out 2>&1
eval_tap $? 71 'PostGameBinaryPresignedURLV1' test.out

#- 72 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'lNos4yBRjrERHEon' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "1984-09-27T00:00:00Z", "value": {"ZR8GmEu0q1p6QCyY": {}, "6vSkVFWdsbYuVEGV": {}, "xYheR3j5mNZ6vwv7": {}}}' \
    > test.out 2>&1
eval_tap $? 72 'PutGameRecordConcurrentHandlerV1' test.out

#- 73 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["K8Asvt1j1Rx59hes", "NWy2NvZ85DDKDAF8", "KDsBZOuYQJ03BAHZ"]}' \
    > test.out 2>&1
eval_tap $? 73 'GetGameRecordsBulk' test.out

#- 74 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key '7c53q7akMpcmnnx6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 74 'GetGameRecordHandlerV1' test.out

#- 75 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'RVBrop9v7aZK3h65' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 75 'PutGameRecordHandlerV1' test.out

#- 76 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'hbN15zfQSfQrtfF3' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 76 'PostGameRecordHandlerV1' test.out

#- 77 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'TQN0OcNDLr36vzoh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 77 'DeleteGameRecordHandlerV1' test.out

#- 78 PublicListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 78 'PublicListTagsHandlerV1' test.out

#- 79 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'iOMZfEhHr39pysFO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["3Zvc1BZG99LyvfvH", "EsJKQQewVLMUoAna", "RcYp7FUjfIGaffof"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 80 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'lEIByYqeKN0meGel' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["YF5wWaDhukU4khGG", "4vZFTYnPkmSu4PWa", "m1jxR7SETWjteoc8"]}' \
    > test.out 2>&1
eval_tap $? 80 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 81 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '51' \
    --query 'gvZDDhoO05oKqymx' \
    --tags 'LD1Lcvw6T6mZEiwx,xElpMYSWIeVzm7z9,noowmlTIKVowi0RY' \
    > test.out 2>&1
eval_tap $? 81 'ListMyBinaryRecordsV1' test.out

#- 82 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["2VN4ZONJREdUQ3z9", "F1BxNNgnke4akncw", "7wu9TmXfJWBPrx9N"]}' \
    > test.out 2>&1
eval_tap $? 82 'BulkGetMyBinaryRecordV1' test.out

#- 83 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '61' \
    --tags '8eLzYEvwSWTaLQjc,tvrK2jhsYpKPlXn7,7AtYoFzLAATPY8P8' \
    > test.out 2>&1
eval_tap $? 83 'RetrievePlayerRecords' test.out

#- 84 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["P3cfoivvQxevecWw", "7Rry0KK5rgAGO0dW", "8rX2MVUGKSZ4GcLk"]}' \
    > test.out 2>&1
eval_tap $? 84 'GetPlayerRecordsBulkHandlerV1' test.out

#- 85 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 't4pK32sJxlZcCTpT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 85 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 86 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dRtCHvuk6B6XTmSL' \
    --body '{"file_type": "yn50sigBVZxiKdV5", "is_public": true, "key": "vRyd9UuL02Le8HSC"}' \
    > test.out 2>&1
eval_tap $? 86 'PostPlayerBinaryRecordV1' test.out

#- 87 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'slsDd4M1F5qRIblS' \
    --limit '99' \
    --offset '81' \
    --tags 'BZVGLlkUetzCAWc9,x1aMjgGim51T107X,IZRZ7tZdIs0xf4cz' \
    > test.out 2>&1
eval_tap $? 87 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 88 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dt7zqmSKxOEQlVcx' \
    --body '{"keys": ["6GqsBq8vdhWVnuYL", "gpZehK0G2nmyuViB", "9kRTcSQdTnNYGeAf"]}' \
    > test.out 2>&1
eval_tap $? 88 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 89 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'YFG3wSkHKufBdS3Z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OokZB4cXnAXyuGz6' \
    > test.out 2>&1
eval_tap $? 89 'GetPlayerBinaryRecordV1' test.out

#- 90 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'LlxHv8SwyagYvDJ3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w3UNgIGj2jZtEYT8' \
    --body '{"content_type": "sIPSE1XXPzySa0sZ", "file_location": "oFS6xCOWMpyh9pMs"}' \
    > test.out 2>&1
eval_tap $? 90 'PutPlayerBinaryRecordV1' test.out

#- 91 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'Qgb64ELbzDMwyo4n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IRysQdbufXjYnSoI' \
    > test.out 2>&1
eval_tap $? 91 'DeletePlayerBinaryRecordV1' test.out

#- 92 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'FeouC2m38kXrDZWl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GVE9sJ4NpUtKp6M9' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 92 'PutPlayerBinaryRecorMetadataV1' test.out

#- 93 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key '6nEwnZhsjwJeGwaP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SDMZz95OYKiqaZD6' \
    --body '{"file_type": "3xe5rruJVfLGea0Z"}' \
    > test.out 2>&1
eval_tap $? 93 'PostPlayerBinaryPresignedURLV1' test.out

#- 94 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'tlzUcuHAXz0UV31M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fuGaXsAuGsZaSHev' \
    > test.out 2>&1
eval_tap $? 94 'GetPlayerPublicBinaryRecordsV1' test.out

#- 95 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'O0TQNEI3kfabxJWW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SI1ECUo1NPpeFhUz' \
    --responseBody  \
    --body '{"updatedAt": "1981-09-10T00:00:00Z", "value": {"XDgB7n4C97uAPP8P": {}, "ATLpUpxeJlsBJT6H": {}, "h3OMjAjq2mK8lbSE": {}}}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 96 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'Eelxnb5QxWG2HFnZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lA6HKWW4fI1IQcoB' \
    --responseBody  \
    --body '{"updatedAt": "1993-08-20T00:00:00Z", "value": {"ELcNlZkqTZrKgXNw": {}, "vm4e5GX6H742Oixh": {}, "tAoKiVm6URT95Xhn": {}}}' \
    > test.out 2>&1
eval_tap $? 96 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 97 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UcvWB28MpusuhhDJ' \
    --limit '56' \
    --offset '38' \
    --tags 'a36KNzjf005CXNGe,hQ2aTjTDfKFDXC7e,GL5YhJDWh9YWqc0q' \
    > test.out 2>&1
eval_tap $? 97 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 98 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gV6d9yOfIMLds2Db' \
    --body '{"keys": ["PcaoMdtRLTmSvTkQ", "QgB7exYvmHMxr5hP", "CJJztJBg0tTJg46I"]}' \
    > test.out 2>&1
eval_tap $? 98 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 99 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'ewOXE2AkCh3QIZsU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f8lGFXcmwTERHclO' \
    > test.out 2>&1
eval_tap $? 99 'GetPlayerRecordHandlerV1' test.out

#- 100 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'dxIwqejxe18rNdb8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Otq6j1mqUav7k05H' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 100 'PutPlayerRecordHandlerV1' test.out

#- 101 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'AQltnSojV4jT65yc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lX2FtAz0vJjFIYWO' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 101 'PostPlayerRecordHandlerV1' test.out

#- 102 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'aNdsimmkW2miH3xR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'HAKy4QxZkaXZ7vmi' \
    > test.out 2>&1
eval_tap $? 102 'DeletePlayerRecordHandlerV1' test.out

#- 103 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'Ed0JPxVyQpshaDwN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qTbbFMXAMfVXe0GZ' \
    > test.out 2>&1
eval_tap $? 103 'GetPlayerPublicRecordHandlerV1' test.out

#- 104 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'eMgsRsmH1EQrYmkP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KTPOlhTtSiZNCxuo' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 104 'PutPlayerPublicRecordHandlerV1' test.out

#- 105 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'gFteTHJe4BhSSQkQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D6WmOt6D7ufFVTOh' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 105 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE