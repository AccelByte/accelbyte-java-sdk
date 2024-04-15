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
    --body '{"tags": ["3td6TC6I3lMjGSWN", "2laRlxfcjHfYakUC", "TqGkE7wcWfDslpJS"], "updatedAt": "qGAXQ0yYoNRKd3IL", "value": {"5TAQ6iiPlSC2uE4o": {}, "5Vwdo3fePqIJA8IH": {}, "trkmu0hpDDWVAla2": {}}}' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutAdminGameRecordConcurrentHandlerV1' test.out

#- 17 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'l5BYNtIuS5S5XUdj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "SERVER", "tags": ["YzUOcEdscKHPEqgA", "8yu7Vk6Jt4Ymos9J", "cdos4fYcTVU6RBt0"], "ttl_config": {"action": "DELETE", "expires_at": "1987-04-24T00:00:00Z"}, "updatedAt": "5dAgqxpBFmaLoxoz", "value": {"r6wfNPX2bOItRMvq": {}, "tlB2jJCSQT279ZZP": {}, "YGu0rdlgdWyOtXi3": {}}}' \
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
    --body '{"appConfig": {"appName": "choQrpOsDBU5Sepj"}, "customConfig": {"GRPCAddress": "ChB3V0v52Dlym6pu"}, "customFunction": {"afterBulkReadGameBinaryRecord": true, "afterBulkReadGameRecord": true, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": true, "afterReadGameBinaryRecord": false, "afterReadGameRecord": true, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": true, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": false, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": false}, "extendType": "APP"}' \
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
    --body '{"appConfig": {"appName": "p44YUDjasWIPUvmE"}, "customConfig": {"GRPCAddress": "ejtGeoyIPa8ZRrvj"}, "customFunction": {"afterBulkReadGameBinaryRecord": false, "afterBulkReadGameRecord": false, "afterBulkReadPlayerBinaryRecord": false, "afterBulkReadPlayerRecord": false, "afterReadGameBinaryRecord": false, "afterReadGameRecord": false, "afterReadPlayerBinaryRecord": false, "afterReadPlayerRecord": false, "beforeWriteAdminGameRecord": false, "beforeWriteAdminPlayerRecord": false, "beforeWriteGameBinaryRecord": false, "beforeWriteGameRecord": true, "beforeWritePlayerBinaryRecord": false, "beforeWritePlayerRecord": true}, "extendType": "CUSTOM"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdatePluginConfig' test.out

#- 22 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'SP0pf4IxjUkl535X' \
    --tags '3ateEKDpADz1x3po,D3Qgb3boLQQ1MzH7,Qm8bwbmXgdAPh1ET' \
    --limit '16' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 22 'ListGameRecordsHandlerV1' test.out

#- 23 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'G96gAFKK2WDgCcxv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'AdminGetGameRecordHandlerV1' test.out

#- 24 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'ONZm3EeERmDnyeFo' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPutGameRecordHandlerV1' test.out

#- 25 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'F7VSZ6pf3vneSD2T' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPostGameRecordHandlerV1' test.out

#- 26 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'b3g7mSQUhAEtrmjq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'AdminDeleteGameRecordHandlerV1' test.out

#- 27 DeleteGameRecordTTLConfig
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordTTLConfig \
    --key 'U6YE3p4lSck0ZHn5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameRecordTTLConfig' test.out

#- 28 AdminListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '67' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 28 'AdminListTagsHandlerV1' test.out

#- 29 AdminPostTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"tag": "I39YBHqaTHeKtW18"}' \
    > test.out 2>&1
eval_tap $? 29 'AdminPostTagHandlerV1' test.out

#- 30 AdminDeleteTagHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteTagHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --tag 'iGeUlc9d9sogWa24' \
    > test.out 2>&1
eval_tap $? 30 'AdminDeleteTagHandlerV1' test.out

#- 31 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'CKNS0GqVvUfHQvsH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["XNUNe4mhgo5QB65l", "SAiYnNjkfZrQvGgb", "LdLsFzHkBMr1yrOM"]}' \
    > test.out 2>&1
eval_tap $? 31 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 32 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["lNFSrUEirnjX9fDm", "IbeZxzfTcyiuATus", "9hsfpFDcSDG8aMVG"], "user_id": "LiBNrDjqoxcwgGLX"}, {"keys": ["pUL4pp2ncYAHdNzD", "meIP6rOvDz9KOsb3", "92k6YmJFfRByjlBi"], "user_id": "uFM3FIoVk8T3GpAn"}, {"keys": ["kCmBUqg2SCnqntX9", "y1aZSWMiVi10sG6v", "xkfUcmqRRbceJ5i0"], "user_id": "EeDxOgBnhhqElIaD"}]}' \
    > test.out 2>&1
eval_tap $? 32 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 33 ListPlayerRecordHandlerV1
eval_tap 0 33 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 34 AdminBulkPutPlayerRecordsByKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkPutPlayerRecordsByKeyHandlerV1 \
    --key 'ml48wdNFLTm5T50x' \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"user_id": "9WT0GfH2rtOa4EXs", "value": {"XzOXQAk4mqrxzTtu": {}, "Ll4XlbGL8QOxtjzm": {}, "8y2wNhmwoYZyI4EF": {}}}, {"user_id": "ZKBcYrCEAE7WIsfm", "value": {"x40NLRc6m8heKnWh": {}, "zfe2NubeoKFeIaFQ": {}, "CYoDPICpnduEEQlU": {}}}, {"user_id": "LdJz4mnRBkMNxvvK", "value": {"gAT8mJrYq6hRkloq": {}, "xM3gpwxcfMy9Xzjj": {}, "I5YbsKoADkzJEN2V": {}}}]}' \
    > test.out 2>&1
eval_tap $? 34 'AdminBulkPutPlayerRecordsByKeyHandlerV1' test.out

#- 35 AdminBulkGetPlayerRecordsByUserIDsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetPlayerRecordsByUserIDsHandlerV1 \
    --key 'Hzih3bit0VWn3CO3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["9PXDNxtXgeO3FgkX", "hjDzaQY3snn2ZkP7", "cFdP43e5dC9XIBud"]}' \
    > test.out 2>&1
eval_tap $? 35 'AdminBulkGetPlayerRecordsByUserIDsHandlerV1' test.out

#- 36 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fZgrbHDIDm4hMzF4' \
    --limit '93' \
    --offset '100' \
    --tags 'xodenSrUTvfqU0bf,oMm5cTtFWbotQyXJ,RcQWsmqPNs92epxk' \
    > test.out 2>&1
eval_tap $? 36 'AdminListAdminUserRecordsV1' test.out

#- 37 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '0i8VxsZNereSvf96' \
    --body '{"keys": ["99mCEHThUJkETAsS", "p7gh4TeUTkOkAYfJ", "B8AT9t4Tv207Y2QD"]}' \
    > test.out 2>&1
eval_tap $? 37 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 38 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key '3oD5fLCr3OOlXVv8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZGF7uYnGzpipNDig' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetAdminPlayerRecordV1' test.out

#- 39 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'NJma1MbqqZtfNWql' \
    --namespace "$AB_NAMESPACE" \
    --userId '4nmwAft4gqkNNlWk' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 39 'AdminPutAdminPlayerRecordV1' test.out

#- 40 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'D9eOziYRFOn0jJLH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9LxhvNXTwGBCtoh' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPostPlayerAdminRecordV1' test.out

#- 41 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'Ltl9Zuhytm5UDrT6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QXCs5SPBbRPZTF6o' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAdminPlayerRecordV1' test.out

#- 42 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAXVG7tnsZg5QgXj' \
    --limit '45' \
    --offset '49' \
    --query '1m7Ta1PsKc50Kv6e' \
    --tags 'cnEevcAx2K2zkRen,mPZnGBt4P7WnbdSJ,tjX7ZshZyZl5x4bR' \
    > test.out 2>&1
eval_tap $? 42 'AdminListPlayerBinaryRecordsV1' test.out

#- 43 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XBHUTrDzZSKscfOc' \
    --body '{"file_type": "Yu3dpCROYqUiGKXV", "is_public": true, "key": "Ro2ogaKt2ujQSa3Z", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPostPlayerBinaryRecordV1' test.out

#- 44 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key '5QpNhlI2iS5EpGhh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vXYck0upMzUYnb76' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPlayerBinaryRecordV1' test.out

#- 45 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'tFkEORV3bu1bNCtX' \
    --namespace "$AB_NAMESPACE" \
    --userId '7W40V6Do5sYadCCF' \
    --body '{"content_type": "rHHC3DpZxkrQDXuN", "file_location": "FviMarv8mnfHK8CC"}' \
    > test.out 2>&1
eval_tap $? 45 'AdminPutPlayerBinaryRecordV1' test.out

#- 46 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'mE2lPnsbD3SGEdlw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uUccE536ugBp3HBv' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeletePlayerBinaryRecordV1' test.out

#- 47 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'epnDCjgyJlXe36mg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WjLfFmteue9nzJ6f' \
    --body '{"is_public": false, "set_by": "CLIENT", "tags": ["805tVg8JqU0jZpjv", "sugAOS7u8RiWyerC", "Sa8SRgwsAj1ik1jg"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 48 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'laDXTvKCWwNTAhd2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wrS0uPdjhdinpng5' \
    --body '{"file_type": "BLy8wbhMssAHjapI"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 49 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'kY9Rf4wP57dBZNR8' \
    --namespace "$AB_NAMESPACE" \
    --userId '8YbCtmKy8M9zVrjf' \
    --responseBody  \
    --body '{"tags": ["GXZnqAQUoY1GjlII", "k0iKoTTS1j02o7Jj", "TXAQN0qdskdQV0Tq"], "updatedAt": "I8EFnmDbxIxi4YKl", "value": {"ONk2Q5Y4Jvaizwii": {}, "latuUjjt9lIMGql5": {}, "ElEa9EIIlGcHB3Cf": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 50 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'R3ncDlwi3v3MFFJ1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KesKoELCpobBEG8X' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["Dymtj3giPg4x4yiP", "X6ues1Hhhkg1yLVb", "LFzHEP8cM4NTwr0K"], "ttl_config": {"action": "DELETE", "expires_at": "1996-07-31T00:00:00Z"}, "updatedAt": "iR1DJ7HVWqMkNSaw", "value": {"QUWDFJvJBWic7UkB": {}, "eIXuqDuAXI66bQ71": {}, "w0deoV9Lx5RDA1l2": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 51 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'XcrciYNEzvSZIPkh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SgORcz5S5BvmgBLx' \
    --responseBody  \
    --body '{"set_by": "CLIENT", "tags": ["uKNuy0ytZQ7M6Nzy", "1adnSKOLFKx1dX4L", "uWJu3pDMUAeeZ97S"], "ttl_config": {"action": "DELETE", "expires_at": "1989-12-21T00:00:00Z"}, "updatedAt": "FlAVmVLu4AOec0z8", "value": {"eBeeoip68J1nsv4W": {}, "2OJhtafxMSJlHeb3": {}, "4sZKHcl5LLLOexL4": {}}}' \
    > test.out 2>&1
eval_tap $? 51 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 52 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'fZvWtND2tcBFpX8l' \
    --limit '81' \
    --offset '16' \
    --tags 'tFEJ7tnkY6Mca5af,j12K2IzrBvvWm4ud,E0OXudXgNne8kJAT' \
    > test.out 2>&1
eval_tap $? 52 'AdminRetrievePlayerRecords' test.out

#- 53 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wlc6esUp6Sw1I98j' \
    --body '{"data": [{"key": "eZQ7hfxnhLd3Knak", "value": {"noed9DHhLOqQGhCU": {}, "r6iTrjyEgarAdNJO": {}, "IG36I6tRbRcrEveM": {}}}, {"key": "dAdiPKDUVSC00PYe", "value": {"DcagginxnFIna3yd": {}, "dcbsPheTH26IUJNv": {}, "YuGRUvpZaHCuESOi": {}}}, {"key": "IZsMfB4ZH3mtgWgU", "value": {"4pCAKxeE70CaunQN": {}, "xot371W9G4AvQkqs": {}, "Gnmyo5JJTUVmb8GE": {}}}]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerRecordsHandlerV1' test.out

#- 54 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XFTlEMEsFzYqwgK1' \
    --body '{"keys": ["Np5nodqpLm7FhJBN", "XzAFdO0Khqf6kiTd", "SGv2LFjAKY7CbgsW"]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetPlayerRecordsHandlerV1' test.out

#- 55 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'qFWZX7kPBom8F9GL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LTG8phc3n4iLoIll' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerRecordHandlerV1' test.out

#- 56 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'KlpO2pqiXJF3WGRa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oQomSJC4DdrKF7SU' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 56 'AdminPutPlayerRecordHandlerV1' test.out

#- 57 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'QPLG59e0k5ZtX6wK' \
    --namespace "$AB_NAMESPACE" \
    --userId '7PpUlcIW32iK7MGt' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'AdminPostPlayerRecordHandlerV1' test.out

#- 58 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key '1ixY5rA1WoVeJIeP' \
    --namespace "$AB_NAMESPACE" \
    --userId 'F8ZrQzP4zvtdxdbZ' \
    > test.out 2>&1
eval_tap $? 58 'AdminDeletePlayerRecordHandlerV1' test.out

#- 59 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'Upd6FJtHJ1pyVwyK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QLY6FEO65Rb3z7CY' \
    > test.out 2>&1
eval_tap $? 59 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 60 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'LM8IlsHqffnrfsGl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fPaZKBwa3Ddb60uf' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 60 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 61 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'Ppzwj1QGIFmlVf4j' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vapseE9LN9bvhOrH' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 61 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 62 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'flIOd6X3viLvtEk4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mTIpUA9gxo8SV38n' \
    > test.out 2>&1
eval_tap $? 62 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 63 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'EhoXmM2W7l6jHMA2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rG3nakopAywelu01' \
    > test.out 2>&1
eval_tap $? 63 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 64 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '97' \
    --query 'ryEJ0NqoTow0qiOi' \
    --tags 'C4j0iktm0ZPLkLOs,p0LZ5njN86Hl8kUX,zt6bSc6bWvgpVyW9' \
    > test.out 2>&1
eval_tap $? 64 'ListGameBinaryRecordsV1' test.out

#- 65 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "dD1kOmvrAejcq2Lg", "key": "kQuaS7RBx3vim02j"}' \
    > test.out 2>&1
eval_tap $? 65 'PostGameBinaryRecordV1' test.out

#- 66 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["BOxrZDyvpcLYOWA8", "NjxOnaEok4nOOCzf", "sflhjbngJOUn18G5"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetGameBinaryRecordV1' test.out

#- 67 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'MlfDTk8aG40Nlncc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetGameBinaryRecordV1' test.out

#- 68 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'eIZSwgAIkgzh4pTU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "0Am4DZhl0bQxFJ3s", "file_location": "WCqQpQ2FbKPFMycM"}' \
    > test.out 2>&1
eval_tap $? 68 'PutGameBinaryRecordV1' test.out

#- 69 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'SQ4qfAacR0LgB5BU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameBinaryRecordV1' test.out

#- 70 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key 'Xvjcu2s6w3VifnKq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "mTSoGH1XEfY6QAYn"}' \
    > test.out 2>&1
eval_tap $? 70 'PostGameBinaryPresignedURLV1' test.out

#- 71 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key '6WQ5UBEU1QAOHfZi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "GhxOdcuDXSxSc3aZ", "value": {"PV87pna08gxefTYK": {}, "huxaEc7M4P7UckSC": {}, "6ePeN8i4GrFES9z7": {}}}' \
    > test.out 2>&1
eval_tap $? 71 'PutGameRecordConcurrentHandlerV1' test.out

#- 72 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["xueHpATHccee9GXh", "KcjmSEwdrkEnnqKz", "FsLfYalUlfwEQKjU"]}' \
    > test.out 2>&1
eval_tap $? 72 'GetGameRecordsBulk' test.out

#- 73 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key '7eHGebSVu0LQ40ke' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetGameRecordHandlerV1' test.out

#- 74 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'pEaC4dfiOMZfEhHr' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 74 'PutGameRecordHandlerV1' test.out

#- 75 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key '39pysFO3Zvc1BZG9' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 75 'PostGameRecordHandlerV1' test.out

#- 76 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key '9LyvfvHEsJKQQewV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteGameRecordHandlerV1' test.out

#- 77 PublicListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '77' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 77 'PublicListTagsHandlerV1' test.out

#- 78 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'MUoAnaRcYp7FUjfI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["GaffoflEIByYqeKN", "0meGelYF5wWaDhuk", "U4khGG4vZFTYnPkm"]}' \
    > test.out 2>&1
eval_tap $? 78 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'Su4PWam1jxR7SETW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["jteoc8fgvZDDhoO0", "5oKqymxLD1Lcvw6T", "6mZEiwxxElpMYSWI"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 80 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '8' \
    --offset '53' \
    --query 'Vzm7z9noowmlTIKV' \
    --tags 'owi0RY2VN4ZONJRE,dUQ3z9F1BxNNgnke,4akncw7wu9TmXfJW' \
    > test.out 2>&1
eval_tap $? 80 'ListMyBinaryRecordsV1' test.out

#- 81 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["BPrx9Ns8eLzYEvwS", "WTaLQjctvrK2jhsY", "pKPlXn77AtYoFzLA"]}' \
    > test.out 2>&1
eval_tap $? 81 'BulkGetMyBinaryRecordV1' test.out

#- 82 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '35' \
    --tags 'TPY8P8P3cfoivvQx,evecWw7Rry0KK5rg,AGO0dW8rX2MVUGKS' \
    > test.out 2>&1
eval_tap $? 82 'RetrievePlayerRecords' test.out

#- 83 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["Z4GcLkt4pK32sJxl", "ZcCTpTdRtCHvuk6B", "6XTmSLyn50sigBVZ"]}' \
    > test.out 2>&1
eval_tap $? 83 'GetPlayerRecordsBulkHandlerV1' test.out

#- 84 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'xiKdV57GvRyd9UuL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 85 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '02Le8HSCslsDd4M1' \
    --body '{"file_type": "F5qRIblS7Nz81GRa", "is_public": true, "key": "UetzCAWc9x1aMjgG"}' \
    > test.out 2>&1
eval_tap $? 85 'PostPlayerBinaryRecordV1' test.out

#- 86 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'im51T107XIZRZ7tZ' \
    --limit '8' \
    --offset '43' \
    --tags 'Is0xf4czdt7zqmSK,xOEQlVcx6GqsBq8v,dhWVnuYLgpZehK0G' \
    > test.out 2>&1
eval_tap $? 86 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 87 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '2nmyuViB9kRTcSQd' \
    --body '{"keys": ["TnNYGeAfYFG3wSkH", "KufBdS3ZOokZB4cX", "nAXyuGz6LlxHv8Sw"]}' \
    > test.out 2>&1
eval_tap $? 87 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 88 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'yagYvDJ3w3UNgIGj' \
    --namespace "$AB_NAMESPACE" \
    --userId '2jZtEYT8sIPSE1XX' \
    > test.out 2>&1
eval_tap $? 88 'GetPlayerBinaryRecordV1' test.out

#- 89 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'PzySa0sZoFS6xCOW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Mpyh9pMsQgb64ELb' \
    --body '{"content_type": "zDMwyo4nIRysQdbu", "file_location": "fXjYnSoIFeouC2m3"}' \
    > test.out 2>&1
eval_tap $? 89 'PutPlayerBinaryRecordV1' test.out

#- 90 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key '8kXrDZWlGVE9sJ4N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pUtKp6M9I6nEwnZh' \
    > test.out 2>&1
eval_tap $? 90 'DeletePlayerBinaryRecordV1' test.out

#- 91 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'sjwJeGwaPSDMZz95' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OYKiqaZD63xe5rru' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerBinaryRecorMetadataV1' test.out

#- 92 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key 'VfLGea0ZtlzUcuHA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Xz0UV31MfuGaXsAu' \
    --body '{"file_type": "GsZaSHevO0TQNEI3"}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerBinaryPresignedURLV1' test.out

#- 93 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'kfabxJWWSI1ECUo1' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NPpeFhUztXDgB7n4' \
    > test.out 2>&1
eval_tap $? 93 'GetPlayerPublicBinaryRecordsV1' test.out

#- 94 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'C97uAPP8PATLpUpx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eJlsBJT6Hh3OMjAj' \
    --responseBody  \
    --body '{"updatedAt": "q2mK8lbSEEelxnb5", "value": {"QxWG2HFnZlA6HKWW": {}, "4fI1IQcoBQELcNlZ": {}, "kqTZrKgXNwvm4e5G": {}}}' \
    > test.out 2>&1
eval_tap $? 94 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 95 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'X6H742OixhtAoKiV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm6URT95XhnUcvWB2' \
    --responseBody  \
    --body '{"updatedAt": "8MpusuhhDJ5slzgi", "value": {"WZEtyd56LfxnbY97": {}, "jjYgXchCbkXX26uE": {}, "dCfQaMAQuTKfC0I2": {}}}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 96 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kNjCMDtDMrentgn3' \
    --limit '61' \
    --offset '6' \
    --tags 'hqciwIeShF9RKb9v,vxuJlhXbWhbwPwTo,C6knjVwVnzaqSfJi' \
    > test.out 2>&1
eval_tap $? 96 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 97 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QFC2gXoda0kg16yU' \
    --body '{"keys": ["SpSOAjHJWwfCjYwW", "kLob9gKLqs2nEZhp", "ByfHZinxNfgPAwkM"]}' \
    > test.out 2>&1
eval_tap $? 97 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 98 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'BsznlBUqnLT4AbGp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tKaWNvPbpg7yrRvX' \
    > test.out 2>&1
eval_tap $? 98 'GetPlayerRecordHandlerV1' test.out

#- 99 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'fZ6rvgvEY3Hht1Sw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qTsKKKo37NHDOQe9' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 99 'PutPlayerRecordHandlerV1' test.out

#- 100 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key '1Ps3ztUIV0dS6hIH' \
    --namespace "$AB_NAMESPACE" \
    --userId '9c4VfkyrwpuXxbaE' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 100 'PostPlayerRecordHandlerV1' test.out

#- 101 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'RbfgPmi0eHkt1mr9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOIFg0dnWIYN2NVL' \
    > test.out 2>&1
eval_tap $? 101 'DeletePlayerRecordHandlerV1' test.out

#- 102 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key '70Iw157g00jr9b8M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uYmmeKTmBNvGYxEQ' \
    > test.out 2>&1
eval_tap $? 102 'GetPlayerPublicRecordHandlerV1' test.out

#- 103 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'df3ewoGGoY7xmFNA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mjDDCvs78mcMdiS7' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 103 'PutPlayerPublicRecordHandlerV1' test.out

#- 104 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key '6YApGJ9ufwLYkqIg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LuZS6hsQryiEtOAb' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 104 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE