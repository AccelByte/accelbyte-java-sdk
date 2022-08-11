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
    --key 'wRhrHAyw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "pHIqKJ1h", "updatedAt": "HooX7B07", "value": {"OpdBz7SB": {}, "ZeUIEQlr": {}, "1VMCMgv2": {}}}' \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'Rb95DXcs' \
    --limit '35' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key '3hoqDU0z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key '8yfND9S9' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key '7TSrdG6Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'uTYfHHRe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 ListPlayerRecordHandlerV1
eval_tap 0 8 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 9 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key '8ip1iNIf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yhQpIKgd' \
    --body '{"set_by": "is2TLEFO", "updatedAt": "0e5ImPBr", "value": {"CWpD93Ha": {}, "wwoF7mHr": {}, "WKrya1k0": {}}}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 10 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'B36AKGGA' \
    --namespace "$AB_NAMESPACE" \
    --userId 'UyMpaJA6' \
    --body '{"set_by": "CPR8xeUb", "updatedAt": "sKWzIdXX", "value": {"7HDqY9o6": {}, "Ish5nHEc": {}, "slhYQZ72": {}}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 11 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'IvEBp08s' \
    --limit '36' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 11 'AdminRetrievePlayerRecords' test.out

#- 12 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'ArvijGp0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CvVZM5ai' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPlayerRecordHandlerV1' test.out

#- 13 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'ahfteauI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wQl8nqrk' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutPlayerRecordHandlerV1' test.out

#- 14 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'B3B0hym5' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PYbIW2Hd' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostPlayerRecordHandlerV1' test.out

#- 15 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key '1Iqf55gi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NSFIOEKy' \
    > test.out 2>&1
eval_tap $? 15 'AdminDeletePlayerRecordHandlerV1' test.out

#- 16 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'UCFwPru7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'By3VEx1B' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 17 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key '7VzvnRUB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hbjMAcfg' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 17 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'feGdPcgf' \
    --namespace "$AB_NAMESPACE" \
    --userId '12VXDolF' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 19 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'KvJdhvBZ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ka0nx2rL' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 20 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'yW6PLXgA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "2WUy8yIu", "value": {"BznXi688": {}, "NigOOyZw": {}, "vI0KlT5B": {}}}' \
    > test.out 2>&1
eval_tap $? 20 'PutGameRecordConcurrentHandlerV1' test.out

#- 21 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'E31wc7NX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetGameRecordHandlerV1' test.out

#- 22 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'DBPOhXq6' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordHandlerV1' test.out

#- 23 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'Uvt38I76' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 23 'PostGameRecordHandlerV1' test.out

#- 24 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'NoVdsnCG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGameRecordHandlerV1' test.out

#- 25 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'R5kPmwR3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["FirfO8OQ", "YMjjFBar", "ByWLr6PB"]}' \
    > test.out 2>&1
eval_tap $? 25 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 26 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key '8ILFGQAa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 27 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key '8mU4tMzs' \
    --namespace "$AB_NAMESPACE" \
    --userId 'tV0LYfkE' \
    --body '{"updatedAt": "J0FgF1sH", "value": {"jfO78Kmz": {}, "lBsaoXKn": {}, "BbmBZUax": {}}}' \
    > test.out 2>&1
eval_tap $? 27 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 28 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'qtYhSXNR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Pd3eclHR' \
    --body '{"updatedAt": "ygC4m9zI", "value": {"VVJkqurC": {}, "6rKB6ArE": {}, "UWRQu6NX": {}}}' \
    > test.out 2>&1
eval_tap $? 28 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 29 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'fzQxX6Cc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'D0QvltfG' \
    > test.out 2>&1
eval_tap $? 29 'GetPlayerRecordHandlerV1' test.out

#- 30 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key '4QVKbGfE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wyr3KCf8' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 30 'PutPlayerRecordHandlerV1' test.out

#- 31 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'ECwFeMVR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Bz1CKTLx' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 31 'PostPlayerRecordHandlerV1' test.out

#- 32 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'Y1nZWkpg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XcskGwSU' \
    > test.out 2>&1
eval_tap $? 32 'DeletePlayerRecordHandlerV1' test.out

#- 33 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'ojZSFlDM' \
    --namespace "$AB_NAMESPACE" \
    --userId '8gVFYkNk' \
    > test.out 2>&1
eval_tap $? 33 'GetPlayerPublicRecordHandlerV1' test.out

#- 34 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key '45kIccIT' \
    --namespace "$AB_NAMESPACE" \
    --userId '2nuq5u0n' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 34 'PutPlayerPublicRecordHandlerV1' test.out

#- 35 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key '75LZ7GWk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'EjfrrmOA' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 35 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE