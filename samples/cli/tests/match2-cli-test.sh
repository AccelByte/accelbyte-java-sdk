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
echo "1..26"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetHealthcheckInfo
./ng net.accelbyte.sdk.cli.Main match2 getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main match2 getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "HicQM859", "sessionId": "uhZtf4ZV"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateBackfill' test.out

#- 5 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'pIU9GRkW' \
    > test.out 2>&1
eval_tap $? 5 'GetBackfillProposal' test.out

#- 6 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'ZQmEoq07' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetBackfill' test.out

#- 7 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'Wdj7GiOh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteBackfill' test.out

#- 8 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID '4Bl4sOKj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "hywbYqbC", "stop": true}' \
    > test.out 2>&1
eval_tap $? 8 'AcceptBackfill' test.out

#- 9 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'FIJDUZ6f' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "xV6KpPJc", "stop": true}' \
    > test.out 2>&1
eval_tap $? 9 'RejectBackfill' test.out

#- 10 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 10 'MatchFunctionList' test.out

#- 11 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "IBNQtZDO", "url": "nnT59jFL"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateMatchFunction' test.out

#- 12 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'iEGEoJIq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteMatchFunction' test.out

#- 13 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '28' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 13 'MatchPoolList' test.out

#- 14 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 96, "backfill_ticket_expiration_seconds": 68, "match_function": "myFU3DYS", "match_function_override": {"backfill_matches": "23Smcbpe", "hydration": ["CVq4sVlF", "YxbIhB19", "bhjngX0x"], "make_matches": "EjoDPNXE", "stat_codes": ["Se9V24b8", "6XFJpcIp", "pbkeiQrF"], "validation": ["WA150g7F", "3XLyuEG8", "8dbZT4eh"]}, "name": "l43hITaH", "rule_set": "3tj1tlA3", "session_template": "qTvC0YOy", "ticket_expiration_seconds": 76}' \
    > test.out 2>&1
eval_tap $? 14 'CreateMatchPool' test.out

#- 15 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'spRTYhDD' \
    > test.out 2>&1
eval_tap $? 15 'MatchPoolDetails' test.out

#- 16 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'iW93fzZD' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 28, "backfill_ticket_expiration_seconds": 61, "match_function": "tGC7mEmf", "match_function_override": {"backfill_matches": "CKVk44dJ", "hydration": ["uWUF5dL2", "d6iMRko3", "Wra38ULw"], "make_matches": "LQb55jym", "stat_codes": ["iJpn6vME", "1XTx900S", "fHvRdruF"], "validation": ["3Q2Ylm1a", "ATNdmlbT", "BGgJ0rTG"]}, "rule_set": "rF1d2PJF", "session_template": "AAvvfPFV", "ticket_expiration_seconds": 10}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateMatchPool' test.out

#- 17 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'FMPdo9VO' \
    > test.out 2>&1
eval_tap $? 17 'DeleteMatchPool' test.out

#- 18 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"LBf6QIOz": {}, "dVwioIcI": {}, "UREWtZoF": {}}, "latencies": {"TqG0MJcX": 80, "lexGJZx3": 89, "fbiUPfwm": 23}, "matchPool": "ZMlqZDYu", "sessionID": "gDi5I6Yx"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateMatchTicket' test.out

#- 19 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid '4yPHi1qi' \
    > test.out 2>&1
eval_tap $? 19 'MatchTicketDetails' test.out

#- 20 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'bcBu2nC0' \
    > test.out 2>&1
eval_tap $? 20 'DeleteMatchTicket' test.out

#- 21 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 21 'RuleSetList' test.out

#- 22 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"SjWU7BdM": {}, "c8msqrX8": {}, "JOKwusX4": {}}, "enable_custom_match_function": false, "name": "Lpj0ykPU"}' \
    > test.out 2>&1
eval_tap $? 22 'CreateRuleSet' test.out

#- 23 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'W6SRrD3K' \
    > test.out 2>&1
eval_tap $? 23 'RuleSetDetails' test.out

#- 24 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'ZIn2eCT4' \
    --body '{"data": {"M2W7vso5": {}, "64zWB7EO": {}, "ZAqnFbb2": {}}, "enable_custom_match_function": true, "name": "TkSDLL9N"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateRuleSet' test.out

#- 25 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'VegMgQfg' \
    > test.out 2>&1
eval_tap $? 25 'DeleteRuleSet' test.out

#- 26 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 26 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE