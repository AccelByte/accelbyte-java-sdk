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

#- 2 AdminFindActionList
./ng net.accelbyte.sdk.cli.Main reporting adminFindActionList \
    > test.out 2>&1
eval_tap $? 2 'AdminFindActionList' test.out

#- 3 AdminCreateModAction
./ng net.accelbyte.sdk.cli.Main reporting adminCreateModAction \
    --body '{"actionId": "EAxcVpFrttufHIRd", "actionName": "H9UzVRiXbqlAw7r6", "eventName": "W2ktQG0h5JAav5kR"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateModAction' test.out

#- 4 AdminFindExtensionCategoryList
./ng net.accelbyte.sdk.cli.Main reporting adminFindExtensionCategoryList \
    --order 'asc' \
    --sortBy 'extensionCategory' \
    > test.out 2>&1
eval_tap $? 4 'AdminFindExtensionCategoryList' test.out

#- 5 AdminCreateExtensionCategory
./ng net.accelbyte.sdk.cli.Main reporting adminCreateExtensionCategory \
    --body '{"extensionCategory": "2WopBJHPtcDs8bBZ", "extensionCategoryName": "LCXLx8bbgorQeFbQ", "serviceSource": "1g7qbPngUNB1vRod"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateExtensionCategory' test.out

#- 6 Get
./ng net.accelbyte.sdk.cli.Main reporting get \
    --namespace "$AB_NAMESPACE" \
    --category 'extension' \
    > test.out 2>&1
eval_tap $? 6 'Get' test.out

#- 7 Upsert
./ng net.accelbyte.sdk.cli.Main reporting upsert \
    --namespace "$AB_NAMESPACE" \
    --body '{"categoryLimits": [{"extensionCategory": "ElFHHdgs21Jub74C", "maxReportPerTicket": 96, "name": "Gj6oDLjWjkY1aXlF"}, {"extensionCategory": "cDtgOjchIua5tWEI", "maxReportPerTicket": 59, "name": "JSDgY1TXp38zsCTC"}, {"extensionCategory": "rbCbPOyNQkT7NvyE", "maxReportPerTicket": 5, "name": "8mAQLnzjMf8GZ2WB"}], "timeInterval": 36, "userMaxReportPerTimeInterval": 33}' \
    > test.out 2>&1
eval_tap $? 7 'Upsert' test.out

#- 8 AdminListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting adminListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 8 'AdminListReasonGroups' test.out

#- 9 CreateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting createReasonGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["JW2OQNOs1PXhT5Fv", "diRilZ7oFgx4c8Ou", "mKtPDKJDXn7Z4U68"], "title": "su8XfqlqNiTvB6Sd"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateReasonGroup' test.out

#- 10 GetReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting getReasonGroup \
    --groupId 'AdIhUDrwoZ5MecdK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetReasonGroup' test.out

#- 11 DeleteReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting deleteReasonGroup \
    --groupId 'i5r6QEa1ysLEzth6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteReasonGroup' test.out

#- 12 UpdateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting updateReasonGroup \
    --groupId 'mXhzkzWkFeZSoEAc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["BdW19m4eu6d5tA5j", "UmiTqpyhPFdxLzFQ", "N05MYzYiKWe5dNRl"], "title": "jv7IPrDQQRgat0Se"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateReasonGroup' test.out

#- 13 AdminGetReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'vkLGMS0lyuI9a2I9' \
    --limit '42' \
    --offset '52' \
    --title '6Vpbsx5w8hqUI06U' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetReasons' test.out

#- 14 CreateReason
./ng net.accelbyte.sdk.cli.Main reporting createReason \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "pOXGSLmCVuHOPlLl", "groupIds": ["kvR8sKgnuRkgghGo", "YupD391C2qtPYoka", "hFjkQsfCaTmt1d67"], "title": "FXGk2s9Q0mPVo3tw"}' \
    > test.out 2>&1
eval_tap $? 14 'CreateReason' test.out

#- 15 AdminGetAllReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetAllReasons \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 15 'AdminGetAllReasons' test.out

#- 16 AdminGetUnusedReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetUnusedReasons \
    --namespace "$AB_NAMESPACE" \
    --extensionCategory 'u0MesTCf9x4rt69l' \
    --category 'na7qxNeIxPz6MbwL' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUnusedReasons' test.out

#- 17 AdminGetReason
./ng net.accelbyte.sdk.cli.Main reporting adminGetReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId '6IY69z1UaLqYSYWy' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetReason' test.out

#- 18 DeleteReason
./ng net.accelbyte.sdk.cli.Main reporting deleteReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'tLPziZMdjxcBZufQ' \
    > test.out 2>&1
eval_tap $? 18 'DeleteReason' test.out

#- 19 UpdateReason
./ng net.accelbyte.sdk.cli.Main reporting updateReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'xGiHPllG4cYEzfTD' \
    --body '{"description": "1ZBm3MqHcUmLZZbS", "groupIds": ["qb8RwNmn9HrNQy4u", "ZAAiE0mit9RGCCHY", "zUOcEdscKHPEqgA8"], "title": "yu7Vk6Jt4Ymos9Jc"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateReason' test.out

#- 20 ListReports
./ng net.accelbyte.sdk.cli.Main reporting listReports \
    --namespace "$AB_NAMESPACE" \
    --category 'dos4fYcTVU6RBt0z' \
    --limit '29' \
    --offset '79' \
    --reportedUserId 'dAgqxpBFmaLoxozr' \
    --sortBy '6wfNPX2bOItRMvqt' \
    > test.out 2>&1
eval_tap $? 20 'ListReports' test.out

#- 21 AdminSubmitReport
./ng net.accelbyte.sdk.cli.Main reporting adminSubmitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"lB2jJCSQT279ZZPY": {}, "Gu0rdlgdWyOtXi3c": {}, "hoQrpOsDBU5SepjC": {}}, "category": "CHAT", "comment": "yKrQpM4hkkK6KKXN", "extensionCategory": "B3Gv0IqmF51TkhjY", "objectId": "naq6foWvXa3bMrXs", "objectType": "Dr6kILsSSyDdmykm", "reason": "oPYgc2L4jk4Lo0LS", "userId": "P0pf4IxjUkl535X3"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminSubmitReport' test.out

#- 22 CreateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting createModerationRule \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "6BXksUC9b6i5lZC9", "duration": 47, "reason": "Qgb3boLQQ1MzH7Qm", "skipNotif": false, "type": "Bdte9NDUPVJf6c2Z"}, "deleteChat": false, "extensionActionIds": ["QZxfgPubTDIHrvqA", "ThuwjRHpKKTlmVr9", "XuoJbRFQSKVPHbn4"], "hideContent": false}, "active": true, "category": "UGC", "extensionCategory": "QUhAEtrmjqU6YE3p", "reason": "4lSck0ZHn5GI39YB", "threshold": 69}' \
    > test.out 2>&1
eval_tap $? 22 'CreateModerationRule' test.out

#- 23 UpdateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId '91GXlvPG6bFYReVH' \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "d9sogWa24CKNS0Gq", "duration": 97, "reason": "GGSyEW4ZJJ42d3PB", "skipNotif": false, "type": "go5QB65lSAiYnNjk"}, "deleteChat": false, "extensionActionIds": ["qMrj3oZk03QXcKMD", "YDDxHSZjtqXyJ58f", "7Gc26SaiGVkydwYW"], "hideContent": true}, "active": false, "category": "UGC", "extensionCategory": "6yUZNmTBcvrbYCwZ", "reason": "txFHyPLtI8ilbyDP", "threshold": 95}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateModerationRule' test.out

#- 24 DeleteModerationRule
./ng net.accelbyte.sdk.cli.Main reporting deleteModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'gGLXpUL4pp2ncYAH' \
    > test.out 2>&1
eval_tap $? 24 'DeleteModerationRule' test.out

#- 25 UpdateModerationRuleStatus
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRuleStatus \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'dNzDmeIP6rOvDz9K' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateModerationRuleStatus' test.out

#- 26 GetModerationRules
./ng net.accelbyte.sdk.cli.Main reporting getModerationRules \
    --namespace "$AB_NAMESPACE" \
    --category 'sb392k6YmJFfRByj' \
    --extensionCategory 'lBiuFM3FIoVk8T3G' \
    --limit '31' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 26 'GetModerationRules' test.out

#- 27 GetModerationRuleDetails
./ng net.accelbyte.sdk.cli.Main reporting getModerationRuleDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'AnkCmBUqg2SCnqnt' \
    > test.out 2>&1
eval_tap $? 27 'GetModerationRuleDetails' test.out

#- 28 ListTickets
./ng net.accelbyte.sdk.cli.Main reporting listTickets \
    --namespace "$AB_NAMESPACE" \
    --category 'X9y1aZSWMiVi10sG' \
    --extensionCategory '6vxkfUcmqRRbceJ5' \
    --limit '16' \
    --offset '18' \
    --order '0EeDxOgBnhhqElIa' \
    --reportedUserId 'Dml48wdNFLTm5T50' \
    --sortBy 'x9WT0GfH2rtOa4EX' \
    --status 'sXzOXQAk4mqrxzTt' \
    > test.out 2>&1
eval_tap $? 28 'ListTickets' test.out

#- 29 TicketStatistic
./ng net.accelbyte.sdk.cli.Main reporting ticketStatistic \
    --namespace "$AB_NAMESPACE" \
    --extensionCategory 'uLl4XlbGL8QOxtjz' \
    --category 'm8y2wNhmwoYZyI4E' \
    > test.out 2>&1
eval_tap $? 29 'TicketStatistic' test.out

#- 30 GetTicketDetail
./ng net.accelbyte.sdk.cli.Main reporting getTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'FZKBcYrCEAE7WIsf' \
    > test.out 2>&1
eval_tap $? 30 'GetTicketDetail' test.out

#- 31 DeleteTicket
./ng net.accelbyte.sdk.cli.Main reporting deleteTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'mx40NLRc6m8heKnW' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTicket' test.out

#- 32 GetReportsByTicket
./ng net.accelbyte.sdk.cli.Main reporting getReportsByTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'hzfe2NubeoKFeIaF' \
    --limit '87' \
    --offset '58' \
    > test.out 2>&1
eval_tap $? 32 'GetReportsByTicket' test.out

#- 33 UpdateTicketResolutions
./ng net.accelbyte.sdk.cli.Main reporting updateTicketResolutions \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'Z8YYk6QEgJjBbEDo' \
    --body '{"notes": "Nf3n0hEoRCAcf80z", "status": "AUTO_MODERATED"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateTicketResolutions' test.out

#- 34 PublicListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting publicListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '65' \
    > test.out 2>&1
eval_tap $? 34 'PublicListReasonGroups' test.out

#- 35 PublicGetReasons
./ng net.accelbyte.sdk.cli.Main reporting publicGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'T8mJrYq6hRkloqxM' \
    --limit '8' \
    --offset '13' \
    --title 'aqC2J9jyEW6GLbc0' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetReasons' test.out

#- 36 SubmitReport
./ng net.accelbyte.sdk.cli.Main reporting submitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"NaKDUL3sa13lk1dQ": {}, "BHO86IlBhnetU4Rw": {}, "TqUXlTDBzOuYsaZA": {}}, "category": "CHAT", "comment": "yyd4mbqoOfADMMAX", "extensionCategory": "FaY9eKa699bRVhya", "objectId": "KwwrAP2aMlu7WtjC", "objectType": "toYetOO847g8OudO", "reason": "fjnCuHZ3c46IjGa2", "userId": "3YvYmmDg7VYPXIuv"}' \
    > test.out 2>&1
eval_tap $? 36 'SubmitReport' test.out


rm -f "tmp.dat"

exit $EXIT_CODE