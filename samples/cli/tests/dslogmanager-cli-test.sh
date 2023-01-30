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
    --podName 'obwJmXZr' \
    --logType 'ATHoeP2O' \
    --offset '48' \
    --origin 'BXV5KkgQ' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'dDbeEEir' \
    --endDate 'NgttKgVV' \
    --gameMode 'XZixFfVy' \
    --limit '53' \
    --next 'uYeYi5PE' \
    --partyId 'du6esaVK' \
    --podName '1idrfUYh' \
    --previous 'xlF59n63' \
    --provider 'CaPkG061' \
    --region 'BsENz07I' \
    --sessionId '9BU8mrov' \
    --startDate 'M894c0Sj' \
    --status 'PNegeJJF' \
    --userId '9vGutlBC' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'MBKg7eNY' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'k9EG8Whz' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "3a8qB64m", "namespace": "ikBCyikq", "pod_name": "6TL7i6LU"}, {"alloc_id": "GcaF8w1k", "namespace": "LfFjHZzd", "pod_name": "CXK9lOWN"}, {"alloc_id": "Oi62UHl0", "namespace": "mhwysWCS", "pod_name": "MyiQ9iEe"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'YPp9LU9A' \
    --endDate '5jWQCrn8' \
    --gameMode '3PyJAEvs' \
    --limit '82' \
    --namespace "$AB_NAMESPACE" \
    --next 'OqgJayV8' \
    --partyId 'wOVhyFyM' \
    --podName 'piczXIPB' \
    --previous 'R4ZKSsZp' \
    --provider 'ZzfDCLrt' \
    --region '4qNjHzOw' \
    --sessionId 'jFSGskmV' \
    --startDate 'cwo1xeI8' \
    --status 'AMYHR4Ia' \
    --userId 'mLjBdep6' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE