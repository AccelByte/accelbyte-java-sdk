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
echo "1..35"

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

#- 4 AdminGetAllConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetAllConfigV1 \
    > test.out 2>&1
eval_tap $? 4 'AdminGetAllConfigV1' test.out

#- 5 AdminGetConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminGetConfigV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'AdminGetConfigV1' test.out

#- 6 AdminPatchConfigV1
./ng net.accelbyte.sdk.cli.Main match2 adminPatchConfigV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"platformGroup": {"EAxcVpFrttufHIRd": ["H9UzVRiXbqlAw7r6", "W2ktQG0h5JAav5kR", "a62WopBJHPtcDs8b"], "BZLCXLx8bbgorQeF": ["bQ1g7qbPngUNB1vR", "odwpzS6DaDpv8N7Z", "QVqGj6oDLjWjkY1a"], "XlFcDtgOjchIua5t": ["WEIC32ogW7olvbTg", "rhRTcPiSuL0Sly6X", "M4OI18mAQLnzjMf8"]}}' \
    > test.out 2>&1
eval_tap $? 6 'AdminPatchConfigV1' test.out

#- 7 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 7 'EnvironmentVariableList' test.out

#- 8 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "GZ2WBZqxYG3aREAu", "sessionId": "2D6QVKNCWP75TB0i"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateBackfill' test.out

#- 9 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID '7pKxR8dl0zRVW4EZ' \
    > test.out 2>&1
eval_tap $? 9 'GetBackfillProposal' test.out

#- 10 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'G9m0XcgGVbMqSszE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetBackfill' test.out

#- 11 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID '8GHavj7AorKsxwko' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteBackfill' test.out

#- 12 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'sAVerXpc1C8XfwHu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "Keb9l3rGN9A3sNm8", "stop": false}' \
    > test.out 2>&1
eval_tap $? 12 'AcceptBackfill' test.out

#- 13 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'hddSpHt0P7MIIR7C' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "kyF6C7duuyZ0GhDo", "stop": false}' \
    > test.out 2>&1
eval_tap $? 13 'RejectBackfill' test.out

#- 14 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 14 'MatchFunctionList' test.out

#- 15 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "xLzFQN05MYzYiKWe", "serviceAppName": "5dNRljv7IPrDQQRg", "url": "at0SevkLGMS0lyuI"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMatchFunction' test.out

#- 16 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name '9a2I9u6Vpbsx5w8h' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "qUI06UpOXGSLmCVu", "serviceAppName": "HOPlLlkvR8sKgnuR", "url": "kgghGoYupD391C2q"}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateMatchFunction' test.out

#- 17 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'tPYokahFjkQsfCaT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMatchFunction' test.out

#- 18 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '25' \
    --name 'f8TgoNm03VLisV6z' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 18 'MatchPoolList' test.out

#- 19 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 42, "backfill_ticket_expiration_seconds": 29, "crossplay_disabled": true, "match_function": "3td6TC6I3lMjGSWN", "match_function_override": {"backfill_matches": "2laRlxfcjHfYakUC", "enrichment": ["TqGkE7wcWfDslpJS", "qGAXQ0yYoNRKd3IL", "5TAQ6iiPlSC2uE4o"], "make_matches": "5Vwdo3fePqIJA8IH", "stat_codes": ["trkmu0hpDDWVAla2", "l5BYNtIuS5S5XUdj", "soqwGyzzWi9gwQYv"], "validation": ["7t1o7TTr1DmrhZv1", "5T7quIOvBMcaYmvC", "kGZ5dAgqxpBFmaLo"]}, "name": "xozr6wfNPX2bOItR", "platform_group_enabled": true, "rule_set": "u0M3VHh2EI8JlDbP", "session_template": "WbQ6Q9lNmqRBaAkL", "ticket_expiration_seconds": 28}' \
    > test.out 2>&1
eval_tap $? 19 'CreateMatchPool' test.out

#- 20 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool '3choQrpOsDBU5Sep' \
    > test.out 2>&1
eval_tap $? 20 'MatchPoolDetails' test.out

#- 21 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'jChB3V0v52Dlym6p' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 86, "backfill_ticket_expiration_seconds": 81, "crossplay_disabled": true, "match_function": "3xoJ8aeCnaLpUKp4", "match_function_override": {"backfill_matches": "4YUDjasWIPUvmEej", "enrichment": ["tGeoyIPa8ZRrvjj7", "il35MXbN9oCMNqq9", "8SjTvhZNkSQ70D0H"], "make_matches": "6BXksUC9b6i5lZC9", "stat_codes": ["xv32e8c5csSovoqs", "ZNBdte9NDUPVJf6c", "2Z0QZxfgPubTDIHr"], "validation": ["vqAThuwjRHpKKTlm", "Vr9XuoJbRFQSKVPH", "bn4Xxtu7LQRENjEE"]}, "platform_group_enabled": true, "rule_set": "6YE3p4lSck0ZHn5G", "session_template": "I39YBHqaTHeKtW18", "ticket_expiration_seconds": 18}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateMatchPool' test.out

#- 22 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'YReVHQipcCx9Zw5D' \
    > test.out 2>&1
eval_tap $? 22 'DeleteMatchPool' test.out

#- 23 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '2L7vIYhGGSyEW4ZJ' \
    > test.out 2>&1
eval_tap $? 23 'MatchPoolMetric' test.out

#- 24 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'J42d3PBddN8S48l9' \
    > test.out 2>&1
eval_tap $? 24 'GetPlayerMetric' test.out

#- 25 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'lyNApflxqMrj3oZk' \
    --limit '6' \
    --offset '77' \
    > test.out 2>&1
eval_tap $? 25 'AdminGetMatchPoolTickets' test.out

#- 26 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"QXcKMDYDDxHSZjtq": {}, "XyJ58f7Gc26SaiGV": {}, "kydwYWQG26yUZNmT": {}}, "latencies": {"BcvrbYCwZtxFHyPL": 39, "NrDjqoxcwgGLXpUL": 6, "pp2ncYAHdNzDmeIP": 13}, "matchPool": "rOvDz9KOsb392k6Y", "sessionID": "mJFfRByjlBiuFM3F"}' \
    > test.out 2>&1
eval_tap $? 26 'CreateMatchTicket' test.out

#- 27 GetMyMatchTickets
./ng net.accelbyte.sdk.cli.Main match2 getMyMatchTickets \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --matchPool 'oRS1X2PFAAMwzHPx' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 27 'GetMyMatchTickets' test.out

#- 28 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'g2SCnqntX9y1aZSW' \
    > test.out 2>&1
eval_tap $? 28 'MatchTicketDetails' test.out

#- 29 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'MiVi10sG6vxkfUcm' \
    > test.out 2>&1
eval_tap $? 29 'DeleteMatchTicket' test.out

#- 30 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '33' \
    --name '33T5UBJCjfcnLRfx' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 30 'RuleSetList' test.out

#- 31 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"nhhqElIaDml48wdN": {}, "FLTm5T50x9WT0GfH": {}, "2rtOa4EXsXzOXQAk": {}}, "enable_custom_match_function": false, "name": "mqrxzTtuLl4XlbGL"}' \
    > test.out 2>&1
eval_tap $? 31 'CreateRuleSet' test.out

#- 32 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset '8QOxtjzm8y2wNhmw' \
    > test.out 2>&1
eval_tap $? 32 'RuleSetDetails' test.out

#- 33 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'oYZyI4EFZKBcYrCE' \
    --body '{"data": {"AE7WIsfmx40NLRc6": {}, "m8heKnWhzfe2Nube": {}, "oKFeIaFQCYoDPICp": {}}, "enable_custom_match_function": false, "name": "gJjBbEDoNf3n0hEo"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateRuleSet' test.out

#- 34 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'RCAcf80zfFyabWAg' \
    > test.out 2>&1
eval_tap $? 34 'DeleteRuleSet' test.out

#- 35 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 35 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE