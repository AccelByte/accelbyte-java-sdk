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
    --deviceType 'EAxcVpFrttufHIRd' \
    --endTime 'H9UzVRiXbqlAw7r6' \
    --eventId 'W2ktQG0h5JAav5kR' \
    --eventName 'a62WopBJHPtcDs8b' \
    --eventPayload 'BZLCXLx8bbgorQeF' \
    --flightId 'bQ1g7qbPngUNB1vR' \
    --limit '29' \
    --offset '47' \
    --startTime 'dwpzS6DaDpv8N7ZQ' \
    --userId 'VqGj6oDLjWjkY1aX' \
    > test.out 2>&1
eval_tap $? 3 'GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet' test.out

#- 4 ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedSaveEventsGameTelemetryV1ProtectedEventsPost \
    --body '[{"ClientTimestamp": "1977-05-08T00:00:00Z", "DeviceType": "FcDtgOjchIua5tWE", "EventId": "IC32ogW7olvbTgrh", "EventName": "RTcPiSuL0Sly6XM4", "EventNamespace": "OI18mAQLnzjMf8GZ", "EventTimestamp": "1997-12-26T00:00:00Z", "Payload": {"WBZqxYG3aREAu2D6": {}, "QVKNCWP75TB0i7pK": {}, "xR8dl0zRVW4EZG9m": {}}}, {"ClientTimestamp": "1998-01-13T00:00:00Z", "DeviceType": "68su8XfqlqNiTvB6", "EventId": "SdAdIhUDrwoZ5Mec", "EventName": "dKi5r6QEa1ysLEzt", "EventNamespace": "h6mXhzkzWkFeZSoE", "EventTimestamp": "1984-10-03T00:00:00Z", "Payload": {"cBdW19m4eu6d5tA5": {}, "jUmiTqpyhPFdxLzF": {}, "QN05MYzYiKWe5dNR": {}}}, {"ClientTimestamp": "1976-10-09T00:00:00Z", "DeviceType": "jv7IPrDQQRgat0Se", "EventId": "vkLGMS0lyuI9a2I9", "EventName": "u6Vpbsx5w8hqUI06", "EventNamespace": "UpOXGSLmCVuHOPlL", "EventTimestamp": "1976-06-23T00:00:00Z", "Payload": {"kvR8sKgnuRkgghGo": {}, "YupD391C2qtPYoka": {}, "hFjkQsfCaTmt1d67": {}}}]' \
    > test.out 2>&1
eval_tap $? 4 'ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost' test.out

#- 5 ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet \
    --steamId 'FXGk2s9Q0mPVo3tw' \
    > test.out 2>&1
eval_tap $? 5 'ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet' test.out

#- 6 ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
./ng net.accelbyte.sdk.cli.Main gametelemetry protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut \
    --playtime 'u0MesTCf9x4rt69l' \
    --steamId 'na7qxNeIxPz6MbwL' \
    > test.out 2>&1
eval_tap $? 6 'ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut' test.out


rm -f "tmp.dat"

exit $EXIT_CODE