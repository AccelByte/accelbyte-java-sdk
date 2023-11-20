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
echo "1..6"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetNamespacesGameTelemetryV1AdminNamespacesGet
./ng net.accelbyte.sdk.cli.Main gametelemetry getNamespacesGameTelemetryV1AdminNamespacesGet \
    > test.out 2>&1
eval_tap $? 2 'GetNamespacesGameTelemetryV1AdminNamespacesGet' test.out

#- 3 GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
./ng net.accelbyte.sdk.cli.Main gametelemetry getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet \
    --namespace "$AB_NAMESPACE" \
    --endTime 'EAxcVpFrttufHIRd' \
    --eventId 'H9UzVRiXbqlAw7r6' \
    --eventName 'W2ktQG0h5JAav5kR' \
    --eventPayload 'a62WopBJHPtcDs8b' \
    --flightId 'BZLCXLx8bbgorQeF' \
    --limit '2' \
    --offset '87' \
    --startTime 'hkspInrAip6lyzSx' \
    --userId 'wElFHHdgs21Jub74' \
    > test.out 2>&1
eval_tap $? 3 'GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet' test.out

#- 4 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"ClientTimestamp": "1985-05-11T00:00:00Z", "EventId": "UkNmKJfh5pUkHODp", "EventName": "oMF78NY4YkHs1cnz", "EventNamespace": "1JSDgY1TXp38zsCT", "EventTimestamp": "1985-05-25T00:00:00Z", "Payload": {"cPiSuL0Sly6XM4OI": {}, "18mAQLnzjMf8GZ2W": {}, "BZqxYG3aREAu2D6Q": {}}}, {"ClientTimestamp": "1995-10-20T00:00:00Z", "EventId": "FvdiRilZ7oFgx4c8", "EventName": "OumKtPDKJDXn7Z4U", "EventNamespace": "68su8XfqlqNiTvB6", "EventTimestamp": "1994-01-23T00:00:00Z", "Payload": {"AorKsxwkosAVerXp": {}, "c1C8XfwHuKeb9l3r": {}, "GN9A3sNm84hddSpH": {}}}, {"ClientTimestamp": "1981-08-16T00:00:00Z", "EventId": "0P7MIIR7CkyF6C7d", "EventName": "uuyZ0GhDogqrhBRd", "EventNamespace": "8lDR6qVNPRZYdFLI", "EventTimestamp": "1984-06-27T00:00:00Z", "Payload": {"jGGJddVCvu9vx5KQ": {}, "7KYnIuMBvaO35llz": {}, "QRaT5kPxUfofvnnS": {}}}]' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 5 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId 'uB0y5WUlrMdI4sNv' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 6 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime 'eabntBSxTeIv53HG' \
    --steamId 'CiljvjKoyD6SCwGr' \
    > test.out 2>&1
eval_tap $? 6 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE