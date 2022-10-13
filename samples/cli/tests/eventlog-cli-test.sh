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
echo "1..33"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 AgentTypeDescriptionHandler
eval_tap 0 2 'AgentTypeDescriptionHandler # SKIP deprecated' test.out

#- 3 SpecificAgentTypeDescriptionHandler
eval_tap 0 3 'SpecificAgentTypeDescriptionHandler # SKIP deprecated' test.out

#- 4 EventIDDescriptionHandler
eval_tap 0 4 'EventIDDescriptionHandler # SKIP deprecated' test.out

#- 5 SpecificEventIDDescriptionHandler
eval_tap 0 5 'SpecificEventIDDescriptionHandler # SKIP deprecated' test.out

#- 6 EventLevelDescriptionHandler
eval_tap 0 6 'EventLevelDescriptionHandler # SKIP deprecated' test.out

#- 7 SpecificEventLevelDescriptionHandler
eval_tap 0 7 'SpecificEventLevelDescriptionHandler # SKIP deprecated' test.out

#- 8 EventTypeDescriptionHandler
eval_tap 0 8 'EventTypeDescriptionHandler # SKIP deprecated' test.out

#- 9 SpecificEventTypeDescriptionHandler
eval_tap 0 9 'SpecificEventTypeDescriptionHandler # SKIP deprecated' test.out

#- 10 UXNameDescriptionHandler
eval_tap 0 10 'UXNameDescriptionHandler # SKIP deprecated' test.out

#- 11 SpecificUXDescriptionHandler
eval_tap 0 11 'SpecificUXDescriptionHandler # SKIP deprecated' test.out

#- 12 GetEventByNamespaceHandler
eval_tap 0 12 'GetEventByNamespaceHandler # SKIP deprecated' test.out

#- 13 PostEventHandler
eval_tap 0 13 'PostEventHandler # SKIP deprecated' test.out

#- 14 GetEventByEventIDHandler
eval_tap 0 14 'GetEventByEventIDHandler # SKIP deprecated' test.out

#- 15 GetEventByEventTypeHandler
eval_tap 0 15 'GetEventByEventTypeHandler # SKIP deprecated' test.out

#- 16 GetEventByEventTypeAndEventIDHandler
eval_tap 0 16 'GetEventByEventTypeAndEventIDHandler # SKIP deprecated' test.out

#- 17 GetEventByUserIDHandler
eval_tap 0 17 'GetEventByUserIDHandler # SKIP deprecated' test.out

#- 18 GetUserActivitiesHandler
eval_tap 0 18 'GetUserActivitiesHandler # SKIP deprecated' test.out

#- 19 DeleteUserActivitiesHandler
eval_tap 0 19 'DeleteUserActivitiesHandler # SKIP deprecated' test.out

#- 20 GetEventByUserIDAndEventIDHandler
eval_tap 0 20 'GetEventByUserIDAndEventIDHandler # SKIP deprecated' test.out

#- 21 GetEventByUserIDAndEventTypeHandler
eval_tap 0 21 'GetEventByUserIDAndEventTypeHandler # SKIP deprecated' test.out

#- 22 GetEventByUserEventIDAndEventTypeHandler
eval_tap 0 22 'GetEventByUserEventIDAndEventTypeHandler # SKIP deprecated' test.out

#- 23 LastUserActivityTimeHandler
eval_tap 0 23 'LastUserActivityTimeHandler # SKIP deprecated' test.out

#- 24 GetRegisteredEventsHandler
eval_tap 0 24 'GetRegisteredEventsHandler # SKIP deprecated' test.out

#- 25 RegisterEventHandler
eval_tap 0 25 'RegisterEventHandler # SKIP deprecated' test.out

#- 26 GetRegisteredEventIDHandler
eval_tap 0 26 'GetRegisteredEventIDHandler # SKIP deprecated' test.out

#- 27 UpdateEventRegistryHandler
eval_tap 0 27 'UpdateEventRegistryHandler # SKIP deprecated' test.out

#- 28 UnregisterEventIDHandler
eval_tap 0 28 'UnregisterEventIDHandler # SKIP deprecated' test.out

#- 29 GetRegisteredEventsByEventTypeHandler
eval_tap 0 29 'GetRegisteredEventsByEventTypeHandler # SKIP deprecated' test.out

#- 30 QueryEventStreamHandler
./ng net.accelbyte.sdk.cli.Main eventlog queryEventStreamHandler \
    --namespace "$AB_NAMESPACE" \
    --endDate 'UE3HeYUq' \
    --offset '89' \
    --pageSize '76' \
    --startDate 'mM3fVNKD' \
    --body '{"clientId": "riYucBw4", "eventName": "hThwfhdJ", "payloadQuery": {"qyA0S4LK": {}, "4yU5yJDu": {}, "3QnSEVDk": {}}, "sessionId": "D9IU217m", "traceId": "H2x81pdJ", "userId": "ltjlnBk9", "version": 14}' \
    > test.out 2>&1
eval_tap $? 30 'QueryEventStreamHandler' test.out

#- 31 GetEventSpecificUserV2Handler
./ng net.accelbyte.sdk.cli.Main eventlog getEventSpecificUserV2Handler \
    --namespace "$AB_NAMESPACE" \
    --userId '8JQehW3w' \
    --endDate 'GP394Yfx' \
    --eventName '8MaWhAKj' \
    --offset '30' \
    --pageSize '68' \
    --startDate 'cVAl3F05' \
    > test.out 2>&1
eval_tap $? 31 'GetEventSpecificUserV2Handler' test.out

#- 32 GetPublicEditHistory
./ng net.accelbyte.sdk.cli.Main eventlog getPublicEditHistory \
    --namespace "$AB_NAMESPACE" \
    --userId '4ByS9hnB' \
    --endDate 'Z85oan3A' \
    --offset '88' \
    --pageSize '22' \
    --startDate 'eyKRDMUx' \
    --type '3uPlq3AO' \
    > test.out 2>&1
eval_tap $? 32 'GetPublicEditHistory' test.out

#- 33 GetUserEventsV2Public
./ng net.accelbyte.sdk.cli.Main eventlog getUserEventsV2Public \
    --namespace "$AB_NAMESPACE" \
    --userId 'Iaa1benh' \
    --endDate 'QZejHQCP' \
    --eventName 'TMaZT1eC' \
    --offset '18' \
    --pageSize '28' \
    --startDate 'TbHyii98' \
    > test.out 2>&1
eval_tap $? 33 'GetUserEventsV2Public' test.out


rm -f "tmp.dat"

exit $EXIT_CODE