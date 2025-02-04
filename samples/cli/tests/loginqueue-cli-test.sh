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

#- 2 AdminGetConfiguration
./ng net.accelbyte.sdk.cli.Main loginqueue adminGetConfiguration \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 2 'AdminGetConfiguration' test.out

#- 3 AdminUpdateConfiguration
./ng net.accelbyte.sdk.cli.Main loginqueue adminUpdateConfiguration \
    --namespace "$AB_NAMESPACE" \
    --body '{"enabled": true, "maxConcurrency": 39, "maxLoginRate": 55, "minActivationPeriodInSecond": 46, "playerPollingTimeInSecond": 48, "playerReconnectGracePeriodInSecond": 5, "queueReconnectGracePeriodInSecond": 58, "safetyMarginPercentage": 98}' \
    > test.out 2>&1
eval_tap $? 3 'AdminUpdateConfiguration' test.out

#- 4 AdminGetStatus
./ng net.accelbyte.sdk.cli.Main loginqueue adminGetStatus \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'AdminGetStatus' test.out

#- 5 RefreshTicket
./ng net.accelbyte.sdk.cli.Main loginqueue refreshTicket \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'RefreshTicket' test.out

#- 6 CancelTicket
./ng net.accelbyte.sdk.cli.Main loginqueue cancelTicket \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'CancelTicket' test.out


rm -f "tmp.dat"

exit $EXIT_CODE