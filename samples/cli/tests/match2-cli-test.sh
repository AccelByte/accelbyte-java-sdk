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
    --body '{"matchPool": "6HPvTmAh", "sessionId": "u2arWDYh"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateBackfill' test.out

#- 5 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'f8cptedG' \
    > test.out 2>&1
eval_tap $? 5 'GetBackfillProposal' test.out

#- 6 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'vSnYSvw3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetBackfill' test.out

#- 7 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID '0zZrOCFf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteBackfill' test.out

#- 8 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID '7cXaog29' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "MJly11q5", "stop": false}' \
    > test.out 2>&1
eval_tap $? 8 'AcceptBackfill' test.out

#- 9 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'ykCs2CE4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "S5ICensL", "stop": false}' \
    > test.out 2>&1
eval_tap $? 9 'RejectBackfill' test.out

#- 10 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 10 'MatchFunctionList' test.out

#- 11 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "t9Mx1aN5", "url": "WKNxjr41"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateMatchFunction' test.out

#- 12 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 's4mvxdLM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteMatchFunction' test.out

#- 13 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '64' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 13 'MatchPoolList' test.out

#- 14 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 70, "backfill_ticket_expiration_seconds": 67, "match_function": "r5q2kyGz", "match_function_override": {"backfill_matches": "OFKXbzR2", "hydration": ["Mg2Iw1W7", "DE0a10R3", "z92B2CQm"], "make_matches": "ZvN8tH61", "stat_codes": ["PAX42ONR", "0or8Ocvj", "V5V5plX5"], "validation": ["2EVARK8g", "Mi5UJPGx", "1gQzwROz"]}, "name": "X2Xp5yIN", "rule_set": "53PtgOgL", "session_template": "CkepISqy", "ticket_expiration_seconds": 73}' \
    > test.out 2>&1
eval_tap $? 14 'CreateMatchPool' test.out

#- 15 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'gwOTHO13' \
    > test.out 2>&1
eval_tap $? 15 'MatchPoolDetails' test.out

#- 16 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'IxSlCevu' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 94, "backfill_ticket_expiration_seconds": 84, "match_function": "JHLwMdvV", "match_function_override": {"backfill_matches": "E8kdIQuW", "hydration": ["17EAK3lV", "pHGyMG1n", "7tbyJdyr"], "make_matches": "0Hl1Oigr", "stat_codes": ["dljVpxuy", "p0l38Sfh", "gL5n1tix"], "validation": ["j16hKauh", "yxvlu8Cv", "38N9DIa0"]}, "rule_set": "UPc2yXmN", "session_template": "udL4ydqP", "ticket_expiration_seconds": 28}' \
    > test.out 2>&1
eval_tap $? 16 'UpdateMatchPool' test.out

#- 17 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '9q6Qspqa' \
    > test.out 2>&1
eval_tap $? 17 'DeleteMatchPool' test.out

#- 18 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"Hb7m4NJ6": {}, "KbyoKIW4": {}, "v2mLbV0L": {}}, "latencies": {"D80E662u": 31, "yhQypMxM": 61, "xye7HzYL": 0}, "matchPool": "ANO9wcoX", "sessionID": "W5plSFIP"}' \
    > test.out 2>&1
eval_tap $? 18 'CreateMatchTicket' test.out

#- 19 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid '6QG27dhC' \
    > test.out 2>&1
eval_tap $? 19 'MatchTicketDetails' test.out

#- 20 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'jbJ5vr3J' \
    > test.out 2>&1
eval_tap $? 20 'DeleteMatchTicket' test.out

#- 21 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 21 'RuleSetList' test.out

#- 22 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"uLYvswhL": {}, "nvAzM4gm": {}, "LSUI41FY": {}}, "enable_custom_match_function": true, "name": "eOxLSkh2"}' \
    > test.out 2>&1
eval_tap $? 22 'CreateRuleSet' test.out

#- 23 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 't2rIO2Ul' \
    > test.out 2>&1
eval_tap $? 23 'RuleSetDetails' test.out

#- 24 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'iuEhaSSu' \
    --body '{"data": {"WzgjGr4i": {}, "K8IJQJOJ": {}, "PMuOYqny": {}}, "enable_custom_match_function": true, "name": "Hznr3mUw"}' \
    > test.out 2>&1
eval_tap $? 24 'UpdateRuleSet' test.out

#- 25 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'ipDkLIyP' \
    > test.out 2>&1
eval_tap $? 25 'DeleteRuleSet' test.out

#- 26 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 26 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE