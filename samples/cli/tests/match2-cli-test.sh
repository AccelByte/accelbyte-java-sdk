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
echo "1..39"

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

#- 6 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 6 'AdminGetAllConfigV1' test.out

#- 7 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'AdminGetConfigV1' test.out

#- 8 AdminPatchConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminPatchConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossPlatformNoCurrentPlatform": true, "extraPlatforms": ["AxcVpFrttufHIRdH", "9UzVRiXbqlAw7r6W", "2ktQG0h5JAav5kRa"], "matchAnyCommon": false, "platformGroup": {"2WopBJHPtcDs8bBZ": ["LCXLx8bbgorQeFbQ", "1g7qbPngUNB1vRod", "wpzS6DaDpv8N7ZQV"], "qGj6oDLjWjkY1aXl": ["FcDtgOjchIua5tWE", "IC32ogW7olvbTgrh", "RTcPiSuL0Sly6XM4"], "OI18mAQLnzjMf8GZ": ["2WBZqxYG3aREAu2D", "6QVKNCWP75TB0i7p", "KxR8dl0zRVW4EZG9"]}}' \
    > test.out 2>&1
eval_tap $? 8 'AdminPatchConfigV1' test.out

#- 9 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 9 'EnvironmentVariableList' test.out

#- 10 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "m0XcgGVbMqSszE8G", "sessionId": "Havj7AorKsxwkosA"}' \
    > test.out 2>&1
eval_tap $? 10 'CreateBackfill' test.out

#- 11 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'VerXpc1C8XfwHuKe' \
    > test.out 2>&1
eval_tap $? 11 'GetBackfillProposal' test.out

#- 12 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'b9l3rGN9A3sNm84h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'GetBackfill' test.out

#- 13 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'ddSpHt0P7MIIR7Ck' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteBackfill' test.out

#- 14 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'yF6C7duuyZ0GhDog' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["qrhBRd8lDR6qVNPR", "ZYdFLIAjGGJddVCv", "u9vx5KQ7KYnIuMBv"], "proposalId": "aO35llzQRaT5kPxU", "stop": false}' \
    > test.out 2>&1
eval_tap $? 14 'AcceptBackfill' test.out

#- 15 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'qUI06UpOXGSLmCVu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "HOPlLlkvR8sKgnuR", "stop": false}' \
    > test.out 2>&1
eval_tap $? 15 'RejectBackfill' test.out

#- 16 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 16 'MatchFunctionList' test.out

#- 17 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "v53HGCiljvjKoyD6", "serviceAppName": "SCwGrncqmLtjQHAf", "url": "8TgoNm03VLisV6zw"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateMatchFunction' test.out

#- 18 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'Puo3td6TC6I3lMjG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "SWN2laRlxfcjHfYa", "serviceAppName": "kUCTqGkE7wcWfDsl", "url": "pJSqGAXQ0yYoNRKd"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchFunction' test.out

#- 19 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name '3IL5TAQ6iiPlSC2u' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteMatchFunction' test.out

#- 20 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '63' \
    --name 'zfTD1ZBm3MqHcUmL' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolList' test.out

#- 21 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 40, "backfill_ticket_expiration_seconds": 91, "best_latency_calculation_method": "rkmu0hpDDWVAla2l", "crossplay_disabled": true, "match_function": "AAiE0mit9RGCCHYz", "match_function_override": {"backfill_matches": "UOcEdscKHPEqgA8y", "enrichment": ["u7Vk6Jt4Ymos9Jcd", "os4fYcTVU6RBt0zY", "oMcHyCUEXlAvxJMd"], "make_matches": "alwSyliWMNW5NyLu", "stat_codes": ["0M3VHh2EI8JlDbPW", "bQ6Q9lNmqRBaAkLn", "vxkT1X68cmDc3fxU"], "validation": ["8MyKrQpM4hkkK6KK", "XNB3Gv0IqmF51Tkh", "jYnaq6foWvXa3bMr"]}, "name": "XsDr6kILsSSyDdmy", "platform_group_enabled": false, "rule_set": "j7il35MXbN9oCMNq", "session_template": "q98SjTvhZNkSQ70D", "ticket_expiration_seconds": 69}' \
    > test.out 2>&1
eval_tap $? 21 'CreateMatchPool' test.out

#- 22 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'ateEKDpADz1x3poD' \
    > test.out 2>&1
eval_tap $? 22 'MatchPoolDetails' test.out

#- 23 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '3Qgb3boLQQ1MzH7Q' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 82, "backfill_ticket_expiration_seconds": 4, "best_latency_calculation_method": "Bdte9NDUPVJf6c2Z", "crossplay_disabled": false, "match_function": "QZxfgPubTDIHrvqA", "match_function_override": {"backfill_matches": "ThuwjRHpKKTlmVr9", "enrichment": ["XuoJbRFQSKVPHbn4", "Xxtu7LQRENjEEztx", "1WsYSiZqan0nSBJr"], "make_matches": "oav91GXlvPG6bFYR", "stat_codes": ["eVHQipcCx9Zw5D2L", "7vIYhGGSyEW4ZJJ4", "2d3PBddN8S48l9ly"], "validation": ["NApflxqMrj3oZk03", "QXcKMDYDDxHSZjtq", "XyJ58f7Gc26SaiGV"]}, "platform_group_enabled": false, "rule_set": "ZxzfTcyiuATus9hs", "session_template": "fpFDcSDG8aMVGLiB", "ticket_expiration_seconds": 81}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateMatchPool' test.out

#- 24 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'I8ilbyDPUIj88cek' \
    > test.out 2>&1
eval_tap $? 24 'DeleteMatchPool' test.out

#- 25 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'dqCt81P1ktfIovmv' \
    > test.out 2>&1
eval_tap $? 25 'MatchPoolMetric' test.out

#- 26 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '9gsR5cJcHm3SZLxo' \
    --body '{"type": "getExternalDS"}' \
    > test.out 2>&1
eval_tap $? 26 'PostMatchErrorMetric' test.out

#- 27 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'mJFfRByjlBiuFM3F' \
    > test.out 2>&1
eval_tap $? 27 'GetPlayerMetric' test.out

#- 28 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'IoVk8T3GpAnkCmBU' \
    --limit '33' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 28 'AdminGetMatchPoolTickets' test.out

#- 29 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"g2SCnqntX9y1aZSW": {}, "MiVi10sG6vxkfUcm": {}, "qRRbceJ5i0EeDxOg": {}}, "excludedSessions": ["BnhhqElIaDml48wd", "NFLTm5T50x9WT0Gf", "H2rtOa4EXsXzOXQA"], "latencies": {"k4mqrxzTtuLl4Xlb": 67, "9gIiDandpGT2t24a": 83, "woYZyI4EFZKBcYrC": 62}, "matchPool": "xreNDUWehwH3q31A", "sessionID": "806DJgas4b6z3LNU", "storage": {"j7fdgLA84Z8YYk6Q": {}, "EgJjBbEDoNf3n0hE": {}, "oRCAcf80zfFyabWA": {}}}' \
    > test.out 2>&1
eval_tap $? 29 'CreateMatchTicket' test.out

#- 30 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --matchPool 'q6hRkloqxM3gpwxc' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 30 'GetMyMatchTickets' test.out

#- 31 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid '9jyEW6GLbc0NaKDU' \
    > test.out 2>&1
eval_tap $? 31 'MatchTicketDetails' test.out

#- 32 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'L3sa13lk1dQBHO86' \
    > test.out 2>&1
eval_tap $? 32 'DeleteMatchTicket' test.out

#- 33 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --name 'VWn3CO39PXDNxtXg' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 33 'RuleSetList' test.out

#- 34 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"DBzOuYsaZA2yyd4m": {}, "bqoOfADMMAXFaY9e": {}, "Ka699bRVhyaKwwrA": {}}, "enable_custom_match_function": false, "name": "aMlu7WtjCtoYetOO"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateRuleSet' test.out

#- 35 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset '847g8OudOfjnCuHZ' \
    > test.out 2>&1
eval_tap $? 35 'RuleSetDetails' test.out

#- 36 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '3c46IjGa23YvYmmD' \
    --body '{"data": {"g7VYPXIuvUYTZBRu": {}, "jIUE1Tq5jyAZvkRC": {}, "MNFIurjh2imdb4rb": {}}, "enable_custom_match_function": false, "name": "kAYfJB8AT9t4Tv20"}' \
    > test.out 2>&1
eval_tap $? 36 'UpdateRuleSet' test.out

#- 37 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '7Y2QD3oD5fLCr3OO' \
    > test.out 2>&1
eval_tap $? 37 'DeleteRuleSet' test.out

#- 38 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'lXVv8ZGF7uYnGzpi' \
    > test.out 2>&1
eval_tap $? 38 'PublicGetPlayerMetric' test.out

#- 39 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 39 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE