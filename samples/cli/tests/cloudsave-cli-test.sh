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
    --key 'ItmfKT8d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "z0f9nipz", "updatedAt": "9kSST69B", "value": {"GCJDxAiy": {}, "crpfqmGD": {}, "IRzCdXV9": {}}}' \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'mfqybX2Y' \
    --limit '63' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'mAaKsEtf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'PK9kYsis' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key 'PJvpXHWb' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'YrvwArEa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 ListPlayerRecordHandlerV1
eval_tap 0 8 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 9 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'Krl3zf0P' \
    --namespace "$AB_NAMESPACE" \
    --userId 'rdatUaq2' \
    --body '{"set_by": "5a34T2LJ", "updatedAt": "VwgaS5p9", "value": {"lpKmlLGa": {}, "wiSxAdPd": {}, "zGF51CVk": {}}}' \
    > test.out 2>&1
eval_tap $? 9 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 10 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'NTqyZXw5' \
    --namespace "$AB_NAMESPACE" \
    --userId '3bs3cf9k' \
    --body '{"set_by": "H7o19M9j", "updatedAt": "yUkucgLu", "value": {"x92fZnE7": {}, "T1iXTJRi": {}, "JZxeeGay": {}}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 11 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId '7lqdiZlx' \
    --limit '30' \
    --offset '89' \
    > test.out 2>&1
eval_tap $? 11 'AdminRetrievePlayerRecords' test.out

#- 12 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'I5qktONu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TiBgn5h1' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetPlayerRecordHandlerV1' test.out

#- 13 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key 'bSEWQRGb' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jacTE61w' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPutPlayerRecordHandlerV1' test.out

#- 14 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key 'UwDMuvp6' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RFvOx76Y' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPostPlayerRecordHandlerV1' test.out

#- 15 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'pb4TQqL5' \
    --namespace "$AB_NAMESPACE" \
    --userId '1hFX4qon' \
    > test.out 2>&1
eval_tap $? 15 'AdminDeletePlayerRecordHandlerV1' test.out

#- 16 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key 'byfS2u1R' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cUiLZOWu' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 17 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'H7anugrn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ydl4M3qE' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 17 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key '6SZKkn77' \
    --namespace "$AB_NAMESPACE" \
    --userId 'e19FPucA' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 19 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'yCKmBikf' \
    --namespace "$AB_NAMESPACE" \
    --userId 'TestXC8b' \
    > test.out 2>&1
eval_tap $? 19 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 20 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'dDzLIsmw' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "GcghUhaw", "value": {"URqIwebZ": {}, "tPRLWqmH": {}, "2sKoBxox": {}}}' \
    > test.out 2>&1
eval_tap $? 20 'PutGameRecordConcurrentHandlerV1' test.out

#- 21 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'IywBLfun' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetGameRecordHandlerV1' test.out

#- 22 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key '3uppHKej' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordHandlerV1' test.out

#- 23 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'o7KbfytD' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 23 'PostGameRecordHandlerV1' test.out

#- 24 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'bATSvVlF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGameRecordHandlerV1' test.out

#- 25 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key '7Ez5ozIR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["opCpGzZL", "A9S1D1ur", "YQE3hZK0"]}' \
    > test.out 2>&1
eval_tap $? 25 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 26 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'ihbnBTvP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 27 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'cMxXqhJ8' \
    --namespace "$AB_NAMESPACE" \
    --userId '1ipJLIql' \
    --body '{"updatedAt": "dR371nuI", "value": {"IUMotJ4I": {}, "0vyt5L4U": {}, "ZWdGZDQF": {}}}' \
    > test.out 2>&1
eval_tap $? 27 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 28 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'iaTynyWv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'VPwjWC2Q' \
    --body '{"updatedAt": "Ek8nkoqF", "value": {"P8VZ4qKM": {}, "2n2l9a7k": {}, "sTANOa53": {}}}' \
    > test.out 2>&1
eval_tap $? 28 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 29 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key '6V78jKsi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'cpFxRo47' \
    > test.out 2>&1
eval_tap $? 29 'GetPlayerRecordHandlerV1' test.out

#- 30 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'g57bdXEU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fViQJpu2' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 30 'PutPlayerRecordHandlerV1' test.out

#- 31 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'THWw8Hk7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ExH8U06P' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 31 'PostPlayerRecordHandlerV1' test.out

#- 32 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key 'SOqiavaG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'fTVhQngC' \
    > test.out 2>&1
eval_tap $? 32 'DeletePlayerRecordHandlerV1' test.out

#- 33 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'sOIijrMK' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZBeMMMw6' \
    > test.out 2>&1
eval_tap $? 33 'GetPlayerPublicRecordHandlerV1' test.out

#- 34 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'SFbRozPE' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yPQP3als' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 34 'PutPlayerPublicRecordHandlerV1' test.out

#- 35 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'Cnc2Ox0f' \
    --namespace "$AB_NAMESPACE" \
    --userId 'nSdkruU0' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 35 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE