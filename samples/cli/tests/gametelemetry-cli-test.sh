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
echo "1..5"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
./ng net.accelbyte.sdk.cli.Main gametelemetry getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet \
    --namespace "$AB_NAMESPACE" \
    --endTime 'bG7gHu9U' \
    --eventId 'xd14llWc' \
    --eventName 'Zeb1Zvd5' \
    --eventPayload 'VXw3Cqe2' \
    --limit '91' \
    --offset '30' \
    --startTime '14j0FM0g' \
    > test.out 2>&1
eval_tap $? 2 'GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet' test.out

#- 3 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"EventId": "2xBFC3Df", "EventName": "d9Yjdtje", "EventNamespace": "ZjfSBH9v", "EventTimestamp": "1991-02-22T00:00:00Z", "Payload": {"3lDWf6UU": {}, "eccZLlTA": {}, "VRiqYsUA": {}}}, {"EventId": "5lA0DyHJ", "EventName": "hp4u7yaE", "EventNamespace": "5XOhQwJm", "EventTimestamp": "1975-09-27T00:00:00Z", "Payload": {"ASy1LfaM": {}, "e2Lgi4ym": {}, "ge2QhDNQ": {}}}, {"EventId": "cnf8v8Tg", "EventName": "fczAMaeS", "EventNamespace": "D9K35LVT", "EventTimestamp": "1998-10-29T00:00:00Z", "Payload": {"hnQTUIx1": {}, "8dpK98NC": {}, "sG9ZPgr2": {}}}]' \
    > test.out 2>&1
eval_tap $? 3 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 4 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId 'N22woA85' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 5 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime '2DaNMm2S' \
    --steamId 'lOTJVoIT' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE