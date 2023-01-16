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
echo "1..40"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminPutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --key 'dDRRNdow' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "CaKptuen", "updatedAt": "AXFwdRtj", "value": {"x8ABntNd": {}, "a0eNdaaF": {}, "wZIl10lI": {}}}' \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'AMzGzRiU' \
    --limit '81' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'UUsvfYK4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'manRicqi' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'JJGa5K6Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'VtL5mQlL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["4B0ucv9z", "1RUfcbZ4", "rqRKqv3C"], "user_id": "9GJcaaf0"}, {"keys": ["rElKxCjZ", "pfzPyTVz", "pZOfVPmO"], "user_id": "2OlmZTF3"}, {"keys": ["o1LKGUbO", "Bs5CjYQT", "pfCHbRXP"], "user_id": "pyP8IISt"}]}' \
    > test.out 2>&1
eval_tap $? 8 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 9 ListPlayerRecordHandlerV1
eval_tap 0 9 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 10 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'Dl4Pr41J' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RBii3LyL' \
    --body '{"set_by": "Z3lXvnMH", "updatedAt": "8e7UJE37", "value": {"ersVbrjs": {}, "OvqooK4z": {}, "ZOr7aGke": {}}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 11 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key '32gCQGiR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RwvrZo2M' \
    --body '{"set_by": "o7i69zS3", "updatedAt": "B0Pek9JG", "value": {"RV4f14W7": {}, "fkGaUg60": {}, "454Uq3Te": {}}}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 12 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'bjPOIv6n' \
    --limit '19' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 12 'AdminRetrievePlayerRecords' test.out

#- 13 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'H2cFZp7f' \
    --namespace "$AB_NAMESPACE" \
    --userId '4HSrmF1Y' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerRecordHandlerV1' test.out

#- 14 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'X5fDbsxV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u2NqU0Xb' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPutPlayerRecordHandlerV1' test.out

#- 15 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key '5dXeJcZZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GY1qBYaH' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPostPlayerRecordHandlerV1' test.out

#- 16 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'kjScYk2R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oZFDrtrS' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeletePlayerRecordHandlerV1' test.out

#- 17 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '1V5cg30q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nuQW7Zg6' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'rDnmJN4l' \
    --namespace "$AB_NAMESPACE" \
    --userId '2PYHOawM' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 19 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'GgHqGT35' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QscChrPQ' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 19 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 20 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'TQw1idl5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fvzKlSiD' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 21 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'TK1DCycl' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Eo7TvdVf' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 22 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'L1KKidCo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "OzgaD5n1", "value": {"2JA40wnY": {}, "5SSJ3krj": {}, "TIHBFbnf": {}}}' \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordConcurrentHandlerV1' test.out

#- 23 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["WgGeGn36", "CoAU7jri", "iQkLb0Zo"]}' \
    > test.out 2>&1
eval_tap $? 23 'GetGameRecordsBulk' test.out

#- 24 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'QBYilCE9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetGameRecordHandlerV1' test.out

#- 25 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key '5bMzZNMF' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'PutGameRecordHandlerV1' test.out

#- 26 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'fnxQNX2l' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 26 'PostGameRecordHandlerV1' test.out

#- 27 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'RtGsshmz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameRecordHandlerV1' test.out

#- 28 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'NSGpoeMI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["8TXQc2ca", "Wy8AzkSE", "vROXwckT"]}' \
    > test.out 2>&1
eval_tap $? 28 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 29 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '36' \
    > test.out 2>&1
eval_tap $? 29 'RetrievePlayerRecords' test.out

#- 30 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["ZOlH0CoF", "14y0eOML", "BMkoRyWW"]}' \
    > test.out 2>&1
eval_tap $? 30 'GetPlayerRecordsBulkHandlerV1' test.out

#- 31 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key '3TZknvAE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 32 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'I9d3yv0q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rfnGVXWR' \
    --body '{"updatedAt": "s407vjxb", "value": {"c0gCQWrP": {}, "8FUyGUh1": {}, "Dlmug8O0": {}}}' \
    > test.out 2>&1
eval_tap $? 32 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 33 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'mHFRXARb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DLK9ko4D' \
    --body '{"updatedAt": "lJZ03qCw", "value": {"ITVJ8AbJ": {}, "pdbtTFtx": {}, "bdQR1AV0": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 34 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'PK73rXGs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zFd4FH9H' \
    > test.out 2>&1
eval_tap $? 34 'GetPlayerRecordHandlerV1' test.out

#- 35 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'BQLMyLrE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cpz9TeTZ' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 35 'PutPlayerRecordHandlerV1' test.out

#- 36 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'nv7pe0Ue' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b7dVwfkI' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 36 'PostPlayerRecordHandlerV1' test.out

#- 37 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key '1qZrPY3Z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eyI4jiZU' \
    > test.out 2>&1
eval_tap $? 37 'DeletePlayerRecordHandlerV1' test.out

#- 38 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'YFF6skSx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hL93KHeE' \
    > test.out 2>&1
eval_tap $? 38 'GetPlayerPublicRecordHandlerV1' test.out

#- 39 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'diWSZQpJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qMAh0SVm' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 39 'PutPlayerPublicRecordHandlerV1' test.out

#- 40 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'M2Se2QkI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'FiFzWU6w' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 40 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE