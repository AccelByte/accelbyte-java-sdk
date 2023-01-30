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
    --limit '47' \
    --offset '72' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "2ROepqtE", "description": "VbvVcxON", "globalRules": [{"allowedAction": "23Q2x5Fj", "ruleDetail": [{"ruleAttribute": "P4BTuoUR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6112073078045509}, {"ruleAttribute": "HzAvwsY1", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7730585065090401}, {"ruleAttribute": "98ZOLObH", "ruleCriteria": "EQUAL", "ruleValue": 0.5576153564049371}]}, {"allowedAction": "Fh9n5ZkU", "ruleDetail": [{"ruleAttribute": "AtbkYA99", "ruleCriteria": "EQUAL", "ruleValue": 0.033417462808212894}, {"ruleAttribute": "PE6p8dCM", "ruleCriteria": "MINIMUM", "ruleValue": 0.9546691137809502}, {"ruleAttribute": "EBW9v8Z8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4877855186423177}]}, {"allowedAction": "OBgehnr0", "ruleDetail": [{"ruleAttribute": "Gzsimfz8", "ruleCriteria": "EQUAL", "ruleValue": 0.932813126461897}, {"ruleAttribute": "Z6vT8SWs", "ruleCriteria": "MINIMUM", "ruleValue": 0.9510070994602479}, {"ruleAttribute": "CS6V0LKZ", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4152673450886931}]}], "groupAdminRoleId": "7Kl3Yw9a", "groupMaxMember": 63, "groupMemberRoleId": "vRDweMle", "name": "AC9KfH1i"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'WFPCYNXN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'B0wj4PoB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'nu0HiKE5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "1Z26Twpo", "groupMaxMember": 36, "name": "gWxRITow"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'B17JCOkm' \
    --configurationCode 'IbtIkQyj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "tg35xnbH", "ruleCriteria": "EQUAL", "ruleValue": 0.6218803683118874}, {"ruleAttribute": "fdCisASm", "ruleCriteria": "MINIMUM", "ruleValue": 0.9050038492144056}, {"ruleAttribute": "2vVe8LIo", "ruleCriteria": "MINIMUM", "ruleValue": 0.2989169049079029}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '7Tqxmgc3' \
    --configurationCode 'OmsUt40Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode '3c35mrYp' \
    --groupName 'zvPVL72c' \
    --groupRegion '8ftolhmw' \
    --limit '76' \
    --offset '32' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'mDdM5S9n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'pWl77rPA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'Qi3U3W6h' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '90' \
    --order 'm16KKOWO' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '71' \
    --offset '45' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "7EhDROpw", "memberRolePermissions": [{"action": 85, "resourceName": "nTnjZNNo"}, {"action": 93, "resourceName": "rh6Zczq6"}, {"action": 67, "resourceName": "7R4ZLSMz"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId '4eh5Xutj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'E0a9wPaR' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'XDBhntof' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "cT9ZzhsR"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'yw5Umy5u' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 21, "resourceName": "t35Muw0O"}, {"action": 15, "resourceName": "zGdRNwKt"}, {"action": 16, "resourceName": "KMzShxMN"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '16btyJMr' \
    --groupRegion '4T83G3SF' \
    --limit '34' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "16pxnC22", "customAttributes": {"ZQoejVZp": {}, "TYFLLET7": {}, "qI6AEVCQ": {}}, "groupDescription": "q0UERpm0", "groupIcon": "wNgpN5Qz", "groupMaxMember": 14, "groupName": "eMUtTDJF", "groupRegion": "nOCBrYJM", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "79RL1S9P", "ruleDetail": [{"ruleAttribute": "pFfKwXdK", "ruleCriteria": "EQUAL", "ruleValue": 0.12305844940944533}, {"ruleAttribute": "IPWxuykR", "ruleCriteria": "EQUAL", "ruleValue": 0.35115760590587086}, {"ruleAttribute": "AM1Dp53a", "ruleCriteria": "MINIMUM", "ruleValue": 0.2286932021239596}]}, {"allowedAction": "lkeA6ROB", "ruleDetail": [{"ruleAttribute": "E3scbENv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.09268772994894947}, {"ruleAttribute": "aMNJvSCs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.04185711386854418}, {"ruleAttribute": "BS9dvaOG", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7705593124015259}]}, {"allowedAction": "ZcGJnE7Z", "ruleDetail": [{"ruleAttribute": "ZTVo2Auf", "ruleCriteria": "MINIMUM", "ruleValue": 0.1917069326441304}, {"ruleAttribute": "QuB2Antu", "ruleCriteria": "MINIMUM", "ruleValue": 0.013741464611236265}, {"ruleAttribute": "WDDyCr7D", "ruleCriteria": "MINIMUM", "ruleValue": 0.47882980697449284}]}]}, "groupType": "zT8MTZSa"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 't8cEezvn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'kKlZMNzY' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "tRwg7lPX", "groupIcon": "vpc5ZmZ4", "groupName": "ynV4Bgk1", "groupRegion": "4LrBrmWB", "groupType": "GpBYAsFF"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'BNYTPX3e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'oQOVGNaV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "ShQcXbSf", "groupIcon": "xCtesPXP", "groupName": "QNGxaWpF", "groupRegion": "2Q4WpaTW", "groupType": "T1UnZjVJ"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'rOH8qwpn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"5N658Kbn": {}, "S9hDYqd7": {}, "mWj2PX5E": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'oqAhjySG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'hAJm89L1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'BLp7ylxf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'kyF3btWg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'HGl4pWww' \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'RXeTTLad' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '17' \
    --order 'fxNo94CN' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'BQsWmGyq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"JR0EzLAL": {}, "tjM1xNZ6": {}, "VvIpxyLl": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'rvz0Fz9z' \
    --groupId 'oFAAz9Z2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "VJbmxus6", "ruleCriteria": "MINIMUM", "ruleValue": 0.07838655706235309}, {"ruleAttribute": "Tcm2ak34", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2576212186179577}, {"ruleAttribute": "6wXkuK76", "ruleCriteria": "MINIMUM", "ruleValue": 0.33502821928048443}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'QutZ17CR' \
    --groupId 'wGJIW0Gx' \
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
    --limit '24' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'hb7WIwyd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "ATiG7Aoj"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'wgPZSK2g' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "5fbPwswx"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '27' \
    --offset '94' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'rE1N2lD2' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'htxRY1As' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZM342Klj' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '4QTamGp8' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'F0lat6oH' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'C9PjoDTx' \
    --limit '63' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 46 'GetUserJoinedGroupInformationPublicV2' test.out

#- 47 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "1b3ES4YX", "customAttributes": {"TyHkdHbL": {}, "PyV0gcln": {}, "MLvvJLnS": {}}, "groupDescription": "9vtum2pB", "groupIcon": "23FQZzYF", "groupMaxMember": 24, "groupName": "wh8j60OB", "groupRegion": "DQfV9Wm0", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "Qto78YSF", "ruleDetail": [{"ruleAttribute": "bsAlosvn", "ruleCriteria": "EQUAL", "ruleValue": 0.14511548308425415}, {"ruleAttribute": "mMpguAS5", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6453087728199086}, {"ruleAttribute": "lArghMiD", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8540164117384611}]}, {"allowedAction": "LztDzRZo", "ruleDetail": [{"ruleAttribute": "Wr73M1ej", "ruleCriteria": "EQUAL", "ruleValue": 0.21559355046822704}, {"ruleAttribute": "GAwHw3vL", "ruleCriteria": "MINIMUM", "ruleValue": 0.9505646976996593}, {"ruleAttribute": "vHDpOOk8", "ruleCriteria": "EQUAL", "ruleValue": 0.7935456927249833}]}, {"allowedAction": "zGzgQqpQ", "ruleDetail": [{"ruleAttribute": "DUmIvI3n", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3877658959115199}, {"ruleAttribute": "GEdmN4Gv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9016233860077537}, {"ruleAttribute": "ZCTPfQxW", "ruleCriteria": "MINIMUM", "ruleValue": 0.15678499861485373}]}]}, "groupType": "FMoQrV7X"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateNewGroupPublicV2' test.out

#- 48 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["5ihgQLyb", "VHKOj4Q5", "fvKhIefK"]}' \
    > test.out 2>&1
eval_tap $? 48 'GetListGroupByIDsV2' test.out

#- 49 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'UWmJ3q6d' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "xMJPV6TK", "groupIcon": "i45D3ugP", "groupName": "qo6f965Z", "groupRegion": "1Erqqj3g", "groupType": "aBBjKRXU"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePutSingleGroupPublicV2' test.out

#- 50 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'E9bzHZif' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteGroupPublicV2' test.out

#- 51 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'jv0mUKZB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "PfBGYCcP", "groupIcon": "KSfjFWTF", "groupName": "tf361Fvn", "groupRegion": "8HvtiYXf", "groupType": "oAmkh2Ic"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePatchSingleGroupPublicV2' test.out

#- 52 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'XACrzxXT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"TKuNtP2P": {}, "uDRkEwlh": {}, "W29qDR5T": {}}}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGroupCustomAttributesPublicV2' test.out

#- 53 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'jAfPdPZj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AcceptGroupInvitationPublicV2' test.out

#- 54 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'gWdgJfLo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'RejectGroupInvitationPublicV2' test.out

#- 55 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'mQmaiqqH' \
    --namespace "$AB_NAMESPACE" \
    --limit '60' \
    --offset '74' \
    > test.out 2>&1
eval_tap $? 55 'GetGroupInviteRequestPublicV2' test.out

#- 56 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'ak6jz37e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'JoinGroupV2' test.out

#- 57 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'mWxiwpPA' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '27' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupJoinRequestPublicV2' test.out

#- 58 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'idk6lB4E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'LeaveGroupPublicV2' test.out

#- 59 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'GfxF8bKO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"vzzZ462H": {}, "9lIdOT2h": {}, "6LIStFxq": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateGroupCustomRulePublicV2' test.out

#- 60 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'sUx9jBSP' \
    --groupId 'qvTH9SKd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Jb26E1re", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4523710834394117}, {"ruleAttribute": "nO5QM2LT", "ruleCriteria": "MINIMUM", "ruleValue": 0.5950440952213647}, {"ruleAttribute": "dcDSMFj2", "ruleCriteria": "EQUAL", "ruleValue": 0.4023053923930988}]}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGroupPredefinedRulePublicV2' test.out

#- 61 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'l692fjus' \
    --groupId 'iHCVpFty' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteGroupPredefinedRulePublicV2' test.out

#- 62 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '23' \
    --offset '2' \
    > test.out 2>&1
eval_tap $? 62 'GetMemberRolesListPublicV2' test.out

#- 63 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'zKJ7j4Oc' \
    --memberRoleId 'AEG93Yyf' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "YIkaJwTl"}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateMemberRolePublicV2' test.out

#- 64 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'TI3p8TyL' \
    --memberRoleId 'LGCPWi5D' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "12yRtcug"}' \
    > test.out 2>&1
eval_tap $? 64 'DeleteMemberRolePublicV2' test.out

#- 65 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '89' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 65 'GetUserGroupInformationPublicV2' test.out

#- 66 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '10' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 66 'GetMyGroupJoinRequestV2' test.out

#- 67 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '2FTXJVAN' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tur0KOZw' \
    > test.out 2>&1
eval_tap $? 67 'InviteGroupPublicV2' test.out

#- 68 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'We4I27WJ' \
    --namespace "$AB_NAMESPACE" \
    --userId 'u4rZDj4a' \
    > test.out 2>&1
eval_tap $? 68 'CancelInvitationGroupMemberV2' test.out

#- 69 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'k8FOxmgw' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ayPyvFxb' \
    > test.out 2>&1
eval_tap $? 69 'AcceptGroupJoinRequestPublicV2' test.out

#- 70 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'kCBjTbt9' \
    --namespace "$AB_NAMESPACE" \
    --userId 'IXuKiVGS' \
    > test.out 2>&1
eval_tap $? 70 'RejectGroupJoinRequestPublicV2' test.out

#- 71 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'BhzzheQY' \
    --namespace "$AB_NAMESPACE" \
    --userId '58duXZcQ' \
    > test.out 2>&1
eval_tap $? 71 'KickGroupMemberPublicV2' test.out

#- 72 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'cK68gItp' \
    --namespace "$AB_NAMESPACE" \
    --userId 'pUHHlgL5' \
    > test.out 2>&1
eval_tap $? 72 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE