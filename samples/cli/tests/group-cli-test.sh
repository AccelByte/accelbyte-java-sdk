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
echo "1..45"

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
    --limit '68' \
    --offset '16' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "vEitGgHm", "description": "CnCilKEu", "globalRules": [{"allowedAction": "n4TiNGbF", "ruleDetail": [{"ruleAttribute": "u30Yx2S8", "ruleCriteria": "MINIMUM", "ruleValue": 0.07486723373939086}, {"ruleAttribute": "gLXhKc36", "ruleCriteria": "EQUAL", "ruleValue": 0.8642278196693115}, {"ruleAttribute": "Nhof2YSB", "ruleCriteria": "EQUAL", "ruleValue": 0.38838811163559717}]}, {"allowedAction": "BDqvDk0a", "ruleDetail": [{"ruleAttribute": "WWleagaN", "ruleCriteria": "MINIMUM", "ruleValue": 0.00926678109754675}, {"ruleAttribute": "Xs5rGHuc", "ruleCriteria": "MINIMUM", "ruleValue": 0.5844820110813922}, {"ruleAttribute": "HD9Db0bZ", "ruleCriteria": "EQUAL", "ruleValue": 0.234956165871248}]}, {"allowedAction": "UZKnYaJP", "ruleDetail": [{"ruleAttribute": "OR1DUSE2", "ruleCriteria": "MINIMUM", "ruleValue": 0.6179179419099811}, {"ruleAttribute": "FRdKtphp", "ruleCriteria": "MINIMUM", "ruleValue": 0.6325189599764411}, {"ruleAttribute": "MtBL0dte", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4448947603467146}]}], "groupAdminRoleId": "AvoxL3fO", "groupMaxMember": 53, "groupMemberRoleId": "e1VpURJE", "name": "2WhUIJRY"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'VSYsBW30' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'TdGfgFU6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'IPBq62JT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "fNGkJWyV", "groupMaxMember": 5, "name": "6dJheMup"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Ziedt0ld' \
    --configurationCode 'f08xUlYS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "uVnk5DYW", "ruleCriteria": "MINIMUM", "ruleValue": 0.08754275755267282}, {"ruleAttribute": "tEhBmEuQ", "ruleCriteria": "EQUAL", "ruleValue": 0.40276158642397897}, {"ruleAttribute": "E2LBQjrl", "ruleCriteria": "EQUAL", "ruleValue": 0.19978916947723246}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'wdcyvdC1' \
    --configurationCode 'SFfZWXms' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'vPRVEJi5' \
    --groupName 'fVNaRRB7' \
    --groupRegion 'IRKrpOco' \
    --limit '46' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'MmJF3Hdp' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'yujDogQy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'xO5ngVrr' \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '32' \
    --order 'VSrKdWJ5' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '4' \
    --offset '0' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "xr4qtMMm", "memberRolePermissions": [{"action": 30, "resourceName": "pwbNKZ9r"}, {"action": 17, "resourceName": "RRDpZECg"}, {"action": 7, "resourceName": "ei5JLAGu"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'IM1jB6GI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'HEFRFF42' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'Y2i4nDai' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "ZtTeUXqk"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'x3QO6j85' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 59, "resourceName": "bQGL59Sp"}, {"action": 99, "resourceName": "dBJSE3oy"}, {"action": 81, "resourceName": "gOTNBlqb"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'w15fnlPw' \
    --groupRegion '2BlQ03KT' \
    --limit '52' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "NcEglYg0", "customAttributes": {"PoaVInOt": {}, "KgsEdoXe": {}, "zR39k16v": {}}, "groupDescription": "nak1Efe4", "groupIcon": "1C2JurFH", "groupMaxMember": 74, "groupName": "8YKDCn2t", "groupRegion": "ztsidzB5", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "AiNjE02F", "ruleDetail": [{"ruleAttribute": "B2ueDFtV", "ruleCriteria": "MINIMUM", "ruleValue": 0.6322308379035756}, {"ruleAttribute": "eKduubke", "ruleCriteria": "MAXIMUM", "ruleValue": 0.01678511263032556}, {"ruleAttribute": "paq5m8Qt", "ruleCriteria": "MINIMUM", "ruleValue": 0.4724280406297784}]}, {"allowedAction": "7VozNsJG", "ruleDetail": [{"ruleAttribute": "ZWhQALLB", "ruleCriteria": "EQUAL", "ruleValue": 0.26497647283454084}, {"ruleAttribute": "7eCztdNo", "ruleCriteria": "EQUAL", "ruleValue": 0.8879928745295356}, {"ruleAttribute": "UrgaFTpn", "ruleCriteria": "MINIMUM", "ruleValue": 0.4712188024325481}]}, {"allowedAction": "MYxxPV86", "ruleDetail": [{"ruleAttribute": "qvvifXhD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.020999849704769535}, {"ruleAttribute": "HR08tq5H", "ruleCriteria": "MINIMUM", "ruleValue": 0.2873105260562667}, {"ruleAttribute": "HdfyGtwy", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9837346299544341}]}]}, "groupType": "QhC4B03h"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '9UNzQCWA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'auFfMaf8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "NQpWEJGS", "groupIcon": "7EGGtAEh", "groupName": "s5DWFVhO", "groupRegion": "4vCUUZ3i", "groupType": "asMUxbOE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'cML8JoKX' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'FzvM9Kui' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "eyhezwFY", "groupIcon": "prH5q5Rc", "groupName": "PTOXdl2C", "groupRegion": "SZJe0tFs", "groupType": "i9ETaW8l"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'p3E4XfF4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"evB4KVgx": {}, "l1HVf0WS": {}, "piXrseV7": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'E7MNyYlK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '21tjpbpa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'x21bwbQ1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'SsO11lZR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'm9G508G2' \
    --namespace "$AB_NAMESPACE" \
    --limit '3' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId '8jYlgKl1' \
    --namespace "$AB_NAMESPACE" \
    --limit '55' \
    --offset '35' \
    --order 'vok9qpJk' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'ulunQ98B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"0GgxxpAY": {}, "Jjb9ZyfY": {}, "q3hD8AF7": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'm6eXsKQP' \
    --groupId 'USLzqtwr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Btjnz9tL", "ruleCriteria": "EQUAL", "ruleValue": 0.08289090064342863}, {"ruleAttribute": "fgKZtr43", "ruleCriteria": "MINIMUM", "ruleValue": 0.3036394890263221}, {"ruleAttribute": "iAWVzyyP", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7174548219042166}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '6rc89YF3' \
    --groupId 'RMxYrmmB' \
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
    --limit '53' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'ZUp0Ek5n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ytE74cWt"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'bqkZwWvx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "HjARMARr"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '97' \
    --offset '68' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '6ba6Psui' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '1Vmho7sO' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'fp3YAhR2' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '71E3a630' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'mJwXkvJx' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE