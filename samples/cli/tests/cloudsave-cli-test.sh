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

#- 8 AdminListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '50' \
    --offset '83' \
    --query 'E3cwyALczNIicXm7' \
    --tags 'agSrjJW2OQNOs1PX,hT5FvdiRilZ7oFgx,4c8OumKtPDKJDXn7' \
    > test.out 2>&1
eval_tap $? 8 'AdminListGameBinaryRecordsV1' test.out

#- 9 AdminPostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "Z4U68su8XfqlqNiT", "key": "vB6SdAdIhUDrwoZ5", "set_by": "CLIENT", "ttl_config": {"action": "DELETE", "expires_at": "1979-01-18T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPostGameBinaryRecordV1' test.out

#- 10 AdminGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameBinaryRecordV1 \
    --key 'Xpc1C8XfwHuKeb9l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetGameBinaryRecordV1' test.out

#- 11 AdminPutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecordV1 \
    --key '3rGN9A3sNm84hddS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "pHt0P7MIIR7CkyF6", "file_location": "C7duuyZ0GhDogqrh"}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutGameBinaryRecordV1' test.out

#- 12 AdminDeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameBinaryRecordV1 \
    --key 'BRd8lDR6qVNPRZYd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminDeleteGameBinaryRecordV1' test.out

#- 13 AdminPutGameBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameBinaryRecorMetadataV1 \
    --key 'FLIAjGGJddVCvu9v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER", "tags": ["SevkLGMS0lyuI9a2", "I9u6Vpbsx5w8hqUI", "06UpOXGSLmCVuHOP"], "ttl_config": {"action": "DELETE", "expires_at": "1980-11-07T00:00:00Z"}}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutGameBinaryRecorMetadataV1' test.out

#- 14 AdminPostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameBinaryPresignedURLV1 \
    --key 'NveabntBSxTeIv53' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "HGCiljvjKoyD6SCw"}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostGameBinaryPresignedURLV1' test.out

#- 15 DeleteGameBinaryRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordTTLConfig \
    --key 'GrncqmLtjQHAf8Tg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'DeleteGameBinaryRecordTTLConfig' test.out

#- 16 AdminPutAdminGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminGameRecordConcurrentHandlerV1 \
    --key 'oNm03VLisV6zwPuo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"tags": ["3td6TC6I3lMjGSWN", "2laRlxfcjHfYakUC", "TqGkE7wcWfDslpJS"], "updatedAt": "1979-07-19T00:00:00Z", "value": {"GAXQ0yYoNRKd3IL5": {}, "TAQ6iiPlSC2uE4o5": {}, "Vwdo3fePqIJA8IHt": {}}}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 17 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'rkmu0hpDDWVAla2l' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER", "tags": ["AAiE0mit9RGCCHYz", "UOcEdscKHPEqgA8y", "u7Vk6Jt4Ymos9Jcd"], "ttl_config": {"action": "DELETE", "expires_at": "1979-06-02T00:00:00Z"}, "updatedAt": "1981-10-09T00:00:00Z", "value": {"fYcTVU6RBt0zYoMc": {}, "HyCUEXlAvxJMdalw": {}, "SyliWMNW5NyLu0M3": {}}}' \
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
    --body '{"appConfig": {"appName": "VHh2EI8JlDbPWbQ6"}, "customConfig": {"GRPCAddress": "Q9lNmqRBaAkLnvxk"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": true, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": true, "afterReadPlayerRecord": true, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": true, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
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
    --body '{"appConfig": {"appName": "MyKrQpM4hkkK6KKX"}, "customConfig": {"GRPCAddress": "NB3Gv0IqmF51Tkhj"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": true, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": false, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": true, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": true, "beforeWritePlayerRecord": false}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePluginConfig' test.out

#- 22 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'EejtGeoyIPa8ZRrv' \
    --tags 'jj7il35MXbN9oCMN,qq98SjTvhZNkSQ70,D0H6BXksUC9b6i5l' \
    --limit '30' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 22 'ListGameRecordsHandlerV1' test.out

#- 23 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'D3Qgb3boLQQ1MzH7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminGetGameRecordHandlerV1' test.out

#- 24 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'Qm8bwbmXgdAPh1ET' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPutGameRecordHandlerV1' test.out

#- 25 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'hG96gAFKK2WDgCcx' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPostGameRecordHandlerV1' test.out

#- 26 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'vONZm3EeERmDnyeF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'AdminDeleteGameRecordHandlerV1' test.out

#- 27 DeleteGameRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordTTLConfig \
    --key 'oF7VSZ6pf3vneSD2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameRecordTTLConfig' test.out

#- 28 AdminListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 28 'AdminListTagsHandlerV1' test.out

#- 29 AdminPostTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "b3g7mSQUhAEtrmjq"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminPostTagHandlerV1' test.out

#- 30 AdminDeleteTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --tag 'U6YE3p4lSck0ZHn5' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTagHandlerV1' test.out

#- 31 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'GI39YBHqaTHeKtW1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["8iGeUlc9d9sogWa2", "4CKNS0GqVvUfHQvs", "HXNUNe4mhgo5QB65"]}' \
    > test.out 2>&1
eval_tap $? 31 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 32 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["lSAiYnNjkfZrQvGg", "bLdLsFzHkBMr1yrO", "MlNFSrUEirnjX9fD"], "user_id": "mIbeZxzfTcyiuATu"}, {"keys": ["s9hsfpFDcSDG8aMV", "GLiBNrDjqoxcwgGL", "XpUL4pp2ncYAHdNz"], "user_id": "DmeIP6rOvDz9KOsb"}, {"keys": ["392k6YmJFfRByjlB", "iuFM3FIoVk8T3GpA", "nkCmBUqg2SCnqntX"], "user_id": "9y1aZSWMiVi10sG6"}]}' \
    > test.out 2>&1
eval_tap $? 32 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 33 ListPlayerRecordHandlerV1
eval_tap 0 33 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 34 AdminBulkPutPlayerRecordsByKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkPutPlayerRecordsByKeyHandlerV1 \
    --key 'vxkfUcmqRRbceJ5i' \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"user_id": "0EeDxOgBnhhqElIa", "value": {"Dml48wdNFLTm5T50": {}, "x9WT0GfH2rtOa4EX": {}, "sXzOXQAk4mqrxzTt": {}}}, {"user_id": "uLl4XlbGL8QOxtjz", "value": {"m8y2wNhmwoYZyI4E": {}, "FZKBcYrCEAE7WIsf": {}, "mx40NLRc6m8heKnW": {}}}, {"user_id": "hzfe2NubeoKFeIaF", "value": {"QCYoDPICpnduEEQl": {}, "ULdJz4mnRBkMNxvv": {}, "KgAT8mJrYq6hRklo": {}}}]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminBulkPutPlayerRecordsByKeyHandlerV1' test.out

#- 35 AdminBulkGetPlayerRecordsByUserIDsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetPlayerRecordsByUserIDsHandlerV1 \
    --key 'qxM3gpwxcfMy9Xzj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["jI5YbsKoADkzJEN2", "VHzih3bit0VWn3CO", "39PXDNxtXgeO3Fgk"]}' \
    > test.out 2>&1
eval_tap $? 35 'AdminBulkGetPlayerRecordsByUserIDsHandlerV1' test.out

#- 36 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XhjDzaQY3snn2ZkP' \
    --limit '61' \
    --offset '4' \
    --query 'MMAXFaY9eKa699bR' \
    --tags 'VhyaKwwrAP2aMlu7,WtjCtoYetOO847g8,OudOfjnCuHZ3c46I' \
    > test.out 2>&1
eval_tap $? 36 'AdminListAdminUserRecordsV1' test.out

#- 37 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'jGa23YvYmmDg7VYP' \
    --body '{"keys": ["XIuvUYTZBRujIUE1", "Tq5jyAZvkRCMNFIu", "rjh2imdb4rbkXj0Z"]}' \
    > test.out 2>&1
eval_tap $? 37 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 38 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'wsVC0gL97ZVJSPqJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iwv1qlYB1RSKs6gQ' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetAdminPlayerRecordV1' test.out

#- 39 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'xC3Gb7S0o4zGYY7K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QI1AeFgPqaOkvo1a' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 39 'AdminPutAdminPlayerRecordV1' test.out

#- 40 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'olB4lkKB4EYOkQ1j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MD3cym8xIfkOVW2g' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPostPlayerAdminRecordV1' test.out

#- 41 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'rREOLx0KOww3HICQ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lfl7MUBG7qtPu64y' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAdminPlayerRecordV1' test.out

#- 42 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'AtURKLRkb738HGS6' \
    --limit '35' \
    --offset '86' \
    --query 'DgMdIIlhS1fSiM93' \
    --tags '31m7Ta1PsKc50Kv6,ecnEevcAx2K2zkRe,nmPZnGBt4P7WnbdS' \
    > test.out 2>&1
eval_tap $? 42 'AdminListPlayerBinaryRecordsV1' test.out

#- 43 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JtjX7ZshZyZl5x4b' \
    --body '{"file_type": "RXBHUTrDzZSKscfO", "is_public": false, "key": "1DN9LFkYW5DQyj4b", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPostPlayerBinaryRecordV1' test.out

#- 44 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'FCmpo6sPwVOEDSJs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EK5QpNhlI2iS5EpG' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPlayerBinaryRecordV1' test.out

#- 45 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'hhvXYck0upMzUYnb' \
    --namespace "$AB_NAMESPACE" \
    --userId '76tFkEORV3bu1bNC' \
    --body '{"content_type": "tX7W40V6Do5sYadC", "file_location": "CFrHHC3DpZxkrQDX"}' \
    > test.out 2>&1
eval_tap $? 45 'AdminPutPlayerBinaryRecordV1' test.out

#- 46 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'uNFviMarv8mnfHK8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CCmE2lPnsbD3SGEd' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeletePlayerBinaryRecordV1' test.out

#- 47 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'lwuUccE536ugBp3H' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BvepnDCjgyJlXe36' \
    --body '{"is_public": false, "set_by": "CLIENT", "tags": ["nx4V709xbnGezKsD", "wG2omOR2nvYI9TVq", "JdvzcWbfUpaXp5JM"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 48 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'l5LL4bTxBmZjdrrI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xsB0NRsB1fPqqRRu' \
    --body '{"file_type": "lpqpymDkQhtrHWwR"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 49 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'VnwVBOqOHi8pWGd1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'juYhiqjRJOqB5F93' \
    --responseBody  \
    --body '{"tags": ["zFQbJndUDpdONneA", "czbBdHb2slt71B1S", "mZp2JZp50CnPb71O"], "updatedAt": "1993-04-27T00:00:00Z", "value": {"YcmQbTU5JX8ccLjM": {}, "XJRk0eaKQDOJvrTe": {}, "fglSs6g4iY9u02aC": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 50 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'NYIWekp18lOC3mNq' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F7Bl0LcghVHfPEsp' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["3CfR3ncDlwi3v3MF", "FJ1KesKoELCpobBE", "G8X645xpdXpai0rY"], "ttl_config": {"action": "DELETE", "expires_at": "1994-07-11T00:00:00Z"}, "updatedAt": "1975-07-26T00:00:00Z", "value": {"OPjaf3H0tYighU0V": {}, "UfcYHJbBfAKSiPW3": {}, "VgsZXiR1DJ7HVWqM": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 51 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'kNSawQUWDFJvJBWi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'c7UkBeIXuqDuAXI6' \
    --responseBody  \
    --body '{"set_by": "CLIENT", "tags": ["bQ71w0deoV9Lx5RD", "A1l2XcrciYNEzvSZ", "IPkhSgORcz5S5Bvm"], "ttl_config": {"action": "DELETE", "expires_at": "1985-11-05T00:00:00Z"}, "updatedAt": "1981-07-10T00:00:00Z", "value": {"vuKNuy0ytZQ7M6Nz": {}, "y1adnSKOLFKx1dX4": {}, "LuWJu3pDMUAeeZ97": {}}}' \
    > test.out 2>&1
eval_tap $? 51 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 52 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'SBROPYuG6XqP6oo7' \
    --limit '67' \
    --offset '52' \
    --query '73zdxTgOfnwIdlNa' \
    --tags '29fDLh741IslKHzG,lLKWUtDQs61OQAox,yyQpRWCiiPDGQhNP' \
    > test.out 2>&1
eval_tap $? 52 'AdminRetrievePlayerRecords' test.out

#- 53 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EwiJCf2XJVrlzqQl' \
    --body '{"data": [{"key": "s1ozhLVA3kE8jKvg", "value": {"atOEBM70TdlNBJYO": {}, "mpu1VCarzBsV6xnZ": {}, "5Jrzzjrcaug6CWVG": {}}}, {"key": "8SWP3glU6muswVJn", "value": {"NnN7kAa7j0riFc5H": {}, "THQIoVsGo7dwV9DB": {}, "qFKHQkETJyTlUrwD": {}}}, {"key": "TnoujQD4IEiH9Z5q", "value": {"Xn3aoRtlqOECohVi": {}, "HA5CzgFSy8X1A3Pr": {}, "Ifapq5AAeMe4L3mD": {}}}]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerRecordsHandlerV1' test.out

#- 54 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'WORBVXTIIJM9XsYI' \
    --body '{"keys": ["IZxiXNMR9BgaWcFX", "3SUBhyoTsMWPAxUM", "kawaGpAyrIwMif3B"]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetPlayerRecordsHandlerV1' test.out

#- 55 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'OdkocVTd4BxqGWV6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mTJ0sQs6XNbjvqhn' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerRecordHandlerV1' test.out

#- 56 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'UVLWu8olKdxL6ozR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mDD0jJvlfV5OemPY' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 56 'AdminPutPlayerRecordHandlerV1' test.out

#- 57 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'dYT7DROCjtuzFMbA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'G9YI89hmguB8FOTj' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'AdminPostPlayerRecordHandlerV1' test.out

#- 58 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'MLo4b9rIzqYkEpst' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yVTBcrM8rG0rH0zc' \
    > test.out 2>&1
eval_tap $? 58 'AdminDeletePlayerRecordHandlerV1' test.out

#- 59 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'swwVeMK6MbGIVIu8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vvwLc7KY3uVoJXTI' \
    > test.out 2>&1
eval_tap $? 59 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 60 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'MtpgkieDyF97lGdM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iHKxbWCYzo8yO2KT' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 60 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 61 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'K9tmmOnYnOpas6gh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'P1y4Zi7s7QBlk44Z' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 61 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 62 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key '44B1GZgKg4uKxaCg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cGLuC3brWdTYCfHk' \
    > test.out 2>&1
eval_tap $? 62 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 63 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'IySok5DiXZtLW87r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gysryod3dNQrmsAp' \
    > test.out 2>&1
eval_tap $? 63 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 64 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '21' \
    --query 'A6HX3RwrKt2ecozL' \
    --tags '0TOg54vCE48L5oLF,6M4lNa4JUMSHNgqR,qCV7usamANkZlOX9' \
    > test.out 2>&1
eval_tap $? 64 'ListGameBinaryRecordsV1' test.out

#- 65 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "Sfo95HgXqKhTPkwf", "key": "LM9uSybRzWek2gZv"}' \
    > test.out 2>&1
eval_tap $? 65 'PostGameBinaryRecordV1' test.out

#- 66 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["Rrvr0n9d9lvccKML", "hrTrcBE2ItBS3KtK", "ZWe8aoFzAyBME74H"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetGameBinaryRecordV1' test.out

#- 67 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'UtipUWYhWV1qx8Cz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetGameBinaryRecordV1' test.out

#- 68 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'PML52faXUr9Sk4lq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "2faBcAXXKlhvyH8p", "file_location": "aOJtxqMPpcVfRwNj"}' \
    > test.out 2>&1
eval_tap $? 68 'PutGameBinaryRecordV1' test.out

#- 69 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key '547fH0XrKEDpEY8V' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameBinaryRecordV1' test.out

#- 70 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'nocGAjci0V3tBf2j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "nHGKXphn50c9tNLD"}' \
    > test.out 2>&1
eval_tap $? 70 'PostGameBinaryPresignedURLV1' test.out

#- 71 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'ljhZ2jxLRX3z46OC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "1971-08-13T00:00:00Z", "value": {"GBeMfPlNos4yBRjr": {}, "ERHEonAZR8GmEu0q": {}, "1p6QCyY6vSkVFWds": {}}}' \
    > test.out 2>&1
eval_tap $? 71 'PutGameRecordConcurrentHandlerV1' test.out

#- 72 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["bYuVEGVxYheR3j5m", "NZ6vwv7K8Asvt1j1", "Rx59hesNWy2NvZ85"]}' \
    > test.out 2>&1
eval_tap $? 72 'GetGameRecordsBulk' test.out

#- 73 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'DDKDAF8KDsBZOuYQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetGameRecordHandlerV1' test.out

#- 74 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'J03BAHZ7c53q7akM' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 74 'PutGameRecordHandlerV1' test.out

#- 75 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'pcmnnx6RVBrop9v7' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 75 'PostGameRecordHandlerV1' test.out

#- 76 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'aZK3h65hbN15zfQS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteGameRecordHandlerV1' test.out

#- 77 PublicListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 77 'PublicListTagsHandlerV1' test.out

#- 78 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'QrtfF3TQN0OcNDLr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["36vzohZyjMQAg5mP", "YhrLTyU8OhgfY9JQ", "YGF4bYXEcENx9xZl"]}' \
    > test.out 2>&1
eval_tap $? 78 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'Achob44lONDDwMvg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["I0HlyPR7wZNiVsF6", "xG2mXEQdbzIVy8al", "ncV7vWgSHdfo07Uc"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 80 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '24' \
    --query 'PErqxyMyOK06MqQB' \
    --tags 'ErxgjVBycvU4PbmR,Dcrg0DjQjBECXvea,7H1m2lJFRZ3ZprZ6' \
    > test.out 2>&1
eval_tap $? 80 'ListMyBinaryRecordsV1' test.out

#- 81 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["0zMjhTHeh94TSenE", "5hCFkIf5weqZ18MH", "57l2Zsrh90ETtYmG"]}' \
    > test.out 2>&1
eval_tap $? 81 'BulkGetMyBinaryRecordV1' test.out

#- 82 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --offset '9' \
    --tags 'kz3MnlrjcHp6B8Vj,7rXFgDnDkdZ9bpjb,1tdA3QhjCMW64f4X' \
    > test.out 2>&1
eval_tap $? 82 'RetrievePlayerRecords' test.out

#- 83 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["hIjSoTB2NMKtezap", "Pr2QEPx3zTxBGtEJ", "IYppuUSsKoHw2hyd"]}' \
    > test.out 2>&1
eval_tap $? 83 'GetPlayerRecordsBulkHandlerV1' test.out

#- 84 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key '12uSE7BEv3aevq6i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 85 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ohU1cg4W1IS3Uv1B' \
    --body '{"file_type": "pWoJBaqdg2FHcuns", "is_public": true, "key": "1lnaO2m9vqjhbeK2"}' \
    > test.out 2>&1
eval_tap $? 85 'PostPlayerBinaryRecordV1' test.out

#- 86 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'qN8g6x2PyYDo5R3h' \
    --limit '77' \
    --offset '17' \
    --tags '2Le8HSCslsDd4M1F,5qRIblS7Nz81GRaz,PAANjfBoldFOyqA2' \
    > test.out 2>&1
eval_tap $? 86 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 87 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'clJ5gEOaCgM6Yn6R' \
    --body '{"keys": ["ugbNEIpGBFUjOn5m", "M7k8nbLzvtCIW5yn", "MKquUicAeIVXtoWA"]}' \
    > test.out 2>&1
eval_tap $? 87 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 88 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'XhMlW4tLqX7OICf5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oD1e6oI9FmYel0kO' \
    > test.out 2>&1
eval_tap $? 88 'GetPlayerBinaryRecordV1' test.out

#- 89 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'w72o8Zkgk0jS6rDW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UwfhKvrf2AaH4yCW' \
    --body '{"content_type": "rHSppnIZkNnTn3rz", "file_location": "H5NvAtcvNedgS1fU"}' \
    > test.out 2>&1
eval_tap $? 89 'PutPlayerBinaryRecordV1' test.out

#- 90 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'fKmihDbmu8ePWlQM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VDXEHeiGTnwyEw6h' \
    > test.out 2>&1
eval_tap $? 90 'DeletePlayerBinaryRecordV1' test.out

#- 91 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'IWDZrpP7rz3ISW51' \
    --namespace "$AB_NAMESPACE" \
    --userId '0kHr4isTKWjmv67n' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerBinaryRecorMetadataV1' test.out

#- 92 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key '8kXrDZWlGVE9sJ4N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pUtKp6M9I6nEwnZh' \
    --body '{"file_type": "sjwJeGwaPSDMZz95"}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerBinaryPresignedURLV1' test.out

#- 93 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'OYKiqaZD63xe5rru' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JVfLGea0ZtlzUcuH' \
    > test.out 2>&1
eval_tap $? 93 'GetPlayerPublicBinaryRecordsV1' test.out

#- 94 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'AXz0UV31MfuGaXsA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uGsZaSHevO0TQNEI' \
    --responseBody  \
    --body '{"updatedAt": "1999-03-19T00:00:00Z", "value": {"yppBHoytVznCgNyx": {}, "9fbT63ShEh8PbGik": {}, "Ljgjcj34uulU6FYB": {}}}' \
    > test.out 2>&1
eval_tap $? 94 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 95 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'ZsWFbr3RSP0W9nBh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vhf8Q0DtJMcYQdN6' \
    --responseBody  \
    --body '{"updatedAt": "1983-01-07T00:00:00Z", "value": {"WG2HFnZlA6HKWW4f": {}, "I1IQcoBQELcNlZkq": {}, "TZrKgXNwvm4e5GX6": {}}}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 96 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'H742OixhtAoKiVm6' \
    --limit '95' \
    --offset '44' \
    --tags 'RT95XhnUcvWB28Mp,usuhhDJ5slzgiWZE,tyd56LfxnbY97jjY' \
    > test.out 2>&1
eval_tap $? 96 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 97 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'gXchCbkXX26uEdCf' \
    --body '{"keys": ["QaMAQuTKfC0I2kNj", "CMDtDMrentgn3Dhq", "ciwIeShF9RKb9vvx"]}' \
    > test.out 2>&1
eval_tap $? 97 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 98 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'uJlhXbWhbwPwToC6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'knjVwVnzaqSfJiQF' \
    > test.out 2>&1
eval_tap $? 98 'GetPlayerRecordHandlerV1' test.out

#- 99 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'C2gXoda0kg16yUSp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SOAjHJWwfCjYwWkL' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 99 'PutPlayerRecordHandlerV1' test.out

#- 100 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'ob9gKLqs2nEZhpBy' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fHZinxNfgPAwkMBs' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 100 'PostPlayerRecordHandlerV1' test.out

#- 101 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'znlBUqnLT4AbGptK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aWNvPbpg7yrRvXfZ' \
    > test.out 2>&1
eval_tap $? 101 'DeletePlayerRecordHandlerV1' test.out

#- 102 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key '6rvgvEY3Hht1SwqT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sKKKo37NHDOQe91P' \
    > test.out 2>&1
eval_tap $? 102 'GetPlayerPublicRecordHandlerV1' test.out

#- 103 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 's3ztUIV0dS6hIH9c' \
    --namespace "$AB_NAMESPACE" \
    --userId '4VfkyrwpuXxbaERb' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 103 'PutPlayerPublicRecordHandlerV1' test.out

#- 104 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'fgPmi0eHkt1mr9EO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IFg0dnWIYN2NVL70' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 104 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE