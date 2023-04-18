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
echo "1..7"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 UpdateServerConfig
./ng net.accelbyte.sdk.cli.Main qosm updateServerConfig \
    --namespace "$AB_NAMESPACE" \
    --region 'EAxcVpFrttufHIRd' \
    --body '{"status": "H9UzVRiXbqlAw7r6"}' \
    > test.out 2>&1
eval_tap $? 2 'UpdateServerConfig' test.out

#- 3 DeleteServer
./ng net.accelbyte.sdk.cli.Main qosm deleteServer \
    --region 'W2ktQG0h5JAav5kR' \
    > test.out 2>&1
eval_tap $? 3 'DeleteServer' test.out

#- 4 SetServerAlias
./ng net.accelbyte.sdk.cli.Main qosm setServerAlias \
    --region 'a62WopBJHPtcDs8b' \
    --body '{"alias": "BZLCXLx8bbgorQeF"}' \
    > test.out 2>&1
eval_tap $? 4 'SetServerAlias' test.out

#- 5 ListServerPerNamespace
./ng net.accelbyte.sdk.cli.Main qosm listServerPerNamespace \
    --namespace "$AB_NAMESPACE" \
    --status 'bQ1g7qbPngUNB1vR' \
    > test.out 2>&1
eval_tap $? 5 'ListServerPerNamespace' test.out

#- 6 ListServer
./ng net.accelbyte.sdk.cli.Main qosm listServer \
    > test.out 2>&1
eval_tap $? 6 'ListServer' test.out

#- 7 Heartbeat
./ng net.accelbyte.sdk.cli.Main qosm heartbeat \
    --body '{"ip": "odwpzS6DaDpv8N7Z", "port": 87, "region": "4CUkNmKJfh5pUkHO"}' \
    > test.out 2>&1
eval_tap $? 7 'Heartbeat' test.out


rm -f "tmp.dat"

exit $EXIT_CODE