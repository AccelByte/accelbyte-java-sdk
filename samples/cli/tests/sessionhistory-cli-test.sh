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
echo "1..3"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "EAxcVpFrttufHIRd", "activeAllianceRule": {"max_number": 68, "min_number": 59, "player_max_number": 4, "player_min_number": 95}, "activeMatchingRule": [{"attribute": "09nIW0Oaiw9B0D7e", "criteria": "HpzSn3ZPUdc0qh4n", "reference": 0.9696652873308939}, {"attribute": "mzZ0m8SAMTwE6I56", "criteria": "IaRDBXxyaNoMR6hk", "reference": 0.29507084159218033}, {"attribute": "pInrAip6lyzSxwEl", "criteria": "FHHdgs21Jub74CUk", "reference": 0.6437975760118728}], "function": "mKJfh5pUkHODpoMF", "gameMode": "78NY4YkHs1cnz1JS", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 13, "matchID": "gW7olvbTgrhRTcPi", "namespace": "SuL0Sly6XM4OI18m", "remainingPlayersPerTicket": [55, 54, 88], "remainingTickets": 76, "sessionTickID": "LnzjMf8GZ2WBZqxY", "tickID": 66, "ticketID": "2OQNOs1PXhT5Fvdi", "timeToMatchSec": 0.6982226517617746, "timestamp": "1975-04-08T00:00:00Z", "unbackfillReason": "TB0i7pKxR8dl0zRV", "unmatchReason": "W4EZG9m0XcgGVbMq"}' \
    > test.out 2>&1
eval_tap $? 2 'CreateXrayTicketObservability' test.out

#- 3 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "SszE8GHavj7AorKs", "activeAllianceRule": {"max_number": 49, "min_number": 61, "player_max_number": 46, "player_min_number": 35}, "activeMatchingRule": [{"attribute": "kosAVerXpc1C8Xfw", "criteria": "HuKeb9l3rGN9A3sN", "reference": 0.20136001836735962}, {"attribute": "84hddSpHt0P7MIIR", "criteria": "7CkyF6C7duuyZ0Gh", "reference": 0.48234820867962735}, {"attribute": "ogqrhBRd8lDR6qVN", "criteria": "PRZYdFLIAjGGJddV", "reference": 0.46741799787527916}], "function": "vu9vx5KQ7KYnIuMB", "gameMode": "vaO35llzQRaT5kPx", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 33, "matchID": "ofvnnSuB0y5WUlrM", "namespace": "dI4sNveabntBSxTe", "remainingPlayersPerTicket": [70, 13, 43], "remainingTickets": 13, "sessionTickID": "53HGCiljvjKoyD6S", "tickID": 59, "ticketID": "okahFjkQsfCaTmt1", "timeToMatchSec": 0.054299996037950105, "timestamp": "1978-11-26T00:00:00Z", "unbackfillReason": "FXGk2s9Q0mPVo3tw", "unmatchReason": "u0MesTCf9x4rt69l"}, {"action": "na7qxNeIxPz6MbwL", "activeAllianceRule": {"max_number": 67, "min_number": 70, "player_max_number": 21, "player_min_number": 62}, "activeMatchingRule": [{"attribute": "69z1UaLqYSYWytLP", "criteria": "ziZMdjxcBZufQxGi", "reference": 0.5372604812688304}, {"attribute": "PllG4cYEzfTD1ZBm", "criteria": "3MqHcUmLZZbSqb8R", "reference": 0.3589146146034815}, {"attribute": "Nmn9HrNQy4uZAAiE", "criteria": "0mit9RGCCHYzUOcE", "reference": 0.05065644091795485}], "function": "scKHPEqgA8yu7Vk6", "gameMode": "Jt4Ymos9Jcdos4fY", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 94, "matchID": "McaYmvCkGZ5dAgqx", "namespace": "pBFmaLoxozr6wfNP", "remainingPlayersPerTicket": [100, 79, 3], "remainingTickets": 81, "sessionTickID": "OItRMvqtlB2jJCSQ", "tickID": 94, "ticketID": "JlDbPWbQ6Q9lNmqR", "timeToMatchSec": 0.4440664306506802, "timestamp": "1971-11-29T00:00:00Z", "unbackfillReason": "AkLnvxkT1X68cmDc", "unmatchReason": "3fxU8MyKrQpM4hkk"}, {"action": "K6KKXNB3Gv0IqmF5", "activeAllianceRule": {"max_number": 78, "min_number": 93, "player_max_number": 31, "player_min_number": 22}, "activeMatchingRule": [{"attribute": "UKp44YUDjasWIPUv", "criteria": "mEejtGeoyIPa8ZRr", "reference": 0.3473538339374823}, {"attribute": "jj7il35MXbN9oCMN", "criteria": "qq98SjTvhZNkSQ70", "reference": 0.4695026785071339}, {"attribute": "0H6BXksUC9b6i5lZ", "criteria": "C9xv32e8c5csSovo", "reference": 0.27063695102091945}], "function": "sZNBdte9NDUPVJf6", "gameMode": "c2Z0QZxfgPubTDIH", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 80, "matchID": "qAThuwjRHpKKTlmV", "namespace": "r9XuoJbRFQSKVPHb", "remainingPlayersPerTicket": [27, 14, 26], "remainingTickets": 48, "sessionTickID": "SQUhAEtrmjqU6YE3", "tickID": 31, "ticketID": "sYSiZqan0nSBJroa", "timeToMatchSec": 0.3436993699102727, "timestamp": "1979-01-04T00:00:00Z", "unbackfillReason": "GXlvPG6bFYReVHQi", "unmatchReason": "pcCx9Zw5D2L7vIYh"}]}' \
    > test.out 2>&1
eval_tap $? 3 'CreateXrayBulkTicketObservability' test.out


rm -f "tmp.dat"

exit $EXIT_CODE