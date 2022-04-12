#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

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

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..33"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminPutGameRecordConcurrentHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPutGameRecordConcurrentHandlerV1 \
    --body '{"set_by": "FtBxyZcD", "updatedAt": "XBpGlsQu", "value": {"Ju8vMf0I": {}}}' \
    --key 'sJkTrd8I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
java -jar "${CLI_JAR}" cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminGetGameRecordHandlerV1 \
    --key 'V2zXnTKj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPutGameRecordHandlerV1 \
    --body '{}' \
    --key 'XY1bPqam' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPostGameRecordHandlerV1 \
    --body '{}' \
    --key 'iBxx9Cs1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminDeleteGameRecordHandlerV1 \
    --key '8EY84ekI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 ListPlayerRecordHandlerV1
eval_tap 0 8 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 9 AdminPutPlayerPublicRecordConcurrentHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --body '{"set_by": "tqRzHU1o", "updatedAt": "h570KQBV", "value": {"aewc72kr": {}}}' \
    --key 'Sha68n3Y' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nozp1C2K' \
    > test.out 2>&1
eval_tap $? 9 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 10 AdminRetrievePlayerRecords
java -jar "${CLI_JAR}" cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'mIQTuBdN' \
    > test.out 2>&1
eval_tap $? 10 'AdminRetrievePlayerRecords' test.out

#- 11 AdminGetPlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'EUsxFb8C' \
    --namespace "$AB_NAMESPACE" \
    --userId 'J17M7DJZ' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetPlayerRecordHandlerV1' test.out

#- 12 AdminPutPlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPutPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'aMSxECbZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bygyoarO' \
    > test.out 2>&1
eval_tap $? 12 'AdminPutPlayerRecordHandlerV1' test.out

#- 13 AdminPostPlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPostPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'RoeNHSb8' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Rh3kgs9q' \
    > test.out 2>&1
eval_tap $? 13 'AdminPostPlayerRecordHandlerV1' test.out

#- 14 AdminDeletePlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'qJbnQsoB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'giVpP8Cm' \
    > test.out 2>&1
eval_tap $? 14 'AdminDeletePlayerRecordHandlerV1' test.out

#- 15 AdminGetPlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '3yvASUox' \
    --namespace "$AB_NAMESPACE" \
    --userId 'dxxFqmAG' \
    > test.out 2>&1
eval_tap $? 15 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 16 AdminPutPlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'TJ8IEdag' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Etp4w29K' \
    > test.out 2>&1
eval_tap $? 16 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 17 AdminPostPlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'Ou9c19R6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XDqWHkkP' \
    > test.out 2>&1
eval_tap $? 17 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 18 AdminDeletePlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key '8npLEKMf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jiX7jpkV' \
    > test.out 2>&1
eval_tap $? 18 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 19 PutGameRecordConcurrentHandlerV1
java -jar "${CLI_JAR}" cloudsave putGameRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "Zk3IaQYE", "value": {"mqGodOEG": {}}}' \
    --key 't9gPOj0c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'PutGameRecordConcurrentHandlerV1' test.out

#- 20 GetGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave getGameRecordHandlerV1 \
    --key '6i0JkvIa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'GetGameRecordHandlerV1' test.out

#- 21 PutGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave putGameRecordHandlerV1 \
    --body '{}' \
    --key 's73ucYnF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'PutGameRecordHandlerV1' test.out

#- 22 PostGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave postGameRecordHandlerV1 \
    --body '{}' \
    --key 'AJ3DK5T4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'PostGameRecordHandlerV1' test.out

#- 23 DeleteGameRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave deleteGameRecordHandlerV1 \
    --key 'Eogg0Y39' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'DeleteGameRecordHandlerV1' test.out

#- 24 BulkGetPlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --body '{"userIds": ["UoYlpv5b"]}' \
    --key 'VAgtsDhU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 25 PublicDeletePlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'TDUscbQD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 25 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 26 PutPlayerPublicRecordConcurrentHandlerV1
java -jar "${CLI_JAR}" cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --body '{"updatedAt": "jbTQuPMz", "value": {"2PTRlkyU": {}}}' \
    --key '89ZPOw6z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PFJ42cwm' \
    > test.out 2>&1
eval_tap $? 26 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 27 GetPlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave getPlayerRecordHandlerV1 \
    --key 'zBBSMNco' \
    --namespace "$AB_NAMESPACE" \
    --userId 'AAOjKNjf' \
    > test.out 2>&1
eval_tap $? 27 'GetPlayerRecordHandlerV1' test.out

#- 28 PutPlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave putPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'cYHm093a' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YgBU1sqj' \
    > test.out 2>&1
eval_tap $? 28 'PutPlayerRecordHandlerV1' test.out

#- 29 PostPlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave postPlayerRecordHandlerV1 \
    --body '{}' \
    --key 'yK0XH45P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'aRSOFQBt' \
    > test.out 2>&1
eval_tap $? 29 'PostPlayerRecordHandlerV1' test.out

#- 30 DeletePlayerRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave deletePlayerRecordHandlerV1 \
    --key 'u23REZ8h' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RVX7LGOv' \
    > test.out 2>&1
eval_tap $? 30 'DeletePlayerRecordHandlerV1' test.out

#- 31 GetPlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'DdYiQS9i' \
    --namespace "$AB_NAMESPACE" \
    --userId '7mV1C91p' \
    > test.out 2>&1
eval_tap $? 31 'GetPlayerPublicRecordHandlerV1' test.out

#- 32 PutPlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave putPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key 'jG9gpxL6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ycTQdvln' \
    > test.out 2>&1
eval_tap $? 32 'PutPlayerPublicRecordHandlerV1' test.out

#- 33 PostPlayerPublicRecordHandlerV1
java -jar "${CLI_JAR}" cloudsave postPlayerPublicRecordHandlerV1 \
    --body '{}' \
    --key '2LAuSQWE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XL6LFE1Y' \
    > test.out 2>&1
eval_tap $? 33 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE