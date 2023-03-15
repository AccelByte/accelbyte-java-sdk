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
echo "1..28"

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
    --body '{"matchPool": "EAxcVpFr", "sessionId": "ttufHIRd"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateBackfill' test.out

#- 5 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'H9UzVRiX' \
    > test.out 2>&1
eval_tap $? 5 'GetBackfillProposal' test.out

#- 6 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'bqlAw7r6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetBackfill' test.out

#- 7 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'W2ktQG0h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteBackfill' test.out

#- 8 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID '5JAav5kR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "a62WopBJ", "stop": true}' \
    > test.out 2>&1
eval_tap $? 8 'AcceptBackfill' test.out

#- 9 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'AMTwE6I5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "6IaRDBXx", "stop": true}' \
    > test.out 2>&1
eval_tap $? 9 'RejectBackfill' test.out

#- 10 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '1' \
    > test.out 2>&1
eval_tap $? 10 'MatchFunctionList' test.out

#- 11 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "rQeFbQ1g", "url": "7qbPngUN"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateMatchFunction' test.out

#- 12 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'B1vRodwp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "zS6DaDpv", "url": "8N7ZQVqG"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateMatchFunction' test.out

#- 13 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'j6oDLjWj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteMatchFunction' test.out

#- 14 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 14 'MatchPoolList' test.out

#- 15 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 69, "backfill_ticket_expiration_seconds": 1, "match_function": "ODpoMF78", "match_function_override": {"backfill_matches": "NY4YkHs1", "enrichment": ["cnz1JSDg", "Y1TXp38z", "sCTCrbCb"], "make_matches": "POyNQkT7", "stat_codes": ["NvyE3cwy", "ALczNIic", "Xm7agSrj"], "validation": ["JW2OQNOs", "1PXhT5Fv", "diRilZ7o"]}, "name": "Fgx4c8Ou", "rule_set": "mKtPDKJD", "session_template": "Xn7Z4U68", "ticket_expiration_seconds": 38}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMatchPool' test.out

#- 16 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'VbMqSszE' \
    > test.out 2>&1
eval_tap $? 16 'MatchPoolDetails' test.out

#- 17 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '8GHavj7A' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 6, "backfill_ticket_expiration_seconds": 36, "match_function": "IhUDrwoZ", "match_function_override": {"backfill_matches": "5MecdKi5", "enrichment": ["r6QEa1ys", "LEzth6mX", "hzkzWkFe"], "make_matches": "ZSoEAcBd", "stat_codes": ["W19m4eu6", "d5tA5jUm", "iTqpyhPF"], "validation": ["dxLzFQN0", "5MYzYiKW", "e5dNRljv"]}, "rule_set": "7IPrDQQR", "session_template": "gat0Sevk", "ticket_expiration_seconds": 76}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateMatchPool' test.out

#- 18 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'KYnIuMBv' \
    > test.out 2>&1
eval_tap $? 18 'DeleteMatchPool' test.out

#- 19 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'aO35llzQ' \
    > test.out 2>&1
eval_tap $? 19 'MatchPoolMetric' test.out

#- 20 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"RaT5kPxU": {}, "fofvnnSu": {}, "B0y5WUlr": {}}, "latencies": {"MdI4sNve": 1, "R8sKgnuR": 20, "Iv53HGCi": 23}, "matchPool": "D391C2qt", "sessionID": "PYokahFj"}' \
    > test.out 2>&1
eval_tap $? 20 'CreateMatchTicket' test.out

#- 21 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'kQsfCaTm' \
    > test.out 2>&1
eval_tap $? 21 'MatchTicketDetails' test.out

#- 22 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 't1d67FXG' \
    > test.out 2>&1
eval_tap $? 22 'DeleteMatchTicket' test.out

#- 23 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 23 'RuleSetList' test.out

#- 24 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"2s9Q0mPV": {}, "o3twu0Me": {}, "sTCf9x4r": {}}, "enable_custom_match_function": true, "name": "WN2laRlx"}' \
    > test.out 2>&1
eval_tap $? 24 'CreateRuleSet' test.out

#- 25 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'fcjHfYak' \
    > test.out 2>&1
eval_tap $? 25 'RuleSetDetails' test.out

#- 26 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'UCTqGkE7' \
    --body '{"data": {"wcWfDslp": {}, "JSqGAXQ0": {}, "yYoNRKd3": {}}, "enable_custom_match_function": true, "name": "L5TAQ6ii"}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateRuleSet' test.out

#- 27 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'PlSC2uE4' \
    > test.out 2>&1
eval_tap $? 27 'DeleteRuleSet' test.out

#- 28 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 28 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE