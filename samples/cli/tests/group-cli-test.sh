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
echo "1..72"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 ListGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group listGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '59' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "FUCgjZNW", "description": "0SYu1sue", "globalRules": [{"allowedAction": "0ojFYDYm", "ruleDetail": [{"ruleAttribute": "vqEKz36M", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7948806567912832}, {"ruleAttribute": "8dhYKEmk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3540354535754787}, {"ruleAttribute": "c0L7T9Ts", "ruleCriteria": "MINIMUM", "ruleValue": 0.36681506825774113}]}, {"allowedAction": "zSPdCEco", "ruleDetail": [{"ruleAttribute": "txJ90pPf", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8834159355186355}, {"ruleAttribute": "ylEZddRA", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4672711429167484}, {"ruleAttribute": "07mCpq9L", "ruleCriteria": "EQUAL", "ruleValue": 0.7520717700288754}]}, {"allowedAction": "LnFR1oSg", "ruleDetail": [{"ruleAttribute": "UW7vkqsy", "ruleCriteria": "EQUAL", "ruleValue": 0.13415488677635734}, {"ruleAttribute": "t2yRUD2S", "ruleCriteria": "EQUAL", "ruleValue": 0.6458812955221958}, {"ruleAttribute": "RdUHP406", "ruleCriteria": "MINIMUM", "ruleValue": 0.5807006629436616}]}], "groupAdminRoleId": "DvpbTED8", "groupMaxMember": 15, "groupMemberRoleId": "yt9910lL", "name": "Gs9TzHGy"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'a6e2fM4v' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'ab6pkh1k' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode '1ORomE8v' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "D0XwXr4V", "groupMaxMember": 1, "name": "XGOIgohD"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '89qGTDXu' \
    --configurationCode '9UQVzlYr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "84P5Cd9n", "ruleCriteria": "MAXIMUM", "ruleValue": 0.01825157482961659}, {"ruleAttribute": "KGGAmrA7", "ruleCriteria": "MINIMUM", "ruleValue": 0.13310462397256373}, {"ruleAttribute": "MGXTKaFo", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3345214869582389}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '6lv0edHd' \
    --configurationCode 'Fnc532ps' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'klYg240a' \
    --groupName 'WYe5AsOx' \
    --groupRegion '3yRTxOmt' \
    --limit '70' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'RaTeltba' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'et8ggRsC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'BwRtLG95' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '42' \
    --order 'A1iPSWmZ' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "GtYEyVGy", "memberRolePermissions": [{"action": 84, "resourceName": "BbHUTLFS"}, {"action": 94, "resourceName": "Ry7wvpoB"}, {"action": 6, "resourceName": "WMl6dvFN"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'woq9JctU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'nODENU3g' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'TftjxY7H' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "pEB2sgs6"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'M6XBQm6J' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 9, "resourceName": "3oeR84M2"}, {"action": 88, "resourceName": "SfKArN0H"}, {"action": 21, "resourceName": "vKqUrTTE"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'Ae11k0M3' \
    --groupRegion '0dK984oV' \
    --limit '8' \
    --offset '29' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "RHNG3ZKc", "customAttributes": {"jTAOpwxi": {}, "Y905j0z2": {}, "RQ2d8yqv": {}}, "groupDescription": "a10m9Qrx", "groupIcon": "HPrBnFQ0", "groupMaxMember": 78, "groupName": "waP4Zv5o", "groupRegion": "R0VAu3lA", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "BPA0C52d", "ruleDetail": [{"ruleAttribute": "KfMjVjcu", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8811723204070476}, {"ruleAttribute": "sZixWvyg", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8150967419222183}, {"ruleAttribute": "dCvhR52J", "ruleCriteria": "MAXIMUM", "ruleValue": 0.10525767414218856}]}, {"allowedAction": "7szQh1lV", "ruleDetail": [{"ruleAttribute": "YTwrkKoH", "ruleCriteria": "EQUAL", "ruleValue": 0.37510540524391944}, {"ruleAttribute": "5FINrrZS", "ruleCriteria": "MINIMUM", "ruleValue": 0.7556505782840622}, {"ruleAttribute": "LTFs8CcG", "ruleCriteria": "EQUAL", "ruleValue": 0.7682220930524727}]}, {"allowedAction": "ktzw6bED", "ruleDetail": [{"ruleAttribute": "2TcGVhZm", "ruleCriteria": "EQUAL", "ruleValue": 0.7450409513376958}, {"ruleAttribute": "DW9zLmf2", "ruleCriteria": "EQUAL", "ruleValue": 0.7750833522401596}, {"ruleAttribute": "9nDuSEYn", "ruleCriteria": "EQUAL", "ruleValue": 0.7633606469015689}]}]}, "groupType": "fxJ34xwt"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '5Zaf8D7Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'ky7DQgBd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "fXfFvxJF", "groupIcon": "LMe6JL7w", "groupName": "XlFnpXHp", "groupRegion": "EiA0rfdc", "groupType": "513u2ImA"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'bnWFahW0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'Do7ge5Eu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "5XoAAiXo", "groupIcon": "SZX7ZAVm", "groupName": "TmXATdb6", "groupRegion": "9AjyonoM", "groupType": "dsFDYcor"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ypwQblfe' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"Cmi0a4iE": {}, "6MP1YtTA": {}, "COcjZWzi": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'TvOK5PHB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'aXmBBjEh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'zappbJZi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'WNUiL0FE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'NqFuYURh' \
    --namespace "$AB_NAMESPACE" \
    --limit '57' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'QD2HCwnY' \
    --namespace "$AB_NAMESPACE" \
    --limit '62' \
    --offset '72' \
    --order 'wMRZhzF1' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'wn9UNwWx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"cV4NKwYA": {}, "uvWQ4Psn": {}, "RUDsvwRF": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'KKUMdBTw' \
    --groupId '1mKDGOBC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "27PDHgJI", "ruleCriteria": "EQUAL", "ruleValue": 0.9169960331998572}, {"ruleAttribute": "9Pv5ggqi", "ruleCriteria": "MINIMUM", "ruleValue": 0.026055139275123262}, {"ruleAttribute": "Og71s4pr", "ruleCriteria": "MINIMUM", "ruleValue": 0.06934841270279124}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'AeJ6vriJ' \
    --groupId '4rzQxFPg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 35 'DeleteGroupPredefinedRulePublicV1' test.out

#- 36 LeaveGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'LeaveGroupPublicV1' test.out

#- 37 GetMemberRolesListPublicV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '91' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'RXoLDnFB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "JOvgVHND"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'iNlNif3e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "OQFXw2yz"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '32' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sYUG839G' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'wuvmifeF' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'GnrP7liE' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1d3chkY9' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'yQOElOMY' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Wl7ZIgW1' \
    --limit '0' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 46 'GetUserJoinedGroupInformationPublicV2' test.out

#- 47 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "raOBxao2", "customAttributes": {"5TMd1LCw": {}, "HT8plI0p": {}, "j2zaGFiV": {}}, "groupDescription": "ab94nlYf", "groupIcon": "jbEG1w7U", "groupMaxMember": 50, "groupName": "l6vxKhwu", "groupRegion": "TOZHcWcW", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "g4vmKKS9", "ruleDetail": [{"ruleAttribute": "tUGa2pxq", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9886506057741099}, {"ruleAttribute": "hBYNmqsT", "ruleCriteria": "EQUAL", "ruleValue": 0.9979082012915864}, {"ruleAttribute": "BHIdlXpV", "ruleCriteria": "MINIMUM", "ruleValue": 0.9696183927545433}]}, {"allowedAction": "G48DRrq4", "ruleDetail": [{"ruleAttribute": "IQBGUQXq", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9867472981021379}, {"ruleAttribute": "sZxtNUgd", "ruleCriteria": "MAXIMUM", "ruleValue": 0.783389251386974}, {"ruleAttribute": "anIKQZWv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7129422248105914}]}, {"allowedAction": "gwNgk94t", "ruleDetail": [{"ruleAttribute": "6tNXPsoo", "ruleCriteria": "MINIMUM", "ruleValue": 0.6841587946987833}, {"ruleAttribute": "YUTTSKku", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1518023175265345}, {"ruleAttribute": "FSSc3oJk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.924992884750986}]}]}, "groupType": "cI3W2ypB"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateNewGroupPublicV2' test.out

#- 48 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["ovGP4tV7", "exUfFPMc", "wzJ6YIFm"]}' \
    > test.out 2>&1
eval_tap $? 48 'GetListGroupByIDsV2' test.out

#- 49 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'Cf6wPjxa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "r2RPseov", "groupIcon": "Y70rLjfN", "groupName": "5GZ63Hb5", "groupRegion": "JFAF9MCt", "groupType": "9lLKc7Tk"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePutSingleGroupPublicV2' test.out

#- 50 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'AIn7xHD1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteGroupPublicV2' test.out

#- 51 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'dEuRNYcn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "KxhcejYf", "groupIcon": "K5vVG7rm", "groupName": "7p5oGCaq", "groupRegion": "tDBIpMrn", "groupType": "ereBJ6Db"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePatchSingleGroupPublicV2' test.out

#- 52 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'leMf6lqz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"8F6TU6Zp": {}, "a1Tl1Jik": {}, "mzi0TMZ9": {}}}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGroupCustomAttributesPublicV2' test.out

#- 53 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'WCuh04or' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AcceptGroupInvitationPublicV2' test.out

#- 54 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId '8kvoqxZ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'RejectGroupInvitationPublicV2' test.out

#- 55 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId '1fxgxr7u' \
    --namespace "$AB_NAMESPACE" \
    --limit '86' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 55 'GetGroupInviteRequestPublicV2' test.out

#- 56 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '5S4BW9IC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'JoinGroupV2' test.out

#- 57 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'BFmQQFsp' \
    --namespace "$AB_NAMESPACE" \
    --limit '41' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupJoinRequestPublicV2' test.out

#- 58 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'hjTeq0r0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'LeaveGroupPublicV2' test.out

#- 59 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'DVr0wINg' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"nnltZ8xK": {}, "UMBTq0f3": {}, "Hs4gZdO7": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateGroupCustomRulePublicV2' test.out

#- 60 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction '4ZG7uuBx' \
    --groupId 'ZpwTqe6R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "JLVSfqDW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.03568611602886884}, {"ruleAttribute": "qOU0GD0M", "ruleCriteria": "EQUAL", "ruleValue": 0.6841219143167087}, {"ruleAttribute": "A9arlJdy", "ruleCriteria": "EQUAL", "ruleValue": 0.6971599715729707}]}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGroupPredefinedRulePublicV2' test.out

#- 61 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'oFhlHrZI' \
    --groupId 'PBxv13l5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteGroupPredefinedRulePublicV2' test.out

#- 62 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 62 'GetMemberRolesListPublicV2' test.out

#- 63 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '01SWvTRG' \
    --memberRoleId 'xIR1j9SY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "1BZxjUJc"}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateMemberRolePublicV2' test.out

#- 64 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId '9973MM2K' \
    --memberRoleId 'NKm6l42m' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "6yqn98RB"}' \
    > test.out 2>&1
eval_tap $? 64 'DeleteMemberRolePublicV2' test.out

#- 65 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '19' \
    --offset '47' \
    > test.out 2>&1
eval_tap $? 65 'GetUserGroupInformationPublicV2' test.out

#- 66 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '91' \
    > test.out 2>&1
eval_tap $? 66 'GetMyGroupJoinRequestV2' test.out

#- 67 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '02GKyfZV' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XzBFzZpY' \
    > test.out 2>&1
eval_tap $? 67 'InviteGroupPublicV2' test.out

#- 68 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'qVLs8RxB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'vR4Tu4XW' \
    > test.out 2>&1
eval_tap $? 68 'CancelInvitationGroupMemberV2' test.out

#- 69 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'V64Z38Y4' \
    --namespace "$AB_NAMESPACE" \
    --userId '2U0O6wSQ' \
    > test.out 2>&1
eval_tap $? 69 'AcceptGroupJoinRequestPublicV2' test.out

#- 70 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'fOzjOGWD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CdYsHeY3' \
    > test.out 2>&1
eval_tap $? 70 'RejectGroupJoinRequestPublicV2' test.out

#- 71 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'rBrD1qDm' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bfbZkHhQ' \
    > test.out 2>&1
eval_tap $? 71 'KickGroupMemberPublicV2' test.out

#- 72 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'pQmYX1la' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ReyBSlUu' \
    > test.out 2>&1
eval_tap $? 72 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE