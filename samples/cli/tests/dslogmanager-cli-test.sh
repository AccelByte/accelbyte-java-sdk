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
    --deployment 'X521mT6L' \
    --endDate 'fLaeMdUP' \
    --gameMode '1ISwgcFu' \
    --limit '85' \
    --next 'poxtV6t4' \
    --partyId 's9S94JXt' \
    --podName 'nXSOlXyJ' \
    --previous 'p3aT78Wv' \
    --provider 'xe7yCycY' \
    --region 'Dealldu6' \
    --sessionId 'Gq549A8J' \
    --startDate '2eXHTw8N' \
    --status 'bIZUVbeh' \
    --userId 'N2hNPa5q' \
    > test.out 2>&1
eval_tap $? 2 'ListTerminatedServers' test.out

#- 3 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'S0HJ6lPl' \
    > test.out 2>&1
eval_tap $? 3 'DownloadServerLogs' test.out

#- 4 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName '8omhXJyx' \
    > test.out 2>&1
eval_tap $? 4 'CheckServerLogs' test.out

#- 5 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "WBNcw2K4", "namespace": "WtJQImDC", "pod_name": "HyHrWqCa"}, {"alloc_id": "8nUqW5VU", "namespace": "yCz2qXyh", "pod_name": "KLVYdhjh"}, {"alloc_id": "KkRlkd8j", "namespace": "YWtonLu7", "pod_name": "2XwVmNtE"}]}' \
    > test.out 2>&1
eval_tap $? 5 'BatchDownloadServerLogs' test.out

#- 6 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment '9BXUc3MZ' \
    --endDate 'ZNspxX7B' \
    --gameMode 'a7OH8AeQ' \
    --limit '30' \
    --namespace "$AB_NAMESPACE" \
    --next 'XlERdq9j' \
    --partyId 'p9HDYtMj' \
    --podName 'OQCCHDNS' \
    --previous 'Kr7GoH5g' \
    --provider 'UjAGl3Ml' \
    --region 'iIsb1Let' \
    --sessionId 'uow0Npgy' \
    --startDate 'q3BXRXQg' \
    --status 'gB3R3iQc' \
    --userId 'AMTQkj8z' \
    > test.out 2>&1
eval_tap $? 6 'ListAllTerminatedServers' test.out

#- 7 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 7 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE