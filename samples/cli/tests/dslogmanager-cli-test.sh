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
    --deployment 'VoqrMR05' \
    --endDate 'WeHWKCJK' \
    --gameMode 'tY0CUpx7' \
    --limit '75' \
    --next 'pxKx49rs' \
    --partyId 'MfUMs7Fh' \
    --podName 'yiQsuIFY' \
    --previous '4uVXw6fs' \
    --provider 'aTFzWWpx' \
    --region 'aALQ2aLY' \
    --sessionId 'u7PokYk2' \
    --startDate 'ZHQiDsi8' \
    --status 'wm0VNlht' \
    --userId 'xJ8ZIZ4j' \
    > test.out 2>&1
eval_tap $? 2 'ListTerminatedServers' test.out

#- 3 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'TqAKwkAZ' \
    > test.out 2>&1
eval_tap $? 3 'DownloadServerLogs' test.out

#- 4 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'vgpv8uVw' \
    > test.out 2>&1
eval_tap $? 4 'CheckServerLogs' test.out

#- 5 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "YJGPMplg", "namespace": "tduOa5Cq", "pod_name": "ODncnFrj"}, {"alloc_id": "nf3Gom6f", "namespace": "oUB28EtB", "pod_name": "2ntLXfZA"}, {"alloc_id": "U02rFJzl", "namespace": "OK4itbN1", "pod_name": "UeRjaKGy"}]}' \
    > test.out 2>&1
eval_tap $? 5 'BatchDownloadServerLogs' test.out

#- 6 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'VZ5ciQIn' \
    --endDate 'fWDGCqWY' \
    --gameMode '2DBy7naP' \
    --limit '93' \
    --namespace "$AB_NAMESPACE" \
    --next '4wGScerZ' \
    --partyId 'qFWRMP3S' \
    --podName '47yccKs3' \
    --previous 'GTumul1J' \
    --provider 'je9ME8am' \
    --region 'tWfbAleN' \
    --sessionId '7dot8vu5' \
    --startDate 'c2GNrTBO' \
    --status '42ANqUSm' \
    --userId 'tUEtyz5l' \
    > test.out 2>&1
eval_tap $? 6 'ListAllTerminatedServers' test.out

#- 7 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 7 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE