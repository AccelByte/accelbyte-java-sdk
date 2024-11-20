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
echo "1..74"

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
    --body '{"allowMultiple": true, "configurationCode": "wYCA9kPI6LZrkq6D", "description": "c09nIW0Oaiw9B0D7", "globalRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "ktQG0h5JAav5kRa6", "ruleCriteria": "EQUAL", "ruleValue": 0.22965718362292997}, {"ruleAttribute": "pBJHPtcDs8bBZLCX", "ruleCriteria": "MINIMUM", "ruleValue": 0.6960337785804731}, {"ruleAttribute": "DBXxyaNoMR6hkspI", "ruleCriteria": "EQUAL", "ruleValue": 0.670383760985477}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "Aip6lyzSxwElFHHd", "ruleCriteria": "EQUAL", "ruleValue": 0.4725870140020443}, {"ruleAttribute": "pv8N7ZQVqGj6oDLj", "ruleCriteria": "EQUAL", "ruleValue": 0.2472405520592631}, {"ruleAttribute": "UkHODpoMF78NY4Yk", "ruleCriteria": "MINIMUM", "ruleValue": 0.003696026594533164}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "cnz1JSDgY1TXp38z", "ruleCriteria": "MAXIMUM", "ruleValue": 0.2858670909754849}, {"ruleAttribute": "hRTcPiSuL0Sly6XM", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6494097448606809}, {"ruleAttribute": "I18mAQLnzjMf8GZ2", "ruleCriteria": "EQUAL", "ruleValue": 0.43681487232294225}]}], "groupAdminRoleId": "ZqxYG3aREAu2D6QV", "groupMaxMember": 74, "groupMemberRoleId": "FvdiRilZ7oFgx4c8", "name": "OumKtPDKJDXn7Z4U"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode '68su8XfqlqNiTvB6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'SdAdIhUDrwoZ5Mec' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'dKi5r6QEa1ysLEzt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "h6mXhzkzWkFeZSoE", "groupMaxMember": 55, "name": "Ht0P7MIIR7CkyF6C"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '7duuyZ0GhDogqrhB' \
    --configurationCode 'Rd8lDR6qVNPRZYdF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "LIAjGGJddVCvu9vx", "ruleCriteria": "EQUAL", "ruleValue": 0.5946512024730478}, {"ruleAttribute": "Q7KYnIuMBvaO35ll", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9499867012918202}, {"ruleAttribute": "Vpbsx5w8hqUI06Up", "ruleCriteria": "MINIMUM", "ruleValue": 0.4421239554778843}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction '0y5WUlrMdI4sNvea' \
    --configurationCode 'bntBSxTeIv53HGCi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'ljvjKoyD6SCwGrnc' \
    --groupName 'qmLtjQHAf8TgoNm0' \
    --groupRegion '3VLisV6zwPuo3td6' \
    --limit '93' \
    --offset '10' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'C6I3lMjGSWN2laRl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId 'xfcjHfYakUCTqGkE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId '7wcWfDslpJSqGAXQ' \
    --namespace "$AB_NAMESPACE" \
    --limit '18' \
    --offset '50' \
    --order 'ZMdjxcBZufQxGiHP' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '24' \
    --offset '86' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "lG4cYEzfTD1ZBm3M", "memberRolePermissions": [{"action": 33, "resourceName": "PqIJA8IHtrkmu0hp"}, {"action": 60, "resourceName": "n9HrNQy4uZAAiE0m"}, {"action": 18, "resourceName": "5S5XUdjsoqwGyzzW"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'i9gwQYv7t1o7TTr1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'DmrhZv15T7quIOvB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId 'McaYmvCkGZ5dAgqx' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "pBFmaLoxozr6wfNP"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'X2bOItRMvqtlB2jJ' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 58, "resourceName": "EI8JlDbPWbQ6Q9lN"}, {"action": 26, "resourceName": "gdWyOtXi3choQrpO"}, {"action": 38, "resourceName": "cmDc3fxU8MyKrQpM"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName '4hkkK6KKXNB3Gv0I' \
    --groupRegion 'qmF51TkhjYnaq6fo' \
    --limit '99' \
    --offset '38' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "vXa3bMrXsDr6kILs", "customAttributes": {"SSyDdmykmoPYgc2L": {}, "4jk4Lo0LSP0pf4Ix": {}, "jUkl535X3ateEKDp": {}}, "groupDescription": "ADz1x3poD3Qgb3bo", "groupIcon": "LQQ1MzH7Qm8bwbmX", "groupMaxMember": 13, "groupName": "NDUPVJf6c2Z0QZxf", "groupRegion": "gPubTDIHrvqAThuw", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "RmDnyeFoF7VSZ6pf", "ruleCriteria": "MINIMUM", "ruleValue": 0.34942444791741867}, {"ruleAttribute": "neSD2Tb3g7mSQUhA", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7062441953341027}, {"ruleAttribute": "ENjEEztx1WsYSiZq", "ruleCriteria": "EQUAL", "ruleValue": 0.8280425459982925}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "nSBJroav91GXlvPG", "ruleCriteria": "EQUAL", "ruleValue": 0.9787412248956047}, {"ruleAttribute": "iGeUlc9d9sogWa24", "ruleCriteria": "MAXIMUM", "ruleValue": 0.8820909007965355}, {"ruleAttribute": "L7vIYhGGSyEW4ZJJ", "ruleCriteria": "MINIMUM", "ruleValue": 0.8791084709379228}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "e4mhgo5QB65lSAiY", "ruleCriteria": "EQUAL", "ruleValue": 0.24768610772191946}, {"ruleAttribute": "flxqMrj3oZk03QXc", "ruleCriteria": "MINIMUM", "ruleValue": 0.5441861869681924}, {"ruleAttribute": "kBMr1yrOMlNFSrUE", "ruleCriteria": "EQUAL", "ruleValue": 0.08338569314990818}]}]}, "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId 'Gc26SaiGVkydwYWQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId 'G26yUZNmTBcvrbYC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "wZtxFHyPLtI8ilby", "groupIcon": "DPUIj88cekdqCt81", "groupName": "P1ktfIovmv9gsR5c", "groupRegion": "JcHm3SZLxoRDFuuu", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'ByjlBiuFM3FIoVk8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'T3GpAnkCmBUqg2SC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "nqntX9y1aZSWMiVi", "groupIcon": "10sG6vxkfUcmqRRb", "groupName": "ceJ5i0EeDxOgBnhh", "groupRegion": "qElIaDml48wdNFLT", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'duat2vQR3biBfsu4' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"jmsRE2w1yEkLgh3t": {}, "IYt4SqYUTLDx9gIi": {}, "DandpGT2t24aOMh5": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'eC3IHeHSKLCa3xre' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'NDUWehwH3q31A806' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'DJgas4b6z3LNUj7f' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'dgLA84Z8YYk6QEgJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'jBbEDoNf3n0hEoRC' \
    --namespace "$AB_NAMESPACE" \
    --limit '54' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'cf80zfFyabWAgIUX' \
    --namespace "$AB_NAMESPACE" \
    --limit '16' \
    --offset '21' \
    --order 'I07A68eaqC2J9jyE' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'W6GLbc0NaKDUL3sa' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"13lk1dQBHO86IlBh": {}, "netU4RwTqUXlTDBz": {}, "OuYsaZA2yyd4mbqo": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'OfADMMAXFaY9eKa6' \
    --groupId '99bRVhyaKwwrAP2a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "Mlu7WtjCtoYetOO8", "ruleCriteria": "MINIMUM", "ruleValue": 0.9659389693373039}, {"ruleAttribute": "g8OudOfjnCuHZ3c4", "ruleCriteria": "MINIMUM", "ruleValue": 0.5798272799764201}, {"ruleAttribute": "RcQWsmqPNs92epxk", "ruleCriteria": "MINIMUM", "ruleValue": 0.14280255380651274}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction '8VxsZNereSvf9699' \
    --groupId 'mCEHThUJkETAsSp7' \
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
    --limit '13' \
    --offset '15' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'imdb4rbkXj0ZwsVC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "0gL97ZVJSPqJiwv1"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'qlYB1RSKs6gQxC3G' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "b7S0o4zGYY7KQI1A"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '64' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'MbqqZtfNWql4nmwA' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'ft4gqkNNlWkD9eOz' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'iYRFOn0jJLHC9Lxh' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'vNXTwGBCtohLtl9Z' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'uhytm5UDrT6QXCs5' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out

#- 46 GetListGroupByIDsAdminV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsAdminV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["SPBbRPZTF6oQAXVG", "7tnsZg5QgXjvyGJP", "N4eXbJE5Vs2Gcyom"]}' \
    > test.out 2>&1
eval_tap $? 46 'GetListGroupByIDsAdminV2' test.out

#- 47 GetUserJoinedGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserJoinedGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --userId 'QoIXimBJehyxlNsj' \
    --limit '95' \
    --offset '67' \
    > test.out 2>&1
eval_tap $? 47 'GetUserJoinedGroupInformationPublicV2' test.out

#- 48 AdminGetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group adminGetUserGroupStatusInformationV2 \
    --groupId 'gxBkF6wFPoJeQedi' \
    --namespace "$AB_NAMESPACE" \
    --userId 'ogEhhM2rIizGdKvO' \
    > test.out 2>&1
eval_tap $? 48 'AdminGetUserGroupStatusInformationV2' test.out

#- 49 CreateNewGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "Pdq5xrgxSmy1DN9L", "customAttributes": {"FkYW5DQyj4bj5Ro2": {}, "ogaKt2ujQSa3Zdb6": {}, "5UXmy0Zp6iIaTIKU": {}}, "groupDescription": "kmkk9QM0NBMA9ORx", "groupIcon": "pzwLR2AK6eXUGPJs", "groupMaxMember": 45, "groupName": "0V6Do5sYadCCFrHH", "groupRegion": "C3DpZxkrQDXuNFvi", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "arv8mnfHK8CCmE2l", "ruleCriteria": "MINIMUM", "ruleValue": 0.606135124069634}, {"ruleAttribute": "uIpomM8sm1MiaI1m", "ruleCriteria": "MAXIMUM", "ruleValue": 0.3261061203877309}, {"ruleAttribute": "gBp3HBvepnDCjgyJ", "ruleCriteria": "EQUAL", "ruleValue": 0.8500888035061814}]}, {"allowedAction": "createGroup", "ruleDetail": [{"ruleAttribute": "vGYYnx4V709xbnGe", "ruleCriteria": "MAXIMUM", "ruleValue": 0.40896607631188486}, {"ruleAttribute": "J6fH24T805tVg8Jq", "ruleCriteria": "MAXIMUM", "ruleValue": 0.14712153053005517}, {"ruleAttribute": "ZpjvsugAOS7u8RiW", "ruleCriteria": "MAXIMUM", "ruleValue": 0.9269760256130815}]}, {"allowedAction": "joinGroup", "ruleDetail": [{"ruleAttribute": "L4bTxBmZjdrrIxsB", "ruleCriteria": "EQUAL", "ruleValue": 0.6326681761603362}, {"ruleAttribute": "RsB1fPqqRRulpqpy", "ruleCriteria": "EQUAL", "ruleValue": 0.28216047189930427}, {"ruleAttribute": "S0uPdjhdinpng5BL", "ruleCriteria": "MAXIMUM", "ruleValue": 0.6608615516018669}]}]}, "groupType": "PUBLIC"}' \
    > test.out 2>&1
eval_tap $? 49 'CreateNewGroupPublicV2' test.out

#- 50 GetListGroupByIDsV2
./ng net.accelbyte.sdk.cli.Main group getListGroupByIDsV2 \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupIDs": ["wbhMssAHjapIkY9R", "f4wP57dBZNR88YbC", "tmKy8M9zVrjfGXZn"]}' \
    > test.out 2>&1
eval_tap $? 50 'GetListGroupByIDsV2' test.out

#- 51 UpdatePutSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePutSingleGroupPublicV2 \
    --groupId 'qAQUoY1GjlIIk0iK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "oTTS1j02o7JjTXAQ", "groupIcon": "N0qdskdQV0TqI8EF", "groupName": "nmDbxIxi4YKlONk2", "groupRegion": "Q5Y4Jvaizwiilatu", "groupType": "OPEN"}' \
    > test.out 2>&1
eval_tap $? 51 'UpdatePutSingleGroupPublicV2' test.out

#- 52 DeleteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV2 \
    --groupId 'lOC3mNqF7Bl0Lcgh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 52 'DeleteGroupPublicV2' test.out

#- 53 UpdatePatchSingleGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV2 \
    --groupId 'VHfPEspxwhRON0bc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "1eMbEIjowLqc3ecj", "groupIcon": "XJbZDKKoxLE1Y3Dy", "groupName": "mtj3giPg4x4yiPX6", "groupRegion": "ues1Hhhkg1yLVbLF", "groupType": "PRIVATE"}' \
    > test.out 2>&1
eval_tap $? 53 'UpdatePatchSingleGroupPublicV2' test.out

#- 54 UpdateGroupCustomAttributesPublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV2 \
    --groupId 'JbBfAKSiPW3VgsZX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"iR1DJ7HVWqMkNSaw": {}, "QUWDFJvJBWic7UkB": {}, "eIXuqDuAXI66bQ71": {}}}' \
    > test.out 2>&1
eval_tap $? 54 'UpdateGroupCustomAttributesPublicV2' test.out

#- 55 AcceptGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV2 \
    --groupId 'w0deoV9Lx5RDA1l2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 55 'AcceptGroupInvitationPublicV2' test.out

#- 56 RejectGroupInvitationPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV2 \
    --groupId 'XcrciYNEzvSZIPkh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 56 'RejectGroupInvitationPublicV2' test.out

#- 57 GetGroupInviteRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupInviteRequestPublicV2 \
    --groupId 'SgORcz5S5BvmgBLx' \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '41' \
    > test.out 2>&1
eval_tap $? 57 'GetGroupInviteRequestPublicV2' test.out

#- 58 JoinGroupV2
./ng net.accelbyte.sdk.cli.Main group joinGroupV2 \
    --groupId '4ijFnE3Tam69qSZ7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 58 'JoinGroupV2' test.out

#- 59 GetGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV2 \
    --groupId 'PC6f6QkmZXElW9Yf' \
    --namespace "$AB_NAMESPACE" \
    --limit '90' \
    --offset '100' \
    > test.out 2>&1
eval_tap $? 59 'GetGroupJoinRequestPublicV2' test.out

#- 60 LeaveGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group leaveGroupPublicV2 \
    --groupId 'Sse6AAz3S4czz0QK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 60 'LeaveGroupPublicV2' test.out

#- 61 UpdateGroupCustomRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV2 \
    --groupId 'FlAVmVLu4AOec0z8' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"eBeeoip68J1nsv4W": {}, "2OJhtafxMSJlHeb3": {}, "4sZKHcl5LLLOexL4": {}}}' \
    > test.out 2>&1
eval_tap $? 61 'UpdateGroupCustomRulePublicV2' test.out

#- 62 UpdateGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV2 \
    --allowedAction 'fZvWtND2tcBFpX8l' \
    --groupId 'NtFEJ7tnkY6Mca5a' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "fj12K2IzrBvvWm4u", "ruleCriteria": "EQUAL", "ruleValue": 0.659631531601669}, {"ruleAttribute": "EBM70TdlNBJYOmpu", "ruleCriteria": "EQUAL", "ruleValue": 0.7706353071366285}, {"ruleAttribute": "CarzBsV6xnZ5Jrzz", "ruleCriteria": "EQUAL", "ruleValue": 0.9638750648443265}]}' \
    > test.out 2>&1
eval_tap $? 62 'UpdateGroupPredefinedRulePublicV2' test.out

#- 63 DeleteGroupPredefinedRulePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV2 \
    --allowedAction 'hfxnhLd3Knaknoed' \
    --groupId '9DHhLOqQGhCUr6iT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 63 'DeleteGroupPredefinedRulePublicV2' test.out

#- 64 GetMemberRolesListPublicV2
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '37' \
    --offset '19' \
    > test.out 2>&1
eval_tap $? 64 'GetMemberRolesListPublicV2' test.out

#- 65 UpdateMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV2 \
    --groupId 'j0riFc5HTHQIoVsG' \
    --memberRoleId 'o7dwV9DBqFKHQkET' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "JyTlUrwDTnoujQD4"}' \
    > test.out 2>&1
eval_tap $? 65 'UpdateMemberRolePublicV2' test.out

#- 66 DeleteMemberRolePublicV2
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV2 \
    --groupId 'IEiH9Z5qXn3aoRtl' \
    --memberRoleId 'qOECohViHA5CzgFS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "y8X1A3PrIfapq5AA"}' \
    > test.out 2>&1
eval_tap $? 66 'DeleteMemberRolePublicV2' test.out

#- 67 GetUserGroupInformationPublicV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '78' \
    > test.out 2>&1
eval_tap $? 67 'GetUserGroupInformationPublicV2' test.out

#- 68 GetMyGroupJoinRequestV2
./ng net.accelbyte.sdk.cli.Main group getMyGroupJoinRequestV2 \
    --namespace "$AB_NAMESPACE" \
    --limit '9' \
    --offset '69' \
    > test.out 2>&1
eval_tap $? 68 'GetMyGroupJoinRequestV2' test.out

#- 69 InviteGroupPublicV2
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV2 \
    --groupId '4L3mDWORBVXTIIJM' \
    --namespace "$AB_NAMESPACE" \
    --userId '9XsYIIZxiXNMR9Bg' \
    > test.out 2>&1
eval_tap $? 69 'InviteGroupPublicV2' test.out

#- 70 CancelInvitationGroupMemberV2
./ng net.accelbyte.sdk.cli.Main group cancelInvitationGroupMemberV2 \
    --groupId 'aWcFX3SUBhyoTsMW' \
    --namespace "$AB_NAMESPACE" \
    --userId 'PAxUMkawaGpAyrIw' \
    > test.out 2>&1
eval_tap $? 70 'CancelInvitationGroupMemberV2' test.out

#- 71 AcceptGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV2 \
    --groupId 'Mif3BOdkocVTd4Bx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'qGWV6mTJ0sQs6XNb' \
    > test.out 2>&1
eval_tap $? 71 'AcceptGroupJoinRequestPublicV2' test.out

#- 72 RejectGroupJoinRequestPublicV2
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV2 \
    --groupId 'jvqhnUVLWu8olKdx' \
    --namespace "$AB_NAMESPACE" \
    --userId 'L6ozRmDD0jJvlfV5' \
    > test.out 2>&1
eval_tap $? 72 'RejectGroupJoinRequestPublicV2' test.out

#- 73 KickGroupMemberPublicV2
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV2 \
    --groupId 'OemPYdYT7DROCjtu' \
    --namespace "$AB_NAMESPACE" \
    --userId 'zFMbAG9YI89hmguB' \
    > test.out 2>&1
eval_tap $? 73 'KickGroupMemberPublicV2' test.out

#- 74 GetUserGroupStatusInformationV2
./ng net.accelbyte.sdk.cli.Main group getUserGroupStatusInformationV2 \
    --groupId '8FOTjMLo4b9rIzqY' \
    --namespace "$AB_NAMESPACE" \
    --userId 'kEpstyVTBcrM8rG0' \
    > test.out 2>&1
eval_tap $? 74 'GetUserGroupStatusInformationV2' test.out


rm -f "tmp.dat"

exit $EXIT_CODE