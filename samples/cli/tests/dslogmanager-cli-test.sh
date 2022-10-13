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
echo "1..7"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'PfIuqNym' \
    --endDate 'AVNkIZ7p' \
    --gameMode 'uiC3IMw6' \
    --limit '12' \
    --next 'v8WZS4lG' \
    --partyId 'aEAQqt3x' \
    --podName 'ZuJBk8Vm' \
    --previous 'YmQxJNqH' \
    --provider 'tBdz1RgF' \
    --region '0RMWqHWA' \
    --sessionId 't8KBHxqi' \
    --startDate 'J9wbcrDf' \
    --status '86WiakH9' \
    --userId 'KM1JcUME' \
    > test.out 2>&1
eval_tap $? 2 'ListTerminatedServers' test.out

#- 3 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'pn5vBaHa' \
    > test.out 2>&1
eval_tap $? 3 'DownloadServerLogs' test.out

#- 4 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'VzabUCoo' \
    > test.out 2>&1
eval_tap $? 4 'CheckServerLogs' test.out

#- 5 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "BKlo3ryz", "namespace": "o8QssSjX", "pod_name": "9Bl3At43"}, {"alloc_id": "jlL0zjDF", "namespace": "2hlA7T9h", "pod_name": "YxANC1iR"}, {"alloc_id": "EFRPyrru", "namespace": "c1Q2t2ZW", "pod_name": "G6UGP4GJ"}]}' \
    > test.out 2>&1
eval_tap $? 5 'BatchDownloadServerLogs' test.out

#- 6 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'XNXAedbC' \
    --endDate 'b60xdgvE' \
    --gameMode 'aXpFJlnm' \
    --limit '30' \
    --namespace "$AB_NAMESPACE" \
    --next 'xbtTrJk6' \
    --partyId 'kcXXHNvZ' \
    --podName 'WTbTeb4s' \
    --previous 'Dt59g5rC' \
    --provider 'fc7iQTLV' \
    --region 'Z4HMkHhe' \
    --sessionId 'yERq4x0l' \
    --startDate 'as7SmsvT' \
    --status 'm1PRa54H' \
    --userId '08sY7mlP' \
    > test.out 2>&1
eval_tap $? 6 'ListAllTerminatedServers' test.out

#- 7 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 7 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE