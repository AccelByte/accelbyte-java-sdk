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
echo "1..37"

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
    --body '{"proposalId": "qrhBRd8lDR6qVNPR", "stop": false}' \
    > test.out 2>&1
eval_tap $? 14 'AcceptBackfill' test.out

#- 15 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'dFLIAjGGJddVCvu9' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "vx5KQ7KYnIuMBvaO", "stop": false}' \
    > test.out 2>&1
eval_tap $? 15 'RejectBackfill' test.out

#- 16 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '42' \
    > test.out 2>&1
eval_tap $? 16 'MatchFunctionList' test.out

#- 17 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "zQRaT5kPxUfofvnn", "serviceAppName": "SuB0y5WUlrMdI4sN", "url": "veabntBSxTeIv53H"}' \
    > test.out 2>&1
eval_tap $? 17 'CreateMatchFunction' test.out

#- 18 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'GCiljvjKoyD6SCwG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "rncqmLtjQHAf8Tgo", "serviceAppName": "Nm03VLisV6zwPuo3", "url": "td6TC6I3lMjGSWN2"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMatchFunction' test.out

#- 19 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'laRlxfcjHfYakUCT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteMatchFunction' test.out

#- 20 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --name '6IY69z1UaLqYSYWy' \
    --offset '40' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolList' test.out

#- 21 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 77, "backfill_ticket_expiration_seconds": 85, "best_latency_calculation_method": "Q0yYoNRKd3IL5TAQ", "crossplay_disabled": false, "match_function": "PllG4cYEzfTD1ZBm", "match_function_override": {"backfill_matches": "3MqHcUmLZZbSqb8R", "enrichment": ["wNmn9HrNQy4uZAAi", "E0mit9RGCCHYzUOc", "EdscKHPEqgA8yu7V"], "make_matches": "k6Jt4Ymos9Jcdos4", "stat_codes": ["fYcTVU6RBt0zYoMc", "HyCUEXlAvxJMdalw", "SyliWMNW5NyLu0M3"], "validation": ["VHh2EI8JlDbPWbQ6", "Q9lNmqRBaAkLnvxk", "T1X68cmDc3fxU8My"]}, "name": "KrQpM4hkkK6KKXNB", "platform_group_enabled": true, "rule_set": "Gv0IqmF51TkhjYna", "session_template": "q6foWvXa3bMrXsDr", "ticket_expiration_seconds": 8}' \
    > test.out 2>&1
eval_tap $? 21 'CreateMatchPool' test.out

#- 22 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'kILsSSyDdmykmoPY' \
    > test.out 2>&1
eval_tap $? 22 'MatchPoolDetails' test.out

#- 23 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'gc2L4jk4Lo0LSP0p' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 93, "backfill_ticket_expiration_seconds": 45, "best_latency_calculation_method": "IxjUkl535X3ateEK", "crossplay_disabled": true, "match_function": "UC9b6i5lZC9xv32e", "match_function_override": {"backfill_matches": "8c5csSovoqsZNBdt", "enrichment": ["e9NDUPVJf6c2Z0QZ", "xfgPubTDIHrvqATh", "uwjRHpKKTlmVr9Xu"], "make_matches": "oJbRFQSKVPHbn4Xx", "stat_codes": ["tu7LQRENjEEztx1W", "sYSiZqan0nSBJroa", "v91GXlvPG6bFYReV"], "validation": ["HQipcCx9Zw5D2L7v", "IYhGGSyEW4ZJJ42d", "3PBddN8S48l9lyNA"]}, "platform_group_enabled": false, "rule_set": "NjkfZrQvGgbLdLsF", "session_template": "zHkBMr1yrOMlNFSr", "ticket_expiration_seconds": 96}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateMatchPool' test.out

#- 24 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '58f7Gc26SaiGVkyd' \
    > test.out 2>&1
eval_tap $? 24 'DeleteMatchPool' test.out

#- 25 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'wYWQG26yUZNmTBcv' \
    > test.out 2>&1
eval_tap $? 25 'MatchPoolMetric' test.out

#- 26 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'rbYCwZtxFHyPLtI8' \
    > test.out 2>&1
eval_tap $? 26 'GetPlayerMetric' test.out

#- 27 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'ilbyDPUIj88cekdq' \
    --limit '59' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 27 'AdminGetMatchPoolTickets' test.out

#- 28 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"ncYAHdNzDmeIP6rO": {}, "vDz9KOsb392k6YmJ": {}, "FfRByjlBiuFM3FIo": {}}, "latencies": {"Vk8T3GpAnkCmBUqg": 96, "SCnqntX9y1aZSWMi": 98, "2DKHRuPMMWH8Yb33": 93}, "matchPool": "bceJ5i0EeDxOgBnh", "sessionID": "hqElIaDml48wdNFL", "storage": {"Tm5T50x9WT0GfH2r": {}, "tOa4EXsXzOXQAk4m": {}, "qrxzTtuLl4XlbGL8": {}}}' \
    > test.out 2>&1
eval_tap $? 28 'CreateMatchTicket' test.out

#- 29 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --matchPool 'iDandpGT2t24aOMh' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 29 'GetMyMatchTickets' test.out

#- 30 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'yI4EFZKBcYrCEAE7' \
    > test.out 2>&1
eval_tap $? 30 'MatchTicketDetails' test.out

#- 31 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'WIsfmx40NLRc6m8h' \
    > test.out 2>&1
eval_tap $? 31 'DeleteMatchTicket' test.out

#- 32 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --name 'Jgas4b6z3LNUj7fd' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 32 'RuleSetList' test.out

#- 33 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"IaFQCYoDPICpnduE": {}, "EQlULdJz4mnRBkMN": {}, "xvvKgAT8mJrYq6hR": {}}, "enable_custom_match_function": false, "name": "I07A68eaqC2J9jyE"}' \
    > test.out 2>&1
eval_tap $? 33 'CreateRuleSet' test.out

#- 34 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'W6GLbc0NaKDUL3sa' \
    > test.out 2>&1
eval_tap $? 34 'RuleSetDetails' test.out

#- 35 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '13lk1dQBHO86IlBh' \
    --body '{"data": {"netU4RwTqUXlTDBz": {}, "OuYsaZA2yyd4mbqo": {}, "OfADMMAXFaY9eKa6": {}}, "enable_custom_match_function": true, "name": "9bRVhyaKwwrAP2aM"}' \
    > test.out 2>&1
eval_tap $? 35 'UpdateRuleSet' test.out

#- 36 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'lu7WtjCtoYetOO84' \
    > test.out 2>&1
eval_tap $? 36 'DeleteRuleSet' test.out

#- 37 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 37 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE