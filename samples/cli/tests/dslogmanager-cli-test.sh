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
    --podName 'EAxcVpFrttufHIRd' \
    --logType 'H9UzVRiXbqlAw7r6' \
    --offset '100' \
    --origin '7eHpzSn3ZPUdc0qh' \
    > test.out 2>&1
eval_tap $? 2 'GetServerLogs' test.out

#- 3 ListTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    --deployment '4n8mzZ0m8SAMTwE6' \
    --endDate 'I56IaRDBXxyaNoMR' \
    --gameMode '6hkspInrAip6lyzS' \
    --limit '47' \
    --next 'dwpzS6DaDpv8N7ZQ' \
    --partyId 'VqGj6oDLjWjkY1aX' \
    --podName 'lFcDtgOjchIua5tW' \
    --previous 'EIC32ogW7olvbTgr' \
    --provider 'hRTcPiSuL0Sly6XM' \
    --region '4OI18mAQLnzjMf8G' \
    --sessionId 'Z2WBZqxYG3aREAu2' \
    --source 'D6QVKNCWP75TB0i7' \
    --startDate 'pKxR8dl0zRVW4EZG' \
    --status '9m0XcgGVbMqSszE8' \
    --userId 'GHavj7AorKsxwkos' \
    > test.out 2>&1
eval_tap $? 3 'ListTerminatedServers' test.out

#- 4 DownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'AVerXpc1C8XfwHuK' \
    > test.out 2>&1
eval_tap $? 4 'DownloadServerLogs' test.out

#- 5 CheckServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'eb9l3rGN9A3sNm84' \
    > test.out 2>&1
eval_tap $? 5 'CheckServerLogs' test.out

#- 6 BatchDownloadServerLogs
./ng net.accelbyte.sdk.cli.Main dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "hddSpHt0P7MIIR7C", "namespace": "kyF6C7duuyZ0GhDo", "pod_name": "gqrhBRd8lDR6qVNP"}, {"alloc_id": "RZYdFLIAjGGJddVC", "namespace": "vu9vx5KQ7KYnIuMB", "pod_name": "vaO35llzQRaT5kPx"}, {"alloc_id": "UfofvnnSuB0y5WUl", "namespace": "rMdI4sNveabntBSx", "pod_name": "TeIv53HGCiljvjKo"}]}' \
    > test.out 2>&1
eval_tap $? 6 'BatchDownloadServerLogs' test.out

#- 7 ListAllTerminatedServers
./ng net.accelbyte.sdk.cli.Main dslogmanager listAllTerminatedServers \
    --deployment 'yD6SCwGrncqmLtjQ' \
    --endDate 'HAf8TgoNm03VLisV' \
    --gameMode '6zwPuo3td6TC6I3l' \
    --limit '79' \
    --namespace "$AB_NAMESPACE" \
    --next 'x4rt69lna7qxNeIx' \
    --partyId 'Pz6MbwL6IY69z1Ua' \
    --podName 'LqYSYWytLPziZMdj' \
    --previous 'xcBZufQxGiHPllG4' \
    --provider 'cYEzfTD1ZBm3MqHc' \
    --region 'UmLZZbSqb8RwNmn9' \
    --sessionId 'HrNQy4uZAAiE0mit' \
    --startDate '9RGCCHYzUOcEdscK' \
    --status 'HPEqgA8yu7Vk6Jt4' \
    --userId 'Ymos9Jcdos4fYcTV' \
    > test.out 2>&1
eval_tap $? 7 'ListAllTerminatedServers' test.out

#- 8 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 8 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE