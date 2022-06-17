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
echo "1..35"

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
    --body '{"set_by": "FtBxyZcD", "updatedAt": "XBpGlsQu", "value": {"Ju8vMf0I": {}}}' \
    --key 'sJkTrd8I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'V2zXnTKj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --body '{}' \
    --key 'XY1bPqam' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --body '{}' \
    --key 'iBxx9Cs1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key '8EY84ekI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 ListPlayerRecordHandlerV1
eval_tap 0 8 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 9 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --body '{"set_by": "tqRzHU1o", "updatedAt": "h570KQBV", "value": {"aewc72kr": {}}}' \
    --key 'Sha68n3Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nozp1C2K' \
    > test.out 2>&1
eval_tap $? 9 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 10 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --body '{"set_by": "mIQTuBdN", "updatedAt": "EUsxFb8C", "value": {"J17M7DJZ": {}}}' \
    --key 'aMSxECbZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bygyoarO' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 11 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'RoeNHSb8' \
    > test.out 2>&1
eval_tap $? 11 'AdminRetrievePlayerRecords' test.out

#- 12 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'Rh3kgs9q' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qJbnQsoB' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPlayerRecordHandlerV1' test.out

#- 13 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'giVpP8Cm' \
    --namespace "$AB_NAMESPACE" \
    --userId '3yvASUox' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutPlayerRecordHandlerV1' test.out

#- 14 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'dxxFqmAG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TJ8IEdag' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostPlayerRecordHandlerV1' test.out

#- 15 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'Etp4w29K' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ou9c19R6' \
    > test.out 2>&1
eval_tap $? 15 'AdminDeletePlayerRecordHandlerV1' test.out

#- 16 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'XDqWHkkP' \
    --namespace "$AB_NAMESPACE" \
    --userId '8npLEKMf' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 17 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'jiX7jpkV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Zk3IaQYE' \
    > test.out 2>&1
eval_tap $? 17 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'mqGodOEG' \
    --namespace "$AB_NAMESPACE" \
    --userId 't9gPOj0c' \
    > test.out 2>&1
eval_tap $? 18 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 19 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key '6i0JkvIa' \
    --namespace "$AB_NAMESPACE" \
    --userId 's73ucYnF' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 20 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "AJ3DK5T4", "value": {"Eogg0Y39": {}}}' \
    --key 'UoYlpv5b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'PutGameRecordConcurrentHandlerV1' test.out

#- 21 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'VAgtsDhU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetGameRecordHandlerV1' test.out

#- 22 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --body '{}' \
    --key 'TDUscbQD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordHandlerV1' test.out

#- 23 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --body '{}' \
    --key 'jbTQuPMz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'PostGameRecordHandlerV1' test.out

#- 24 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key '2PTRlkyU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGameRecordHandlerV1' test.out

#- 25 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --body '{"userIds": ["89ZPOw6z"]}' \
    --key 'PFJ42cwm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 26 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'zBBSMNco' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 27 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "AAOjKNjf", "value": {"cYHm093a": {}}}' \
    --key 'YgBU1sqj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yK0XH45P' \
    > test.out 2>&1
eval_tap $? 27 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 28 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "aRSOFQBt", "value": {"u23REZ8h": {}}}' \
    --key 'RVX7LGOv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'DdYiQS9i' \
    > test.out 2>&1
eval_tap $? 28 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 29 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key '7mV1C91p' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jG9gpxL6' \
    > test.out 2>&1
eval_tap $? 29 'GetPlayerRecordHandlerV1' test.out

#- 30 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'ycTQdvln' \
    --namespace "$AB_NAMESPACE" \
    --userId '2LAuSQWE' \
    > test.out 2>&1
eval_tap $? 30 'PutPlayerRecordHandlerV1' test.out

#- 31 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'XL6LFE1Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ho9m126Z' \
    > test.out 2>&1
eval_tap $? 31 'PostPlayerRecordHandlerV1' test.out

#- 32 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'Wc8hHtWv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bNYqgUqs' \
    > test.out 2>&1
eval_tap $? 32 'DeletePlayerRecordHandlerV1' test.out

#- 33 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'lArFPiHU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IvaCv8kU' \
    > test.out 2>&1
eval_tap $? 33 'GetPlayerPublicRecordHandlerV1' test.out

#- 34 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key '9dBBpdsJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'LhsVyExr' \
    > test.out 2>&1
eval_tap $? 34 'PutPlayerPublicRecordHandlerV1' test.out

#- 35 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'kxoot0B7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'WOfercZd' \
    > test.out 2>&1
eval_tap $? 35 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE