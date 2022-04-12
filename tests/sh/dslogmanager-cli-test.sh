#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

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

CLI_JAR="${CLI_JAR:-../../samples/cli/build/libs/cli.jar}"

echo "TAP version 13"
echo "1..7"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListTerminatedServers
java -jar "${CLI_JAR}" dslogmanager listTerminatedServers \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'ListTerminatedServers' test.out

#- 3 DownloadServerLogs
java -jar "${CLI_JAR}" dslogmanager downloadServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'FtBxyZcD' \
    > test.out 2>&1
eval_tap $? 3 'DownloadServerLogs' test.out

#- 4 CheckServerLogs
java -jar "${CLI_JAR}" dslogmanager checkServerLogs \
    --namespace "$AB_NAMESPACE" \
    --podName 'XBpGlsQu' \
    > test.out 2>&1
eval_tap $? 4 'CheckServerLogs' test.out

#- 5 BatchDownloadServerLogs
java -jar "${CLI_JAR}" dslogmanager batchDownloadServerLogs \
    --body '{"Downloads": [{"alloc_id": "Ju8vMf0I", "namespace": "sJkTrd8I", "pod_name": "DcV2zXnT"}]}' \
    > test.out 2>&1
eval_tap $? 5 'BatchDownloadServerLogs' test.out

#- 6 ListAllTerminatedServers
java -jar "${CLI_JAR}" dslogmanager listAllTerminatedServers \
    > test.out 2>&1
eval_tap $? 6 'ListAllTerminatedServers' test.out

#- 7 PublicGetMessages
java -jar "${CLI_JAR}" dslogmanager publicGetMessages \
    > test.out 2>&1
eval_tap $? 7 'PublicGetMessages' test.out


rm -f "tmp.dat"

exit $EXIT_CODE