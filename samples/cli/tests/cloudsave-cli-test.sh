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
    --key 'IrOLTk2D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "mE17on3r", "updatedAt": "3Z69lLzY", "value": {"Yl8VzC1D": {}, "J2huBoyV": {}, "65mfIx6x": {}}}' \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'pnzlwrf6' \
    --limit '15' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'YROnuYLy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'Xt0JZdOR' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'SYdynIxr' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'KOHlcXrl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 ListPlayerRecordHandlerV1
eval_tap 0 8 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 9 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'SD4UvbFK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jkSUC6O6' \
    --body '{"set_by": "NlLdZ5JR", "updatedAt": "2Jjd1NzZ", "value": {"1lKyFcDY": {}, "cKlC3ECC": {}, "c37Ctv26": {}}}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 10 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'tkAZNs1W' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZN77ij88' \
    --body '{"set_by": "3qn9WNul", "updatedAt": "cv8r4sLM", "value": {"nsbB9ZJH": {}, "ovgtDftu": {}, "jgst0d8G": {}}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 11 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'I2fsaE8w' \
    --limit '7' \
    --offset '92' \
    > test.out 2>&1
eval_tap $? 11 'AdminRetrievePlayerRecords' test.out

#- 12 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'AEb0ZJ5c' \
    --namespace "$AB_NAMESPACE" \
    --userId 'lROOG4kQ' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPlayerRecordHandlerV1' test.out

#- 13 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'duHQS2fN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zzPeyGfz' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutPlayerRecordHandlerV1' test.out

#- 14 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'YYZ6ljnK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'V3HAZrEB' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostPlayerRecordHandlerV1' test.out

#- 15 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key '6RmPhjt6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pKCZmr6V' \
    > test.out 2>&1
eval_tap $? 15 'AdminDeletePlayerRecordHandlerV1' test.out

#- 16 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '9b2UM24I' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bJS5Pz5P' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 17 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'YtNORjSu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vCPzGftk' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 17 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key 'uVE7pU1Z' \
    --namespace "$AB_NAMESPACE" \
    --userId 'hwaLWzJ7' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 19 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'zDRGB3RR' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XOVaoXkH' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 20 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'kIqgFLOj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "wtCriY0e", "value": {"VcuXKvAL": {}, "dtQNLkE7": {}, "pSU50ru1": {}}}' \
    > test.out 2>&1
eval_tap $? 20 'PutGameRecordConcurrentHandlerV1' test.out

#- 21 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'rGOObFNS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetGameRecordHandlerV1' test.out

#- 22 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'nf489SrF' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordHandlerV1' test.out

#- 23 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'kLkxW4ar' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 23 'PostGameRecordHandlerV1' test.out

#- 24 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'isGAhYLk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGameRecordHandlerV1' test.out

#- 25 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'RkpKvU4D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["54n53kyb", "n2pw7LZb", "S8LwwJZx"]}' \
    > test.out 2>&1
eval_tap $? 25 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 26 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'LHI2Udrh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 27 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'u1PKPmmk' \
    --namespace "$AB_NAMESPACE" \
    --userId 'JBrFpE8x' \
    --body '{"updatedAt": "Eqnxw1B9", "value": {"VnY0N0Id": {}, "aTPY8iST": {}, "fvya1HnT": {}}}' \
    > test.out 2>&1
eval_tap $? 27 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 28 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key '3H9bENzr' \
    --namespace "$AB_NAMESPACE" \
    --userId 'w6JZyMas' \
    --body '{"updatedAt": "kzCJOviI", "value": {"C9HxJyHH": {}, "xDyDkmyM": {}, "qRu3isIu": {}}}' \
    > test.out 2>&1
eval_tap $? 28 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 29 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key 'HQkRypiJ' \
    --namespace "$AB_NAMESPACE" \
    --userId '4XNli0e1' \
    > test.out 2>&1
eval_tap $? 29 'GetPlayerRecordHandlerV1' test.out

#- 30 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'sOgAgqxx' \
    --namespace "$AB_NAMESPACE" \
    --userId '352BrXPW' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 30 'PutPlayerRecordHandlerV1' test.out

#- 31 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'P38D4yAe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'g2sDeLDl' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 31 'PostPlayerRecordHandlerV1' test.out

#- 32 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'Fj3D7owT' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jXx1J84Q' \
    > test.out 2>&1
eval_tap $? 32 'DeletePlayerRecordHandlerV1' test.out

#- 33 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'ztBOICLb' \
    --namespace "$AB_NAMESPACE" \
    --userId '7ASeYjxL' \
    > test.out 2>&1
eval_tap $? 33 'GetPlayerPublicRecordHandlerV1' test.out

#- 34 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'uySTEdPj' \
    --namespace "$AB_NAMESPACE" \
    --userId '27yHRu7c' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 34 'PutPlayerPublicRecordHandlerV1' test.out

#- 35 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'g18VdxkL' \
    --namespace "$AB_NAMESPACE" \
    --userId '0vkShL8G' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 35 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE