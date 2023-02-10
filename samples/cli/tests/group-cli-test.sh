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
    --limit '77' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "wWxpv9Ac", "description": "RM6zBAm7", "globalRules": [{"allowedAction": "FCalWnoA", "ruleDetail": [{"ruleAttribute": "jU6zBBU0", "ruleCriteria": "MAXIMUM", "ruleValue": 0.11352658151535067}, {"ruleAttribute": "0vBwYR35", "ruleCriteria": "EQUAL", "ruleValue": 0.0023934670289560422}, {"ruleAttribute": "RIXqJIeD", "ruleCriteria": "MINIMUM", "ruleValue": 0.02721302025585204}]}, {"allowedAction": "QSVN0aVF", "ruleDetail": [{"ruleAttribute": "p2naMHls", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5256096225384062}, {"ruleAttribute": "WCKU4Yr5", "ruleCriteria": "MAXIMUM", "ruleValue": 0.029646846479499778}, {"ruleAttribute": "GMWpDyg4", "ruleCriteria": "EQUAL", "ruleValue": 0.4061763181799759}]}, {"allowedAction": "oOVMFhib", "ruleDetail": [{"ruleAttribute": "Y7XNfKXt", "ruleCriteria": "EQUAL", "ruleValue": 0.9612449803644814}, {"ruleAttribute": "dfdHqC4b", "ruleCriteria": "MINIMUM", "ruleValue": 0.03392698931916127}, {"ruleAttribute": "aTIuC7zK", "ruleCriteria": "EQUAL", "ruleValue": 0.9326157571384232}]}], "groupAdminRoleId": "9UyUA1eb", "groupMaxMember": 3, "groupMemberRoleId": "AnIN2Yqz", "name": "noOvVgd0"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '59QiPwZd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode '4wnbHgXe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'lHX8vwPQ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "YoJfoxoK", "groupMaxMember": 29, "name": "SXmJQHe1"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Xdqjn6G6' \
    --configurationCode 'y6fcsNf0' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "yeKBkYhC", "ruleCriteria": "MINIMUM", "ruleValue": 0.08532162735854565}, {"ruleAttribute": "UzeR5VHn", "ruleCriteria": "EQUAL", "ruleValue": 0.7210023787137014}, {"ruleAttribute": "dnhLnZQi", "ruleCriteria": "EQUAL", "ruleValue": 0.318348241872923}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'yXiB1j7m' \
    --configurationCode 'kNdAoZR3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'aQNKvdox' \
    --groupName 'PndBUjiD' \
    --groupRegion '6eiwlwty' \
    --limit '95' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'pdkGJSSg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'bUlrWQ7N' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'ExvXjOae' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '48' \
    --order '5LqPFriQ' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '98' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "o6lNmFly", "memberRolePermissions": [{"action": 36, "resourceName": "9z0ddzkL"}, {"action": 6, "resourceName": "p7NHuhlC"}, {"action": 84, "resourceName": "IzsgFL6A"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'x6ugz7yi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'MMmZc8km' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId '4k5q1NGd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "thhMBvU5"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'EuTbTpRa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 29, "resourceName": "aiucI7xJ"}, {"action": 39, "resourceName": "VzlIJGwU"}, {"action": 98, "resourceName": "4PPkC0Jm"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'dZeqgDE2' \
    --groupRegion 'm7h8f6dL' \
    --limit '49' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "T6AkEU6A", "customAttributes": {"8Z2eA6f6": {}, "n2iiQ1SK": {}, "cwNmPG3I": {}}, "groupDescription": "PQQm0fsx", "groupIcon": "uFEGLbh8", "groupMaxMember": 62, "groupName": "35hCtpdL", "groupRegion": "weUGOGY4", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "ZTigQ1v4", "ruleDetail": [{"ruleAttribute": "MdGUnc95", "ruleCriteria": "EQUAL", "ruleValue": 0.39017055764424213}, {"ruleAttribute": "HdplScb8", "ruleCriteria": "EQUAL", "ruleValue": 0.13411482632441507}, {"ruleAttribute": "GgXO1NkD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5068283834455387}]}, {"allowedAction": "zR194bgH", "ruleDetail": [{"ruleAttribute": "1cUb88NO", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7641447192471172}, {"ruleAttribute": "WnLJdfmD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.40014353709778716}, {"ruleAttribute": "SdI3TI88", "ruleCriteria": "EQUAL", "ruleValue": 0.5948534941862595}]}, {"allowedAction": "Ev3qjNv2", "ruleDetail": [{"ruleAttribute": "fGdizsb5", "ruleCriteria": "MINIMUM", "ruleValue": 0.2346642361115736}, {"ruleAttribute": "ELSbbf6N", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8939266139610035}, {"ruleAttribute": "oPXxmFi2", "ruleCriteria": "MINIMUM", "ruleValue": 0.3787487298893306}]}]}, "groupType": "IJzEWnja"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'HwV7ouKy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'iadC1xUN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Grucahmg", "groupIcon": "9ciwy0D6", "groupName": "2FnuMaJn", "groupRegion": "YigQhANR", "groupType": "ADOaxp8r"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'UbIy82Ut' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId '7W3OAZZH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "FWczeDPb", "groupIcon": "hdL4AMXi", "groupName": "A2c0P7tT", "groupRegion": "XVa3fI8b", "groupType": "6obmFjEq"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'yLTAa14S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"faBjKoXs": {}, "09e64dsz": {}, "l6jOdna3": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'mc2yuIEQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'Nr9YMIhl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'Xl9yIOMy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'yjRZyNjR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'YTS1CICt' \
    --namespace "$AB_NAMESPACE" \
    --limit '93' \
    --offset '11' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'mBJNvoYH' \
    --namespace "$AB_NAMESPACE" \
    --limit '42' \
    --offset '27' \
    --order '3kKy6cAT' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'hhpdtv0q' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"tUJNE2O3": {}, "5hjlmEpX": {}, "Z214Cark": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'I1FqGzkB' \
    --groupId 'oQa6L72Y' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "sASdWDS0", "ruleCriteria": "MINIMUM", "ruleValue": 0.3277312579909666}, {"ruleAttribute": "5PktSuKK", "ruleCriteria": "MINIMUM", "ruleValue": 0.953560690804308}, {"ruleAttribute": "jr8ifF4e", "ruleCriteria": "EQUAL", "ruleValue": 0.5572279447659899}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'mclnfwuG' \
    --groupId 'MEafE0pz' \
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
    --limit '30' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'nR8KQuvK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "njnTrAvH"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId '03mWeSYl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "LCKvSsA3"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '94' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RirHB0v9' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Cyk8Oxvi' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'DlwOzXFb' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YBavOAFA' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'JAJH8iFi' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'YH1vyIv9' \
    --limit '45' \
    --offset '63' \
    > test.out 2>&1
eval_tap $? 46 'GetUserJoinedGroupInformationPublicV2' test.out

#- 47 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "tpAiABwj", "customAttributes": {"EyaOXJW3": {}, "hwfOR5g2": {}, "8QfNtVVa": {}}, "groupDescription": "Ml8Ci6JX", "groupIcon": "BCfmEGgM", "groupMaxMember": 19, "groupName": "Lte1Huyf", "groupRegion": "knwJyHQ6", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "K4p93r1w", "ruleDetail": [{"ruleAttribute": "bKx9rN67", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6818334010668518}, {"ruleAttribute": "7bHRBlcw", "ruleCriteria": "MINIMUM", "ruleValue": 0.3364836157995529}, {"ruleAttribute": "XI8s96pS", "ruleCriteria": "MINIMUM", "ruleValue": 0.8072705280015632}]}, {"allowedAction": "oguD5sTV", "ruleDetail": [{"ruleAttribute": "Br8biX1J", "ruleCriteria": "MINIMUM", "ruleValue": 0.33862633464558844}, {"ruleAttribute": "KKa0NwTZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.34409556992736456}, {"ruleAttribute": "YVgaaRhK", "ruleCriteria": "EQUAL", "ruleValue": 0.9969660380808498}]}, {"allowedAction": "OMoYKuA3", "ruleDetail": [{"ruleAttribute": "g3VPHPSq", "ruleCriteria": "EQUAL", "ruleValue": 0.48124768224531544}, {"ruleAttribute": "GZvGqM81", "ruleCriteria": "MINIMUM", "ruleValue": 0.3913489185900575}, {"ruleAttribute": "YCzt6me6", "ruleCriteria": "MAXIMUM", "ruleValue": 0.14556453793165114}]}]}, "groupType": "6RlFHUVe"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateNewGroupPublicV2' test.out

#- 48 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["LQw2FnQo", "0Btwofzh", "iun3cFNU"]}' \
    > test.out 2>&1
eval_tap $? 48 'GetListGroupByIDsV2' test.out

#- 49 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'G618gnsH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "YGzb8KrQ", "groupIcon": "vOgh4qi6", "groupName": "yjCdByXv", "groupRegion": "hQicnPKq", "groupType": "B9xjNDgb"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePutSingleGroupPublicV2' test.out

#- 50 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId '2Lgg8V5n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteGroupPublicV2' test.out

#- 51 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'PP36YUub' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ENV930rd", "groupIcon": "vTGgBYLh", "groupName": "ts2Qs4DW", "groupRegion": "DfeD4Nez", "groupType": "tAET4ThS"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePatchSingleGroupPublicV2' test.out

#- 52 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'PGpvsYpm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"OIQolBRj": {}, "LwFFbEzr": {}, "dQ1rok8D": {}}}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGroupCustomAttributesPublicV2' test.out

#- 53 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'EzOnlV8o' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AcceptGroupInvitationPublicV2' test.out

#- 54 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'bpJqkHVx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'RejectGroupInvitationPublicV2' test.out

#- 55 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'RCGaVyTb' \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 55 'GetGroupInviteRequestPublicV2' test.out

#- 56 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'ct4sQkK6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'JoinGroupV2' test.out

#- 57 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId '431mEbIQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupJoinRequestPublicV2' test.out

#- 58 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'L8CzgGSq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'LeaveGroupPublicV2' test.out

#- 59 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId '8rmugzoY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"INkSbP2F": {}, "csmvg8NR": {}, "Io3I74yC": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateGroupCustomRulePublicV2' test.out

#- 60 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'iKiVixSe' \
    --groupId 'W9Mc0epU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "WThglviH", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5589775586452667}, {"ruleAttribute": "hfB6zlq5", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8309207613994816}, {"ruleAttribute": "ELDOzepr", "ruleCriteria": "EQUAL", "ruleValue": 0.555866723897961}]}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGroupPredefinedRulePublicV2' test.out

#- 61 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'ZtBBBLvr' \
    --groupId 'EXgPbMvd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteGroupPredefinedRulePublicV2' test.out

#- 62 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 62 'GetMemberRolesListPublicV2' test.out

#- 63 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId '5oQBPYE1' \
    --memberRoleId 'kKxaTiSB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "hcanOAjF"}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateMemberRolePublicV2' test.out

#- 64 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'BArfKQnJ' \
    --memberRoleId 'NkvpGjMD' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "Ek7GviNJ"}' \
    > test.out 2>&1
eval_tap $? 64 'DeleteMemberRolePublicV2' test.out

#- 65 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '11' \
    --offset '3' \
    > test.out 2>&1
eval_tap $? 65 'GetUserGroupInformationPublicV2' test.out

#- 66 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '4' \
    > test.out 2>&1
eval_tap $? 66 'GetMyGroupJoinRequestV2' test.out

#- 67 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '1wbTkOxX' \
    --namespace "$AB_NAMESPACE" \
    --userId 'NlnMBo28' \
    > test.out 2>&1
eval_tap $? 67 'InviteGroupPublicV2' test.out

#- 68 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'zwS7xxNy' \
    --namespace "$AB_NAMESPACE" \
    --userId '9XTyRdtP' \
    > test.out 2>&1
eval_tap $? 68 'CancelInvitationGroupMemberV2' test.out

#- 69 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId '7Uuvb9vS' \
    --namespace "$AB_NAMESPACE" \
    --userId '8tn0KcuB' \
    > test.out 2>&1
eval_tap $? 69 'AcceptGroupJoinRequestPublicV2' test.out

#- 70 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'pLQuB1gt' \
    --namespace "$AB_NAMESPACE" \
    --userId 'jWnSx0gc' \
    > test.out 2>&1
eval_tap $? 70 'RejectGroupJoinRequestPublicV2' test.out

#- 71 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'VIRb2ZEc' \
    --namespace "$AB_NAMESPACE" \
    --userId 'm49tDI2L' \
    > test.out 2>&1
eval_tap $? 71 'KickGroupMemberPublicV2' test.out

#- 72 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'ToVzLypD' \
    --namespace "$AB_NAMESPACE" \
    --userId '0eIUDXyf' \
    > test.out 2>&1
eval_tap $? 72 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE