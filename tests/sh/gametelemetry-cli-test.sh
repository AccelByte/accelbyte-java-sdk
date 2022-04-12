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
echo "1..6"

#- 1 Login
java -jar "${CLI_JAR}" loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AdminGetEventsGameTelemetryV1AdminEventsGet
java -jar "${CLI_JAR}" gametelemetry adminGetEventsGameTelemetryV1AdminEventsGet \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'AdminGetEventsGameTelemetryV1AdminEventsGet' test.out

#- 3 AdminGetNamespaceGameTelemetryV1AdminTelemetrynamespaceGet
java -jar "${CLI_JAR}" gametelemetry adminGetNamespaceGameTelemetryV1AdminTelemetrynamespaceGet \
    > test.out 2>&1
eval_tap $? 3 'AdminGetNamespaceGameTelemetryV1AdminTelemetrynamespaceGet' test.out

#- 4 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
java -jar "${CLI_JAR}" gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"EventId": "FtBxyZcD", "EventName": "XBpGlsQu", "EventNamespace": "Ju8vMf0I", "EventTimestamp": "1980-10-10T00:00:00Z", "Payload": {"kTrd8IDc": {}}}]' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 5 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
java -jar "${CLI_JAR}" gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId 'V2zXnTKj' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 6 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
java -jar "${CLI_JAR}" gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime 'XY1bPqam' \
    --steamId 'iBxx9Cs1' \
    > test.out 2>&1
eval_tap $? 6 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE