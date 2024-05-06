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
    --query 'xodenSrUTvfqU0bf' \
    --tags 'oMm5cTtFWbotQyXJ,RcQWsmqPNs92epxk,0i8VxsZNereSvf96' \
    > test.out 2>&1
eval_tap $? 36 'AdminListAdminUserRecordsV1' test.out

#- 37 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '99mCEHThUJkETAsS' \
    --body '{"keys": ["p7gh4TeUTkOkAYfJ", "B8AT9t4Tv207Y2QD", "3oD5fLCr3OOlXVv8"]}' \
    > test.out 2>&1
eval_tap $? 37 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 38 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'ZGF7uYnGzpipNDig' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NJma1MbqqZtfNWql' \
    > test.out 2>&1
eval_tap $? 38 'AdminGetAdminPlayerRecordV1' test.out

#- 39 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key '4nmwAft4gqkNNlWk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D9eOziYRFOn0jJLH' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 39 'AdminPutAdminPlayerRecordV1' test.out

#- 40 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'C9LxhvNXTwGBCtoh' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ltl9Zuhytm5UDrT6' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'AdminPostPlayerAdminRecordV1' test.out

#- 41 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key 'QXCs5SPBbRPZTF6o' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QAXVG7tnsZg5QgXj' \
    > test.out 2>&1
eval_tap $? 41 'AdminDeleteAdminPlayerRecordV1' test.out

#- 42 AdminListPlayerBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListPlayerBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vyGJPN4eXbJE5Vs2' \
    --limit '67' \
    --offset '8' \
    --query 'cyomQoIXimBJehyx' \
    --tags 'lNsjUgxBkF6wFPoJ,eQediogEhhM2rIiz,GdKvOPdq5xrgxSmy' \
    > test.out 2>&1
eval_tap $? 42 'AdminListPlayerBinaryRecordsV1' test.out

#- 43 AdminPostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1DN9LFkYW5DQyj4b' \
    --body '{"file_type": "j5Ro2ogaKt2ujQSa", "is_public": true, "key": "Zdb65UXmy0Zp6iIa", "set_by": "CLIENT"}' \
    > test.out 2>&1
eval_tap $? 43 'AdminPostPlayerBinaryRecordV1' test.out

#- 44 AdminGetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerBinaryRecordV1 \
    --key 'IKUkmkk9QM0NBMA9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ORxpzwLR2AK6eXUG' \
    > test.out 2>&1
eval_tap $? 44 'AdminGetPlayerBinaryRecordV1' test.out

#- 45 AdminPutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecordV1 \
    --key 'PJsw1fiP80G9Pclx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cft2ulIJzPyrVEiO' \
    --body '{"content_type": "G4UcqsuGKHhMRWLV", "file_location": "d3DlhLuIpomM8sm1"}' \
    > test.out 2>&1
eval_tap $? 45 'AdminPutPlayerBinaryRecordV1' test.out

#- 46 AdminDeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerBinaryRecordV1 \
    --key 'MiaI1mX2tJoARtdb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Be7udsMrok0WvGYY' \
    > test.out 2>&1
eval_tap $? 46 'AdminDeletePlayerBinaryRecordV1' test.out

#- 47 AdminPutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerBinaryRecorMetadataV1 \
    --key 'nx4V709xbnGezKsD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wG2omOR2nvYI9TVq' \
    --body '{"is_public": false, "set_by": "CLIENT", "tags": ["vzcWbfUpaXp5JMl5", "LL4bTxBmZjdrrIxs", "B0NRsB1fPqqRRulp"]}' \
    > test.out 2>&1
eval_tap $? 47 'AdminPutPlayerBinaryRecorMetadataV1' test.out

#- 48 AdminPostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerBinaryPresignedURLV1 \
    --key 'qpymDkQhtrHWwRVn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wVBOqOHi8pWGd1ju' \
    --body '{"file_type": "YhiqjRJOqB5F93zF"}' \
    > test.out 2>&1
eval_tap $? 48 'AdminPostPlayerBinaryPresignedURLV1' test.out

#- 49 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'QbJndUDpdONneAcz' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bBdHb2slt71B1SmZ' \
    --responseBody  \
    --body '{"tags": ["p2JZp50CnPb71ORY", "cmQbTU5JX8ccLjMX", "JRk0eaKQDOJvrTef"], "updatedAt": "glSs6g4iY9u02aCN", "value": {"YIWekp18lOC3mNqF": {}, "7Bl0LcghVHfPEspx": {}, "whRON0bc1eMbEIjo": {}}}' \
    > test.out 2>&1
eval_tap $? 49 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 50 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'wLqc3ecjXJbZDKKo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xLE1Y3Dymtj3giPg' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["5hOPjaf3H0tYighU", "0VUfcYHJbBfAKSiP", "W3VgsZXiR1DJ7HVW"], "ttl_config": {"action": "DELETE", "expires_at": "1975-11-15T00:00:00Z"}, "updatedAt": "6tArAURt9plCSVq8", "value": {"PdH6hJPUAc0RVwXg": {}, "AgntLMCuaXBWQi6B": {}, "qPg4xr0lCancUZGC": {}}}' \
    > test.out 2>&1
eval_tap $? 50 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 51 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'HsZYoLfR1KtOv7Zy' \
    --namespace "$AB_NAMESPACE" \
    --userId '0b65uvuKNuy0ytZQ' \
    --responseBody  \
    --body '{"set_by": "SERVER", "tags": ["Nzy1adnSKOLFKx1d", "X4LuWJu3pDMUAeeZ", "97SBROPYuG6XqP6o"], "ttl_config": {"action": "DELETE", "expires_at": "1972-09-27T00:00:00Z"}, "updatedAt": "z8eBeeoip68J1nsv", "value": {"4W2OJhtafxMSJlHe": {}, "b34sZKHcl5LLLOex": {}, "L4fZvWtND2tcBFpX": {}}}' \
    > test.out 2>&1
eval_tap $? 51 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 52 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId '8lNtFEJ7tnkY6Mca' \
    --limit '38' \
    --offset '1' \
    --query '1ozhLVA3kE8jKvga' \
    --tags 'tOEBM70TdlNBJYOm,pu1VCarzBsV6xnZ5,Jrzzjrcaug6CWVG8' \
    > test.out 2>&1
eval_tap $? 52 'AdminRetrievePlayerRecords' test.out

#- 53 AdminPutPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SWP3glU6muswVJnN' \
    --body '{"data": [{"key": "nN7kAa7j0riFc5HT", "value": {"HQIoVsGo7dwV9DBq": {}, "FKHQkETJyTlUrwDT": {}, "noujQD4IEiH9Z5qX": {}}}, {"key": "n3aoRtlqOECohViH", "value": {"A5CzgFSy8X1A3PrI": {}, "fapq5AAeMe4L3mDW": {}, "ORBVXTIIJM9XsYII": {}}}, {"key": "ZxiXNMR9BgaWcFX3", "value": {"SUBhyoTsMWPAxUMk": {}, "awaGpAyrIwMif3BO": {}, "dkocVTd4BxqGWV6m": {}}}]}' \
    > test.out 2>&1
eval_tap $? 53 'AdminPutPlayerRecordsHandlerV1' test.out

#- 54 AdminGetPlayerRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJ0sQs6XNbjvqhnU' \
    --body '{"keys": ["VLWu8olKdxL6ozRm", "DD0jJvlfV5OemPYd", "YT7DROCjtuzFMbAG"]}' \
    > test.out 2>&1
eval_tap $? 54 'AdminGetPlayerRecordsHandlerV1' test.out

#- 55 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key '9YI89hmguB8FOTjM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Lo4b9rIzqYkEpsty' \
    > test.out 2>&1
eval_tap $? 55 'AdminGetPlayerRecordHandlerV1' test.out

#- 56 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'VTBcrM8rG0rH0zcs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wwVeMK6MbGIVIu8v' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 56 'AdminPutPlayerRecordHandlerV1' test.out

#- 57 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'vwLc7KY3uVoJXTIM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tpgkieDyF97lGdMi' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'AdminPostPlayerRecordHandlerV1' test.out

#- 58 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'HKxbWCYzo8yO2KTK' \
    --namespace "$AB_NAMESPACE" \
    --userId '9tmmOnYnOpas6ghP' \
    > test.out 2>&1
eval_tap $? 58 'AdminDeletePlayerRecordHandlerV1' test.out

#- 59 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '1y4Zi7s7QBlk44Z4' \
    --namespace "$AB_NAMESPACE" \
    --userId '4B1GZgKg4uKxaCgc' \
    > test.out 2>&1
eval_tap $? 59 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 60 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'GLuC3brWdTYCfHkI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ySok5DiXZtLW87rG' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 60 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 61 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'ysryod3dNQrmsApR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'A6HX3RwrKt2ecozL' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 61 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 62 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key '0TOg54vCE48L5oLF' \
    --namespace "$AB_NAMESPACE" \
    --userId '6M4lNa4JUMSHNgqR' \
    > test.out 2>&1
eval_tap $? 62 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 63 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'qCV7usamANkZlOX9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Sfo95HgXqKhTPkwf' \
    > test.out 2>&1
eval_tap $? 63 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 64 ListGameBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '76' \
    --offset '82' \
    --query 'M9uSybRzWek2gZvR' \
    --tags 'rvr0n9d9lvccKMLh,rTrcBE2ItBS3KtKZ,We8aoFzAyBME74HU' \
    > test.out 2>&1
eval_tap $? 64 'ListGameBinaryRecordsV1' test.out

#- 65 PostGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "tipUWYhWV1qx8CzP", "key": "ML52faXUr9Sk4lq2"}' \
    > test.out 2>&1
eval_tap $? 65 'PostGameBinaryRecordV1' test.out

#- 66 BulkGetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetGameBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["faBcAXXKlhvyH8pa", "OJtxqMPpcVfRwNj5", "47fH0XrKEDpEY8Vn"]}' \
    > test.out 2>&1
eval_tap $? 66 'BulkGetGameBinaryRecordV1' test.out

#- 67 GetGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameBinaryRecordV1 \
    --key 'ocGAjci0V3tBf2jn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 67 'GetGameBinaryRecordV1' test.out

#- 68 PutGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameBinaryRecordV1 \
    --key 'HGKXphn50c9tNLDl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"content_type": "jhZ2jxLRX3z46OCa", "file_location": "GBeMfPlNos4yBRjr"}' \
    > test.out 2>&1
eval_tap $? 68 'PutGameBinaryRecordV1' test.out

#- 69 DeleteGameBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameBinaryRecordV1 \
    --key 'ERHEonAZR8GmEu0q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 69 'DeleteGameBinaryRecordV1' test.out

#- 70 PostGameBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameBinaryPresignedURLV1 \
    --key '1p6QCyY6vSkVFWds' \
    --namespace "$AB_NAMESPACE" \
    --body '{"file_type": "bYuVEGVxYheR3j5m"}' \
    > test.out 2>&1
eval_tap $? 70 'PostGameBinaryPresignedURLV1' test.out

#- 71 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'NZ6vwv7K8Asvt1j1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "Rx59hesNWy2NvZ85", "value": {"DDKDAF8KDsBZOuYQ": {}, "J03BAHZ7c53q7akM": {}, "pcmnnx6RVBrop9v7": {}}}' \
    > test.out 2>&1
eval_tap $? 71 'PutGameRecordConcurrentHandlerV1' test.out

#- 72 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["aZK3h65hbN15zfQS", "fQrtfF3TQN0OcNDL", "r36vzohZyjMQAg5m"]}' \
    > test.out 2>&1
eval_tap $? 72 'GetGameRecordsBulk' test.out

#- 73 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'PYhrLTyU8OhgfY9J' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 73 'GetGameRecordHandlerV1' test.out

#- 74 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'QYGF4bYXEcENx9xZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 74 'PutGameRecordHandlerV1' test.out

#- 75 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'lAchob44lONDDwMv' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 75 'PostGameRecordHandlerV1' test.out

#- 76 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'gI0HlyPR7wZNiVsF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 76 'DeleteGameRecordHandlerV1' test.out

#- 77 PublicListTagsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicListTagsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '48' \
    > test.out 2>&1
eval_tap $? 77 'PublicListTagsHandlerV1' test.out

#- 78 BulkGetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicBinaryRecordsV1 \
    --key 'N0meGelYF5wWaDhu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["kU4khGG4vZFTYnPk", "mSu4PWam1jxR7SET", "Wjteoc8fgvZDDhoO"]}' \
    > test.out 2>&1
eval_tap $? 78 'BulkGetPlayerPublicBinaryRecordsV1' test.out

#- 79 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key '05oKqymxLD1Lcvw6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["T6mZEiwxxElpMYSW", "IeVzm7z9noowmlTI", "KVowi0RY2VN4ZONJ"]}' \
    > test.out 2>&1
eval_tap $? 79 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 80 ListMyBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listMyBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '63' \
    --query '7l2Zsrh90ETtYmGu' \
    --tags 'kz3MnlrjcHp6B8Vj,7rXFgDnDkdZ9bpjb,1tdA3QhjCMW64f4X' \
    > test.out 2>&1
eval_tap $? 80 'ListMyBinaryRecordsV1' test.out

#- 81 BulkGetMyBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetMyBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["hIjSoTB2NMKtezap", "Pr2QEPx3zTxBGtEJ", "IYppuUSsKoHw2hyd"]}' \
    > test.out 2>&1
eval_tap $? 81 'BulkGetMyBinaryRecordV1' test.out

#- 82 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '54' \
    --tags 'uSE7BEv3aevq6ioh,U1cg4W1IS3Uv1BpW,oJBaqdg2FHcunsS1' \
    > test.out 2>&1
eval_tap $? 82 'RetrievePlayerRecords' test.out

#- 83 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["lnaO2m9vqjhbeK2q", "N8g6x2PyYDo5R3hL", "iD5sf5y1JsxJNGmy"]}' \
    > test.out 2>&1
eval_tap $? 83 'GetPlayerRecordsBulkHandlerV1' test.out

#- 84 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 't0SQDUDoWBZVGLlk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 84 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 85 PostPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'UetzCAWc9x1aMjgG' \
    --body '{"file_type": "im51T107XIZRZ7tZ", "is_public": false, "key": "ugbNEIpGBFUjOn5m"}' \
    > test.out 2>&1
eval_tap $? 85 'PostPlayerBinaryRecordV1' test.out

#- 86 ListOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave listOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'M7k8nbLzvtCIW5yn' \
    --limit '79' \
    --offset '6' \
    --tags 'KquUicAeIVXtoWAX,hMlW4tLqX7OICf5o,D1e6oI9FmYel0kOw' \
    > test.out 2>&1
eval_tap $? 86 'ListOtherPlayerPublicBinaryRecordsV1' test.out

#- 87 BulkGetOtherPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetOtherPlayerPublicBinaryRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '72o8Zkgk0jS6rDWU' \
    --body '{"keys": ["wfhKvrf2AaH4yCWr", "HSppnIZkNnTn3rzH", "5NvAtcvNedgS1fUf"]}' \
    > test.out 2>&1
eval_tap $? 87 'BulkGetOtherPlayerPublicBinaryRecordsV1' test.out

#- 88 GetPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerBinaryRecordV1 \
    --key 'KmihDbmu8ePWlQMV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DXEHeiGTnwyEw6hI' \
    > test.out 2>&1
eval_tap $? 88 'GetPlayerBinaryRecordV1' test.out

#- 89 PutPlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecordV1 \
    --key 'WDZrpP7rz3ISW510' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kHr4isTKWjmv67nu' \
    --body '{"content_type": "HCXWfwnwGioVwVzm", "file_location": "mBVVFfpqx1AeLtzc"}' \
    > test.out 2>&1
eval_tap $? 89 'PutPlayerBinaryRecordV1' test.out

#- 90 DeletePlayerBinaryRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerBinaryRecordV1 \
    --key 'PJ3jtDYBo4FUTH7C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GfKSyxgRR1DiCqSM' \
    > test.out 2>&1
eval_tap $? 90 'DeletePlayerBinaryRecordV1' test.out

#- 91 PutPlayerBinaryRecorMetadataV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerBinaryRecorMetadataV1 \
    --key 'zpqIFGLkDs7ACC1R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gBfoNrHlFi2qJLgm' \
    --body '{"is_public": true}' \
    > test.out 2>&1
eval_tap $? 91 'PutPlayerBinaryRecorMetadataV1' test.out

#- 92 PostPlayerBinaryPresignedURLV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerBinaryPresignedURLV1 \
    --key 'GsZaSHevO0TQNEI3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kfabxJWWSI1ECUo1' \
    --body '{"file_type": "NPpeFhUztXDgB7n4"}' \
    > test.out 2>&1
eval_tap $? 92 'PostPlayerBinaryPresignedURLV1' test.out

#- 93 GetPlayerPublicBinaryRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicBinaryRecordsV1 \
    --key 'C97uAPP8PATLpUpx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eJlsBJT6Hh3OMjAj' \
    > test.out 2>&1
eval_tap $? 93 'GetPlayerPublicBinaryRecordsV1' test.out

#- 94 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'q2mK8lbSEEelxnb5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QxWG2HFnZlA6HKWW' \
    --responseBody  \
    --body '{"updatedAt": "4fI1IQcoBQELcNlZ", "value": {"kqTZrKgXNwvm4e5G": {}, "X6H742OixhtAoKiV": {}, "m6URT95XhnUcvWB2": {}}}' \
    > test.out 2>&1
eval_tap $? 94 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 95 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key '8MpusuhhDJ5slzgi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WZEtyd56LfxnbY97' \
    --responseBody  \
    --body '{"updatedAt": "jjYgXchCbkXX26uE", "value": {"dCfQaMAQuTKfC0I2": {}, "kNjCMDtDMrentgn3": {}, "DhqciwIeShF9RKb9": {}}}' \
    > test.out 2>&1
eval_tap $? 95 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 96 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vvxuJlhXbWhbwPwT' \
    --limit '30' \
    --offset '73' \
    --tags 'C6knjVwVnzaqSfJi,QFC2gXoda0kg16yU,SpSOAjHJWwfCjYwW' \
    > test.out 2>&1
eval_tap $? 96 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 97 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kLob9gKLqs2nEZhp' \
    --body '{"keys": ["ByfHZinxNfgPAwkM", "BsznlBUqnLT4AbGp", "tKaWNvPbpg7yrRvX"]}' \
    > test.out 2>&1
eval_tap $? 97 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 98 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'fZ6rvgvEY3Hht1Sw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qTsKKKo37NHDOQe9' \
    > test.out 2>&1
eval_tap $? 98 'GetPlayerRecordHandlerV1' test.out

#- 99 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key '1Ps3ztUIV0dS6hIH' \
    --namespace "$AB_NAMESPACE" \
    --userId '9c4VfkyrwpuXxbaE' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 99 'PutPlayerRecordHandlerV1' test.out

#- 100 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'RbfgPmi0eHkt1mr9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EOIFg0dnWIYN2NVL' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 100 'PostPlayerRecordHandlerV1' test.out

#- 101 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key '70Iw157g00jr9b8M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'uYmmeKTmBNvGYxEQ' \
    > test.out 2>&1
eval_tap $? 101 'DeletePlayerRecordHandlerV1' test.out

#- 102 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'df3ewoGGoY7xmFNA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mjDDCvs78mcMdiS7' \
    > test.out 2>&1
eval_tap $? 102 'GetPlayerPublicRecordHandlerV1' test.out

#- 103 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key '6YApGJ9ufwLYkqIg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LuZS6hsQryiEtOAb' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 103 'PutPlayerPublicRecordHandlerV1' test.out

#- 104 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'peUNf26UqkCfgCUY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bn2xaOBdPF0JmX8q' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 104 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE