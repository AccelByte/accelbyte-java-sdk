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
    --key 'nBHfxejR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"set_by": "saNGBIJu", "updatedAt": "OlKWIuqX", "value": {"orR8cAOj": {}, "a9VdV7Am": {}, "I9EqtHW4": {}}}' \
    > test.out 2>&1
eval_tap $? 2 'AdminPutGameRecordConcurrentHandlerV1' test.out

#- 3 ListGameRecordsHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave listGameRecordsHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --query 'nz9eEVPN' \
    --limit '27' \
    --offset '30' \
    > test.out 2>&1
eval_tap $? 3 'ListGameRecordsHandlerV1' test.out

#- 4 AdminGetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetGameRecordHandlerV1 \
    --key 'HyWVMZPF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetGameRecordHandlerV1' test.out

#- 5 AdminPutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutGameRecordHandlerV1 \
    --key 'BB5gpiCE' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPutGameRecordHandlerV1' test.out

#- 6 AdminPostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostGameRecordHandlerV1 \
    --key '1ggxI1ZM' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPostGameRecordHandlerV1' test.out

#- 7 AdminDeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeleteGameRecordHandlerV1 \
    --key 'Ih9MKJkk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminDeleteGameRecordHandlerV1' test.out

#- 8 BulkGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerRecordSizeHandlerV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": [{"keys": ["XJYFopQa", "DihzvDz1", "VeOV8Sn5"], "user_id": "CT67F9N4"}, {"keys": ["Ouj8HXyI", "Jf6T5dCY", "WOVFvbdS"], "user_id": "zce17QnQ"}, {"keys": ["qpvl5D37", "r41xSnk6", "9edjpp3N"], "user_id": "70Yjm8Is"}]}' \
    > test.out 2>&1
eval_tap $? 8 'BulkGetPlayerRecordSizeHandlerV1' test.out

#- 9 ListPlayerRecordHandlerV1
eval_tap 0 9 'ListPlayerRecordHandlerV1 # SKIP deprecated' test.out

#- 10 AdminPutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordConcurrentHandlerV1 \
    --key 'yr2lTLYG' \
    --namespace "$AB_NAMESPACE" \
    --userId 'KHLlhVxK' \
    --body '{"set_by": "XCqo6d6e", "updatedAt": "DtkkTFG7", "value": {"nNVv8qNB": {}, "wXfyrj2a": {}, "bb7RzADu": {}}}' \
    > test.out 2>&1
eval_tap $? 10 'AdminPutPlayerRecordConcurrentHandlerV1' test.out

#- 11 AdminPutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordConcurrentHandlerV1 \
    --key 'pjy8Wx0M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'GJOQ2Xtf' \
    --body '{"set_by": "JLwCGeUe", "updatedAt": "ChD23BAL", "value": {"3QBdG1X1": {}, "yQer5jF3": {}, "pd7x4Oi8": {}}}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 12 AdminRetrievePlayerRecords
./ng net.accelbyte.sdk.cli.Main cloudsave adminRetrievePlayerRecords \
    --namespace "$AB_NAMESPACE" \
    --userId 'yJgk5OiC' \
    --limit '3' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 12 'AdminRetrievePlayerRecords' test.out

#- 13 AdminGetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordHandlerV1 \
    --key 'Kmb8XFhp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jXSIK5dk' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetPlayerRecordHandlerV1' test.out

#- 14 AdminPutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerRecordHandlerV1 \
    --key '5qvV44Uw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'OaSF53x7' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 14 'AdminPutPlayerRecordHandlerV1' test.out

#- 15 AdminPostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerRecordHandlerV1 \
    --key '0tPtB2Vj' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oIuXLgyD' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 15 'AdminPostPlayerRecordHandlerV1' test.out

#- 16 AdminDeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerRecordHandlerV1 \
    --key 'heRRbgOS' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L1gn8YAj' \
    > test.out 2>&1
eval_tap $? 16 'AdminDeletePlayerRecordHandlerV1' test.out

#- 17 AdminGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerPublicRecordHandlerV1 \
    --key '4PbJ0bwv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZkmgGt9G' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetPlayerPublicRecordHandlerV1' test.out

#- 18 AdminPutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPutPlayerPublicRecordHandlerV1 \
    --key 'EGy4rGEo' \
    --namespace "$AB_NAMESPACE" \
    --userId 'YgMhIt1H' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 18 'AdminPutPlayerPublicRecordHandlerV1' test.out

#- 19 AdminPostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminPostPlayerPublicRecordHandlerV1 \
    --key '4rIC1oF4' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wUJcZFxq' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 19 'AdminPostPlayerPublicRecordHandlerV1' test.out

#- 20 AdminDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminDeletePlayerPublicRecordHandlerV1 \
    --key 'Mcxh04um' \
    --namespace "$AB_NAMESPACE" \
    --userId 'oa44Ml1H' \
    > test.out 2>&1
eval_tap $? 20 'AdminDeletePlayerPublicRecordHandlerV1' test.out

#- 21 AdminGetPlayerRecordSizeHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave adminGetPlayerRecordSizeHandlerV1 \
    --key '91KYDIb0' \
    --namespace "$AB_NAMESPACE" \
    --userId 'wROyo0Oy' \
    > test.out 2>&1
eval_tap $? 21 'AdminGetPlayerRecordSizeHandlerV1' test.out

#- 22 PutGameRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordConcurrentHandlerV1 \
    --key 'YiJlxpUq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"updatedAt": "WaSq62V1", "value": {"XRpKzeXv": {}, "rMiGE8Su": {}, "om1WS9OS": {}}}' \
    > test.out 2>&1
eval_tap $? 22 'PutGameRecordConcurrentHandlerV1' test.out

#- 23 GetGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getGameRecordHandlerV1 \
    --key 'cH6fzD1c' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetGameRecordHandlerV1' test.out

#- 24 PutGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putGameRecordHandlerV1 \
    --key 'XmOqS7Y8' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 24 'PutGameRecordHandlerV1' test.out

#- 25 PostGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postGameRecordHandlerV1 \
    --key 'H6H5A14X' \
    --namespace "$AB_NAMESPACE" \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 25 'PostGameRecordHandlerV1' test.out

#- 26 DeleteGameRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deleteGameRecordHandlerV1 \
    --key 'wcPNsCfj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'DeleteGameRecordHandlerV1' test.out

#- 27 BulkGetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave bulkGetPlayerPublicRecordHandlerV1 \
    --key 'IK8P8ed1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userIds": ["5ZLNPpnw", "K1Fc78QR", "LeLlTlqb"]}' \
    > test.out 2>&1
eval_tap $? 27 'BulkGetPlayerPublicRecordHandlerV1' test.out

#- 28 PublicDeletePlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave publicDeletePlayerPublicRecordHandlerV1 \
    --key 'y17GtAjD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'PublicDeletePlayerPublicRecordHandlerV1' test.out

#- 29 PutPlayerRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordConcurrentHandlerV1 \
    --key 'a1P40UZL' \
    --namespace "$AB_NAMESPACE" \
    --userId 'BilWdKXG' \
    --body '{"updatedAt": "2wOeDHfd", "value": {"A5yloOzC": {}, "UsIoSg4W": {}, "ziMTCaQ9": {}}}' \
    > test.out 2>&1
eval_tap $? 29 'PutPlayerRecordConcurrentHandlerV1' test.out

#- 30 PutPlayerPublicRecordConcurrentHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordConcurrentHandlerV1 \
    --key 'NBNHKtaD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vjeHBt4W' \
    --body '{"updatedAt": "vyGkRNDp", "value": {"rYtrf3Lc": {}, "wQSx5YI2": {}, "n1Pd8PqT": {}}}' \
    > test.out 2>&1
eval_tap $? 30 'PutPlayerPublicRecordConcurrentHandlerV1' test.out

#- 31 GetPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerRecordHandlerV1 \
    --key '43sYZfV6' \
    --namespace "$AB_NAMESPACE" \
    --userId '3pqyDyvi' \
    > test.out 2>&1
eval_tap $? 31 'GetPlayerRecordHandlerV1' test.out

#- 32 PutPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerRecordHandlerV1 \
    --key 'nno7EDsn' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iiKKaaHI' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 32 'PutPlayerRecordHandlerV1' test.out

#- 33 PostPlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerRecordHandlerV1 \
    --key 'jVSl4e0T' \
    --namespace "$AB_NAMESPACE" \
    --userId 'iZz5PeeL' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 33 'PostPlayerRecordHandlerV1' test.out

#- 34 DeletePlayerRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave deletePlayerRecordHandlerV1 \
    --key '1jFxW6Jm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PCpMgL8h' \
    > test.out 2>&1
eval_tap $? 34 'DeletePlayerRecordHandlerV1' test.out

#- 35 GetPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave getPlayerPublicRecordHandlerV1 \
    --key 'nyT3Pvpm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IjK8Y5H7' \
    > test.out 2>&1
eval_tap $? 35 'GetPlayerPublicRecordHandlerV1' test.out

#- 36 PutPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave putPlayerPublicRecordHandlerV1 \
    --key 'Si966AFe' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZVU6XKkO' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 36 'PutPlayerPublicRecordHandlerV1' test.out

#- 37 PostPlayerPublicRecordHandlerV1
./ng net.accelbyte.sdk.cli.Main cloudsave postPlayerPublicRecordHandlerV1 \
    --key 'WDdGaOTM' \
    --namespace "$AB_NAMESPACE" \
    --userId 'RDyOLDya' \
    --body '{}' \
    > test.out 2>&1
eval_tap $? 37 'PostPlayerPublicRecordHandlerV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE