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
    --podName 'LA697TuD' \
    --logType 'WKOXi4zp' \
    --offset '71' \
    --origin 'aiOlK31O' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'BgIrt53p' \
    --endDate 'xq4LjlN4' \
    --gameMode 'CJBeQrSu' \
    --limit '66' \
    --next 'kcgQjm9w' \
    --partyId 'G2u9xIDD' \
    --podName 'aO1eIrg4' \
    --previous '2W2u96D8' \
    --provider 'gCjxSM5y' \
    --region '7kzAihES' \
    --sessionId 'tHWruTIc' \
    --startDate 'L6S4Xr1N' \
    --status 'iJcVmzfo' \
    --userId 'lqC5uAXC' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName '5L9xeRsE' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'ZxwxJSpA' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "NS1Te92l", "namespace": "1eISx1UD", "pod_name": "t5PGosXE"}, {"alloc_id": "oXmz3TyY", "namespace": "eAfmHA0P", "pod_name": "MXVoc3uk"}, {"alloc_id": "VoWWC8az", "namespace": "qUcEZeeB", "pod_name": "lG2aCDjF"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'NAhreqKy' \
    --endDate 'Rti43cUn' \
    --gameMode 'e2ekWNnU' \
    --limit '60' \
    --namespace "$AB_NAMESPACE" \
    --next 'UVAl8WAF' \
    --partyId '5OXcvNZO' \
    --podName 'Hi8ciCO2' \
    --previous '6oSQFbCw' \
    --provider 'gAGoIZeB' \
    --region 'LKbL4J8b' \
    --sessionId 'l8PIdCti' \
    --startDate 'meTX7euH' \
    --status 'rvmYNBN8' \
    --userId 'e3DYbUAJ' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE