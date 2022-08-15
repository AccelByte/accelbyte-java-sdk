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
    --limit '82' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "4uenxdsy", "description": "waA9nQ15", "globalRules": [{"allowedAction": "7WYPSn7t", "ruleDetail": [{"ruleAttribute": "iwaifXsL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7089835208352673}, {"ruleAttribute": "lKHEKqJH", "ruleCriteria": "MINIMUM", "ruleValue": 0.6959801576924834}, {"ruleAttribute": "a11UxEQC", "ruleCriteria": "EQUAL", "ruleValue": 0.5486359433814044}]}, {"allowedAction": "F8tzjorc", "ruleDetail": [{"ruleAttribute": "1OlQFg7u", "ruleCriteria": "MINIMUM", "ruleValue": 0.4303010377231573}, {"ruleAttribute": "LSL745Xf", "ruleCriteria": "MINIMUM", "ruleValue": 0.11035423687916102}, {"ruleAttribute": "IvcE4jk2", "ruleCriteria": "EQUAL", "ruleValue": 0.05323906343682372}]}, {"allowedAction": "KiCXEpEr", "ruleDetail": [{"ruleAttribute": "BLg9DSKQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.16589342347722835}, {"ruleAttribute": "xXtwCh9U", "ruleCriteria": "MINIMUM", "ruleValue": 0.3147171494648602}, {"ruleAttribute": "mIMqHelO", "ruleCriteria": "EQUAL", "ruleValue": 0.2661687079838525}]}], "groupAdminRoleId": "6PImmX1U", "groupMaxMember": 67, "groupMemberRoleId": "ho5tfVAK", "name": "R7Uy5mSI"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'FsRCDgbN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'eoV5KxKG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'X73mT731' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "lYqZuB0m", "groupMaxMember": 16, "name": "pWDefhKx"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'B0moZPVP' \
    --configurationCode 'JptYPfmV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "eXXIjwSC", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8935168295502508}, {"ruleAttribute": "u3DkRNoS", "ruleCriteria": "MINIMUM", "ruleValue": 0.7009095351083048}, {"ruleAttribute": "3xqurvHo", "ruleCriteria": "EQUAL", "ruleValue": 0.6709819128527944}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'NsxA0oFI' \
    --configurationCode 'V1ZVz6zl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'zTWclzbw' \
    --groupName 'kY2zt8GJ' \
    --groupRegion 'TDuAvxmW' \
    --limit '9' \
    --offset '76' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'qKRZfKAG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'VDapW4fv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '6nJjkFJD' \
    --namespace "$AB_NAMESPACE" \
    --limit '81' \
    --offset '42' \
    --order 'JTVsKKhI' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '88' \
    --offset '99' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "PPdgukOD", "memberRolePermissions": [{"action": 92, "resourceName": "z2Jzjl4C"}, {"action": 32, "resourceName": "4Lm3B7VQ"}, {"action": 33, "resourceName": "OKRL9dVs"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'BszIMimI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'Nl30sM6a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'EvNc1Rtv' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "WNCWuDl1"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId '4VhVoPFV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 85, "resourceName": "9wMIiuWJ"}, {"action": 65, "resourceName": "YTA50yCM"}, {"action": 99, "resourceName": "Xo3IBPFk"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'D91puBPH' \
    --groupRegion '0UCOEaEo' \
    --limit '67' \
    --offset '12' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "qXsNzD1Z", "customAttributes": {"2HE6yI3P": {}, "pffDTci9": {}, "QvsutfIP": {}}, "groupDescription": "Z3CjZZdF", "groupIcon": "sKjX8WHq", "groupMaxMember": 47, "groupName": "cVuH75rP", "groupRegion": "In3baObf", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "mW3Q6gt5", "ruleDetail": [{"ruleAttribute": "RTBc66hG", "ruleCriteria": "EQUAL", "ruleValue": 0.04264675847156352}, {"ruleAttribute": "ulm7GBMt", "ruleCriteria": "MINIMUM", "ruleValue": 0.6420384600398245}, {"ruleAttribute": "ep4vS84R", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8218663972171871}]}, {"allowedAction": "vtCtsqkB", "ruleDetail": [{"ruleAttribute": "1fFiVHFL", "ruleCriteria": "EQUAL", "ruleValue": 0.1868517815317131}, {"ruleAttribute": "UADgidWU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3375522007201055}, {"ruleAttribute": "UKtO0h24", "ruleCriteria": "EQUAL", "ruleValue": 0.6304065256567991}]}, {"allowedAction": "t1dLEfVt", "ruleDetail": [{"ruleAttribute": "lT78KSg2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5786872344430423}, {"ruleAttribute": "ziao1NWS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7155318639867772}, {"ruleAttribute": "qKKRwepK", "ruleCriteria": "MINIMUM", "ruleValue": 0.3690905903749444}]}]}, "groupType": "YeKApHBn"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'peNfZifI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'kFcSVpRt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "fK4gByKm", "groupIcon": "57d9OUgf", "groupName": "kacGwHvl", "groupRegion": "KKObmTdz", "groupType": "xPXVWyDH"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'zTiWoy80' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'ogcCSlyN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "DNN2FBD3", "groupIcon": "bloqbbKe", "groupName": "eHFfZuYI", "groupRegion": "7bOi5DdJ", "groupType": "SYeVrawd"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'FfZGEKnN' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"MTVaKHa5": {}, "01ik2ddZ": {}, "1W9IYbRY": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'kJUwGf4l' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'hJl5o5X9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'iUBxhXOf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'Q2Nc0DLD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'HZK30lej' \
    --namespace "$AB_NAMESPACE" \
    --limit '98' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'gRaKjDxZ' \
    --namespace "$AB_NAMESPACE" \
    --limit '52' \
    --offset '29' \
    --order 'oEevuSm8' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'dsUsOAJY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"prCy8GT2": {}, "jBPE8dX1": {}, "Dyy2JiXx": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'ePWLE0Wn' \
    --groupId 'gMVvnh13' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "lozjV6cS", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3230759578378538}, {"ruleAttribute": "yOAHKluC", "ruleCriteria": "EQUAL", "ruleValue": 0.6697126022160125}, {"ruleAttribute": "zWJ6AkyH", "ruleCriteria": "EQUAL", "ruleValue": 0.7915869361229804}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'UBgXkHXH' \
    --groupId 'YasknUto' \
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
    --limit '69' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'v9d3oTLT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "WUrWEkfF"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId '2n4YB0UK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "33RgrfBM"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '38' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Ntx6TqN9' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'odratM9D' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZfR8dJ6O' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'c2ZEeJGK' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '9QhS6exH' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE