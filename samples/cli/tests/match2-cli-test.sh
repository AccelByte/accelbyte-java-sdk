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
echo "1..44"

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

#- 9 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 9 'AdminGetAllConfigV1' test.out

#- 10 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'AdminGetConfigV1' test.out

#- 11 AdminPatchConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminPatchConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"crossPlatformNoCurrentPlatform": true, "extraPlatforms": ["xcVpFrttufHIRdH9", "UzVRiXbqlAw7r6W2", "ktQG0h5JAav5kRa6"], "matchAnyCommon": false, "platformGroup": {"opBJHPtcDs8bBZLC": ["XLx8bbgorQeFbQ1g", "7qbPngUNB1vRodwp", "zS6DaDpv8N7ZQVqG"], "j6oDLjWjkY1aXlFc": ["DtgOjchIua5tWEIC", "32ogW7olvbTgrhRT", "cPiSuL0Sly6XM4OI"], "18mAQLnzjMf8GZ2W": ["BZqxYG3aREAu2D6Q", "VKNCWP75TB0i7pKx", "R8dl0zRVW4EZG9m0"]}}' \
    > test.out 2>&1
eval_tap $? 11 'AdminPatchConfigV1' test.out

#- 12 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 12 'EnvironmentVariableList' test.out

#- 13 AdminQueryBackfill
./ng net.accelbyte.sdk.cli.Main match2 adminQueryBackfill \
    --namespace "$AB_NAMESPACE" \
    --fromTime '1996-01-14T00:00:00Z' \
    --isActive  \
    --limit '14' \
    --matchPool '8su8XfqlqNiTvB6S' \
    --offset '6' \
    --playerID 'AorKsxwkosAVerXp' \
    --region 'c1C8XfwHuKeb9l3r' \
    --sessionID 'GN9A3sNm84hddSpH' \
    --toTime '1981-08-16T00:00:00Z' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryBackfill' test.out

#- 14 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "0P7MIIR7CkyF6C7d", "sessionId": "uuyZ0GhDogqrhBRd"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateBackfill' test.out

#- 15 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID '8lDR6qVNPRZYdFLI' \
    > test.out 2>&1
eval_tap $? 15 'GetBackfillProposal' test.out

#- 16 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'AjGGJddVCvu9vx5K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetBackfill' test.out

#- 17 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'Q7KYnIuMBvaO35ll' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteBackfill' test.out

#- 18 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'zQRaT5kPxUfofvnn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["SuB0y5WUlrMdI4sN", "veabntBSxTeIv53H", "GCiljvjKoyD6SCwG"], "proposalId": "rncqmLtjQHAf8Tgo", "stop": false}' \
    > test.out 2>&1
eval_tap $? 18 'AcceptBackfill' test.out

#- 19 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'XGk2s9Q0mPVo3twu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "0MesTCf9x4rt69ln", "stop": false}' \
    > test.out 2>&1
eval_tap $? 19 'RejectBackfill' test.out

#- 20 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 20 'MatchFunctionList' test.out

#- 21 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "qxNeIxPz6MbwL6IY", "serviceAppName": "69z1UaLqYSYWytLP", "url": "ziZMdjxcBZufQxGi"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateMatchFunction' test.out

#- 22 MatchFunctionGet
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionGet \
    --name 'HPllG4cYEzfTD1ZB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'MatchFunctionGet' test.out

#- 23 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'm3MqHcUmLZZbSqb8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "RwNmn9HrNQy4uZAA", "serviceAppName": "iE0mit9RGCCHYzUO", "url": "cEdscKHPEqgA8yu7"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateMatchFunction' test.out

#- 24 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'Vk6Jt4Ymos9Jcdos' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteMatchFunction' test.out

#- 25 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --name 'fYcTVU6RBt0zYoMc' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 25 'MatchPoolList' test.out

#- 26 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 51, "backfill_ticket_expiration_seconds": 34, "best_latency_calculation_method": "CUEXlAvxJMdalwSy", "crossplay_disabled": false, "match_function": "PX2bOItRMvqtlB2j", "match_function_override": {"backfill_matches": "JCSQT279ZZPYGu0r", "enrichment": ["dlgdWyOtXi3choQr", "pOsDBU5SepjChB3V", "0v52Dlym6puQ23xo"], "make_matches": "J8aeCnaLpUKp44YU", "stat_codes": ["DjasWIPUvmEejtGe", "oyIPa8ZRrvjj7il3", "5MXbN9oCMNqq98Sj"], "validation": ["TvhZNkSQ70D0H6BX", "ksUC9b6i5lZC9xv3", "2e8c5csSovoqsZNB"]}, "name": "dte9NDUPVJf6c2Z0", "platform_group_enabled": true, "rule_set": "ZxfgPubTDIHrvqAT", "session_template": "huwjRHpKKTlmVr9X", "ticket_expiration_seconds": 42}' \
    > test.out 2>&1
eval_tap $? 26 'CreateMatchPool' test.out

#- 27 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool '6pf3vneSD2Tb3g7m' \
    > test.out 2>&1
eval_tap $? 27 'MatchPoolDetails' test.out

#- 28 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'SQUhAEtrmjqU6YE3' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 38, "backfill_ticket_expiration_seconds": 23, "best_latency_calculation_method": "SiZqan0nSBJroav9", "crossplay_disabled": false, "match_function": "GXlvPG6bFYReVHQi", "match_function_override": {"backfill_matches": "pcCx9Zw5D2L7vIYh", "enrichment": ["GGSyEW4ZJJ42d3PB", "ddN8S48l9lyNApfl", "xqMrj3oZk03QXcKM"], "make_matches": "DYDDxHSZjtqXyJ58", "stat_codes": ["f7Gc26SaiGVkydwY", "WQG26yUZNmTBcvrb", "YCwZtxFHyPLtI8il"], "validation": ["byDPUIj88cekdqCt", "81P1ktfIovmv9gsR", "5cJcHm3SZLxoRDFu"]}, "platform_group_enabled": true, "rule_set": "fRByjlBiuFM3FIoV", "session_template": "k8T3GpAnkCmBUqg2", "ticket_expiration_seconds": 91}' \
    > test.out 2>&1
eval_tap $? 28 'UpdateMatchPool' test.out

#- 29 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'skYs4Yw20DOqOBSC' \
    > test.out 2>&1
eval_tap $? 29 'DeleteMatchPool' test.out

#- 30 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '2DKHRuPMMWH8Yb33' \
    > test.out 2>&1
eval_tap $? 30 'MatchPoolMetric' test.out

#- 31 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'T5UBJCjfcnLRfxeC' \
    --body '{"type": "connectDS"}' \
    > test.out 2>&1
eval_tap $? 31 'PostMatchErrorMetric' test.out

#- 32 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'z9WEi8KlloeH0JT1' \
    > test.out 2>&1
eval_tap $? 32 'GetPlayerMetric' test.out

#- 33 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'yduat2vQR3biBfsu' \
    --limit '82' \
    --offset '20' \
    > test.out 2>&1
eval_tap $? 33 'AdminGetMatchPoolTickets' test.out

#- 34 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"a4EXsXzOXQAk4mqr": {}, "xzTtuLl4XlbGL8QO": {}, "xtjzm8y2wNhmwoYZ": {}}, "excludedSessions": ["yI4EFZKBcYrCEAE7", "WIsfmx40NLRc6m8h", "eKnWhzfe2NubeoKF"], "latencies": {"eIaFQCYoDPICpndu": 62, "BbEDoNf3n0hEoRCA": 4, "xvvKgAT8mJrYq6hR": 21}, "matchPool": "I07A68eaqC2J9jyE", "sessionID": "W6GLbc0NaKDUL3sa", "storage": {"13lk1dQBHO86IlBh": {}, "netU4RwTqUXlTDBz": {}, "OuYsaZA2yyd4mbqo": {}}}' \
    > test.out 2>&1
eval_tap $? 34 'CreateMatchTicket' test.out

#- 35 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '83' \
    --matchPool 'kP7cFdP43e5dC9XI' \
    --offset '56' \
    > test.out 2>&1
eval_tap $? 35 'GetMyMatchTickets' test.out

#- 36 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid '9bRVhyaKwwrAP2aM' \
    > test.out 2>&1
eval_tap $? 36 'MatchTicketDetails' test.out

#- 37 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'lu7WtjCtoYetOO84' \
    > test.out 2>&1
eval_tap $? 37 'DeleteMatchTicket' test.out

#- 38 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '13' \
    --name 'bfoMm5cTtFWbotQy' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 38 'RuleSetList' test.out

#- 39 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"JRcQWsmqPNs92epx": {}, "k0i8VxsZNereSvf9": {}, "699mCEHThUJkETAs": {}}, "enable_custom_match_function": true, "name": "p7gh4TeUTkOkAYfJ"}' \
    > test.out 2>&1
eval_tap $? 39 'CreateRuleSet' test.out

#- 40 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'B8AT9t4Tv207Y2QD' \
    > test.out 2>&1
eval_tap $? 40 'RuleSetDetails' test.out

#- 41 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '3oD5fLCr3OOlXVv8' \
    --body '{"data": {"ZGF7uYnGzpipNDig": {}, "NJma1MbqqZtfNWql": {}, "4nmwAft4gqkNNlWk": {}}, "enable_custom_match_function": true, "name": "D3cym8xIfkOVW2gr"}' \
    > test.out 2>&1
eval_tap $? 41 'UpdateRuleSet' test.out

#- 42 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'REOLx0KOww3HICQL' \
    > test.out 2>&1
eval_tap $? 42 'DeleteRuleSet' test.out

#- 43 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'fl7MUBG7qtPu64yA' \
    > test.out 2>&1
eval_tap $? 43 'PublicGetPlayerMetric' test.out

#- 44 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 44 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE