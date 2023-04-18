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
    --endTime 'EAxcVpFrttufHIRd' \
    --eventId 'H9UzVRiXbqlAw7r6' \
    --eventName 'W2ktQG0h5JAav5kR' \
    --eventPayload 'a62WopBJHPtcDs8b' \
    --limit '56' \
    --offset '70' \
    --startTime 'ZLCXLx8bbgorQeFb' \
    > test.out 2>&1
eval_tap $? 2 'GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet' test.out

#- 3 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"EventId": "Q1g7qbPngUNB1vRo", "EventName": "dwpzS6DaDpv8N7ZQ", "EventNamespace": "VqGj6oDLjWjkY1aX", "EventTimestamp": "1977-05-08T00:00:00Z", "Payload": {"FcDtgOjchIua5tWE": {}, "IC32ogW7olvbTgrh": {}, "RTcPiSuL0Sly6XM4": {}}}, {"EventId": "OI18mAQLnzjMf8GZ", "EventName": "2WBZqxYG3aREAu2D", "EventNamespace": "6QVKNCWP75TB0i7p", "EventTimestamp": "1989-07-10T00:00:00Z", "Payload": {"c8OumKtPDKJDXn7Z": {}, "4U68su8XfqlqNiTv": {}, "B6SdAdIhUDrwoZ5M": {}}}, {"EventId": "ecdKi5r6QEa1ysLE", "EventName": "zth6mXhzkzWkFeZS", "EventNamespace": "oEAcBdW19m4eu6d5", "EventTimestamp": "1981-08-01T00:00:00Z", "Payload": {"C7duuyZ0GhDogqrh": {}, "BRd8lDR6qVNPRZYd": {}, "FLIAjGGJddVCvu9v": {}}}]' \
    > test.out 2>&1
eval_tap $? 3 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 4 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId 'x5KQ7KYnIuMBvaO3' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 5 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime '5llzQRaT5kPxUfof' \
    --steamId 'vnnSuB0y5WUlrMdI' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE