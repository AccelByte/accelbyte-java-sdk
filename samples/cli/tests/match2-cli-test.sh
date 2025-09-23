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
echo "1..46"

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

#- 4 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main match2 adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetLogConfig' test.out

#- 5 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main match2 adminPatchUpdateLogConfig \
    --body '{"logLevel": "info"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminGetPlayFeatureFlag
./ng net.accelbyte.sdk.cli.Main match2 adminGetPlayFeatureFlag \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'AdminGetPlayFeatureFlag' test.out

#- 7 AdminUpsertPlayFeatureFlag
./ng net.accelbyte.sdk.cli.Main match2 adminUpsertPlayFeatureFlag \
    --namespace "$AB_NAMESPACE" \
    --body '{"ENABLE_AUTO_CANCEL_MATCH_USER_DISCONNECT": true, "ENABLE_AUTO_CANCEL_MATCH_USER_LEAVE": true}' \
    > test.out 2>&1
eval_tap $? 7 'AdminUpsertPlayFeatureFlag' test.out

#- 8 AdminDeletePlayFeatureFlag
./ng net.accelbyte.sdk.cli.Main match2 adminDeletePlayFeatureFlag \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 8 'AdminDeletePlayFeatureFlag' test.out

#- 9 AdminGetXRayConfig
./ng net.accelbyte.sdk.cli.Main match2 adminGetXRayConfig \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'AdminGetXRayConfig' test.out

#- 10 AdminUpdateXRayConfig
./ng net.accelbyte.sdk.cli.Main match2 adminUpdateXRayConfig \
    --namespace "$AB_NAMESPACE" \
    --body '{"whitelistedUsers": ["wYCA9kPI6LZrkq6D", "c09nIW0Oaiw9B0D7", "eHpzSn3ZPUdc0qh4"]}' \
    > test.out 2>&1
eval_tap $? 10 'AdminUpdateXRayConfig' test.out

#- 11 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 11 'AdminGetAllConfigV1' test.out

#- 12 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'AdminGetConfigV1' test.out

#- 13 AdminPatchConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminPatchConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossPlatformNoCurrentPlatform": false, "extraPlatforms": ["2WopBJHPtcDs8bBZ", "LCXLx8bbgorQeFbQ", "1g7qbPngUNB1vRod"], "matchAnyCommon": true, "platformGroup": {"ElFHHdgs21Jub74C": ["UkNmKJfh5pUkHODp", "oMF78NY4YkHs1cnz", "1JSDgY1TXp38zsCT"], "CrbCbPOyNQkT7Nvy": ["E3cwyALczNIicXm7", "agSrjJW2OQNOs1PX", "hT5FvdiRilZ7oFgx"], "4c8OumKtPDKJDXn7": ["Z4U68su8XfqlqNiT", "vB6SdAdIhUDrwoZ5", "MecdKi5r6QEa1ysL"]}, "xrayMaxWhitelistedUserCount": 62}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPatchConfigV1' test.out

#- 14 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 14 'EnvironmentVariableList' test.out

#- 15 AdminQueryBackfill
./ng net.accelbyte.sdk.cli.Main match2 adminQueryBackfill \
    --namespace "$AB_NAMESPACE" \
    --fromTime '1984-04-02T00:00:00Z' \
    --isActive  \
    --limit '39' \
    --matchPool '3rGN9A3sNm84hddS' \
    --offset '31' \
    --playerID 'AcBdW19m4eu6d5tA' \
    --region '5jUmiTqpyhPFdxLz' \
    --sessionID 'FQN05MYzYiKWe5dN' \
    --toTime '1993-10-29T00:00:00Z' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryBackfill' test.out

#- 16 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "ljv7IPrDQQRgat0S", "sessionId": "evkLGMS0lyuI9a2I"}' \
    > test.out 2>&1
eval_tap $? 16 'CreateBackfill' test.out

#- 17 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID '9u6Vpbsx5w8hqUI0' \
    > test.out 2>&1
eval_tap $? 17 'GetBackfillProposal' test.out

#- 18 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID '6UpOXGSLmCVuHOPl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetBackfill' test.out

#- 19 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'LlkvR8sKgnuRkggh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteBackfill' test.out

#- 20 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'GoYupD391C2qtPYo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["kahFjkQsfCaTmt1d", "67FXGk2s9Q0mPVo3", "twu0MesTCf9x4rt6"], "proposalId": "9lna7qxNeIxPz6Mb", "stop": true}' \
    > test.out 2>&1
eval_tap $? 20 'AcceptBackfill' test.out

#- 21 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'TqGkE7wcWfDslpJS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "qGAXQ0yYoNRKd3IL", "stop": true}' \
    > test.out 2>&1
eval_tap $? 21 'RejectBackfill' test.out

#- 22 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '66' \
    > test.out 2>&1
eval_tap $? 22 'MatchFunctionList' test.out

#- 23 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "Q6iiPlSC2uE4o5Vw", "serviceAppName": "do3fePqIJA8IHtrk", "url": "mu0hpDDWVAla2l5B"}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMatchFunction' test.out

#- 24 MatchFunctionGet
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionGet \
    --name 'YNtIuS5S5XUdjsoq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'MatchFunctionGet' test.out

#- 25 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'wGyzzWi9gwQYv7t1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "o7TTr1DmrhZv15T7", "serviceAppName": "quIOvBMcaYmvCkGZ", "url": "5dAgqxpBFmaLoxoz"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateMatchFunction' test.out

#- 26 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'r6wfNPX2bOItRMvq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'DeleteMatchFunction' test.out

#- 27 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --name 'M3VHh2EI8JlDbPWb' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 27 'MatchPoolList' test.out

#- 28 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 88, "backfill_ticket_expiration_seconds": 37, "best_latency_calculation_method": "lNmqRBaAkLnvxkT1", "crossplay_disabled": false, "match_function": "68cmDc3fxU8MyKrQ", "match_function_override": {"backfill_matches": "pM4hkkK6KKXNB3Gv", "enrichment": ["0IqmF51TkhjYnaq6", "foWvXa3bMrXsDr6k", "ILsSSyDdmykmoPYg"], "make_matches": "c2L4jk4Lo0LSP0pf", "stat_codes": ["4IxjUkl535X3ateE", "KDpADz1x3poD3Qgb", "3boLQQ1MzH7Qm8bw"], "validation": ["bmXgdAPh1EThG96g", "AFKK2WDgCcxvONZm", "3EeERmDnyeFoF7VS"]}, "name": "Z6pf3vneSD2Tb3g7", "platform_group_enabled": false, "rule_set": "xtu7LQRENjEEztx1", "session_template": "WsYSiZqan0nSBJro", "ticket_expiration_seconds": 0}' \
    > test.out 2>&1
eval_tap $? 28 'CreateMatchPool' test.out

#- 29 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'BHqaTHeKtW18iGeU' \
    > test.out 2>&1
eval_tap $? 29 'MatchPoolDetails' test.out

#- 30 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'lc9d9sogWa24CKNS' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 15, "backfill_ticket_expiration_seconds": 97, "best_latency_calculation_method": "GGSyEW4ZJJ42d3PB", "crossplay_disabled": false, "match_function": "go5QB65lSAiYnNjk", "match_function_override": {"backfill_matches": "fZrQvGgbLdLsFzHk", "enrichment": ["BMr1yrOMlNFSrUEi", "rnjX9fDmIbeZxzfT", "cyiuATus9hsfpFDc"], "make_matches": "SDG8aMVGLiBNrDjq", "stat_codes": ["oxcwgGLXpUL4pp2n", "cYAHdNzDmeIP6rOv", "Dz9KOsb392k6YmJF"], "validation": ["fRByjlBiuFM3FIoV", "k8T3GpAnkCmBUqg2", "SCnqntX9y1aZSWMi"]}, "platform_group_enabled": false, "rule_set": "DKHRuPMMWH8Yb33T", "session_template": "5UBJCjfcnLRfxeCS", "ticket_expiration_seconds": 52}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateMatchPool' test.out

#- 31 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'qElIaDml48wdNFLT' \
    > test.out 2>&1
eval_tap $? 31 'DeleteMatchPool' test.out

#- 32 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'm5T50x9WT0GfH2rt' \
    > test.out 2>&1
eval_tap $? 32 'MatchPoolMetric' test.out

#- 33 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'Oa4EXsXzOXQAk4mq' \
    --body '{"type": "getExternalDS"}' \
    > test.out 2>&1
eval_tap $? 33 'PostMatchErrorMetric' test.out

#- 34 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'IYt4SqYUTLDx9gIi' \
    > test.out 2>&1
eval_tap $? 34 'GetPlayerMetric' test.out

#- 35 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'DandpGT2t24aOMh5' \
    --limit '8' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetMatchPoolTickets' test.out

#- 36 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"C3IHeHSKLCa3xreN": {}, "DUWehwH3q31A806D": {}, "Jgas4b6z3LNUj7fd": {}}, "excludedSessions": ["gLA84Z8YYk6QEgJj", "BbEDoNf3n0hEoRCA", "cf80zfFyabWAgIUX"], "latencies": {"iI07A68eaqC2J9jy": 61, "XzjjI5YbsKoADkzJ": 62, "13lk1dQBHO86IlBh": 27}, "matchPool": "CO39PXDNxtXgeO3F", "sessionID": "gkXhjDzaQY3snn2Z", "storage": {"kP7cFdP43e5dC9XI": {}, "BudfZgrbHDIDm4hM": {}, "zF4TxodenSrUTvfq": {}}}' \
    > test.out 2>&1
eval_tap $? 36 'CreateMatchTicket' test.out

#- 37 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '95' \
    --matchPool '7g8OudOfjnCuHZ3c' \
    --offset '50' \
    > test.out 2>&1
eval_tap $? 37 'GetMyMatchTickets' test.out

#- 38 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid '6IjGa23YvYmmDg7V' \
    > test.out 2>&1
eval_tap $? 38 'MatchTicketDetails' test.out

#- 39 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'YPXIuvUYTZBRujIU' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMatchTicket' test.out

#- 40 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --name '9699mCEHThUJkETA' \
    --offset '37' \
    > test.out 2>&1
eval_tap $? 40 'RuleSetList' test.out

#- 41 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"urjh2imdb4rbkXj0": {}, "ZwsVC0gL97ZVJSPq": {}, "Jiwv1qlYB1RSKs6g": {}}, "enable_custom_match_function": true, "name": "ZGF7uYnGzpipNDig"}' \
    > test.out 2>&1
eval_tap $? 41 'CreateRuleSet' test.out

#- 42 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'NJma1MbqqZtfNWql' \
    > test.out 2>&1
eval_tap $? 42 'RuleSetDetails' test.out

#- 43 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '4nmwAft4gqkNNlWk' \
    --body '{"data": {"D9eOziYRFOn0jJLH": {}, "C9LxhvNXTwGBCtoh": {}, "Ltl9Zuhytm5UDrT6": {}}, "enable_custom_match_function": true, "name": "XCs5SPBbRPZTF6oQ"}' \
    > test.out 2>&1
eval_tap $? 43 'UpdateRuleSet' test.out

#- 44 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'AXVG7tnsZg5QgXjv' \
    > test.out 2>&1
eval_tap $? 44 'DeleteRuleSet' test.out

#- 45 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'yGJPN4eXbJE5Vs2G' \
    > test.out 2>&1
eval_tap $? 45 'PublicGetPlayerMetric' test.out

#- 46 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 46 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE