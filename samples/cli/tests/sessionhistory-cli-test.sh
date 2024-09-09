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
./ng net.accelbyte.sdk.cli.Main sessionhistory getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 GetHealthcheckInfoV1
./ng net.accelbyte.sdk.cli.Main sessionhistory getHealthcheckInfoV1 \
    > test.out 2>&1
eval_tap $? 3 'GetHealthcheckInfoV1' test.out

#- 4 AdminGetLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetLogConfig \
    > test.out 2>&1
eval_tap $? 4 'AdminGetLogConfig' test.out

#- 5 AdminPatchUpdateLogConfig
./ng net.accelbyte.sdk.cli.Main sessionhistory adminPatchUpdateLogConfig \
    --body '{"logLevel": "info"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminPatchUpdateLogConfig' test.out

#- 6 AdminQueryGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'twYCA9kPI6LZrkq6' \
    --gameSessionID 'Dc09nIW0Oaiw9B0D' \
    --limit '9' \
    --offset '20' \
    --order 'HpzSn3ZPUdc0qh4n' \
    --orderBy '8mzZ0m8SAMTwE6I5' \
    --startDate '6IaRDBXxyaNoMR6h' \
    --userID 'kspInrAip6lyzSxw' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'ElFHHdgs21Jub74C' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID 'UkNmKJfh5pUkHODp' \
    --limit '29' \
    --offset '6' \
    --order 'MF78NY4YkHs1cnz1' \
    --orderBy 'JSDgY1TXp38zsCTC' \
    --ticketID 'rbCbPOyNQkT7NvyE' \
    --userID '3cwyALczNIicXm7a' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'gSrjJW2OQNOs1PXh' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'T5FvdiRilZ7oFgx4' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '90' \
    --order '8OumKtPDKJDXn7Z4' \
    --orderBy 'U68su8XfqlqNiTvB' \
    --partyID '6SdAdIhUDrwoZ5Me' \
    --userID 'cdKi5r6QEa1ysLEz' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'th6mXhzkzWkFeZSo' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'EAcBdW19m4eu6d5t' \
    --gameMode 'A5jUmiTqpyhPFdxL' \
    --limit '51' \
    --offset '55' \
    --order 'FQN05MYzYiKWe5dN' \
    --partyID 'Rljv7IPrDQQRgat0' \
    --region 'SevkLGMS0lyuI9a2' \
    --startDate 'I9u6Vpbsx5w8hqUI' \
    --userIDs '06UpOXGSLmCVuHOP' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'lLlkvR8sKgnuRkgg' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 PublicQueryGameSessionMe
./ng net.accelbyte.sdk.cli.Main sessionhistory publicQueryGameSessionMe \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '67' \
    --order 'HGCiljvjKoyD6SCw' \
    > test.out 2>&1
eval_tap $? 15 'PublicQueryGameSessionMe' test.out

#- 16 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'GrncqmLtjQHAf8Tg,oNm03VLisV6zwPuo,3td6TC6I3lMjGSWN' \
    --endDate '2laRlxfcjHfYakUC' \
    --startDate 'TqGkE7wcWfDslpJS' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'qGAXQ0yYoNRKd3IL' \
    --poolName '5TAQ6iiPlSC2uE4o' \
    --all  \
    --limit '61' \
    --offset '97' \
    --endDate '1ZBm3MqHcUmLZZbS' \
    --startDate 'qb8RwNmn9HrNQy4u' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'ZAAiE0mit9RGCCHY' \
    --poolName 'zUOcEdscKHPEqgA8' \
    --tickId 'yu7Vk6Jt4Ymos9Jc' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'dos4fYcTVU6RBt0z' \
    --poolName 'YoMcHyCUEXlAvxJM' \
    --tickId 'dalwSyliWMNW5NyL' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'u0M3VHh2EI8JlDbP' \
    --namespace "$AB_NAMESPACE" \
    --limit '99' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'bQ6Q9lNmqRBaAkLn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'vxkT1X68cmDc3fxU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --matchPool '8MyKrQpM4hkkK6KK,XNB3Gv0IqmF51Tkh,jYnaq6foWvXa3bMr' \
    --endDate 'XsDr6kILsSSyDdmy' \
    --startDate 'kmoPYgc2L4jk4Lo0' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'LSP0pf4IxjUkl535,X3ateEKDpADz1x3p,oD3Qgb3boLQQ1MzH' \
    --endDate '7Qm8bwbmXgdAPh1E' \
    --startDate 'ThG96gAFKK2WDgCc' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'xvONZm3EeERmDnye,FoF7VSZ6pf3vneSD,2Tb3g7mSQUhAEtrm' \
    --endDate 'jqU6YE3p4lSck0ZH' \
    --startDate 'n5GI39YBHqaTHeKt' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'W18iGeUlc9d9sogW,a24CKNS0GqVvUfHQ,vsHXNUNe4mhgo5QB' \
    --endDate '65lSAiYnNjkfZrQv' \
    --startDate 'GgbLdLsFzHkBMr1y' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'rOMlNFSrUEirnjX9,fDmIbeZxzfTcyiuA,Tus9hsfpFDcSDG8a' \
    --region 'MVGLiBNrDjqoxcwg' \
    --endDate 'GLXpUL4pp2ncYAHd' \
    --startDate 'NzDmeIP6rOvDz9KO' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'sb392k6YmJFfRByj,lBiuFM3FIoVk8T3G,pAnkCmBUqg2SCnqn' \
    --endDate 'tX9y1aZSWMiVi10s' \
    --startDate 'G6vxkfUcmqRRbceJ' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --matchPool '5i0EeDxOgBnhhqEl,IaDml48wdNFLTm5T,50x9WT0GfH2rtOa4' \
    --endDate 'EXsXzOXQAk4mqrxz' \
    --startDate 'TtuLl4XlbGL8QOxt' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'jzm8y2wNhmwoYZyI,4EFZKBcYrCEAE7WI,sfmx40NLRc6m8heK' \
    --endDate 'nWhzfe2NubeoKFeI' \
    --startDate 'aFQCYoDPICpnduEE' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'QlULdJz4mnRBkMNx,vvKgAT8mJrYq6hRk,loqxM3gpwxcfMy9X' \
    --endDate 'zjjI5YbsKoADkzJE' \
    --startDate 'N2VHzih3bit0VWn3' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'CO39PXDNxtXgeO3F,gkXhjDzaQY3snn2Z,kP7cFdP43e5dC9XI' \
    --endDate 'BudfZgrbHDIDm4hM' \
    --startDate 'zF4TxodenSrUTvfq' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'U0bfoMm5cTtFWbot,QyXJRcQWsmqPNs92,epxk0i8VxsZNereS' \
    --endDate 'vf9699mCEHThUJkE' \
    --startDate 'TAsSp7gh4TeUTkOk' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "AYfJB8AT9t4Tv207", "activeAllianceRule": {"max_number": 85, "min_number": 33, "player_max_number": 87, "player_min_number": 74}, "activeMatchingRule": [{"attribute": "D3oD5fLCr3OOlXVv", "criteria": "8ZGF7uYnGzpipNDi", "reference": 0.101065178821099}, {"attribute": "NJma1MbqqZtfNWql", "criteria": "4nmwAft4gqkNNlWk", "reference": 0.4692255816039117}, {"attribute": "9eOziYRFOn0jJLHC", "criteria": "9LxhvNXTwGBCtohL", "reference": 0.3086985959229762}], "function": "l9Zuhytm5UDrT6QX", "gameMode": "Cs5SPBbRPZTF6oQA", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 24, "matchID": "nsZg5QgXjvyGJPN4", "namespace": "eXbJE5Vs2GcyomQo", "partyID": "IXimBJehyxlNsjUg", "remainingPlayersPerTicket": [48, 39, 56], "remainingTickets": 22, "sessionTickID": "P7WnbdSJtjX7ZshZ", "tickID": 51, "timeToMatchSec": 0.12676435581860468, "timestamp": "1990-03-30T00:00:00Z", "unbackfillReason": "2rIizGdKvOPdq5xr", "unmatchReason": "gxSmy1DN9LFkYW5D"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 CreateXrayBulkTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayBulkTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"ticketObservabilities": [{"action": "Qyj4bj5Ro2ogaKt2", "activeAllianceRule": {"max_number": 42, "min_number": 62, "player_max_number": 20, "player_min_number": 61}, "activeMatchingRule": [{"attribute": "QSa3Zdb65UXmy0Zp", "criteria": "6iIaTIKUkmkk9QM0", "reference": 0.6324027539027077}, {"attribute": "BMA9ORxpzwLR2AK6", "criteria": "eXUGPJsw1fiP80G9", "reference": 0.6729504320820341}, {"attribute": "clxcft2ulIJzPyrV", "criteria": "EiOG4UcqsuGKHhMR", "reference": 0.7751921786099131}], "function": "LVd3DlhLuIpomM8s", "gameMode": "m1MiaI1mX2tJoARt", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 2, "matchID": "vepnDCjgyJlXe36m", "namespace": "gWjLfFmteue9nzJ6", "partyID": "fH24T805tVg8JqU0", "remainingPlayersPerTicket": [18, 72, 8], "remainingTickets": 31, "sessionTickID": "vzcWbfUpaXp5JMl5", "tickID": 77, "timeToMatchSec": 0.27761178165275147, "timestamp": "1985-12-28T00:00:00Z", "unbackfillReason": "bTxBmZjdrrIxsB0N", "unmatchReason": "RsB1fPqqRRulpqpy"}, {"action": "mDkQhtrHWwRVnwVB", "activeAllianceRule": {"max_number": 83, "min_number": 76, "player_max_number": 33, "player_min_number": 51}, "activeMatchingRule": [{"attribute": "OHi8pWGd1juYhiqj", "criteria": "RJOqB5F93zFQbJnd", "reference": 0.7532645721323077}, {"attribute": "DpdONneAczbBdHb2", "criteria": "slt71B1SmZp2JZp5", "reference": 0.8517753424555412}, {"attribute": "CnPb71ORYcmQbTU5", "criteria": "JX8ccLjMXJRk0eaK", "reference": 0.6897516786999137}], "function": "DOJvrTefglSs6g4i", "gameMode": "Y9u02aCNYIWekp18", "isBackfillMatch": false, "isRuleSetFlexed": false, "iteration": 84, "matchID": "t9lIMGql5ElEa9EI", "namespace": "IlGcHB3CfR3ncDlw", "partyID": "i3v3MFFJ1KesKoEL", "remainingPlayersPerTicket": [57, 2, 31], "remainingTickets": 30, "sessionTickID": "DKKoxLE1Y3Dymtj3", "tickID": 13, "timeToMatchSec": 0.8461782420609313, "timestamp": "1980-12-06T00:00:00Z", "unbackfillReason": "YaT5hOPjaf3H0tYi", "unmatchReason": "ghU0VUfcYHJbBfAK"}, {"action": "SiPW3VgsZXiR1DJ7", "activeAllianceRule": {"max_number": 69, "min_number": 97, "player_max_number": 99, "player_min_number": 74}, "activeMatchingRule": [{"attribute": "qMkNSawQUWDFJvJB", "criteria": "Wic7UkBeIXuqDuAX", "reference": 0.5514568247782807}, {"attribute": "66bQ71w0deoV9Lx5", "criteria": "RDA1l2XcrciYNEzv", "reference": 0.7143627668665172}, {"attribute": "ZIPkhSgORcz5S5Bv", "criteria": "mgBLxh4ijFnE3Tam", "reference": 0.9427162380491856}], "function": "9qSZ7PC6f6QkmZXE", "gameMode": "lW9YfRSse6AAz3S4", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 53, "matchID": "7SBROPYuG6XqP6oo", "namespace": "7G73zdxTgOfnwIdl", "partyID": "Na29fDLh741IslKH", "remainingPlayersPerTicket": [52, 9, 67], "remainingTickets": 3, "sessionTickID": "lLKWUtDQs61OQAox", "tickID": 51, "timeToMatchSec": 0.9125214770457519, "timestamp": "1973-12-15T00:00:00Z", "unbackfillReason": "ZvWtND2tcBFpX8lN", "unmatchReason": "tFEJ7tnkY6Mca5af"}]}' \
    > test.out 2>&1
eval_tap $? 35 'CreateXrayBulkTicketObservability' test.out

#- 36 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'j12K2IzrBvvWm4ud' \
    --limit '62' \
    --offset '62' \
    --endDate '0OXudXgNne8kJATw' \
    --startDate 'lc6esUp6Sw1I98je' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByTicketID' test.out

#- 37 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZQ7hfxnhLd3Knakn' \
    --limit '30' \
    --offset '9' \
    --endDate 'glU6muswVJnNnN7k' \
    --startDate 'Aa7j0riFc5HTHQIo' \
    > test.out 2>&1
eval_tap $? 37 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE