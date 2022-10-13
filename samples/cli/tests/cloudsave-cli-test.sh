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
echo "1..37"

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
    --key 'u0Z59i8N' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "5rjnLG6X", "updatedAt": "gsE7zjf1", "value": {"vS8YYPON": {}, "UKHfIWAk": {}, "FDF3zhhL": {}}}' \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'StRYRRCK' \
    --limit '89' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'V2Q5s8eB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'neWJDGO9' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key '0Jr5Ywwe' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'DV6cmVtO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["pbCpHFmB", "ny4tfaWF", "kx5SXBGs"], "user_id": "w1xhfbG6"}, {"keys": ["vjClFxkU", "9rNszvZ9", "nRa88FeG"], "user_id": "WsLVYBlw"}, {"keys": ["NbXVRjsG", "dg1Ffdax", "xZgsVYT1"], "user_id": "Eq6RvFHZ"}]}' \
    > test.out 2>&1
eval_tap $? 8 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 9 ListPlayerRecordHandlerV1
eval_tap 0 9 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 10 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'av9kiDQG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LtGAyTT7' \
    --body '{"set_by": "xzAOVxHA", "updatedAt": "CPSqYouk", "value": {"7jyDCpfR": {}, "DzytW08G": {}, "JrLtov6S": {}}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 11 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'WRMFQawn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'QHoUz9YR' \
    --body '{"set_by": "pVpZlL9I", "updatedAt": "D800kEWe", "value": {"rBqzAokm": {}, "sCLTXBDe": {}, "80SInEwg": {}}}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 12 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'HbIsoyET' \
    --limit '39' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 12 'AdminRetrievePlayerRecords' test.out

#- 13 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'i4NNkMBz' \
    --namespace "$AB_NAMESPACE" \
    --userId '1pGj7zee' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerRecordHandlerV1' test.out

#- 14 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'nd7eOCHz' \
    --namespace "$AB_NAMESPACE" \
    --userId '8B4Z4T8y' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPutPlayerRecordHandlerV1' test.out

#- 15 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'yMXJ877s' \
    --namespace "$AB_NAMESPACE" \
    --userId '6yPVPYoc' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPostPlayerRecordHandlerV1' test.out

#- 16 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'Kej3iKN0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'l23aTsZe' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeletePlayerRecordHandlerV1' test.out

#- 17 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'e1yIesAE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aGlRgowG' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key '7KDn9ol2' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hn67zE2d' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 19 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'Q1fr0XZ1' \
    --namespace "$AB_NAMESPACE" \
    --userId '9OiPpbJY' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 19 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 20 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'LnLsjlDB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JehQirE4' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 21 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key 'wajuxzh3' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NjjfvWGG' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 22 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'vNm6qieZ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "WzoK49vp", "value": {"10xrI4wg": {}, "Rw1z785u": {}, "famav0sH": {}}}' \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordConcurrentHandlerV1' test.out

#- 23 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'KYxmg4F3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetGameRecordHandlerV1' test.out

#- 24 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'HSWziLnv' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'PutGameRecordHandlerV1' test.out

#- 25 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'cGmV1M7H' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'PostGameRecordHandlerV1' test.out

#- 26 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'HHTzDwBp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'DeleteGameRecordHandlerV1' test.out

#- 27 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'OWdKHsES' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["icqAPz2k", "9OQrUrmR", "Cl8svTsv"]}' \
    > test.out 2>&1
eval_tap $? 27 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 28 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'r5mlV9UA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 29 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'h7Th4VcC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pJKyV4vI' \
    --body '{"updatedAt": "yCGtH4A2", "value": {"T9Pdzx9m": {}, "5CnDGIKZ": {}, "Y2pFCISq": {}}}' \
    > test.out 2>&1
eval_tap $? 29 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 30 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'OTSvgf0n' \
    --namespace "$AB_NAMESPACE" \
    --userId 'M4exWeDu' \
    --body '{"updatedAt": "dXEVJqSy", "value": {"1CZtzIQl": {}, "zSWXoqOf": {}, "8PRKb481": {}}}' \
    > test.out 2>&1
eval_tap $? 30 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 31 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'AjvG6y4S' \
    --namespace "$AB_NAMESPACE" \
    --userId 'psqW90L2' \
    > test.out 2>&1
eval_tap $? 31 'GetPlayerRecordHandlerV1' test.out

#- 32 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'mVN7NYSu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VUGtaes3' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 32 'PutPlayerRecordHandlerV1' test.out

#- 33 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'tRJNDW1i' \
    --namespace "$AB_NAMESPACE" \
    --userId 'j9bcml5i' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'PostPlayerRecordHandlerV1' test.out

#- 34 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'MQv4dyVd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'eIfUySvX' \
    > test.out 2>&1
eval_tap $? 34 'DeletePlayerRecordHandlerV1' test.out

#- 35 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key '0tpOaxaE' \
    --namespace "$AB_NAMESPACE" \
    --userId '7m6o0U4q' \
    > test.out 2>&1
eval_tap $? 35 'GetPlayerPublicRecordHandlerV1' test.out

#- 36 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'Hf1TYq1S' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oC8IAxjq' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 36 'PutPlayerPublicRecordHandlerV1' test.out

#- 37 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'feXLjSUY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gnv8UTME' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 37 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE