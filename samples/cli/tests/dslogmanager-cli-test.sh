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
echo "1..8"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager getServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'mzenepJG' \
    --logType 'QAbpkh2m' \
    --offset '26' \
    --origin 'Br4Ks59v' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'Ml92BEKH' \
    --endDate 'LSZBXJjX' \
    --gameMode 'jGEbWKLG' \
    --limit '77' \
    --next 'NNoeElZl' \
    --partyId 'aUVXFVDz' \
    --podName 'KKJ0JfCU' \
    --previous 'gGasWxKO' \
    --provider 'J6pJXpDe' \
    --region 'f5e0Qxx9' \
    --sessionId 'OEp4l1Ug' \
    --startDate 'byMJkdSW' \
    --status 'hZ54AJBg' \
    --userId 'xdV1ORtK' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'SLKY7K2C' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'c6yqTpxG' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "svC8zREt", "namespace": "6z1YY01Y", "pod_name": "VXfAS2bt"}, {"alloc_id": "84s1jUFn", "namespace": "ZHEk6025", "pod_name": "Ew4QST2q"}, {"alloc_id": "6Mfl9JLK", "namespace": "lN1bXfjN", "pod_name": "o9Qvzk10"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment '9bc3edYl' \
    --endDate 'd5MI6G4Q' \
    --gameMode '0A3FSpV3' \
    --limit '75' \
    --namespace "$AB_NAMESPACE" \
    --next 'Z4a8ssE1' \
    --partyId 'N5VUtblj' \
    --podName 'ZaPvepA7' \
    --previous 'vQNRtS72' \
    --provider 'kFYmRBd8' \
    --region 'NTxqpdpf' \
    --sessionId 'kgK4q9UE' \
    --startDate 'sRMZjyx9' \
    --status 'kghTTgON' \
    --userId 'f128r8ct' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE