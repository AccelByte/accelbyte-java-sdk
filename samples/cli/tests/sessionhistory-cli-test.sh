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
echo "1..36"

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
    --poolName 'GrncqmLtjQHAf8Tg' \
    --endDate 'oNm03VLisV6zwPuo' \
    --startDate '3td6TC6I3lMjGSWN' \
    > test.out 2>&1
eval_tap $? 16 'QueryXrayMatchPool' test.out

#- 17 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName '2laRlxfcjHfYakUC' \
    --poolName 'TqGkE7wcWfDslpJS' \
    --all  \
    --limit '33' \
    --offset '50' \
    --endDate 'GAXQ0yYoNRKd3IL5' \
    --startDate 'TAQ6iiPlSC2uE4o5' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPool' test.out

#- 18 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'Vwdo3fePqIJA8IHt' \
    --poolName 'rkmu0hpDDWVAla2l' \
    --tickId '5BYNtIuS5S5XUdjs' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolMatches' test.out

#- 19 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'oqwGyzzWi9gwQYv7' \
    --poolName 't1o7TTr1DmrhZv15' \
    --tickId 'T7quIOvBMcaYmvCk' \
    > test.out 2>&1
eval_tap $? 19 'QueryDetailTickMatchPoolTicket' test.out

#- 20 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'GZ5dAgqxpBFmaLox' \
    --namespace "$AB_NAMESPACE" \
    --limit '30' \
    --offset '7' \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchHistories' test.out

#- 21 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'zr6wfNPX2bOItRMv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryMatchTicketHistories' test.out

#- 22 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'qtlB2jJCSQT279ZZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'QueryXrayMatch' test.out

#- 23 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --endDate 'PYGu0rdlgdWyOtXi' \
    --startDate '3choQrpOsDBU5Sep' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDS' test.out

#- 24 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate 'jChB3V0v52Dlym6p' \
    --startDate 'uQ23xoJ8aeCnaLpU' \
    > test.out 2>&1
eval_tap $? 24 'QueryAcquiringDSWaitTimeAvg' test.out

#- 25 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate 'Kp44YUDjasWIPUvm' \
    --startDate 'EejtGeoyIPa8ZRrv' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationpAvg' test.out

#- 26 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'jj7il35MXbN9oCMN' \
    --startDate 'qq98SjTvhZNkSQ70' \
    > test.out 2>&1
eval_tap $? 26 'QueryMatchLengthDurationp99' test.out

#- 27 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --region 'D0H6BXksUC9b6i5l' \
    --endDate 'ZC9xv32e8c5csSov' \
    --startDate 'oqsZNBdte9NDUPVJ' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalActiveSession' test.out

#- 28 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'f6c2Z0QZxfgPubTD' \
    --endDate 'IHrvqAThuwjRHpKK' \
    --startDate 'TlmVr9XuoJbRFQSK' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalMatchmakingMatch' test.out

#- 29 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --endDate 'VPHbn4Xxtu7LQREN' \
    --startDate 'jEEztx1WsYSiZqan' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalPlayerPersession' test.out

#- 30 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool '0nSBJroav91GXlvP' \
    --endDate 'G6bFYReVHQipcCx9' \
    --startDate 'Zw5D2L7vIYhGGSyE' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCanceled' test.out

#- 31 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'W4ZJJ42d3PBddN8S' \
    --endDate '48l9lyNApflxqMrj' \
    --startDate '3oZk03QXcKMDYDDx' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingCreated' test.out

#- 32 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'HSZjtqXyJ58f7Gc2' \
    --endDate '6SaiGVkydwYWQG26' \
    --startDate 'yUZNmTBcvrbYCwZt' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingExpired' test.out

#- 33 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'xFHyPLtI8ilbyDPU' \
    --endDate 'Ij88cekdqCt81P1k' \
    --startDate 'tfIovmv9gsR5cJcH' \
    > test.out 2>&1
eval_tap $? 33 'QueryTotalMatchmakingMatchTicket' test.out

#- 34 CreateXrayTicketObservability
./ng net.accelbyte.sdk.cli.Main sessionhistory createXrayTicketObservability \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "m3SZLxoRDFuuuySj", "activeAllianceRule": {"max_number": 24, "min_number": 56, "player_max_number": 1, "player_min_number": 16}, "activeMatchingRule": [{"attribute": "9LJE8HoRS1X2PFAA", "criteria": "MwzHPxB1UskYs4Yw", "reference": 0.8780789181137458}, {"attribute": "0DOqOBSC2DKHRuPM", "criteria": "MWH8Yb33T5UBJCjf", "reference": 0.03912062253362525}, {"attribute": "nLRfxeCSz9WEi8Kl", "criteria": "loeH0JT1yduat2vQ", "reference": 0.7018636892334367}], "function": "3biBfsu4jmsRE2w1", "gameMode": "yEkLgh3tIYt4SqYU", "isBackfillMatch": false, "isRuleSetFlexed": true, "iteration": 2, "matchID": "x9gIiDandpGT2t24", "namespace": "aOMh5eC3IHeHSKLC", "partyID": "a3xreNDUWehwH3q3", "remainingPlayersPerTicket": [5, 54, 24], "remainingTickets": 15, "sessionTickID": "DJgas4b6z3LNUj7f", "tickID": 8, "timeToMatchSec": 0.06865267530832231, "timestamp": "1988-11-03T00:00:00Z", "unbackfillReason": "aFQCYoDPICpnduEE", "unmatchReason": "QlULdJz4mnRBkMNx"}' \
    > test.out 2>&1
eval_tap $? 34 'CreateXrayTicketObservability' test.out

#- 35 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'vvKgAT8mJrYq6hRk' \
    --limit '23' \
    --offset '30' \
    --endDate '7A68eaqC2J9jyEW6' \
    --startDate 'GLbc0NaKDUL3sa13' \
    > test.out 2>&1
eval_tap $? 35 'QueryXrayTimelineByTicketID' test.out

#- 36 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'lk1dQBHO86IlBhne' \
    --limit '41' \
    --offset '94' \
    --endDate '9PXDNxtXgeO3FgkX' \
    --startDate 'hjDzaQY3snn2ZkP7' \
    > test.out 2>&1
eval_tap $? 36 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE