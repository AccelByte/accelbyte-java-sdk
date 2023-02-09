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
    --podName 'GkHYdB94' \
    --logType 'aukrg1Vz' \
    --offset '100' \
    --origin 'hXAtkGLz' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment 'PmERBwuV' \
    --endDate 'htHBJlaW' \
    --gameMode 'hgbZI65I' \
    --limit '56' \
    --next 'etugNy8T' \
    --partyId 'Sl5ow7BJ' \
    --podName 'xgrJZYEs' \
    --previous 'IlzGDByi' \
    --provider 'Tk2Lp2a4' \
    --region 'YkzRH2KJ' \
    --sessionId 'jCMBD5ey' \
    --startDate 'qOetdNM2' \
    --status '1G1A6jZr' \
    --userId '0eh0eEni' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'G41Ns0GA' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'pKwRqi5g' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "KHNI0rXS", "namespace": "TgeG9ciX", "pod_name": "EfmkfFVF"}, {"alloc_id": "qkF5RmJ0", "namespace": "0BuX1RNV", "pod_name": "CcwzMMsO"}, {"alloc_id": "QXJx6CdO", "namespace": "3edFll0e", "pod_name": "PQyd3DQ9"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'VG2xklAG' \
    --endDate 'nJdZsuqv' \
    --gameMode '1ygKaIo4' \
    --limit '4' \
    --namespace "$AB_NAMESPACE" \
    --next 'JqO6yCPk' \
    --partyId 'WWK7JSau' \
    --podName 'tWm3LYsM' \
    --previous 'w9a7fzYr' \
    --provider 'DG7myjjn' \
    --region 't9yymBvI' \
    --sessionId 'D4m1gdRt' \
    --startDate 'GbNNMbIg' \
    --status 'sKrXPeup' \
    --userId 'CQww9vhc' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE