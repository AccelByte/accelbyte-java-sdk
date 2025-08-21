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
    --body '{"crossPlatformNoCurrentPlatform": false, "extraPlatforms": ["2WopBJHPtcDs8bBZ", "LCXLx8bbgorQeFbQ", "1g7qbPngUNB1vRod"], "matchAnyCommon": true, "platformGroup": {"ElFHHdgs21Jub74C": ["UkNmKJfh5pUkHODp", "oMF78NY4YkHs1cnz", "1JSDgY1TXp38zsCT"], "CrbCbPOyNQkT7Nvy": ["E3cwyALczNIicXm7", "agSrjJW2OQNOs1PX", "hT5FvdiRilZ7oFgx"], "4c8OumKtPDKJDXn7": ["Z4U68su8XfqlqNiT", "vB6SdAdIhUDrwoZ5", "MecdKi5r6QEa1ysL"]}}' \
    > test.out 2>&1
eval_tap $? 13 'AdminPatchConfigV1' test.out

#- 14 EnvironmentVariableList
./ng net.accelbyte.sdk.cli.Main match2 environmentVariableList \
    > test.out 2>&1
eval_tap $? 14 'EnvironmentVariableList' test.out

#- 15 AdminQueryBackfill
./ng net.accelbyte.sdk.cli.Main match2 adminQueryBackfill \
    --namespace "$AB_NAMESPACE" \
    --fromTime '1986-07-31T00:00:00Z' \
    --isActive  \
    --limit '23' \
    --matchPool 'th6mXhzkzWkFeZSo' \
    --offset '63' \
    --playerID 'pHt0P7MIIR7CkyF6' \
    --region 'C7duuyZ0GhDogqrh' \
    --sessionID 'BRd8lDR6qVNPRZYd' \
    --toTime '1987-12-24T00:00:00Z' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryBackfill' test.out

#- 16 CreateBackfill
./ng net.accelbyte.sdk.cli.Main match2 createBackfill \
    --namespace "$AB_NAMESPACE" \
    --body '{"matchPool": "LIAjGGJddVCvu9vx", "sessionId": "5KQ7KYnIuMBvaO35"}' \
    > test.out 2>&1
eval_tap $? 16 'CreateBackfill' test.out

#- 17 GetBackfillProposal
./ng net.accelbyte.sdk.cli.Main match2 getBackfillProposal \
    --namespace "$AB_NAMESPACE" \
    --sessionID 'llzQRaT5kPxUfofv' \
    > test.out 2>&1
eval_tap $? 17 'GetBackfillProposal' test.out

#- 18 GetBackfill
./ng net.accelbyte.sdk.cli.Main match2 getBackfill \
    --backfillID 'nnSuB0y5WUlrMdI4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetBackfill' test.out

#- 19 DeleteBackfill
./ng net.accelbyte.sdk.cli.Main match2 deleteBackfill \
    --backfillID 'sNveabntBSxTeIv5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 19 'DeleteBackfill' test.out

#- 20 AcceptBackfill
./ng net.accelbyte.sdk.cli.Main match2 acceptBackfill \
    --backfillID '3HGCiljvjKoyD6SC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"acceptedTicketIds": ["wGrncqmLtjQHAf8T", "goNm03VLisV6zwPu", "o3td6TC6I3lMjGSW"], "proposalId": "N2laRlxfcjHfYakU", "stop": true}' \
    > test.out 2>&1
eval_tap $? 20 'AcceptBackfill' test.out

#- 21 RejectBackfill
./ng net.accelbyte.sdk.cli.Main match2 rejectBackfill \
    --backfillID 'wL6IY69z1UaLqYSY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"proposalId": "WytLPziZMdjxcBZu", "stop": false}' \
    > test.out 2>&1
eval_tap $? 21 'RejectBackfill' test.out

#- 22 MatchFunctionList
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionList \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '93' \
    > test.out 2>&1
eval_tap $? 22 'MatchFunctionList' test.out

#- 23 CreateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 createMatchFunction \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "xGiHPllG4cYEzfTD", "serviceAppName": "1ZBm3MqHcUmLZZbS", "url": "qb8RwNmn9HrNQy4u"}' \
    > test.out 2>&1
eval_tap $? 23 'CreateMatchFunction' test.out

#- 24 MatchFunctionGet
./ng net.accelbyte.sdk.cli.Main match2 matchFunctionGet \
    --name 'ZAAiE0mit9RGCCHY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'MatchFunctionGet' test.out

#- 25 UpdateMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 updateMatchFunction \
    --name 'zUOcEdscKHPEqgA8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_function": "yu7Vk6Jt4Ymos9Jc", "serviceAppName": "dos4fYcTVU6RBt0z", "url": "YoMcHyCUEXlAvxJM"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateMatchFunction' test.out

#- 26 DeleteMatchFunction
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchFunction \
    --name 'dalwSyliWMNW5NyL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 26 'DeleteMatchFunction' test.out

#- 27 MatchPoolList
./ng net.accelbyte.sdk.cli.Main match2 matchPoolList \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --name 'qtlB2jJCSQT279ZZ' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 27 'MatchPoolList' test.out

#- 28 CreateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 createMatchPool \
    --namespace "$AB_NAMESPACE" \
    --body '{"auto_accept_backfill_proposal": false, "backfill_proposal_expiration_seconds": 86, "backfill_ticket_expiration_seconds": 66, "best_latency_calculation_method": "6Q9lNmqRBaAkLnvx", "crossplay_disabled": false, "match_function": "oQrpOsDBU5SepjCh", "match_function_override": {"backfill_matches": "B3V0v52Dlym6puQ2", "enrichment": ["3xoJ8aeCnaLpUKp4", "4YUDjasWIPUvmEej", "tGeoyIPa8ZRrvjj7"], "make_matches": "il35MXbN9oCMNqq9", "stat_codes": ["8SjTvhZNkSQ70D0H", "6BXksUC9b6i5lZC9", "xv32e8c5csSovoqs"], "validation": ["ZNBdte9NDUPVJf6c", "2Z0QZxfgPubTDIHr", "vqAThuwjRHpKKTlm"]}, "name": "Vr9XuoJbRFQSKVPH", "platform_group_enabled": false, "rule_set": "3g7mSQUhAEtrmjqU", "session_template": "6YE3p4lSck0ZHn5G", "ticket_expiration_seconds": 70}' \
    > test.out 2>&1
eval_tap $? 28 'CreateMatchPool' test.out

#- 29 MatchPoolDetails
./ng net.accelbyte.sdk.cli.Main match2 matchPoolDetails \
    --namespace "$AB_NAMESPACE" \
    --pool 'Jroav91GXlvPG6bF' \
    > test.out 2>&1
eval_tap $? 29 'MatchPoolDetails' test.out

#- 30 UpdateMatchPool
./ng net.accelbyte.sdk.cli.Main match2 updateMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'YReVHQipcCx9Zw5D' \
    --body '{"auto_accept_backfill_proposal": true, "backfill_proposal_expiration_seconds": 70, "backfill_ticket_expiration_seconds": 66, "best_latency_calculation_method": "YhGGSyEW4ZJJ42d3", "crossplay_disabled": false, "match_function": "BddN8S48l9lyNApf", "match_function_override": {"backfill_matches": "lxqMrj3oZk03QXcK", "enrichment": ["MDYDDxHSZjtqXyJ5", "8f7Gc26SaiGVkydw", "YWQG26yUZNmTBcvr"], "make_matches": "bYCwZtxFHyPLtI8i", "stat_codes": ["lbyDPUIj88cekdqC", "t81P1ktfIovmv9gs", "R5cJcHm3SZLxoRDF"], "validation": ["uuuySj29a9LJE8Ho", "RS1X2PFAAMwzHPxB", "1UskYs4Yw20DOqOB"]}, "platform_group_enabled": false, "rule_set": "C2DKHRuPMMWH8Yb3", "session_template": "3T5UBJCjfcnLRfxe", "ticket_expiration_seconds": 59}' \
    > test.out 2>&1
eval_tap $? 30 'UpdateMatchPool' test.out

#- 31 DeleteMatchPool
./ng net.accelbyte.sdk.cli.Main match2 deleteMatchPool \
    --namespace "$AB_NAMESPACE" \
    --pool 'hhqElIaDml48wdNF' \
    > test.out 2>&1
eval_tap $? 31 'DeleteMatchPool' test.out

#- 32 MatchPoolMetric
./ng net.accelbyte.sdk.cli.Main match2 matchPoolMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'LTm5T50x9WT0GfH2' \
    > test.out 2>&1
eval_tap $? 32 'MatchPoolMetric' test.out

#- 33 PostMatchErrorMetric
./ng net.accelbyte.sdk.cli.Main match2 postMatchErrorMetric \
    --namespace "$AB_NAMESPACE" \
    --pool 'rtOa4EXsXzOXQAk4' \
    --body '{"type": "connectDS"}' \
    > test.out 2>&1
eval_tap $? 33 'PostMatchErrorMetric' test.out

#- 34 GetPlayerMetric
./ng net.accelbyte.sdk.cli.Main match2 getPlayerMetric \
    --namespace "$AB_NAMESPACE" \
    --pool '3tIYt4SqYUTLDx9g' \
    > test.out 2>&1
eval_tap $? 34 'GetPlayerMetric' test.out

#- 35 AdminGetMatchPoolTickets
./ng net.accelbyte.sdk.cli.Main match2 adminGetMatchPoolTickets \
    --namespace "$AB_NAMESPACE" \
    --pool 'IiDandpGT2t24aOM' \
    --limit '16' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 35 'AdminGetMatchPoolTickets' test.out

#- 36 CreateMatchTicket
./ng net.accelbyte.sdk.cli.Main match2 createMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --body '{"attributes": {"yI4EFZKBcYrCEAE7": {}, "WIsfmx40NLRc6m8h": {}, "eKnWhzfe2NubeoKF": {}}, "excludedSessions": ["eIaFQCYoDPICpndu", "EEQlULdJz4mnRBkM", "NxvvKgAT8mJrYq6h"], "latencies": {"RkloqxM3gpwxcfMy": 61, "XzjjI5YbsKoADkzJ": 62, "13lk1dQBHO86IlBh": 27}, "matchPool": "CO39PXDNxtXgeO3F", "sessionID": "gkXhjDzaQY3snn2Z", "storage": {"kP7cFdP43e5dC9XI": {}, "BudfZgrbHDIDm4hM": {}, "zF4TxodenSrUTvfq": {}}}' \
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