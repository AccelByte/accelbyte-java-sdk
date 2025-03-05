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
echo "1..40"

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

#- 10 AdminQueryBackfill
./ng net.accelbyte.sdk.cli.Main match2 adminQueryBackfill \
    --namespace "$AB_NAMESPACE" \
    --fromTime '1977-01-18T00:00:00Z' \
    --isActive  \
    --limit '14' \
    --matchPool '8su8XfqlqNiTvB6S' \
    --offset '6' \
    --playerID 'AorKsxwkosAVerXp' \
    --region 'c1C8XfwHuKeb9l3r' \
    --sessionID 'GN9A3sNm84hddSpH' \
    --toTime '1981-08-16T00:00:00Z' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryBackfill' test.out

#- 11 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "0P7MIIR7CkyF6C7d", "sessionId": "uuyZ0GhDogqrhBRd"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateBackfill' test.out

#- 12 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID '8lDR6qVNPRZYdFLI' \
    > test.out 2>&1
eval_tap $? 12 'GetBackfillProposal' test.out

#- 13 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'AjGGJddVCvu9vx5K' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'GetBackfill' test.out

#- 14 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'Q7KYnIuMBvaO35ll' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'DeleteBackfill' test.out

#- 15 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'zQRaT5kPxUfofvnn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["SuB0y5WUlrMdI4sN", "veabntBSxTeIv53H", "GCiljvjKoyD6SCwG"], "proposalId": "rncqmLtjQHAf8Tgo", "stop": false}' \
    > test.out 2>&1
eval_tap $? 15 'AcceptBackfill' test.out

#- 16 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'XGk2s9Q0mPVo3twu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "0MesTCf9x4rt69ln", "stop": false}' \
    > test.out 2>&1
eval_tap $? 16 'RejectBackfill' test.out

#- 17 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '23' \
    > test.out 2>&1
eval_tap $? 17 'MatchFunctionList' test.out

#- 18 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "qxNeIxPz6MbwL6IY", "serviceAppName": "69z1UaLqYSYWytLP", "url": "ziZMdjxcBZufQxGi"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateMatchFunction' test.out

#- 19 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'HPllG4cYEzfTD1ZB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "m3MqHcUmLZZbSqb8", "serviceAppName": "RwNmn9HrNQy4uZAA", "url": "iE0mit9RGCCHYzUO"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchFunction' test.out

#- 20 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'cEdscKHPEqgA8yu7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'DeleteMatchFunction' test.out

#- 21 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --name 'TTr1DmrhZv15T7qu' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 21 'MatchPoolList' test.out

#- 22 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 83, "backfill_ticket_expiration_seconds": 44, "best_latency_calculation_method": "cTVU6RBt0zYoMcHy", "crossplay_disabled": true, "match_function": "xpBFmaLoxozr6wfN", "match_function_override": {"backfill_matches": "PX2bOItRMvqtlB2j", "enrichment": ["JCSQT279ZZPYGu0r", "dlgdWyOtXi3choQr", "pOsDBU5SepjChB3V"], "make_matches": "0v52Dlym6puQ23xo", "stat_codes": ["J8aeCnaLpUKp44YU", "DjasWIPUvmEejtGe", "oyIPa8ZRrvjj7il3"], "validation": ["5MXbN9oCMNqq98Sj", "TvhZNkSQ70D0H6BX", "ksUC9b6i5lZC9xv3"]}, "name": "2e8c5csSovoqsZNB", "platform_group_enabled": false, "rule_set": "bmXgdAPh1EThG96g", "session_template": "AFKK2WDgCcxvONZm", "ticket_expiration_seconds": 16}' \
    > test.out 2>&1
eval_tap $? 22 'CreateMatchPool' test.out

#- 23 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'EeERmDnyeFoF7VSZ' \
    > test.out 2>&1
eval_tap $? 23 'MatchPoolDetails' test.out

#- 24 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '6pf3vneSD2Tb3g7m' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 87, "backfill_ticket_expiration_seconds": 42, "best_latency_calculation_method": "UhAEtrmjqU6YE3p4", "crossplay_disabled": false, "match_function": "SiZqan0nSBJroav9", "match_function_override": {"backfill_matches": "1GXlvPG6bFYReVHQ", "enrichment": ["ipcCx9Zw5D2L7vIY", "hGGSyEW4ZJJ42d3P", "BddN8S48l9lyNApf"], "make_matches": "lxqMrj3oZk03QXcK", "stat_codes": ["MDYDDxHSZjtqXyJ5", "8f7Gc26SaiGVkydw", "YWQG26yUZNmTBcvr"], "validation": ["bYCwZtxFHyPLtI8i", "lbyDPUIj88cekdqC", "t81P1ktfIovmv9gs"]}, "platform_group_enabled": true, "rule_set": "5cJcHm3SZLxoRDFu", "session_template": "uuySj29a9LJE8HoR", "ticket_expiration_seconds": 92}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateMatchPool' test.out

#- 25 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'k8T3GpAnkCmBUqg2' \
    > test.out 2>&1
eval_tap $? 25 'DeleteMatchPool' test.out

#- 26 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'SCnqntX9y1aZSWMi' \
    > test.out 2>&1
eval_tap $? 26 'MatchPoolMetric' test.out

#- 27 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'Vi10sG6vxkfUcmqR' \
    --body '{"type": "connectDS"}' \
    > test.out 2>&1
eval_tap $? 27 'PostMatchErrorMetric' test.out

#- 28 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '5UBJCjfcnLRfxeCS' \
    > test.out 2>&1
eval_tap $? 28 'GetPlayerMetric' test.out

#- 29 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'z9WEi8KlloeH0JT1' \
    --limit '51' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 29 'AdminGetMatchPoolTickets' test.out

#- 30 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"duat2vQR3biBfsu4": {}, "jmsRE2w1yEkLgh3t": {}, "IYt4SqYUTLDx9gIi": {}}, "excludedSessions": ["DandpGT2t24aOMh5", "eC3IHeHSKLCa3xre", "NDUWehwH3q31A806"], "latencies": {"DJgas4b6z3LNUj7f": 8, "eIaFQCYoDPICpndu": 62, "BbEDoNf3n0hEoRCA": 4}, "matchPool": "xvvKgAT8mJrYq6hR", "sessionID": "kloqxM3gpwxcfMy9", "storage": {"XzjjI5YbsKoADkzJ": {}, "EN2VHzih3bit0VWn": {}, "3CO39PXDNxtXgeO3": {}}}' \
    > test.out 2>&1
eval_tap $? 30 'CreateMatchTicket' test.out

#- 31 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --matchPool 'OuYsaZA2yyd4mbqo' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 31 'GetMyMatchTickets' test.out

#- 32 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'kP7cFdP43e5dC9XI' \
    > test.out 2>&1
eval_tap $? 32 'MatchTicketDetails' test.out

#- 33 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'BudfZgrbHDIDm4hM' \
    > test.out 2>&1
eval_tap $? 33 'DeleteMatchTicket' test.out

#- 34 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '51' \
    --name 'lu7WtjCtoYetOO84' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 34 'RuleSetList' test.out

#- 35 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"bfoMm5cTtFWbotQy": {}, "XJRcQWsmqPNs92ep": {}, "xk0i8VxsZNereSvf": {}}, "enable_custom_match_function": true, "name": "9mCEHThUJkETAsSp"}' \
    > test.out 2>&1
eval_tap $? 35 'CreateRuleSet' test.out

#- 36 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset '7gh4TeUTkOkAYfJB' \
    > test.out 2>&1
eval_tap $? 36 'RuleSetDetails' test.out

#- 37 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '8AT9t4Tv207Y2QD3' \
    --body '{"data": {"oD5fLCr3OOlXVv8Z": {}, "GF7uYnGzpipNDigN": {}, "Jma1MbqqZtfNWql4": {}}, "enable_custom_match_function": false, "name": "B4lkKB4EYOkQ1jMD"}' \
    > test.out 2>&1
eval_tap $? 37 'UpdateRuleSet' test.out

#- 38 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '3cym8xIfkOVW2grR' \
    > test.out 2>&1
eval_tap $? 38 'DeleteRuleSet' test.out

#- 39 PublicGetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 publicGetPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'EOLx0KOww3HICQLf' \
    > test.out 2>&1
eval_tap $? 39 'PublicGetPlayerMetric' test.out

#- 40 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 40 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE