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
echo "1..42"

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
    --key 'EAxcVpFrttufHIRd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "H9UzVRiXbqlAw7r6", "updatedAt": "W2ktQG0h5JAav5kR", "value": {"a62WopBJHPtcDs8b": {}, "BZLCXLx8bbgorQeF": {}, "bQ1g7qbPngUNB1vR": {}}}' \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'odwpzS6DaDpv8N7Z' \
    --limit '87' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'CUkNmKJfh5pUkHOD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'poMF78NY4YkHs1cn' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'z1JSDgY1TXp38zsC' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'TCrbCbPOyNQkT7Nv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["yE3cwyALczNIicXm", "7agSrjJW2OQNOs1P", "XhT5FvdiRilZ7oFg"], "user_id": "x4c8OumKtPDKJDXn"}, {"keys": ["7Z4U68su8XfqlqNi", "TvB6SdAdIhUDrwoZ", "5MecdKi5r6QEa1ys"], "user_id": "LEzth6mXhzkzWkFe"}, {"keys": ["ZSoEAcBdW19m4eu6", "d5tA5jUmiTqpyhPF", "dxLzFQN05MYzYiKW"], "user_id": "e5dNRljv7IPrDQQR"}]}' \
    > test.out 2>&1
eval_tap $? 8 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 9 ListPlayerRecordHandlerV1
eval_tap 0 9 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 10 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'gat0SevkLGMS0lyu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'I9a2I9u6Vpbsx5w8' \
    --body '{"set_by": "hqUI06UpOXGSLmCV", "updatedAt": "uHOPlLlkvR8sKgnu", "value": {"RkgghGoYupD391C2": {}, "qtPYokahFjkQsfCa": {}, "Tmt1d67FXGk2s9Q0": {}}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 11 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'mPVo3twu0MesTCf9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'x4rt69lna7qxNeIx' \
    --body '{"set_by": "Pz6MbwL6IY69z1Ua", "updatedAt": "LqYSYWytLPziZMdj", "value": {"xcBZufQxGiHPllG4": {}, "cYEzfTD1ZBm3MqHc": {}, "UmLZZbSqb8RwNmn9": {}}}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 12 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'HrNQy4uZAAiE0mit' \
    --limit '90' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 12 'AdminRetrievePlayerRecords' test.out

#- 13 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'UdjsoqwGyzzWi9gw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QYv7t1o7TTr1Dmrh' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerRecordHandlerV1' test.out

#- 14 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'Zv15T7quIOvBMcaY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'mvCkGZ5dAgqxpBFm' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPutPlayerRecordHandlerV1' test.out

#- 15 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'aLoxozr6wfNPX2bO' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ItRMvqtlB2jJCSQT' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPostPlayerRecordHandlerV1' test.out

#- 16 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key '279ZZPYGu0rdlgdW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yOtXi3choQrpOsDB' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeletePlayerRecordHandlerV1' test.out

#- 17 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'U5SepjChB3V0v52D' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lym6puQ23xoJ8aeC' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'naLpUKp44YUDjasW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IPUvmEejtGeoyIPa' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 19 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key '8ZRrvjj7il35MXbN' \
    --namespace "$AB_NAMESPACE" \
    --userId '9oCMNqq98SjTvhZN' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 19 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 20 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'kSQ70D0H6BXksUC9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'b6i5lZC9xv32e8c5' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 21 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'csSovoqsZNBdte9N' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DUPVJf6c2Z0QZxfg' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 22 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'PubTDIHrvqAThuwj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "RHpKKTlmVr9XuoJb", "value": {"RFQSKVPHbn4Xxtu7": {}, "LQRENjEEztx1WsYS": {}, "iZqan0nSBJroav91": {}}}' \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordConcurrentHandlerV1' test.out

#- 23 GetGameRecordsBulk
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordsBulk \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["GXlvPG6bFYReVHQi", "pcCx9Zw5D2L7vIYh", "GGSyEW4ZJJ42d3PB"]}' \
    > test.out 2>&1
eval_tap $? 23 'GetGameRecordsBulk' test.out

#- 24 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'ddN8S48l9lyNApfl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'GetGameRecordHandlerV1' test.out

#- 25 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'xqMrj3oZk03QXcKM' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'PutGameRecordHandlerV1' test.out

#- 26 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'DYDDxHSZjtqXyJ58' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 26 'PostGameRecordHandlerV1' test.out

#- 27 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'f7Gc26SaiGVkydwY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'DeleteGameRecordHandlerV1' test.out

#- 28 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'WQG26yUZNmTBcvrb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["YCwZtxFHyPLtI8il", "byDPUIj88cekdqCt", "81P1ktfIovmv9gsR"]}' \
    > test.out 2>&1
eval_tap $? 28 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 29 RetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave retrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --limit '61' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 29 'RetrievePlayerRecords' test.out

#- 30 GetPlayerRecordsBulkHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordsBulkHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"keys": ["z9KOsb392k6YmJFf", "RByjlBiuFM3FIoVk", "8T3GpAnkCmBUqg2S"]}' \
    > test.out 2>&1
eval_tap $? 30 'GetPlayerRecordsBulkHandlerV1' test.out

#- 31 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'CnqntX9y1aZSWMiV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 31 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 32 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'i10sG6vxkfUcmqRR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bceJ5i0EeDxOgBnh' \
    --body '{"updatedAt": "hqElIaDml48wdNFL", "value": {"Tm5T50x9WT0GfH2r": {}, "tOa4EXsXzOXQAk4m": {}, "qrxzTtuLl4XlbGL8": {}}}' \
    > test.out 2>&1
eval_tap $? 32 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 33 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'QOxtjzm8y2wNhmwo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YZyI4EFZKBcYrCEA' \
    --body '{"updatedAt": "E7WIsfmx40NLRc6m", "value": {"8heKnWhzfe2Nubeo": {}, "KFeIaFQCYoDPICpn": {}, "duEEQlULdJz4mnRB": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 34 GetOtherPlayerPublicRecordKeyHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordKeyHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kMNxvvKgAT8mJrYq' \
    --limit '95' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 34 'GetOtherPlayerPublicRecordKeyHandlerV1' test.out

#- 35 GetOtherPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getOtherPlayerPublicRecordHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'XiI07A68eaqC2J9j' \
    --body '{"keys": ["yEW6GLbc0NaKDUL3", "sa13lk1dQBHO86Il", "BhnetU4RwTqUXlTD"]}' \
    > test.out 2>&1
eval_tap $? 35 'GetOtherPlayerPublicRecordHandlerV1' test.out

#- 36 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'BzOuYsaZA2yyd4mb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qoOfADMMAXFaY9eK' \
    > test.out 2>&1
eval_tap $? 36 'GetPlayerRecordHandlerV1' test.out

#- 37 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'a699bRVhyaKwwrAP' \
    --namespace "$AB_NAMESPACE" \
    --userId '2aMlu7WtjCtoYetO' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 37 'PutPlayerRecordHandlerV1' test.out

#- 38 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'O847g8OudOfjnCuH' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Z3c46IjGa23YvYmm' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 38 'PostPlayerRecordHandlerV1' test.out

#- 39 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'Dg7VYPXIuvUYTZBR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ujIUE1Tq5jyAZvkR' \
    > test.out 2>&1
eval_tap $? 39 'DeletePlayerRecordHandlerV1' test.out

#- 40 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'CMNFIurjh2imdb4r' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bkXj0ZwsVC0gL97Z' \
    > test.out 2>&1
eval_tap $? 40 'GetPlayerPublicRecordHandlerV1' test.out

#- 41 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'VJSPqJiwv1qlYB1R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SKs6gQxC3Gb7S0o4' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 41 'PutPlayerPublicRecordHandlerV1' test.out

#- 42 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'zGYY7KQI1AeFgPqa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Okvo1aolB4lkKB4E' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 42 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE