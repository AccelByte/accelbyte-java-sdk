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
echo "1..29"

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
    --body '{"matchPool": "EAxcVpFrttufHIRd", "sessionId": "H9UzVRiXbqlAw7r6"}' \
    > test.out 2>&1
eval_tap $? 4 'CreateBackfill' test.out

#- 5 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'W2ktQG0h5JAav5kR' \
    > test.out 2>&1
eval_tap $? 5 'GetBackfillProposal' test.out

#- 6 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'a62WopBJHPtcDs8b' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetBackfill' test.out

#- 7 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'BZLCXLx8bbgorQeF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteBackfill' test.out

#- 8 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID 'bQ1g7qbPngUNB1vR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "odwpzS6DaDpv8N7Z", "stop": true}' \
    > test.out 2>&1
eval_tap $? 8 'AcceptBackfill' test.out

#- 9 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'qGj6oDLjWjkY1aXl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "FcDtgOjchIua5tWE", "stop": true}' \
    > test.out 2>&1
eval_tap $? 9 'RejectBackfill' test.out

#- 10 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '72' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 10 'MatchFunctionList' test.out

#- 11 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "2ogW7olvbTgrhRTc", "serviceAppName": "PiSuL0Sly6XM4OI1", "url": "8mAQLnzjMf8GZ2WB"}' \
    > test.out 2>&1
eval_tap $? 11 'CreateMatchFunction' test.out

#- 12 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'ZqxYG3aREAu2D6QV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "KNCWP75TB0i7pKxR", "serviceAppName": "8dl0zRVW4EZG9m0X", "url": "cgGVbMqSszE8GHav"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateMatchFunction' test.out

#- 13 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'j7AorKsxwkosAVer' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 13 'DeleteMatchFunction' test.out

#- 14 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --name 'pc1C8XfwHuKeb9l3' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 14 'MatchPoolList' test.out

#- 15 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 81, "backfill_ticket_expiration_seconds": 16, "match_function": "A3sNm84hddSpHt0P", "match_function_override": {"backfill_matches": "7MIIR7CkyF6C7duu", "enrichment": ["yZ0GhDogqrhBRd8l", "DR6qVNPRZYdFLIAj", "GGJddVCvu9vx5KQ7"], "make_matches": "KYnIuMBvaO35llzQ", "stat_codes": ["RaT5kPxUfofvnnSu", "B0y5WUlrMdI4sNve", "abntBSxTeIv53HGC"], "validation": ["iljvjKoyD6SCwGrn", "cqmLtjQHAf8TgoNm", "03VLisV6zwPuo3td"]}, "name": "6TC6I3lMjGSWN2la", "rule_set": "RlxfcjHfYakUCTqG", "session_template": "kE7wcWfDslpJSqGA", "ticket_expiration_seconds": 85}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMatchPool' test.out

#- 16 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'Q0yYoNRKd3IL5TAQ' \
    > test.out 2>&1
eval_tap $? 16 'MatchPoolDetails' test.out

#- 17 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool '6iiPlSC2uE4o5Vwd' \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 24, "backfill_ticket_expiration_seconds": 12, "match_function": "MqHcUmLZZbSqb8Rw", "match_function_override": {"backfill_matches": "Nmn9HrNQy4uZAAiE", "enrichment": ["0mit9RGCCHYzUOcE", "dscKHPEqgA8yu7Vk", "6Jt4Ymos9Jcdos4f"], "make_matches": "YcTVU6RBt0zYoMcH", "stat_codes": ["yCUEXlAvxJMdalwS", "yliWMNW5NyLu0M3V", "Hh2EI8JlDbPWbQ6Q"], "validation": ["9lNmqRBaAkLnvxkT", "1X68cmDc3fxU8MyK", "rQpM4hkkK6KKXNB3"]}, "rule_set": "Gv0IqmF51TkhjYna", "session_template": "q6foWvXa3bMrXsDr", "ticket_expiration_seconds": 8}' \
    > test.out 2>&1
eval_tap $? 17 'UpdateMatchPool' test.out

#- 18 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'kILsSSyDdmykmoPY' \
    > test.out 2>&1
eval_tap $? 18 'DeleteMatchPool' test.out

#- 19 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'gc2L4jk4Lo0LSP0p' \
    > test.out 2>&1
eval_tap $? 19 'MatchPoolMetric' test.out

#- 20 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'f4IxjUkl535X3ate' \
    > test.out 2>&1
eval_tap $? 20 'GetPlayerMetric' test.out

#- 21 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"EKDpADz1x3poD3Qg": {}, "b3boLQQ1MzH7Qm8b": {}, "wbmXgdAPh1EThG96": {}}, "latencies": {"gAFKK2WDgCcxvONZ": 25, "ThuwjRHpKKTlmVr9": 42, "6pf3vneSD2Tb3g7m": 92}, "matchPool": "tu7LQRENjEEztx1W", "sessionID": "sYSiZqan0nSBJroa"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateMatchTicket' test.out

#- 22 MatchTicketDetails
./ng net.accelbyte.sdk.cli.Main match2 matchTicketDetails \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'v91GXlvPG6bFYReV' \
    > test.out 2>&1
eval_tap $? 22 'MatchTicketDetails' test.out

#- 23 DeleteMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketid 'HQipcCx9Zw5D2L7v' \
    > test.out 2>&1
eval_tap $? 23 'DeleteMatchTicket' test.out

#- 24 RuleSetList
./ng net.accelbyte.sdk.cli.Main match2 ruleSetList \
    --namespace "$AB_NAMESPACE" \
    --limit '70' \
    --name 'GqVvUfHQvsHXNUNe' \
    --offset '85' \
    > test.out 2>&1
eval_tap $? 24 'RuleSetList' test.out

#- 25 CreateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 createRuleSet \
    --namespace "$AB_NAMESPACE" \
    --body '{"data": {"mhgo5QB65lSAiYnN": {}, "jkfZrQvGgbLdLsFz": {}, "HkBMr1yrOMlNFSrU": {}}, "enable_custom_match_function": true, "name": "8f7Gc26SaiGVkydw"}' \
    > test.out 2>&1
eval_tap $? 25 'CreateRuleSet' test.out

#- 26 RuleSetDetails
./ng net.accelbyte.sdk.cli.Main match2 ruleSetDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'YWQG26yUZNmTBcvr' \
    > test.out 2>&1
eval_tap $? 26 'RuleSetDetails' test.out

#- 27 UpdateRuleSet
./ng net.accelbyte.sdk.cli.Main match2 updateRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'bYCwZtxFHyPLtI8i' \
    --body '{"data": {"lbyDPUIj88cekdqC": {}, "t81P1ktfIovmv9gs": {}, "R5cJcHm3SZLxoRDF": {}}, "enable_custom_match_function": true, "name": "FfRByjlBiuFM3FIo"}' \
    > test.out 2>&1
eval_tap $? 27 'UpdateRuleSet' test.out

#- 28 DeleteRuleSet
./ng net.accelbyte.sdk.cli.Main match2 deleteRuleSet \
    --namespace "$AB_NAMESPACE" \
    --ruleset 'Vk8T3GpAnkCmBUqg' \
    > test.out 2>&1
eval_tap $? 28 'DeleteRuleSet' test.out

#- 29 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main match2 versionCheckHandler \
    > test.out 2>&1
eval_tap $? 29 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE