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
    --body '{"actionId": "smI10D3G", "actionName": "eYm40mbb", "eventName": "vHDBtK5l"}' \
    > test.out 2>&1
eval_tap $? 3 'AdminCreateModAction' test.out

#- 4 AdminFindExtensionCategoryList
./ng net.accelbyte.sdk.cli.Main reporting adminFindExtensionCategoryList \
    --order 'desc' \
    --sortBy 'extensionCategoryName' \
    > test.out 2>&1
eval_tap $? 4 'AdminFindExtensionCategoryList' test.out

#- 5 AdminCreateExtensionCategory
./ng net.accelbyte.sdk.cli.Main reporting adminCreateExtensionCategory \
    --body '{"extensionCategory": "TcLhL50R", "extensionCategoryName": "OZmfbSNk", "serviceSource": "Qc9EC9fx"}' \
    > test.out 2>&1
eval_tap $? 5 'AdminCreateExtensionCategory' test.out

#- 6 Get
./ng net.accelbyte.sdk.cli.Main reporting get \
    --namespace "$AB_NAMESPACE" \
    --category 'all' \
    > test.out 2>&1
eval_tap $? 6 'Get' test.out

#- 7 Upsert
./ng net.accelbyte.sdk.cli.Main reporting upsert \
    --namespace "$AB_NAMESPACE" \
    --body '{"categoryLimits": [{"extensionCategory": "8g3E5Ps7", "maxReportPerTicket": 70, "name": "hs09BYMR"}, {"extensionCategory": "n2yjktbH", "maxReportPerTicket": 61, "name": "DVD2wyIx"}, {"extensionCategory": "5oNB18ab", "maxReportPerTicket": 34, "name": "6B6NQHb6"}], "timeInterval": 91, "userMaxReportPerTimeInterval": 76}' \
    > test.out 2>&1
eval_tap $? 7 'Upsert' test.out

#- 8 AdminListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting adminListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 8 'AdminListReasonGroups' test.out

#- 9 CreateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting createReasonGroup \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["HSh4cKWN", "lBjQI3me", "PZ8YVuWr"], "title": "XbMYl3Gq"}' \
    > test.out 2>&1
eval_tap $? 9 'CreateReasonGroup' test.out

#- 10 GetReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting getReasonGroup \
    --groupId 'tacF93Ko' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 10 'GetReasonGroup' test.out

#- 11 DeleteReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting deleteReasonGroup \
    --groupId 'jYfesL37' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'DeleteReasonGroup' test.out

#- 12 UpdateReasonGroup
./ng net.accelbyte.sdk.cli.Main reporting updateReasonGroup \
    --groupId 'rgalZOK4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"reasonIds": ["o3c3cj1M", "VgmDPLxN", "nSDs3TWb"], "title": "ORcZcgn0"}' \
    > test.out 2>&1
eval_tap $? 12 'UpdateReasonGroup' test.out

#- 13 AdminGetReasons
./ng net.accelbyte.sdk.cli.Main reporting adminGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'm1iZqIAJ' \
    --limit '50' \
    --offset '38' \
    --title 'EI2l3wwC' \
    > test.out 2>&1
eval_tap $? 13 'AdminGetReasons' test.out

#- 14 CreateReason
./ng net.accelbyte.sdk.cli.Main reporting createReason \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "f6OCPgd6", "groupIds": ["7t5d0EiE", "CvM0tUfQ", "C6m5VMQi"], "title": "gPSWtCgh"}' \
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
    --extensionCategory '3xy5PNT5' \
    --category 'VQUTMjG8' \
    > test.out 2>&1
eval_tap $? 16 'AdminGetUnusedReasons' test.out

#- 17 AdminGetReason
./ng net.accelbyte.sdk.cli.Main reporting adminGetReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId '4sPNCZgW' \
    > test.out 2>&1
eval_tap $? 17 'AdminGetReason' test.out

#- 18 DeleteReason
./ng net.accelbyte.sdk.cli.Main reporting deleteReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'GWuIYpRX' \
    > test.out 2>&1
eval_tap $? 18 'DeleteReason' test.out

#- 19 UpdateReason
./ng net.accelbyte.sdk.cli.Main reporting updateReason \
    --namespace "$AB_NAMESPACE" \
    --reasonId 'JBoruyZm' \
    --body '{"description": "PEDclQFF", "groupIds": ["lQxyGGvy", "zHR5721o", "vmVctKpr"], "title": "ySjHEAoT"}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateReason' test.out

#- 20 ListReports
./ng net.accelbyte.sdk.cli.Main reporting listReports \
    --namespace "$AB_NAMESPACE" \
    --category 'aSMbGhlW' \
    --limit '66' \
    --offset '73' \
    --reportedUserId '24Fp2NJX' \
    --sortBy 'qtst5mVi' \
    > test.out 2>&1
eval_tap $? 20 'ListReports' test.out

#- 21 AdminSubmitReport
./ng net.accelbyte.sdk.cli.Main reporting adminSubmitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"k6Sg26iO": {}, "q3aeh8GI": {}, "I0CJqZGR": {}}, "category": "USER", "comment": "Q8QSiN0l", "extensionCategory": "dpoGvMsp", "objectId": "lBUKBusJ", "objectType": "wg0HrbFN", "reason": "wdMGBiG0", "userId": "jC6gl8GU"}' \
    > test.out 2>&1
eval_tap $? 21 'AdminSubmitReport' test.out

#- 22 CreateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting createModerationRule \
    --namespace "$AB_NAMESPACE" \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "6zzfRrhQ", "duration": 6, "reason": "tm0oqkSv", "skipNotif": false, "type": "UfGrTMna"}, "deleteChat": true, "extensionActionIds": ["OLZB3N0u", "SsUWMnpq", "qqpkJfX6"], "hideContent": false}, "active": false, "category": "USER", "extensionCategory": "INgwQF76", "reason": "Z3o68c2W", "threshold": 87}' \
    > test.out 2>&1
eval_tap $? 22 'CreateModerationRule' test.out

#- 23 UpdateModerationRule
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'U63Y6zoi' \
    --body '{"action": "HideContent", "actions": {"banAccount": {"comment": "0mFazyls", "duration": 92, "reason": "5m2eUyFC", "skipNotif": false, "type": "xkAmxF3W"}, "deleteChat": false, "extensionActionIds": ["ES74ZBlO", "XIWjY1NI", "Z5MxzMGo"], "hideContent": false}, "active": true, "category": "UGC", "extensionCategory": "cEBFdyBP", "reason": "qlGUhyLC", "threshold": 64}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateModerationRule' test.out

#- 24 DeleteModerationRule
./ng net.accelbyte.sdk.cli.Main reporting deleteModerationRule \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'lZaSxUVi' \
    > test.out 2>&1
eval_tap $? 24 'DeleteModerationRule' test.out

#- 25 UpdateModerationRuleStatus
./ng net.accelbyte.sdk.cli.Main reporting updateModerationRuleStatus \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'MwoLtOp0' \
    --body '{"active": false}' \
    > test.out 2>&1
eval_tap $? 25 'UpdateModerationRuleStatus' test.out

#- 26 GetModerationRules
./ng net.accelbyte.sdk.cli.Main reporting getModerationRules \
    --namespace "$AB_NAMESPACE" \
    --category 'lOojp6Np' \
    --extensionCategory 'QHCaAEkJ' \
    --limit '4' \
    --offset '13' \
    > test.out 2>&1
eval_tap $? 26 'GetModerationRules' test.out

#- 27 GetModerationRuleDetails
./ng net.accelbyte.sdk.cli.Main reporting getModerationRuleDetails \
    --namespace "$AB_NAMESPACE" \
    --ruleId 'wfZ1lp08' \
    > test.out 2>&1
eval_tap $? 27 'GetModerationRuleDetails' test.out

#- 28 ListTickets
./ng net.accelbyte.sdk.cli.Main reporting listTickets \
    --namespace "$AB_NAMESPACE" \
    --category 'uDUySoWG' \
    --extensionCategory 'rtxhzKgC' \
    --limit '57' \
    --offset '93' \
    --order 'HFT02bft' \
    --reportedUserId 'aMCmVQrR' \
    --sortBy 'qAdiLUUj' \
    --status '8xSCIpSx' \
    > test.out 2>&1
eval_tap $? 28 'ListTickets' test.out

#- 29 TicketStatistic
./ng net.accelbyte.sdk.cli.Main reporting ticketStatistic \
    --namespace "$AB_NAMESPACE" \
    --extensionCategory 'RnhnfLcK' \
    --category 'nXxsp14g' \
    > test.out 2>&1
eval_tap $? 29 'TicketStatistic' test.out

#- 30 GetTicketDetail
./ng net.accelbyte.sdk.cli.Main reporting getTicketDetail \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'DGD5ArKB' \
    > test.out 2>&1
eval_tap $? 30 'GetTicketDetail' test.out

#- 31 DeleteTicket
./ng net.accelbyte.sdk.cli.Main reporting deleteTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'O30pGu8k' \
    > test.out 2>&1
eval_tap $? 31 'DeleteTicket' test.out

#- 32 GetReportsByTicket
./ng net.accelbyte.sdk.cli.Main reporting getReportsByTicket \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'BnlIOfuo' \
    --limit '63' \
    --offset '54' \
    > test.out 2>&1
eval_tap $? 32 'GetReportsByTicket' test.out

#- 33 UpdateTicketResolutions
./ng net.accelbyte.sdk.cli.Main reporting updateTicketResolutions \
    --namespace "$AB_NAMESPACE" \
    --ticketId 'ggGcuzIE' \
    --body '{"notes": "IcvKfxUd", "status": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateTicketResolutions' test.out

#- 34 PublicListReasonGroups
./ng net.accelbyte.sdk.cli.Main reporting publicListReasonGroups \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 34 'PublicListReasonGroups' test.out

#- 35 PublicGetReasons
./ng net.accelbyte.sdk.cli.Main reporting publicGetReasons \
    --namespace "$AB_NAMESPACE" \
    --group 'haOYgHnu' \
    --limit '1' \
    --offset '67' \
    --title 'wHHlyLDJ' \
    > test.out 2>&1
eval_tap $? 35 'PublicGetReasons' test.out

#- 36 SubmitReport
./ng net.accelbyte.sdk.cli.Main reporting submitReport \
    --namespace "$AB_NAMESPACE" \
    --body '{"additionalInfo": {"iiicjTa5": {}, "S3A5fe3i": {}, "BwbKYyJO": {}}, "category": "UGC", "comment": "n9FGfCCg", "extensionCategory": "wZwIOjHJ", "objectId": "ZfQAsBda", "objectType": "Oc8TNKLN", "reason": "hwZVs8nq", "userId": "8UQBilO8"}' \
    > test.out 2>&1
eval_tap $? 36 'SubmitReport' test.out


rm -f "tmp.dat"

exit $EXIT_CODE