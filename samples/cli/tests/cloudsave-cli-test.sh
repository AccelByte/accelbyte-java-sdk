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
echo "1..57"

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

#- 10 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'hddSpHt0P7MIIR7C' \
    --limit '22' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 10 'ListGameRecordsHandlerV1' test.out

#- 11 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'yF6C7duuyZ0GhDog' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'AdminGetGameRecordHandlerV1' test.out

#- 12 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'qrhBRd8lDR6qVNPR' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 12 'AdminPutGameRecordHandlerV1' test.out

#- 13 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'ZYdFLIAjGGJddVCv' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPostGameRecordHandlerV1' test.out

#- 14 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'u9vx5KQ7KYnIuMBv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'AdminDeleteGameRecordHandlerV1' test.out

#- 15 BulkGetAdminPlayerRecordByUserIdsV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetAdminPlayerRecordByUserIdsV1 \
    --key 'aO35llzQRaT5kPxU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["fofvnnSuB0y5WUlr", "MdI4sNveabntBSxT", "eIv53HGCiljvjKoy"]}' \
    > test.out 2>&1
eval_tap $? 15 'BulkGetAdminPlayerRecordByUserIdsV1' test.out

#- 16 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["D6SCwGrncqmLtjQH", "Af8TgoNm03VLisV6", "zwPuo3td6TC6I3lM"], "user_id": "jGSWN2laRlxfcjHf"}, {"keys": ["YakUCTqGkE7wcWfD", "slpJSqGAXQ0yYoNR", "Kd3IL5TAQ6iiPlSC"], "user_id": "2uE4o5Vwdo3fePqI"}, {"keys": ["JA8IHtrkmu0hpDDW", "VAla2l5BYNtIuS5S", "5XUdjsoqwGyzzWi9"], "user_id": "gwQYv7t1o7TTr1Dm"}]}' \
    > test.out 2>&1
eval_tap $? 16 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 17 ListPlayerRecordHandlerV1
eval_tap 0 17 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 18 AdminListAdminUserRecordsV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminListAdminUserRecordsV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rhZv15T7quIOvBMc' \
    --limit '1' \
    --offset '90' \
    > test.out 2>&1
eval_tap $? 18 'AdminListAdminUserRecordsV1' test.out

#- 19 AdminBulkGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminBulkGetAdminPlayerRecordV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mvCkGZ5dAgqxpBFm' \
    --body '{"keys": ["aLoxozr6wfNPX2bO", "ItRMvqtlB2jJCSQT", "279ZZPYGu0rdlgdW"]}' \
    > test.out 2>&1
eval_tap $? 19 'AdminBulkGetAdminPlayerRecordV1' test.out

#- 20 AdminGetAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetAdminPlayerRecordV1 \
    --key 'yOtXi3choQrpOsDB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'U5SepjChB3V0v52D' \
    > test.out 2>&1
eval_tap $? 20 'AdminGetAdminPlayerRecordV1' test.out

#- 21 AdminPutAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordV1 \
    --key 'lym6puQ23xoJ8aeC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'naLpUKp44YUDjasW' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 21 'AdminPutAdminPlayerRecordV1' test.out

#- 22 AdminPostPlayerAdminRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerAdminRecordV1 \
    --key 'IPUvmEejtGeoyIPa' \
    --namespace "$AB_NAMESPACE" \
    --userId '8ZRrvjj7il35MXbN' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 22 'AdminPostPlayerAdminRecordV1' test.out

#- 23 AdminDeleteAdminPlayerRecordV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteAdminPlayerRecordV1 \
    --key '9oCMNqq98SjTvhZN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kSQ70D0H6BXksUC9' \
    > test.out 2>&1
eval_tap $? 23 'AdminDeleteAdminPlayerRecordV1' test.out

#- 24 AdminPutAdminPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutAdminPlayerRecordConcurrentHandlerV1 \
    --key 'b6i5lZC9xv32e8c5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'csSovoqsZNBdte9N' \
    --body '{"updatedAt": "DUPVJf6c2Z0QZxfg", "value": {"PubTDIHrvqAThuwj": {}, "RHpKKTlmVr9XuoJb": {}, "RFQSKVPHbn4Xxtu7": {}}}' \
    > test.out 2>&1
eval_tap $? 24 'AdminPutAdminPlayerRecordConcurrentHandlerV1' test.out

#- 25 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'LQRENjEEztx1WsYS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iZqan0nSBJroav91' \
    --body '{"set_by": "GXlvPG6bFYReVHQi", "updatedAt": "pcCx9Zw5D2L7vIYh", "value": {"GGSyEW4ZJJ42d3PB": {}, "ddN8S48l9lyNApfl": {}, "xqMrj3oZk03QXcKM": {}}}' \
    > test.out 2>&1
eval_tap $? 25 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 26 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'DYDDxHSZjtqXyJ58' \
    --namespace "$AB_NAMESPACE" \
    --userId 'f7Gc26SaiGVkydwY' \
    --body '{"set_by": "WQG26yUZNmTBcvrb", "updatedAt": "YCwZtxFHyPLtI8il", "value": {"byDPUIj88cekdqCt": {}, "81P1ktfIovmv9gsR": {}, "5cJcHm3SZLxoRDFu": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 27 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'uuySj29a9LJE8HoR' \
    --limit '92' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 27 'AdminRetrievePlayerRecords' test.out

#- 28 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key '1X2PFAAMwzHPxB1U' \
    --namespace "$AB_NAMESPACE" \
    --userId 'skYs4Yw20DOqOBSC' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetPlayerRecordHandlerV1' test.out

#- 29 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key '2DKHRuPMMWH8Yb33' \
    --namespace "$AB_NAMESPACE" \
    --userId 'T5UBJCjfcnLRfxeC' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 29 'AdminPutPlayerRecordHandlerV1' test.out

#- 30 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'Sz9WEi8KlloeH0JT' \
    --namespace "$AB_NAMESPACE" \
    --userId '1yduat2vQR3biBfs' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 30 'AdminPostPlayerRecordHandlerV1' test.out

#- 31 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'u4jmsRE2w1yEkLgh' \
    --namespace "$AB_NAMESPACE" \
    --userId '3tIYt4SqYUTLDx9g' \
    > test.out 2>&1
eval_tap $? 31 'AdminDeletePlayerRecordHandlerV1' test.out

#- 32 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'IiDandpGT2t24aOM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'h5eC3IHeHSKLCa3x' \
    > test.out 2>&1
eval_tap $? 32 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 33 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'reNDUWehwH3q31A8' \
    --namespace "$AB_NAMESPACE" \
    --userId '06DJgas4b6z3LNUj' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 34 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key '7fdgLA84Z8YYk6QE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'gJjBbEDoNf3n0hEo' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 34 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 35 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'RCAcf80zfFyabWAg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IUXiI07A68eaqC2J' \
    > test.out 2>&1
eval_tap $? 35 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 36 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key '9jyEW6GLbc0NaKDU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L3sa13lk1dQBHO86' \
    > test.out 2>&1
eval_tap $? 36 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 37 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'IlBhnetU4RwTqUXl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "TDBzOuYsaZA2yyd4", "value": {"mbqoOfADMMAXFaY9": {}, "eKa699bRVhyaKwwr": {}, "AP2aMlu7WtjCtoYe": {}}}' \
    > test.out 2>&1
eval_tap $? 37 'PutGameRecordConcurrentHandlerV1' test.out

#- 38 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["tOO847g8OudOfjnC", "uHZ3c46IjGa23YvY", "mmDg7VYPXIuvUYTZ"]}' \
    > test.out 2>&1
eval_tap $? 38 'GetGameRecordsBulk' test.out

#- 39 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'BRujIUE1Tq5jyAZv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 39 'GetGameRecordHandlerV1' test.out

#- 40 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'kRCMNFIurjh2imdb' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'PutGameRecordHandlerV1' test.out

#- 41 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key '4rbkXj0ZwsVC0gL9' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 41 'PostGameRecordHandlerV1' test.out

#- 42 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key '7ZVJSPqJiwv1qlYB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 42 'DeleteGameRecordHandlerV1' test.out

#- 43 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key '1RSKs6gQxC3Gb7S0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["o4zGYY7KQI1AeFgP", "qaOkvo1aolB4lkKB", "4EYOkQ1jMD3cym8x"]}' \
    > test.out 2>&1
eval_tap $? 43 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 44 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 44 'RetrievePlayerRecords' test.out

#- 45 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["fkOVW2grREOLx0KO", "ww3HICQLfl7MUBG7", "qtPu64yAtURKLRkb"]}' \
    > test.out 2>&1
eval_tap $? 45 'GetPlayerRecordsBulkHandlerV1' test.out

#- 46 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key '738HGS6rDgMdIIlh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 46 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 47 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'S1fSiM9331m7Ta1P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sKc50Kv6ecnEevcA' \
    --body '{"updatedAt": "x2K2zkRenmPZnGBt", "value": {"4P7WnbdSJtjX7Zsh": {}, "ZyZl5x4bRXBHUTrD": {}, "zZSKscfOcYu3dpCR": {}}}' \
    > test.out 2>&1
eval_tap $? 47 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 48 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'OYqUiGKXVFCmpo6s' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PwVOEDSJsEK5QpNh' \
    --body '{"updatedAt": "lI2iS5EpGhhvXYck", "value": {"0upMzUYnb76tFkEO": {}, "RV3bu1bNCtX7W40V": {}, "6Do5sYadCCFrHHC3": {}}}' \
    > test.out 2>&1
eval_tap $? 48 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 49 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DpZxkrQDXuNFviMa' \
    --limit '37' \
    --offset '43' \
    > test.out 2>&1
eval_tap $? 49 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 50 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'v8mnfHK8CCmE2lPn' \
    --body '{"keys": ["sbD3SGEdlwuUccE5", "36ugBp3HBvepnDCj", "gyJlXe36mgWjLfFm"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 51 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'teue9nzJ6fH24T80' \
    --namespace "$AB_NAMESPACE" \
    --userId '5tVg8JqU0jZpjvsu' \
    > test.out 2>&1
eval_tap $? 51 'GetPlayerRecordHandlerV1' test.out

#- 52 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'gAOS7u8RiWyerCSa' \
    --namespace "$AB_NAMESPACE" \
    --userId '8SRgwsAj1ik1jgla' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 52 'PutPlayerRecordHandlerV1' test.out

#- 53 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'DXTvKCWwNTAhd2wr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'S0uPdjhdinpng5BL' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 53 'PostPlayerRecordHandlerV1' test.out

#- 54 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'y8wbhMssAHjapIkY' \
    --namespace "$AB_NAMESPACE" \
    --userId '9Rf4wP57dBZNR88Y' \
    > test.out 2>&1
eval_tap $? 54 'DeletePlayerRecordHandlerV1' test.out

#- 55 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'bCtmKy8M9zVrjfGX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZnqAQUoY1GjlIIk0' \
    > test.out 2>&1
eval_tap $? 55 'GetPlayerPublicRecordHandlerV1' test.out

#- 56 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'iKoTTS1j02o7JjTX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AQN0qdskdQV0TqI8' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 56 'PutPlayerPublicRecordHandlerV1' test.out

#- 57 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'EFnmDbxIxi4YKlON' \
    --namespace "$AB_NAMESPACE" \
    --userId 'k2Q5Y4Jvaizwiila' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 57 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE