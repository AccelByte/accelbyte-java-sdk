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
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"allowMultiple": true, "configurationCode": "wYCA9kPI6LZrkq6D", "description": "c09nIW0Oaiw9B0D7", "globalRules": [{"allowedAction": "eHpzSn3ZPUdc0qh4", "ruleDetail": [{"ruleAttribute": "n8mzZ0m8SAMTwE6I", "ruleCriteria": "MINIMUM", "ruleValue": 0.9374873672587434}, {"ruleAttribute": "IaRDBXxyaNoMR6hk", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9575503562028771}, {"ruleAttribute": "qbPngUNB1vRodwpz", "ruleCriteria": "MINIMUM", "ruleValue": 0.5470143105332298}]}, {"allowedAction": "Hdgs21Jub74CUkNm", "ruleDetail": [{"ruleAttribute": "KJfh5pUkHODpoMF7", "ruleCriteria": "MINIMUM", "ruleValue": 0.6395625333924253}, {"ruleAttribute": "Y4YkHs1cnz1JSDgY", "ruleCriteria": "MINIMUM", "ruleValue": 0.2297591328238191}, {"ruleAttribute": "lvbTgrhRTcPiSuL0", "ruleCriteria": "MINIMUM", "ruleValue": 0.6774488850034576}]}, {"allowedAction": "kT7NvyE3cwyALczN", "ruleDetail": [{"ruleAttribute": "IicXm7agSrjJW2OQ", "ruleCriteria": "MINIMUM", "ruleValue": 0.49352689579304554}, {"ruleAttribute": "Au2D6QVKNCWP75TB", "ruleCriteria": "EQUAL", "ruleValue": 0.14128417150585826}, {"ruleAttribute": "7pKxR8dl0zRVW4EZ", "ruleCriteria": "MINIMUM", "ruleValue": 0.22093008448613038}]}], "groupAdminRoleId": "7Z4U68su8XfqlqNi", "groupMaxMember": 93, "groupMemberRoleId": "Havj7AorKsxwkosA", "name": "VerXpc1C8XfwHuKe"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'b9l3rGN9A3sNm84h' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'ddSpHt0P7MIIR7Ck' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'yF6C7duuyZ0GhDog' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "qrhBRd8lDR6qVNPR", "groupMaxMember": 7, "name": "dFLIAjGGJddVCvu9"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'vx5KQ7KYnIuMBvaO' \
    --configurationCode '35llzQRaT5kPxUfo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "fvnnSuB0y5WUlrMd", "ruleCriteria": "MINIMUM", "ruleValue": 0.6751155250161673}, {"ruleAttribute": "lLlkvR8sKgnuRkgg", "ruleCriteria": "EQUAL", "ruleValue": 0.8980021888784229}, {"ruleAttribute": "HGCiljvjKoyD6SCw", "ruleCriteria": "MINIMUM", "ruleValue": 0.01464352967246385}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'hFjkQsfCaTmt1d67' \
    --configurationCode 'FXGk2s9Q0mPVo3tw' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'u0MesTCf9x4rt69l' \
    --groupName 'na7qxNeIxPz6MbwL' \
    --groupRegion '6IY69z1UaLqYSYWy' \
    --limit '40' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'LPziZMdjxcBZufQx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'GiHPllG4cYEzfTD1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'ZBm3MqHcUmLZZbSq' \
    --namespace "$AB_NAMESPACE" \
    --limit '2' \
    --offset '25' \
    --order '8RwNmn9HrNQy4uZA' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '53' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "iE0mit9RGCCHYzUO", "memberRolePermissions": [{"action": 4, "resourceName": "yzzWi9gwQYv7t1o7"}, {"action": 94, "resourceName": "k6Jt4Ymos9Jcdos4"}, {"action": 11, "resourceName": "OvBMcaYmvCkGZ5dA"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'gqxpBFmaLoxozr6w' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'fNPX2bOItRMvqtlB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId '2jJCSQT279ZZPYGu' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "0rdlgdWyOtXi3cho"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'QrpOsDBU5SepjChB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 36, "resourceName": "V0v52Dlym6puQ23x"}, {"action": 30, "resourceName": "v0IqmF51TkhjYnaq"}, {"action": 60, "resourceName": "foWvXa3bMrXsDr6k"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'ILsSSyDdmykmoPYg' \
    --groupRegion 'c2L4jk4Lo0LSP0pf' \
    --limit '45' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "hZNkSQ70D0H6BXks", "customAttributes": {"UC9b6i5lZC9xv32e": {}, "8c5csSovoqsZNBdt": {}, "e9NDUPVJf6c2Z0QZ": {}}, "groupDescription": "xfgPubTDIHrvqATh", "groupIcon": "uwjRHpKKTlmVr9Xu", "groupMaxMember": 30, "groupName": "pf3vneSD2Tb3g7mS", "groupRegion": "QUhAEtrmjqU6YE3p", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "4lSck0ZHn5GI39YB", "ruleDetail": [{"ruleAttribute": "HqaTHeKtW18iGeUl", "ruleCriteria": "EQUAL", "ruleValue": 0.6843008472893907}, {"ruleAttribute": "ipcCx9Zw5D2L7vIY", "ruleCriteria": "EQUAL", "ruleValue": 0.7652815321995776}, {"ruleAttribute": "vUfHQvsHXNUNe4mh", "ruleCriteria": "EQUAL", "ruleValue": 0.051252933112565846}]}, {"allowedAction": "N8S48l9lyNApflxq", "ruleDetail": [{"ruleAttribute": "Mrj3oZk03QXcKMDY", "ruleCriteria": "MAXIMUM", "ruleValue": 0.28571186567135687}, {"ruleAttribute": "1yrOMlNFSrUEirnj", "ruleCriteria": "EQUAL", "ruleValue": 0.7241213431663898}, {"ruleAttribute": "aiGVkydwYWQG26yU", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6362648679758404}]}, {"allowedAction": "mTBcvrbYCwZtxFHy", "ruleDetail": [{"ruleAttribute": "PLtI8ilbyDPUIj88", "ruleCriteria": "EQUAL", "ruleValue": 0.7559150686846503}, {"ruleAttribute": "L4pp2ncYAHdNzDme", "ruleCriteria": "MINIMUM", "ruleValue": 0.34356511134708123}, {"ruleAttribute": "9gsR5cJcHm3SZLxo", "ruleCriteria": "MINIMUM", "ruleValue": 0.8147044217061608}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'FuuuySj29a9LJE8H' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'oRS1X2PFAAMwzHPx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "B1UskYs4Yw20DOqO", "groupIcon": "BSC2DKHRuPMMWH8Y", "groupName": "b33T5UBJCjfcnLRf", "groupRegion": "xeCSz9WEi8KlloeH", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'JT1yduat2vQR3biB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'fsu4jmsRE2w1yEkL' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "gh3tIYt4SqYUTLDx", "groupIcon": "9gIiDandpGT2t24a", "groupName": "OMh5eC3IHeHSKLCa", "groupRegion": "3xreNDUWehwH3q31", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId '6m8heKnWhzfe2Nub' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"eoKFeIaFQCYoDPIC": {}, "pnduEEQlULdJz4mn": {}, "RBkMNxvvKgAT8mJr": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'Yq6hRkloqxM3gpwx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'cfMy9XzjjI5YbsKo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'ADkzJEN2VHzih3bi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 't0VWn3CO39PXDNxt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'XgeO3FgkXhjDzaQY' \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'nn2ZkP7cFdP43e5d' \
    --namespace "$AB_NAMESPACE" \
    --limit '59' \
    --offset '74' \
    --order '9XIBudfZgrbHDIDm' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId '4hMzF4TxodenSrUT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"vfqU0bfoMm5cTtFW": {}, "botQyXJRcQWsmqPN": {}, "s92epxk0i8VxsZNe": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'reSvf9699mCEHThU' \
    --groupId 'JkETAsSp7gh4TeUT' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "kOkAYfJB8AT9t4Tv", "ruleCriteria": "MINIMUM", "ruleValue": 0.9549895131279466}, {"ruleAttribute": "Y2QD3oD5fLCr3OOl", "ruleCriteria": "EQUAL", "ruleValue": 0.3516961611151834}, {"ruleAttribute": "8ZGF7uYnGzpipNDi", "ruleCriteria": "EQUAL", "ruleValue": 0.6812816384771332}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'I1AeFgPqaOkvo1ao' \
    --groupId 'lB4lkKB4EYOkQ1jM' \
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
    --limit '61' \
    --offset '9' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'cym8xIfkOVW2grRE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "OLx0KOww3HICQLfl"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId '7MUBG7qtPu64yAtU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "RKLRkb738HGS6rDg"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '80' \
    --offset '97' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'dIIlhS1fSiM9331m' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '7Ta1PsKc50Kv6ecn' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'EevcAx2K2zkRenmP' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ZnGBt4P7WnbdSJtj' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'X7ZshZyZl5x4bRXB' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["HUTrDzZSKscfOcYu", "3dpCROYqUiGKXVFC", "mpo6sPwVOEDSJsEK"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId '5QpNhlI2iS5EpGhh' \
    --limit '43' \
    --offset '75' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "XYck0upMzUYnb76t", "customAttributes": {"FkEORV3bu1bNCtX7": {}, "W40V6Do5sYadCCFr": {}, "HHC3DpZxkrQDXuNF": {}}, "groupDescription": "viMarv8mnfHK8CCm", "groupIcon": "E2lPnsbD3SGEdlwu", "groupMaxMember": 96, "groupName": "aI1mX2tJoARtdbBe", "groupRegion": "7udsMrok0WvGYYnx", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "4V709xbnGezKsDwG", "ruleDetail": [{"ruleAttribute": "2omOR2nvYI9TVqJd", "ruleCriteria": "MAXIMUM", "ruleValue": 0.157803300143597}, {"ruleAttribute": "vsugAOS7u8RiWyer", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9044328236015272}, {"ruleAttribute": "bTxBmZjdrrIxsB0N", "ruleCriteria": "MINIMUM", "ruleValue": 0.011190610374314236}]}, {"allowedAction": "DXTvKCWwNTAhd2wr", "ruleDetail": [{"ruleAttribute": "S0uPdjhdinpng5BL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6608615516018669}, {"ruleAttribute": "Hi8pWGd1juYhiqjR", "ruleCriteria": "MINIMUM", "ruleValue": 0.09411597738185762}, {"ruleAttribute": "4wP57dBZNR88YbCt", "ruleCriteria": "EQUAL", "ruleValue": 0.057535645245406664}]}, {"allowedAction": "ONneAczbBdHb2slt", "ruleDetail": [{"ruleAttribute": "71B1SmZp2JZp50Cn", "ruleCriteria": "MINIMUM", "ruleValue": 0.7202669160855811}, {"ruleAttribute": "1j02o7JjTXAQN0qd", "ruleCriteria": "MAXIMUM", "ruleValue": 0.03339302662481547}, {"ruleAttribute": "LjMXJRk0eaKQDOJv", "ruleCriteria": "MAXIMUM", "ruleValue": 0.38008492981683795}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 48 'CreateNewGroupPublicV2' test.out

#- 49 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["efglSs6g4iY9u02a", "CNYIWekp18lOC3mN", "qF7Bl0LcghVHfPEs"]}' \
    > test.out 2>&1
eval_tap $? 49 'GetListGroupByIDsV2' test.out

#- 50 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'pxwhRON0bc1eMbEI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "jowLqc3ecjXJbZDK", "groupIcon": "KoxLE1Y3Dymtj3gi", "groupName": "Pg4x4yiPX6ues1Hh", "groupRegion": "hkg1yLVbLFzHEP8c", "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 50 'UpdatePutSingleGroupPublicV2' test.out

#- 51 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'SiPW3VgsZXiR1DJ7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 51 'DeleteGroupPublicV2' test.out

#- 52 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'HVWqMkNSawQUWDFJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "vJBWic7UkBeIXuqD", "groupIcon": "uAXI66bQ71w0deoV", "groupName": "9Lx5RDA1l2XcrciY", "groupRegion": "NEzvSZIPkhSgORcz", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 52 'UpdatePatchSingleGroupPublicV2' test.out

#- 53 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'S5BvmgBLxh4ijFnE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"3Tam69qSZ7PC6f6Q": {}, "kmZXElW9YfRSse6A": {}, "Az3S4czz0QKFlAVm": {}}}' \
    > test.out 2>&1
eval_tap $? 53 'UpdateGroupCustomAttributesPublicV2' test.out

#- 54 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'VLu4AOec0z8eBeeo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 54 'AcceptGroupInvitationPublicV2' test.out

#- 55 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'ip68J1nsv4W2OJht' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'RejectGroupInvitationPublicV2' test.out

#- 56 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'afxMSJlHeb34sZKH' \
    --namespace "$AB_NAMESPACE" \
    --limit '5' \
    --offset '87' \
    > test.out 2>&1
eval_tap $? 56 'GetGroupInviteRequestPublicV2' test.out

#- 57 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId 'l5LLLOexL4fZvWtN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 57 'JoinGroupV2' test.out

#- 58 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'D2tcBFpX8lNtFEJ7' \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '73' \
    > test.out 2>&1
eval_tap $? 58 'GetGroupJoinRequestPublicV2' test.out

#- 59 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'nkY6Mca5afj12K2I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 59 'LeaveGroupPublicV2' test.out

#- 60 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'zrBvvWm4udE0OXud' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"XgNne8kJATwlc6es": {}, "Up6Sw1I98jeZQ7hf": {}, "xnhLd3Knaknoed9D": {}}}' \
    > test.out 2>&1
eval_tap $? 60 'UpdateGroupCustomRulePublicV2' test.out

#- 61 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'HhLOqQGhCUr6iTrj' \
    --groupId 'yEgarAdNJOIG36I6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "tRbRcrEveMdAdiPK", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3939059581125812}, {"ruleAttribute": "TlUrwDTnoujQD4IE", "ruleCriteria": "EQUAL", "ruleValue": 0.21191562368568684}, {"ruleAttribute": "FIna3yddcbsPheTH", "ruleCriteria": "EQUAL", "ruleValue": 0.9422190198200009}]}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupPredefinedRulePublicV2' test.out

#- 62 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'IUJNvYuGRUvpZaHC' \
    --groupId 'uESOiIZsMfB4ZH3m' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 62 'DeleteGroupPredefinedRulePublicV2' test.out

#- 63 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '39' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 63 'GetMemberRolesListPublicV2' test.out

#- 64 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'gWgU4pCAKxeE70Ca' \
    --memberRoleId 'unQNxot371W9G4Av' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "QkqsGnmyo5JJTUVm"}' \
    > test.out 2>&1
eval_tap $? 64 'UpdateMemberRolePublicV2' test.out

#- 65 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'b8GEXFTlEMEsFzYq' \
    --memberRoleId 'wgK1Np5nodqpLm7F' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "hJBNXzAFdO0Khqf6"}' \
    > test.out 2>&1
eval_tap $? 65 'DeleteMemberRolePublicV2' test.out

#- 66 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '21' \
    --offset '26' \
    > test.out 2>&1
eval_tap $? 66 'GetUserGroupInformationPublicV2' test.out

#- 67 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '96' \
    > test.out 2>&1
eval_tap $? 67 'GetMyGroupJoinRequestV2' test.out

#- 68 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId 'TdSGv2LFjAKY7Cbg' \
    --namespace "$AB_NAMESPACE" \
    --userId 'sWqFWZX7kPBom8F9' \
    > test.out 2>&1
eval_tap $? 68 'InviteGroupPublicV2' test.out

#- 69 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'GLLTG8phc3n4iLoI' \
    --namespace "$AB_NAMESPACE" \
    --userId 'llKlpO2pqiXJF3WG' \
    > test.out 2>&1
eval_tap $? 69 'CancelInvitationGroupMemberV2' test.out

#- 70 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'RaoQomSJC4DdrKF7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'SUQPLG59e0k5ZtX6' \
    > test.out 2>&1
eval_tap $? 70 'AcceptGroupJoinRequestPublicV2' test.out

#- 71 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'wK7PpUlcIW32iK7M' \
    --namespace "$AB_NAMESPACE" \
    --userId 'Gt1ixY5rA1WoVeJI' \
    > test.out 2>&1
eval_tap $? 71 'RejectGroupJoinRequestPublicV2' test.out

#- 72 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'ePF8ZrQzP4zvtdxd' \
    --namespace "$AB_NAMESPACE" \
    --userId 'bZUpd6FJtHJ1pyVw' \
    > test.out 2>&1
eval_tap $? 72 'KickGroupMemberPublicV2' test.out

#- 73 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId 'yKQLY6FEO65Rb3z7' \
    --namespace "$AB_NAMESPACE" \
    --userId 'CYLM8IlsHqffnrfs' \
    > test.out 2>&1
eval_tap $? 73 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE