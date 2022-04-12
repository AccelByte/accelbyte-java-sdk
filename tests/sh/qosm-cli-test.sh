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
echo "1..5"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 DeleteServer
java -jar "${CLI_JAR}" qosm deleteServer \
    --region 'FtBxyZcD' \
    > test.out 2>&1
eval_tap $? 2 'DeleteServer' test.out

#- 3 SetServerAlias
java -jar "${CLI_JAR}" qosm setServerAlias \
    --body '{"alias": "XBpGlsQu"}' \
    --region 'Ju8vMf0I' \
    > test.out 2>&1
eval_tap $? 3 'SetServerAlias' test.out

#- 4 ListServer
java -jar "${CLI_JAR}" qosm listServer \
    > test.out 2>&1
eval_tap $? 4 'ListServer' test.out

#- 5 Heartbeat
java -jar "${CLI_JAR}" qosm heartbeat \
    --body '{"ip": "sJkTrd8I", "port": 59, "region": "cV2zXnTK"}' \
    > test.out 2>&1
eval_tap $? 5 'Heartbeat' test.out


rm -f "tmp.dat"

exit $EXIT_CODE