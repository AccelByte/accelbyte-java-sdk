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
./ng net.accelbyte.sdk.cli.Main sessionhistory getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main sessionhistory getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 AdminGetEnvConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetEnvConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetEnvConfig' test.out

#- 5 AdminPatchUpdateEnvConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminPatchUpdateEnvConfig \
    --body '{"SESSION_DELETION_GRACE_PERIOD": 62}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateEnvConfig' test.out

#- 6 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 6 'AdminGetLogConfig' test.out

#- 7 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminPatchUpdateLogConfig \
    --body '{"logLevel": "fatal"}' \
    > test.out 2>&1
eval_tap $? 7 'AdminPatchUpdateLogConfig' test.out

#- 8 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --completedOnly 'AxcVpFrttufHIRdH' \
    --configurationName '9UzVRiXbqlAw7r6W' \
    --dsPodName '2ktQG0h5JAav5kRa' \
    --endDate '62WopBJHPtcDs8bB' \
    --gameSessionID 'ZLCXLx8bbgorQeFb' \
    --isPersistent 'Q1g7qbPngUNB1vRo' \
    --joinability 'dwpzS6DaDpv8N7ZQ' \
    --limit '98' \
    --matchPool 'CUkNmKJfh5pUkHOD' \
    --offset '32' \
    --order 'FcDtgOjchIua5tWE' \
    --orderBy 'IC32ogW7olvbTgrh' \
    --startDate 'RTcPiSuL0Sly6XM4' \
    --statusV2 'OI18mAQLnzjMf8GZ' \
    --userID '2WBZqxYG3aREAu2D' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryGameSessionDetail' test.out

#- 9 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId '6QVKNCWP75TB0i7p' \
    > test.out 2>&1
eval_tap $? 9 'GetGameSessionDetail' test.out

#- 10 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'KxR8dl0zRVW4EZG9' \
    --limit '25' \
    --offset '96' \
    --order 'cgGVbMqSszE8GHav' \
    --orderBy 'j7AorKsxwkosAVer' \
    --ticketID 'Xpc1C8XfwHuKeb9l' \
    --userID '3rGN9A3sNm84hddS' \
    > test.out 2>&1
eval_tap $? 10 'AdminQueryMatchmakingDetail' test.out

#- 11 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'pHt0P7MIIR7CkyF6' \
    > test.out 2>&1
eval_tap $? 11 'AdminGetMatchmakingDetailBySessionID' test.out

#- 12 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'C7duuyZ0GhDogqrh' \
    > test.out 2>&1
eval_tap $? 12 'AdminGetMatchmakingDetailByTicketID' test.out

#- 13 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'BRd8lDR6qVNPRZYd' \
    --joinability 'FLIAjGGJddVCvu9v' \
    --leaderID 'x5KQ7KYnIuMBvaO3' \
    --limit '71' \
    --offset '23' \
    --order '9u6Vpbsx5w8hqUI0' \
    --orderBy '6UpOXGSLmCVuHOPl' \
    --partyID 'LlkvR8sKgnuRkggh' \
    --startDate 'GoYupD391C2qtPYo' \
    --userID 'kahFjkQsfCaTmt1d' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryPartyDetail' test.out

#- 14 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId '67FXGk2s9Q0mPVo3' \
    > test.out 2>&1
eval_tap $? 14 'GetPartyDetail' test.out

#- 15 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'twu0MesTCf9x4rt6' \
    --gameMode '9lna7qxNeIxPz6Mb' \
    --limit '46' \
    --offset '94' \
    --order 'L6IY69z1UaLqYSYW' \
    --partyID 'ytLPziZMdjxcBZuf' \
    --region 'QxGiHPllG4cYEzfT' \
    --startDate 'D1ZBm3MqHcUmLZZb' \
    --userIDs 'Sqb8RwNmn9HrNQy4' \
    > test.out 2>&1
eval_tap $? 15 'AdminQueryTicketDetail' test.out

#- 16 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'uZAAiE0mit9RGCCH' \
    > test.out 2>&1
eval_tap $? 16 'AdminTicketDetailGetByTicketID' test.out

#- 17 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '52' \
    --order 'qwGyzzWi9gwQYv7t' \
    > test.out 2>&1
eval_tap $? 17 'PublicQueryGameSessionMe' test.out

#- 18 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName '1o7TTr1DmrhZv15T,7quIOvBMcaYmvCkG,Z5dAgqxpBFmaLoxo' \
    --endDate 'zr6wfNPX2bOItRMv' \
    --startDate 'qtlB2jJCSQT279ZZ' \
    > test.out 2>&1
eval_tap $? 18 'QueryXrayMatchPool' test.out

#- 19 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'PYGu0rdlgdWyOtXi' \
    --poolName '3choQrpOsDBU5Sep' \
    --all  \
    --limit '19' \
    --offset '59' \
    --endDate 'MyKrQpM4hkkK6KKX' \
    --startDate 'NB3Gv0IqmF51Tkhj' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPool' test.out

#- 20 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'Ynaq6foWvXa3bMrX' \
    --poolName 'sDr6kILsSSyDdmyk' \
    --tickId 'moPYgc2L4jk4Lo0L' \
    > test.out 2>&1
eval_tap $? 20 'QueryDetailTickMatchPoolMatches' test.out

#- 21 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'SP0pf4IxjUkl535X' \
    --poolName '3ateEKDpADz1x3po' \
    --tickId 'D3Qgb3boLQQ1MzH7' \
    > test.out 2>&1
eval_tap $? 21 'QueryDetailTickMatchPoolTicket' test.out

#- 22 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'Qm8bwbmXgdAPh1ET' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 22 'QueryMatchHistories' test.out

#- 23 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'G96gAFKK2WDgCcxv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'QueryMatchTicketHistories' test.out

#- 24 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'ONZm3EeERmDnyeFo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'QueryXrayMatch' test.out

#- 25 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'F7VSZ6pf3vneSD2T,b3g7mSQUhAEtrmjq,U6YE3p4lSck0ZHn5' \
    --endDate 'GI39YBHqaTHeKtW1' \
    --startDate '8iGeUlc9d9sogWa2' \
    > test.out 2>&1
eval_tap $? 25 'QueryAcquiringDS' test.out

#- 26 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool '4CKNS0GqVvUfHQvs,HXNUNe4mhgo5QB65,lSAiYnNjkfZrQvGg' \
    --endDate 'bLdLsFzHkBMr1yrO' \
    --startDate 'MlNFSrUEirnjX9fD' \
    > test.out 2>&1
eval_tap $? 26 'QueryAcquiringDSWaitTimeAvg' test.out

#- 27 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'mIbeZxzfTcyiuATu,s9hsfpFDcSDG8aMV,GLiBNrDjqoxcwgGL' \
    --endDate 'XpUL4pp2ncYAHdNz' \
    --startDate 'DmeIP6rOvDz9KOsb' \
    > test.out 2>&1
eval_tap $? 27 'QueryMatchLengthDurationpAvg' test.out

#- 28 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool '392k6YmJFfRByjlB,iuFM3FIoVk8T3GpA,nkCmBUqg2SCnqntX' \
    --endDate '9y1aZSWMiVi10sG6' \
    --startDate 'vxkfUcmqRRbceJ5i' \
    > test.out 2>&1
eval_tap $? 28 'QueryMatchLengthDurationp99' test.out

#- 29 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool '0EeDxOgBnhhqElIa,Dml48wdNFLTm5T50,x9WT0GfH2rtOa4EX' \
    --region 'sXzOXQAk4mqrxzTt' \
    --endDate 'uLl4XlbGL8QOxtjz' \
    --startDate 'm8y2wNhmwoYZyI4E' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalActiveSession' test.out

#- 30 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'FZKBcYrCEAE7WIsf,mx40NLRc6m8heKnW,hzfe2NubeoKFeIaF' \
    --endDate 'QCYoDPICpnduEEQl' \
    --startDate 'ULdJz4mnRBkMNxvv' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingMatch' test.out

#- 31 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'KgAT8mJrYq6hRklo,qxM3gpwxcfMy9Xzj,jI5YbsKoADkzJEN2' \
    --endDate 'VHzih3bit0VWn3CO' \
    --startDate '39PXDNxtXgeO3Fgk' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalPlayerPersession' test.out

#- 32 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'XhjDzaQY3snn2ZkP,7cFdP43e5dC9XIBu,dfZgrbHDIDm4hMzF' \
    --endDate '4TxodenSrUTvfqU0' \
    --startDate 'bfoMm5cTtFWbotQy' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingCanceled' test.out

#- 33 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'XJRcQWsmqPNs92ep,xk0i8VxsZNereSvf,9699mCEHThUJkETA' \
    --endDate 'sSp7gh4TeUTkOkAY' \
    --startDate 'fJB8AT9t4Tv207Y2' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingCreated' test.out

#- 34 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'QD3oD5fLCr3OOlXV,v8ZGF7uYnGzpipND,igNJma1MbqqZtfNW' \
    --endDate 'ql4nmwAft4gqkNNl' \
    --startDate 'WkD9eOziYRFOn0jJ' \
    > test.out 2>&1
eval_tap $? 34 'QueryTotalMatchmakingExpired' test.out

#- 35 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'LHC9LxhvNXTwGBCt,ohLtl9Zuhytm5UDr,T6QXCs5SPBbRPZTF' \
    --endDate '6oQAXVG7tnsZg5Qg' \
    --startDate 'XjvyGJPN4eXbJE5V' \
    > test.out 2>&1
eval_tap $? 35 'QueryTotalMatchmakingMatchTicket' test.out

#- 36 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "s2GcyomQoIXimBJe", "activeAllianceRule": {"max_number": 16, "min_number": 89, "player_max_number": 50, "player_min_number": 8}, "activeMatchingRule": [{"attribute": "xlNsjUgxBkF6wFPo", "criteria": "JeQediogEhhM2rIi", "reference": 0.40395239514169357}, {"attribute": "GdKvOPdq5xrgxSmy", "criteria": "1DN9LFkYW5DQyj4b", "reference": 0.1493656822084305}, {"attribute": "5Ro2ogaKt2ujQSa3", "criteria": "Zdb65UXmy0Zp6iIa", "reference": 0.7392205531063033}], "function": "IKUkmkk9QM0NBMA9", "gameMode": "ORxpzwLR2AK6eXUG", "isBackfillMatch": true, "isRuleSetFlexed": true, "iteration": 97, "matchID": "fiP80G9Pclxcft2u", "namespace": "lIJzPyrVEiOG4Ucq", "remainingPlayersPerTicket": [38, 37, 43], "remainingTickets": 43, "sessionTickID": "GKHhMRWLVd3DlhLu", "tickID": 71, "ticketID": "bD3SGEdlwuUccE53", "timeToMatchSec": 0.9414515817028006, "timestamp": "1981-10-15T00:00:00Z", "unbackfillReason": "gBp3HBvepnDCjgyJ", "unmatchReason": "lXe36mgWjLfFmteu"}' \
    > test.out 2>&1
eval_tap $? 36 'CreateXrayTicketObservability' test.out

#- 37 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "e9nzJ6fH24T805tV", "activeAllianceRule": {"max_number": 13, "min_number": 70, "player_max_number": 73, "player_min_number": 33}, "activeMatchingRule": [{"attribute": "TVqJdvzcWbfUpaXp", "criteria": "5JMl5LL4bTxBmZjd", "reference": 0.2776647072160817}, {"attribute": "rIxsB0NRsB1fPqqR", "criteria": "RulpqpymDkQhtrHW", "reference": 0.36366076869943065}, {"attribute": "RVnwVBOqOHi8pWGd", "criteria": "1juYhiqjRJOqB5F9", "reference": 0.895560908662702}], "function": "zFQbJndUDpdONneA", "gameMode": "czbBdHb2slt71B1S", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 23, "matchID": "p2JZp50CnPb71ORY", "namespace": "cmQbTU5JX8ccLjMX", "remainingPlayersPerTicket": [73, 93, 90], "remainingTickets": 33, "sessionTickID": "k0eaKQDOJvrTefgl", "tickID": 92, "ticketID": "ONk2Q5Y4Jvaizwii", "timeToMatchSec": 0.18125967736248882, "timestamp": "1971-03-29T00:00:00Z", "unbackfillReason": "tuUjjt9lIMGql5El", "unmatchReason": "Ea9EIIlGcHB3CfR3"}, {"action": "ncDlwi3v3MFFJ1Ke", "activeAllianceRule": {"max_number": 38, "min_number": 10, "player_max_number": 74, "player_min_number": 4}, "activeMatchingRule": [{"attribute": "oELCpobBEG8X645x", "criteria": "pdXpai0rYaT5hOPj", "reference": 0.013867891931379828}, {"attribute": "f3H0tYighU0VUfcY", "criteria": "HJbBfAKSiPW3VgsZ", "reference": 0.7909634144891622}, {"attribute": "iR1DJ7HVWqMkNSaw", "criteria": "QUWDFJvJBWic7UkB", "reference": 0.07060214629850892}], "function": "IXuqDuAXI66bQ71w", "gameMode": "0deoV9Lx5RDA1l2X", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 35, "matchID": "CancUZGCHsZYoLfR", "namespace": "1KtOv7Zy0b65uvuK", "remainingPlayersPerTicket": [81, 19, 41], "remainingTickets": 65, "sessionTickID": "y0ytZQ7M6Nzy1adn", "tickID": 91, "ticketID": "6QkmZXElW9YfRSse", "timeToMatchSec": 0.9458080921466427, "timestamp": "1984-08-28T00:00:00Z", "unbackfillReason": "Az3S4czz0QKFlAVm", "unmatchReason": "VLu4AOec0z8eBeeo"}, {"action": "ip68J1nsv4W2OJht", "activeAllianceRule": {"max_number": 0, "min_number": 11, "player_max_number": 47, "player_min_number": 71}, "activeMatchingRule": [{"attribute": "MSJlHeb34sZKHcl5", "criteria": "LLLOexL4fZvWtND2", "reference": 0.31569708491266013}, {"attribute": "cBFpX8lNtFEJ7tnk", "criteria": "Y6Mca5afj12K2Izr", "reference": 0.4369555858609173}, {"attribute": "vvWm4udE0OXudXgN", "criteria": "ne8kJATwlc6esUp6", "reference": 0.7143368791302254}], "function": "w1I98jeZQ7hfxnhL", "gameMode": "d3Knaknoed9DHhLO", "isBackfillMatch": true, "isRuleSetFlexed": false, "iteration": 15, "matchID": "NnN7kAa7j0riFc5H", "namespace": "THQIoVsGo7dwV9DB", "remainingPlayersPerTicket": [33, 8, 64], "remainingTickets": 78, "sessionTickID": "KHQkETJyTlUrwDTn", "tickID": 30, "ticketID": "DcagginxnFIna3yd", "timeToMatchSec": 0.06415297836781786, "timestamp": "1972-04-29T00:00:00Z", "unbackfillReason": "bsPheTH26IUJNvYu", "unmatchReason": "GRUvpZaHCuESOiIZ"}]}' \
    > test.out 2>&1
eval_tap $? 37 'CreateXrayBulkTicketObservability' test.out

#- 38 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'sMfB4ZH3mtgWgU4p' \
    --limit '58' \
    --offset '54' \
    --endDate 'TIIJM9XsYIIZxiXN' \
    --startDate 'MR9BgaWcFX3SUBhy' \
    > test.out 2>&1
eval_tap $? 38 'QueryXrayTimelineByTicketID' test.out

#- 39 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'oTsMWPAxUMkawaGp' \
    --limit '54' \
    --offset '62' \
    --order 'yrIwMif3BOdkocVT' \
    --orderBy 'd4BxqGWV6mTJ0sQs' \
    --endDate '6XNbjvqhnUVLWu8o' \
    --startDate 'lKdxL6ozRmDD0jJv' \
    > test.out 2>&1
eval_tap $? 39 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE