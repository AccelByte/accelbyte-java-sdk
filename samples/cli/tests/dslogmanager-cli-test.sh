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
    --deployment 'zJF3bnwz' \
    --endDate 'nynwoj0c' \
    --gameMode 'm8eZqTEM' \
    --limit '1' \
    --next 'Ya3CXIaw' \
    --partyId 'FYEAwODq' \
    --podName 'EKzudDsG' \
    --previous 'aapL64UY' \
    --provider 'yo2Z0yu4' \
    --region 'KpAIDsUC' \
    --sessionId 'lOos3AhZ' \
    --startDate 'x69PUuUW' \
    --status '9rW4cfGv' \
    --userId 'POXCPCzK' \
    > test.out 2>&1
eval_tap $? 2 'ListTerminatedServers' test.out

#- 3 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'WB64uXQv' \
    > test.out 2>&1
eval_tap $? 3 'DownloadServerLogs' test.out

#- 4 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'pM8G4FCE' \
    > test.out 2>&1
eval_tap $? 4 'CheckServerLogs' test.out

#- 5 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "enTDsU6b", "namespace": "KGJGhQNL", "pod_name": "BALgIsqt"}, {"alloc_id": "OMGF2Y7T", "namespace": "RDVa4HDx", "pod_name": "3pO5A0qc"}, {"alloc_id": "UqnyLfzN", "namespace": "UW0zp5ZF", "pod_name": "w0Sr9mTM"}]}' \
    > test.out 2>&1
eval_tap $? 5 'BatchDownloadServerLogs' test.out

#- 6 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment '7n3tK2Dw' \
    --endDate 'mcSXM4C5' \
    --gameMode 'rHinvFNF' \
    --limit '65' \
    --namespace "$AB_NAMESPACE" \
    --next 'D9e3G9pw' \
    --partyId '7oTzIPoB' \
    --podName 'dsOdbvkv' \
    --previous 'Y1cr7EDd' \
    --provider 'EZ8NN9gd' \
    --region 'GM3hpMQ3' \
    --sessionId 'IZi9UoIO' \
    --startDate 'Rfu1bun9' \
    --status 'm07596a4' \
    --userId 'ruyEPmtH' \
    > test.out 2>&1
eval_tap $? 6 'ListAllTerminatedServers' test.out

#- 7 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 7 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE