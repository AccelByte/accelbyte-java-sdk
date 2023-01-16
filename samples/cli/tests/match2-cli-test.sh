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
echo "1..23"

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
    --body '{"matchPool": "VgnkQAhc", "sessionId": "c6dQlYmh"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateBackfill' test.out

#- 5 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'afBcnnkN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "LUW42HhO", "stop": false}' \
    > test.out 2>&1
eval_tap $? 5 'AcceptBackfill' test.out

#- 6 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'JbsGkVrQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "nhxKPlXP", "stop": true}' \
    > test.out 2>&1
eval_tap $? 6 'RejectBackfill' test.out

#- 7 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '35' \
    --offset '57' \
    > test.out 2>&1
eval_tap $? 7 'MatchFunctionList' test.out

#- 8 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "YWfFWpmB", "url": "Roh2Jm0G"}' \
    > test.out 2>&1
eval_tap $? 8 'CreateMatchFunction' test.out

#- 9 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'fuxTwU3Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteMatchFunction' test.out

#- 10 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '48' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 10 'MatchPoolList' test.out

#- 11 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"backfill_ticket_expiration_seconds": 9, "match_function": "oTz0SOyM", "match_function_override": {"backfill_matches": "8m7sIiCn", "hydration": ["EZrnp1Vd", "0cKxlCKE", "1CCCaJvb"], "make_matches": "efhdE3Es", "stat_codes": ["rYP12IRV", "pEPAAQlJ", "xlN8TY70"], "validation": ["EgQtYJsb", "3zML3JO6", "BJoohoFD"]}, "name": "veeVOwFB", "rule_set": "f9cDS984", "session_template": "ok9iTkTz", "ticket_expiration_seconds": 84}' \
    > test.out 2>&1
eval_tap $? 11 'CreateMatchPool' test.out

#- 12 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'KM2chlOJ' \
    > test.out 2>&1
eval_tap $? 12 'MatchPoolDetails' test.out

#- 13 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'drJKfAub' \
    --body '{"backfill_ticket_expiration_seconds": 20, "match_function": "WpWgl9XD", "match_function_override": {"backfill_matches": "f7qnBKbr", "hydration": ["AbTKkgx6", "5jb2ZLnP", "aduRRXgp"], "make_matches": "zrsxWCNB", "stat_codes": ["Df35hnpx", "zbhEitf5", "B1fVh5dn"], "validation": ["CKuLWCs5", "vCR5k5tE", "BlaWqPYA"]}, "rule_set": "QL1644WN", "session_template": "p15fxBXM", "ticket_expiration_seconds": 28}' \
    > test.out 2>&1
eval_tap $? 13 'UpdateMatchPool' test.out

#- 14 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'ny6kiiF1' \
    > test.out 2>&1
eval_tap $? 14 'DeleteMatchPool' test.out

#- 15 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"02lbXmJp": {}, "gPRTuQgV": {}, "gd60Kf7u": {}}, "latencies": {"pDFJMNAA": 74, "5uwYBe63": 97, "pKmjAW6a": 80}, "matchPool": "VcnjzlTc", "sessionID": "G644eb2P"}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMatchTicket' test.out

#- 16 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'D5IkxTp9' \
    > test.out 2>&1
eval_tap $? 16 'MatchTicketDetails' test.out

#- 17 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'lNkg4BDZ' \
    > test.out 2>&1
eval_tap $? 17 'DeleteMatchTicket' test.out

#- 18 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '56' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 18 'RuleSetList' test.out

#- 19 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": "V6LnHtsH", "name": "5vh4XHrV"}' \
    > test.out 2>&1
eval_tap $? 19 'CreateRuleSet' test.out

#- 20 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'u47CFV2b' \
    > test.out 2>&1
eval_tap $? 20 'RuleSetDetails' test.out

#- 21 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset '2g0vDEhG' \
    --body '{"data": "8gezCeM3"}' \
    > test.out 2>&1
eval_tap $? 21 'UpdateRuleSet' test.out

#- 22 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'lVAaB6Pg' \
    > test.out 2>&1
eval_tap $? 22 'DeleteRuleSet' test.out

#- 23 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 23 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE