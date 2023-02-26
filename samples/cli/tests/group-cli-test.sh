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
echo "1..73"

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
    --limit '12' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "cgsYciXB", "description": "U14E58Ei", "globalRules": [{"allowedAction": "HUVh5Vrh", "ruleDetail": [{"ruleAttribute": "tOJH0Oy3", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9875953090905916}, {"ruleAttribute": "kWMGozqI", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6362373201346829}, {"ruleAttribute": "bCkt57pB", "ruleCriteria": "MAXIMUM", "ruleValue": 0.19211705835059778}]}, {"allowedAction": "tLXWc3R3", "ruleDetail": [{"ruleAttribute": "tEFOov3d", "ruleCriteria": "EQUAL", "ruleValue": 0.13027450093247095}, {"ruleAttribute": "VEI0iuOz", "ruleCriteria": "MINIMUM", "ruleValue": 0.15473356282380146}, {"ruleAttribute": "cTzIHsDG", "ruleCriteria": "MINIMUM", "ruleValue": 0.7758454606382881}]}, {"allowedAction": "DezZQvuY", "ruleDetail": [{"ruleAttribute": "TAewnbeb", "ruleCriteria": "EQUAL", "ruleValue": 0.5821557353075274}, {"ruleAttribute": "FAXoo5e0", "ruleCriteria": "MINIMUM", "ruleValue": 0.023742796803615573}, {"ruleAttribute": "pBXUOzLa", "ruleCriteria": "MAXIMUM", "ruleValue": 0.1776841867068909}]}], "groupAdminRoleId": "i4QPY08o", "groupMaxMember": 2, "groupMemberRoleId": "SYXHJI3E", "name": "PEiniCRX"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'zswqaueU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'kHatjRfB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'euf1AeRq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "Np78ojOi", "groupMaxMember": 78, "name": "vZ4TTXZK"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'zwCF8xV3' \
    --configurationCode 'WZgID9n1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "BZFKKIxi", "ruleCriteria": "MAXIMUM", "ruleValue": 0.21585454325770925}, {"ruleAttribute": "NRbVFbvL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3895203360646313}, {"ruleAttribute": "OLshXcKB", "ruleCriteria": "MAXIMUM", "ruleValue": 0.964775223462645}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'tvDRCUHR' \
    --configurationCode 'Xhpb30ar' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'tRTOJ602' \
    --groupName 'I0tWmNtx' \
    --groupRegion 'K7g6N9wV' \
    --limit '49' \
    --offset '95' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId '1XDjxgnN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'bUVUxWRb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 's2TEsluf' \
    --namespace "$AB_NAMESPACE" \
    --limit '78' \
    --offset '21' \
    --order '4wINDrUz' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '79' \
    --offset '71' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "SuOH0Bmc", "memberRolePermissions": [{"action": 38, "resourceName": "NSWuBuYQ"}, {"action": 81, "resourceName": "4Igf5100"}, {"action": 85, "resourceName": "ifC3zSzE"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'gftipCM5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'ETcrzhqa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId '2aNd5VzU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "Ds2TNpAk"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'r1bY25cT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 23, "resourceName": "ErhXRGUM"}, {"action": 76, "resourceName": "iqwTZL5u"}, {"action": 92, "resourceName": "tDNIADZV"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'xRxUTQgi' \
    --groupRegion '6ANmJy3i' \
    --limit '86' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "keAnBd4u", "customAttributes": {"XsaQpKGx": {}, "3wqCVcv5": {}, "p1AN1iV6": {}}, "groupDescription": "vk5Ljhqa", "groupIcon": "hFtaaU6k", "groupMaxMember": 77, "groupName": "rYWNAjHU", "groupRegion": "kyQubiQZ", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "SDdEDut2", "ruleDetail": [{"ruleAttribute": "vVyfNDJv", "ruleCriteria": "EQUAL", "ruleValue": 0.48327269038786214}, {"ruleAttribute": "QiP8mvdD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4903813561382089}, {"ruleAttribute": "o4xXPr19", "ruleCriteria": "MAXIMUM", "ruleValue": 0.17166915037502828}]}, {"allowedAction": "9dLx4TZa", "ruleDetail": [{"ruleAttribute": "fNHPyuXv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.831197898054498}, {"ruleAttribute": "kAQTvj0d", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7902147080867147}, {"ruleAttribute": "VDcUIymS", "ruleCriteria": "EQUAL", "ruleValue": 0.763603183989304}]}, {"allowedAction": "tpv61R0o", "ruleDetail": [{"ruleAttribute": "0wafi1vv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8933631949969938}, {"ruleAttribute": "fPytYTMc", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8950120074580001}, {"ruleAttribute": "o5r4USbB", "ruleCriteria": "EQUAL", "ruleValue": 0.01596292297943558}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'NBvtyelZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '63trDo0X' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "sdOzqXJo", "groupIcon": "7Ar4SdHW", "groupName": "xZM1lj42", "groupRegion": "1yNAguxy", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'YJbDZk4M' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'eSgaonnJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "nQmO1jC2", "groupIcon": "ogDEgMRf", "groupName": "kcIQHMBv", "groupRegion": "Ct56UkRs", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId '34pxq9AE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"KBiAhZGB": {}, "FPiq0Uc1": {}, "JLIHtaPC": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId '7snTXzML' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'A3GNgvnR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId '7AnnucvE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'qGA7hBB5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'KxwiPVur' \
    --namespace "$AB_NAMESPACE" \
    --limit '7' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'phQRnx6b' \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '83' \
    --order 'EP9M9M3A' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'vRt6Vmn1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"EmQd8X2U": {}, "GRNXjBl5": {}, "aDYtgHA1": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction '4fkk1hd0' \
    --groupId 'XPI56K6j' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "vfX354Os", "ruleCriteria": "EQUAL", "ruleValue": 0.14059630010833013}, {"ruleAttribute": "KUbbJeru", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6465011948143641}, {"ruleAttribute": "YsL5o9kh", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3927997459637588}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'SbSAxjyG' \
    --groupId 'PknQZ5T6' \
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
    --limit '84' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'ICzEgEfJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "LSJaqlOk"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'QWCAqgiq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "e5VfWmas"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '60' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'hiNVKVoL' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8PEBnY1m' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mKUuf6Hn' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '44ofZBhy' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'g2YJ0Jbl' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["LEpryHnP", "74ERfnlW", "2yy1HdB8"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JouYFqSN' \
    --limit '80' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "tyY4vARt", "customAttributes": {"5DhqMsDe": {}, "3b88gAbK": {}, "DsJ422J1": {}}, "groupDescription": "AUy1P5KJ", "groupIcon": "ujjd5sN7", "groupMaxMember": 89, "groupName": "dZZfcTob", "groupRegion": "tChQCmUa", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "TPOMY2Bo", "ruleDetail": [{"ruleAttribute": "AHzylR4C", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4328508034970059}, {"ruleAttribute": "cQY9FQ5O", "ruleCriteria": "MAXIMUM", "ruleValue": 0.34376331967051477}, {"ruleAttribute": "Mcz3vEdK", "ruleCriteria": "MINIMUM", "ruleValue": 0.3831461371476357}]}, {"allowedAction": "vRbRe4dJ", "ruleDetail": [{"ruleAttribute": "BAytYUig", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7599384757016329}, {"ruleAttribute": "cRZrDEjz", "ruleCriteria": "EQUAL", "ruleValue": 0.7675719637505102}, {"ruleAttribute": "J9fKujWL", "ruleCriteria": "MINIMUM", "ruleValue": 0.21969649810732594}]}, {"allowedAction": "r6lCTg2K", "ruleDetail": [{"ruleAttribute": "4mHQVIJA", "ruleCriteria": "MINIMUM", "ruleValue": 0.2322919051106962}, {"ruleAttribute": "W0gdBar2", "ruleCriteria": "EQUAL", "ruleValue": 0.11936644951742459}, {"ruleAttribute": "num1lBJH", "ruleCriteria": "EQUAL", "ruleValue": 0.4974712866469744}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateNewGroupPublicV2' test.out

#- 49 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["3mPj8T6i", "KZeKc2lg", "xapV6HIo"]}' \
    > test.out 2>&1
eval_tap $? 49 'GetListGroupByIDsV2' test.out

#- 50 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'AaXuldpQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ZbZGdGxY", "groupIcon": "ms8pw5bw", "groupName": "dJcAcSlW", "groupRegion": "tAmUbsBZ", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdatePutSingleGroupPublicV2' test.out

#- 51 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'biwTIDYT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'DeleteGroupPublicV2' test.out

#- 52 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'ouUdRYFo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "47nNSapr", "groupIcon": "0MnZs2J1", "groupName": "TSQViTbl", "groupRegion": "DbkIWMqO", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdatePatchSingleGroupPublicV2' test.out

#- 53 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'VSgRcD67' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"8ZB0Tepf": {}, "zUPhuRvc": {}, "czaxBoWd": {}}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateGroupCustomAttributesPublicV2' test.out

#- 54 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'vO3WNlNq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AcceptGroupInvitationPublicV2' test.out

#- 55 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'DFw7met7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'RejectGroupInvitationPublicV2' test.out

#- 56 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'eLLFnRIk' \
    --namespace "$AB_NAMESPACE" \
    --limit '12' \
    --offset '83' \
    > test.out 2>&1
eval_tap $? 56 'GetGroupInviteRequestPublicV2' test.out

#- 57 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'LaAfDIA4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'JoinGroupV2' test.out

#- 58 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'ub3cmYrr' \
    --namespace "$AB_NAMESPACE" \
    --limit '69' \
    --offset '34' \
    > test.out 2>&1
eval_tap $? 58 'GetGroupJoinRequestPublicV2' test.out

#- 59 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId '1DgDcc3r' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'LeaveGroupPublicV2' test.out

#- 60 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'atbpbE8k' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"z50rBYgq": {}, "BKSE4Bvq": {}, "cnhVoCOq": {}}}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGroupCustomRulePublicV2' test.out

#- 61 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'y6C38KeB' \
    --groupId 'TdDo2tq2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "AGbUoBC7", "ruleCriteria": "MAXIMUM", "ruleValue": 0.29713101204227343}, {"ruleAttribute": "OkMRAjNW", "ruleCriteria": "MINIMUM", "ruleValue": 0.878951522799598}, {"ruleAttribute": "8YFMZjy8", "ruleCriteria": "MINIMUM", "ruleValue": 0.1104880158912438}]}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupPredefinedRulePublicV2' test.out

#- 62 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'oGEXMosR' \
    --groupId 'WzAbpeCT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteGroupPredefinedRulePublicV2' test.out

#- 63 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 63 'GetMemberRolesListPublicV2' test.out

#- 64 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '6B4waaFA' \
    --memberRoleId 'VwehvGOd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Qxoi2vrr"}' \
    > test.out 2>&1
eval_tap $? 64 'UpdateMemberRolePublicV2' test.out

#- 65 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'kBBpZlBr' \
    --memberRoleId 'h0vsolmC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "nHEhqPsu"}' \
    > test.out 2>&1
eval_tap $? 65 'DeleteMemberRolePublicV2' test.out

#- 66 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '73' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 66 'GetUserGroupInformationPublicV2' test.out

#- 67 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 67 'GetMyGroupJoinRequestV2' test.out

#- 68 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '32ChBFpc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SynVTtPi' \
    > test.out 2>&1
eval_tap $? 68 'InviteGroupPublicV2' test.out

#- 69 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId '2UG2jbnD' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qJ79guGc' \
    > test.out 2>&1
eval_tap $? 69 'CancelInvitationGroupMemberV2' test.out

#- 70 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'b6c2ysxT' \
    --namespace "$AB_NAMESPACE" \
    --userId 's0omXmUG' \
    > test.out 2>&1
eval_tap $? 70 'AcceptGroupJoinRequestPublicV2' test.out

#- 71 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId '22zhDNe9' \
    --namespace "$AB_NAMESPACE" \
    --userId '6u2itsbQ' \
    > test.out 2>&1
eval_tap $? 71 'RejectGroupJoinRequestPublicV2' test.out

#- 72 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'Xno8p9fa' \
    --namespace "$AB_NAMESPACE" \
    --userId 'MInJCr5M' \
    > test.out 2>&1
eval_tap $? 72 'KickGroupMemberPublicV2' test.out

#- 73 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'ua6lydZw' \
    --namespace "$AB_NAMESPACE" \
    --userId '4sn2y2tK' \
    > test.out 2>&1
eval_tap $? 73 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE