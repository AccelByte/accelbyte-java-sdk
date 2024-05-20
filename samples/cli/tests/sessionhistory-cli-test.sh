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
echo "1..34"

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
    --gameSessionID 'twYCA9kPI6LZrkq6' \
    --limit '59' \
    --offset '4' \
    --order 'UzVRiXbqlAw7r6W2' \
    --orderBy 'ktQG0h5JAav5kRa6' \
    --userID '2WopBJHPtcDs8bBZ' \
    > test.out 2>&1
eval_tap $? 6 'AdminQueryGameSessionDetail' test.out

#- 7 GetGameSessionDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getGameSessionDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'LCXLx8bbgorQeFbQ' \
    > test.out 2>&1
eval_tap $? 7 'GetGameSessionDetail' test.out

#- 8 AdminQueryMatchmakingDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryMatchmakingDetail \
    --namespace "$AB_NAMESPACE" \
    --gameSessionID '1g7qbPngUNB1vRod' \
    --limit '46' \
    --offset '63' \
    --order 'pzS6DaDpv8N7ZQVq' \
    --orderBy 'Gj6oDLjWjkY1aXlF' \
    --ticketID 'cDtgOjchIua5tWEI' \
    --userID 'C32ogW7olvbTgrhR' \
    > test.out 2>&1
eval_tap $? 8 'AdminQueryMatchmakingDetail' test.out

#- 9 AdminGetMatchmakingDetailBySessionID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailBySessionID \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'TcPiSuL0Sly6XM4O' \
    > test.out 2>&1
eval_tap $? 9 'AdminGetMatchmakingDetailBySessionID' test.out

#- 10 AdminGetMatchmakingDetailByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminGetMatchmakingDetailByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'I18mAQLnzjMf8GZ2' \
    > test.out 2>&1
eval_tap $? 10 'AdminGetMatchmakingDetailByTicketID' test.out

#- 11 AdminQueryPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --limit '100' \
    --offset '13' \
    --order 'BZqxYG3aREAu2D6Q' \
    --orderBy 'VKNCWP75TB0i7pKx' \
    --partyID 'R8dl0zRVW4EZG9m0' \
    --userID 'XcgGVbMqSszE8GHa' \
    > test.out 2>&1
eval_tap $? 11 'AdminQueryPartyDetail' test.out

#- 12 GetPartyDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory getPartyDetail \
    --namespace "$AB_NAMESPACE" \
    --sessionId 'vj7AorKsxwkosAVe' \
    > test.out 2>&1
eval_tap $? 12 'GetPartyDetail' test.out

#- 13 AdminQueryTicketDetail
./ng net.accelbyte.sdk.cli.Main sessionhistory adminQueryTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --endDate 'rXpc1C8XfwHuKeb9' \
    --gameMode 'l3rGN9A3sNm84hdd' \
    --limit '91' \
    --offset '63' \
    --order 'pHt0P7MIIR7CkyF6' \
    --partyID 'C7duuyZ0GhDogqrh' \
    --region 'BRd8lDR6qVNPRZYd' \
    --startDate 'FLIAjGGJddVCvu9v' \
    --userIDs 'x5KQ7KYnIuMBvaO3' \
    > test.out 2>&1
eval_tap $? 13 'AdminQueryTicketDetail' test.out

#- 14 AdminTicketDetailGetByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory adminTicketDetailGetByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId '5llzQRaT5kPxUfof' \
    > test.out 2>&1
eval_tap $? 14 'AdminTicketDetailGetByTicketID' test.out

#- 15 QueryXrayMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatchPool \
    --namespace "$AB_NAMESPACE" \
    --poolName 'vnnSuB0y5WUlrMdI' \
    --endDate '4sNveabntBSxTeIv' \
    --startDate '53HGCiljvjKoyD6S' \
    > test.out 2>&1
eval_tap $? 15 'QueryXrayMatchPool' test.out

#- 16 QueryDetailTickMatchPool
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPool \
    --namespace "$AB_NAMESPACE" \
    --podName 'CwGrncqmLtjQHAf8' \
    --poolName 'TgoNm03VLisV6zwP' \
    --all  \
    --limit '42' \
    --offset '29' \
    --endDate 'twu0MesTCf9x4rt6' \
    --startDate '9lna7qxNeIxPz6Mb' \
    > test.out 2>&1
eval_tap $? 16 'QueryDetailTickMatchPool' test.out

#- 17 QueryDetailTickMatchPoolMatches
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolMatches \
    --namespace "$AB_NAMESPACE" \
    --podName 'wL6IY69z1UaLqYSY' \
    --poolName 'WytLPziZMdjxcBZu' \
    --tickId 'fQxGiHPllG4cYEzf' \
    > test.out 2>&1
eval_tap $? 17 'QueryDetailTickMatchPoolMatches' test.out

#- 18 QueryDetailTickMatchPoolTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryDetailTickMatchPoolTicket \
    --namespace "$AB_NAMESPACE" \
    --podName 'TD1ZBm3MqHcUmLZZ' \
    --poolName 'bSqb8RwNmn9HrNQy' \
    --tickId '4uZAAiE0mit9RGCC' \
    > test.out 2>&1
eval_tap $? 18 'QueryDetailTickMatchPoolTicket' test.out

#- 19 QueryMatchHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchHistories \
    --matchId 'HYzUOcEdscKHPEqg' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 19 'QueryMatchHistories' test.out

#- 20 QueryMatchTicketHistories
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchTicketHistories \
    --matchId 'yu7Vk6Jt4Ymos9Jc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'QueryMatchTicketHistories' test.out

#- 21 QueryXrayMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayMatch \
    --matchId 'dos4fYcTVU6RBt0z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'QueryXrayMatch' test.out

#- 22 QueryAcquiringDS
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDS \
    --namespace "$AB_NAMESPACE" \
    --endDate 'YoMcHyCUEXlAvxJM' \
    --startDate 'dalwSyliWMNW5NyL' \
    > test.out 2>&1
eval_tap $? 22 'QueryAcquiringDS' test.out

#- 23 QueryAcquiringDSWaitTimeAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryAcquiringDSWaitTimeAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate 'u0M3VHh2EI8JlDbP' \
    --startDate 'WbQ6Q9lNmqRBaAkL' \
    > test.out 2>&1
eval_tap $? 23 'QueryAcquiringDSWaitTimeAvg' test.out

#- 24 QueryMatchLengthDurationpAvg
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationpAvg \
    --namespace "$AB_NAMESPACE" \
    --endDate 'nvxkT1X68cmDc3fx' \
    --startDate 'U8MyKrQpM4hkkK6K' \
    > test.out 2>&1
eval_tap $? 24 'QueryMatchLengthDurationpAvg' test.out

#- 25 QueryMatchLengthDurationp99
./ng net.accelbyte.sdk.cli.Main sessionhistory queryMatchLengthDurationp99 \
    --namespace "$AB_NAMESPACE" \
    --endDate 'KXNB3Gv0IqmF51Tk' \
    --startDate 'hjYnaq6foWvXa3bM' \
    > test.out 2>&1
eval_tap $? 25 'QueryMatchLengthDurationp99' test.out

#- 26 QueryTotalActiveSession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalActiveSession \
    --namespace "$AB_NAMESPACE" \
    --region 'rXsDr6kILsSSyDdm' \
    --endDate 'ykmoPYgc2L4jk4Lo' \
    --startDate '0LSP0pf4IxjUkl53' \
    > test.out 2>&1
eval_tap $? 26 'QueryTotalActiveSession' test.out

#- 27 QueryTotalMatchmakingMatch
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatch \
    --namespace "$AB_NAMESPACE" \
    --matchPool '5X3ateEKDpADz1x3' \
    --endDate 'poD3Qgb3boLQQ1Mz' \
    --startDate 'H7Qm8bwbmXgdAPh1' \
    > test.out 2>&1
eval_tap $? 27 'QueryTotalMatchmakingMatch' test.out

#- 28 QueryTotalPlayerPersession
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalPlayerPersession \
    --namespace "$AB_NAMESPACE" \
    --endDate 'EThG96gAFKK2WDgC' \
    --startDate 'cxvONZm3EeERmDny' \
    > test.out 2>&1
eval_tap $? 28 'QueryTotalPlayerPersession' test.out

#- 29 QueryTotalMatchmakingCanceled
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCanceled \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'eFoF7VSZ6pf3vneS' \
    --endDate 'D2Tb3g7mSQUhAEtr' \
    --startDate 'mjqU6YE3p4lSck0Z' \
    > test.out 2>&1
eval_tap $? 29 'QueryTotalMatchmakingCanceled' test.out

#- 30 QueryTotalMatchmakingCreated
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingCreated \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'Hn5GI39YBHqaTHeK' \
    --endDate 'tW18iGeUlc9d9sog' \
    --startDate 'Wa24CKNS0GqVvUfH' \
    > test.out 2>&1
eval_tap $? 30 'QueryTotalMatchmakingCreated' test.out

#- 31 QueryTotalMatchmakingExpired
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingExpired \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'QvsHXNUNe4mhgo5Q' \
    --endDate 'B65lSAiYnNjkfZrQ' \
    --startDate 'vGgbLdLsFzHkBMr1' \
    > test.out 2>&1
eval_tap $? 31 'QueryTotalMatchmakingExpired' test.out

#- 32 QueryTotalMatchmakingMatchTicket
./ng net.accelbyte.sdk.cli.Main sessionhistory queryTotalMatchmakingMatchTicket \
    --namespace "$AB_NAMESPACE" \
    --matchPool 'yrOMlNFSrUEirnjX' \
    --endDate '9fDmIbeZxzfTcyiu' \
    --startDate 'ATus9hsfpFDcSDG8' \
    > test.out 2>&1
eval_tap $? 32 'QueryTotalMatchmakingMatchTicket' test.out

#- 33 QueryXrayTimelineByTicketID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByTicketID \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'aMVGLiBNrDjqoxcw' \
    --limit '13' \
    --offset '71' \
    --endDate 'GLXpUL4pp2ncYAHd' \
    --startDate 'NzDmeIP6rOvDz9KO' \
    > test.out 2>&1
eval_tap $? 33 'QueryXrayTimelineByTicketID' test.out

#- 34 QueryXrayTimelineByUserID
./ng net.accelbyte.sdk.cli.Main sessionhistory queryXrayTimelineByUserID \
    --namespace "$AB_NAMESPACE" \
    --userId 'sb392k6YmJFfRByj' \
    --limit '24' \
    --offset '56' \
    --endDate 'a9LJE8HoRS1X2PFA' \
    --startDate 'AMwzHPxB1UskYs4Y' \
    > test.out 2>&1
eval_tap $? 34 'QueryXrayTimelineByUserID' test.out


rm -f "tmp.dat"

exit $EXIT_CODE