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
echo "1..31"

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

#- 4 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 4 'EnvironmentVariableList' test.out

#- 5 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "EAxcVpFrttufHIRd", "sessionId": "H9UzVRiXbqlAw7r6"}' \
    > test.out 2>&1
eval_tap $? 5 'CreateBackfill' test.out

#- 6 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'W2ktQG0h5JAav5kR' \
    > test.out 2>&1
eval_tap $? 6 'GetBackfillProposal' test.out

#- 7 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'a62WopBJHPtcDs8b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'GetBackfill' test.out

#- 8 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'BZLCXLx8bbgorQeF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'DeleteBackfill' test.out

#- 9 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'bQ1g7qbPngUNB1vR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "odwpzS6DaDpv8N7Z", "stop": true}' \
    > test.out 2>&1
eval_tap $? 9 'AcceptBackfill' test.out

#- 10 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'qGj6oDLjWjkY1aXl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "FcDtgOjchIua5tWE", "stop": true}' \
    > test.out 2>&1
eval_tap $? 10 'RejectBackfill' test.out

#- 11 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 11 'MatchFunctionList' test.out

#- 12 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "2ogW7olvbTgrhRTc", "serviceAppName": "PiSuL0Sly6XM4OI1", "url": "8mAQLnzjMf8GZ2WB"}' \
    > test.out 2>&1
eval_tap $? 12 'CreateMatchFunction' test.out

#- 13 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'ZqxYG3aREAu2D6QV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "KNCWP75TB0i7pKxR", "serviceAppName": "8dl0zRVW4EZG9m0X", "url": "cgGVbMqSszE8GHav"}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateMatchFunction' test.out

#- 14 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'j7AorKsxwkosAVer' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteMatchFunction' test.out

#- 15 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --name 'pc1C8XfwHuKeb9l3' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 15 'MatchPoolList' test.out

#- 16 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 81, "backfill_ticket_expiration_seconds": 16, "match_function": "A3sNm84hddSpHt0P", "match_function_override": {"backfill_matches": "7MIIR7CkyF6C7duu", "enrichment": ["yZ0GhDogqrhBRd8l", "DR6qVNPRZYdFLIAj", "GGJddVCvu9vx5KQ7"], "make_matches": "KYnIuMBvaO35llzQ", "stat_codes": ["RaT5kPxUfofvnnSu", "B0y5WUlrMdI4sNve", "abntBSxTeIv53HGC"], "validation": ["iljvjKoyD6SCwGrn", "cqmLtjQHAf8TgoNm", "03VLisV6zwPuo3td"]}, "name": "6TC6I3lMjGSWN2la", "rule_set": "RlxfcjHfYakUCTqG", "session_template": "kE7wcWfDslpJSqGA", "ticket_expiration_seconds": 85}' \
    > test.out 2>&1
eval_tap $? 16 'CreateMatchPool' test.out

#- 17 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'Q0yYoNRKd3IL5TAQ' \
    > test.out 2>&1
eval_tap $? 17 'MatchPoolDetails' test.out

#- 18 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '6iiPlSC2uE4o5Vwd' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 24, "backfill_ticket_expiration_seconds": 12, "match_function": "MqHcUmLZZbSqb8Rw", "match_function_override": {"backfill_matches": "Nmn9HrNQy4uZAAiE", "enrichment": ["0mit9RGCCHYzUOcE", "dscKHPEqgA8yu7Vk", "6Jt4Ymos9Jcdos4f"], "make_matches": "YcTVU6RBt0zYoMcH", "stat_codes": ["yCUEXlAvxJMdalwS", "yliWMNW5NyLu0M3V", "Hh2EI8JlDbPWbQ6Q"], "validation": ["9lNmqRBaAkLnvxkT", "1X68cmDc3fxU8MyK", "rQpM4hkkK6KKXNB3"]}, "rule_set": "Gv0IqmF51TkhjYna", "session_template": "q6foWvXa3bMrXsDr", "ticket_expiration_seconds": 8}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchPool' test.out

#- 19 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'kILsSSyDdmykmoPY' \
    > test.out 2>&1
eval_tap $? 19 'DeleteMatchPool' test.out

#- 20 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'gc2L4jk4Lo0LSP0p' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolMetric' test.out

#- 21 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'f4IxjUkl535X3ate' \
    > test.out 2>&1
eval_tap $? 21 'GetPlayerMetric' test.out

#- 22 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"EKDpADz1x3poD3Qg": {}, "b3boLQQ1MzH7Qm8b": {}, "wbmXgdAPh1EThG96": {}}, "latencies": {"gAFKK2WDgCcxvONZ": 25, "ThuwjRHpKKTlmVr9": 42, "6pf3vneSD2Tb3g7m": 92}, "matchPool": "tu7LQRENjEEztx1W", "sessionID": "sYSiZqan0nSBJroa"}' \
    > test.out 2>&1
eval_tap $? 22 'CreateMatchTicket' test.out

#- 23 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '43' \
    --matchPool 'HqaTHeKtW18iGeUl' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 23 'GetMyMatchTickets' test.out

#- 24 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'QipcCx9Zw5D2L7vI' \
    > test.out 2>&1
eval_tap $? 24 'MatchTicketDetails' test.out

#- 25 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'YhGGSyEW4ZJJ42d3' \
    > test.out 2>&1
eval_tap $? 25 'DeleteMatchTicket' test.out

#- 26 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --name 'mhgo5QB65lSAiYnN' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 26 'RuleSetList' test.out

#- 27 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"lxqMrj3oZk03QXcK": {}, "MDYDDxHSZjtqXyJ5": {}, "8f7Gc26SaiGVkydw": {}}, "enable_custom_match_function": false, "name": "QG26yUZNmTBcvrbY"}' \
    > test.out 2>&1
eval_tap $? 27 'CreateRuleSet' test.out

#- 28 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'CwZtxFHyPLtI8ilb' \
    > test.out 2>&1
eval_tap $? 28 'RuleSetDetails' test.out

#- 29 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'yDPUIj88cekdqCt8' \
    --body '{"data": {"1P1ktfIovmv9gsR5": {}, "cJcHm3SZLxoRDFuu": {}, "uySj29a9LJE8HoRS": {}}, "enable_custom_match_function": false, "name": "AAMwzHPxB1UskYs4"}' \
    > test.out 2>&1
eval_tap $? 29 'UpdateRuleSet' test.out

#- 30 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'Yw20DOqOBSC2DKHR' \
    > test.out 2>&1
eval_tap $? 30 'DeleteRuleSet' test.out

#- 31 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 31 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE