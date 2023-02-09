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
    --limit '15' \
    --offset '79' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": false, "configurationCode": "rbf4OxaV", "description": "TPVHvaaR", "globalRules": [{"allowedAction": "JXDdpYNm", "ruleDetail": [{"ruleAttribute": "ooImbCff", "ruleCriteria": "EQUAL", "ruleValue": 0.038510242699620445}, {"ruleAttribute": "JLFptCwS", "ruleCriteria": "MINIMUM", "ruleValue": 0.8616291661107619}, {"ruleAttribute": "dr1iwet0", "ruleCriteria": "MINIMUM", "ruleValue": 0.021345995682870877}]}, {"allowedAction": "oLwrKt71", "ruleDetail": [{"ruleAttribute": "n95rgq0N", "ruleCriteria": "MINIMUM", "ruleValue": 0.002766263469524688}, {"ruleAttribute": "izgFjoDe", "ruleCriteria": "MINIMUM", "ruleValue": 0.3936044755139878}, {"ruleAttribute": "F7vR2GVY", "ruleCriteria": "EQUAL", "ruleValue": 0.7666971411136063}]}, {"allowedAction": "sAQnAGJn", "ruleDetail": [{"ruleAttribute": "uy8iQB2o", "ruleCriteria": "MAXIMUM", "ruleValue": 0.008045968243424184}, {"ruleAttribute": "S2lMGf0c", "ruleCriteria": "MINIMUM", "ruleValue": 0.9395096205458774}, {"ruleAttribute": "fRG6zSGR", "ruleCriteria": "MINIMUM", "ruleValue": 0.21636182814957916}]}], "groupAdminRoleId": "txzt8N40", "groupMaxMember": 90, "groupMemberRoleId": "N38F2sxr", "name": "9StqjoaQ"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '4bKlAKJ3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'cxO7KZW4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'bZ7t8y02' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "aC1Vpj4e", "groupMaxMember": 4, "name": "j05EE9GO"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'PbQzmXxp' \
    --configurationCode 'ZZJkkwg2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "zt4Wt6Jl", "ruleCriteria": "MINIMUM", "ruleValue": 0.7425762628953171}, {"ruleAttribute": "HY1nB3Lr", "ruleCriteria": "EQUAL", "ruleValue": 0.6582440044031974}, {"ruleAttribute": "dKvar7Xg", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3317151073035728}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'v67f04aC' \
    --configurationCode 'RUat2ZfK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'OAusytvR' \
    --groupName 'UPN96Atf' \
    --groupRegion '1fsLBK2U' \
    --limit '62' \
    --offset '28' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'DxipztGj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'j6nvQ659' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'E77k40tq' \
    --namespace "$AB_NAMESPACE" \
    --limit '68' \
    --offset '24' \
    --order 'M4VLNJfu' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '75' \
    --offset '22' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "aXPnHF3E", "memberRolePermissions": [{"action": 22, "resourceName": "sDTCyYdJ"}, {"action": 89, "resourceName": "lKgn9tlN"}, {"action": 19, "resourceName": "2PzfsZnD"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'u1JJVHqq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'VVi3dypB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'E2FATA3R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "6AeckS3v"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'QIGMIaZr' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 13, "resourceName": "iEacHsHL"}, {"action": 50, "resourceName": "dAfxI8uB"}, {"action": 37, "resourceName": "m2ymJmlD"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'eAxdSRn3' \
    --groupRegion '4VqSNtF6' \
    --limit '79' \
    --offset '6' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "OpnTqTSX", "customAttributes": {"71z23HAl": {}, "yHYFRMj3": {}, "CRTmhXM6": {}}, "groupDescription": "gZVojoJ4", "groupIcon": "wwwv0psk", "groupMaxMember": 84, "groupName": "udD2cIPk", "groupRegion": "zyWJxQmR", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "PtDGxPGV", "ruleDetail": [{"ruleAttribute": "R8TpI4TO", "ruleCriteria": "MINIMUM", "ruleValue": 0.3756152301120197}, {"ruleAttribute": "hmEPbW79", "ruleCriteria": "MINIMUM", "ruleValue": 0.12478636705524415}, {"ruleAttribute": "97fDq3EY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8341739631550764}]}, {"allowedAction": "peFnU3rw", "ruleDetail": [{"ruleAttribute": "URPApSvW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7010134695818222}, {"ruleAttribute": "aQRK0MVX", "ruleCriteria": "EQUAL", "ruleValue": 0.2576301937075578}, {"ruleAttribute": "Y9ucz4Uq", "ruleCriteria": "EQUAL", "ruleValue": 0.9652278782302952}]}, {"allowedAction": "nyqt8yl8", "ruleDetail": [{"ruleAttribute": "r7VdW8zV", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6280257396869037}, {"ruleAttribute": "HFrqkfQL", "ruleCriteria": "MINIMUM", "ruleValue": 0.15185085720164648}, {"ruleAttribute": "DBiBAqXD", "ruleCriteria": "EQUAL", "ruleValue": 0.05999985538525465}]}]}, "groupType": "Eg6wfQRo"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'ia3mitK9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'iHg7cIH5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "L0ANqlq3", "groupIcon": "GcHNB729", "groupName": "txNungra", "groupRegion": "ng4nraWA", "groupType": "yHhZFeeD"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'EzquIumg' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'KGvZEySU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "KMfyVVwb", "groupIcon": "dGDAjUhI", "groupName": "G7TnYDMZ", "groupRegion": "FiulwlsB", "groupType": "f69A0gq1"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'xRb5y3N8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"0kg7VGDD": {}, "Yc90XSw1": {}, "YLQ4EhXm": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'XFsUWwEk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId '5ttlKviT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'cVqnueBF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'ZgDygJxs' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'pdnSziWa' \
    --namespace "$AB_NAMESPACE" \
    --limit '85' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'mjIh0Mj6' \
    --namespace "$AB_NAMESPACE" \
    --limit '29' \
    --offset '61' \
    --order 'VMNFVL5A' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'KWFJIXUh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"ToPa143H": {}, "63Fzest1": {}, "Iuu7brEF": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'ITQSw26Y' \
    --groupId '2qMt2LNW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "NG7JRlTz", "ruleCriteria": "EQUAL", "ruleValue": 0.38141482164129303}, {"ruleAttribute": "IR25S2CV", "ruleCriteria": "EQUAL", "ruleValue": 0.13527721531291348}, {"ruleAttribute": "ytIgDwCI", "ruleCriteria": "MINIMUM", "ruleValue": 0.19452976275526435}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'lcnJg0uo' \
    --groupId 'VJkhod3A' \
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
    --limit '42' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'UeAK6O5t' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "S7RBC6yD"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'tBVD6yPH' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "aA31bCcv"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '82' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'RGSiDpZC' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'x0bAZsgr' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Tz8XScXN' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7W1FTURU' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'sfDb0H2k' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'xq01XGYc' \
    --limit '44' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 46 'GetUserJoinedGroupInformationPublicV2' test.out

#- 47 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "npXE90vB", "customAttributes": {"MGHT5Uus": {}, "tJpTNzed": {}, "XOmEZgBn": {}}, "groupDescription": "co3yl4Ii", "groupIcon": "lc9s8lia", "groupMaxMember": 18, "groupName": "NoNYZbS3", "groupRegion": "4qWwcZvn", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "SN3pTlry", "ruleDetail": [{"ruleAttribute": "M1N4Kf1C", "ruleCriteria": "EQUAL", "ruleValue": 0.9939999493265953}, {"ruleAttribute": "xWeKiq7W", "ruleCriteria": "EQUAL", "ruleValue": 0.9083512313186731}, {"ruleAttribute": "Ma8R8iR8", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4128288657848552}]}, {"allowedAction": "NVZw8teF", "ruleDetail": [{"ruleAttribute": "VdrbdAmB", "ruleCriteria": "MINIMUM", "ruleValue": 0.992043235946321}, {"ruleAttribute": "wRD8ke1b", "ruleCriteria": "EQUAL", "ruleValue": 0.1442831848727123}, {"ruleAttribute": "AWuJeO9k", "ruleCriteria": "MAXIMUM", "ruleValue": 0.41864658371132935}]}, {"allowedAction": "hxVL5WdF", "ruleDetail": [{"ruleAttribute": "Ds2nMsbR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8066286048925618}, {"ruleAttribute": "IRhhQNYE", "ruleCriteria": "MINIMUM", "ruleValue": 0.05670758428412537}, {"ruleAttribute": "kTiUATuG", "ruleCriteria": "MINIMUM", "ruleValue": 0.6591549431417095}]}]}, "groupType": "HurhH47D"}' \
    > test.out 2>&1
eval_tap $? 47 'CreateNewGroupPublicV2' test.out

#- 48 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["3yjxwwfW", "OKYMrW4T", "jAPBW4w1"]}' \
    > test.out 2>&1
eval_tap $? 48 'GetListGroupByIDsV2' test.out

#- 49 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'bs2mJEbB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "Vl3BcJqT", "groupIcon": "9MPqxqOD", "groupName": "clwiVTs3", "groupRegion": "ByzseV7u", "groupType": "J9Ge7Sza"}' \
    > test.out 2>&1
eval_tap $? 49 'UpdatePutSingleGroupPublicV2' test.out

#- 50 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'En9TD81h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 50 'DeleteGroupPublicV2' test.out

#- 51 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'wG8WPGpS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "5gGt8861", "groupIcon": "PrsUrzRa", "groupName": "fGRKFfzz", "groupRegion": "Kg7faPVy", "groupType": "wLK2oUJk"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePatchSingleGroupPublicV2' test.out

#- 52 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'UaAtQwOu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"RLCD7deX": {}, "PwTlPrWM": {}, "N9lPJNid": {}}}' \
    > test.out 2>&1
eval_tap $? 52 'UpdateGroupCustomAttributesPublicV2' test.out

#- 53 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'mSRdUkHt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 53 'AcceptGroupInvitationPublicV2' test.out

#- 54 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'O308g5gM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'RejectGroupInvitationPublicV2' test.out

#- 55 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'XTWyifb9' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '44' \
    > test.out 2>&1
eval_tap $? 55 'GetGroupInviteRequestPublicV2' test.out

#- 56 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'wnlnAayJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'JoinGroupV2' test.out

#- 57 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'H5FVL8En' \
    --namespace "$AB_NAMESPACE" \
    --limit '45' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupJoinRequestPublicV2' test.out

#- 58 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'naKCN9ic' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'LeaveGroupPublicV2' test.out

#- 59 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId '7jfYR6GS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"EyEW5sl2": {}, "slv5RcGp": {}, "ranIblVK": {}}}' \
    > test.out 2>&1
eval_tap $? 59 'UpdateGroupCustomRulePublicV2' test.out

#- 60 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'p3iGNES7' \
    --groupId '56GaZmOl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "CZtX23If", "ruleCriteria": "MINIMUM", "ruleValue": 0.9580281056247643}, {"ruleAttribute": "TBNudDZG", "ruleCriteria": "MINIMUM", "ruleValue": 0.46033780569809923}, {"ruleAttribute": "wMXKhAZi", "ruleCriteria": "MINIMUM", "ruleValue": 0.2558340943388524}]}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGroupPredefinedRulePublicV2' test.out

#- 61 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'ViArbsMU' \
    --groupId 'YzEZXFrc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 61 'DeleteGroupPredefinedRulePublicV2' test.out

#- 62 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '17' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 62 'GetMemberRolesListPublicV2' test.out

#- 63 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'cfKnYfxR' \
    --memberRoleId 'H6JPJKNA' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "yWf2HfWi"}' \
    > test.out 2>&1
eval_tap $? 63 'UpdateMemberRolePublicV2' test.out

#- 64 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'TEYjqQH7' \
    --memberRoleId '7bjMwopc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "MhZy1DqT"}' \
    > test.out 2>&1
eval_tap $? 64 'DeleteMemberRolePublicV2' test.out

#- 65 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '87' \
    --offset '8' \
    > test.out 2>&1
eval_tap $? 65 'GetUserGroupInformationPublicV2' test.out

#- 66 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 66 'GetMyGroupJoinRequestV2' test.out

#- 67 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'AshUDONv' \
    --namespace "$AB_NAMESPACE" \
    --userId 'svTbTaOG' \
    > test.out 2>&1
eval_tap $? 67 'InviteGroupPublicV2' test.out

#- 68 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'w8yWqLmB' \
    --namespace "$AB_NAMESPACE" \
    --userId 'xohZFPUb' \
    > test.out 2>&1
eval_tap $? 68 'CancelInvitationGroupMemberV2' test.out

#- 69 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'LOMrDInU' \
    --namespace "$AB_NAMESPACE" \
    --userId 'yG9av1bh' \
    > test.out 2>&1
eval_tap $? 69 'AcceptGroupJoinRequestPublicV2' test.out

#- 70 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'BNxEBKqr' \
    --namespace "$AB_NAMESPACE" \
    --userId '3x9waKOr' \
    > test.out 2>&1
eval_tap $? 70 'RejectGroupJoinRequestPublicV2' test.out

#- 71 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'ooVsBcjC' \
    --namespace "$AB_NAMESPACE" \
    --userId 'XsU79X7L' \
    > test.out 2>&1
eval_tap $? 71 'KickGroupMemberPublicV2' test.out

#- 72 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'ez3XgCGe' \
    --namespace "$AB_NAMESPACE" \
    --userId '5sKVyop2' \
    > test.out 2>&1
eval_tap $? 72 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE