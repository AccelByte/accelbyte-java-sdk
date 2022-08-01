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
    --limit '83' \
    --offset '51' \
    > test.out 2>&1
eval_tap $? 2 'ListGroupConfigurationAdminV1' test.out

#- 3 CreateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group createGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "exbDE6SD", "description": "dyvkbRD5", "globalRules": [{"allowedAction": "nXK25fq2", "ruleDetail": [{"ruleAttribute": "GMaBmApW", "ruleCriteria": "MINIMUM", "ruleValue": 0.9053353560101202}, {"ruleAttribute": "HMqbFyGK", "ruleCriteria": "EQUAL", "ruleValue": 0.27524959919610026}, {"ruleAttribute": "B6VqqSKR", "ruleCriteria": "EQUAL", "ruleValue": 0.4315454047357923}]}, {"allowedAction": "bKpY14WC", "ruleDetail": [{"ruleAttribute": "dJWzv4sW", "ruleCriteria": "MINIMUM", "ruleValue": 0.26254300193820634}, {"ruleAttribute": "GWRZcqUw", "ruleCriteria": "EQUAL", "ruleValue": 0.9829375985205883}, {"ruleAttribute": "N1Hkzf7q", "ruleCriteria": "MINIMUM", "ruleValue": 0.19318777029648893}]}, {"allowedAction": "lTi8OqJV", "ruleDetail": [{"ruleAttribute": "VpOzI1Mw", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7201358639623266}, {"ruleAttribute": "fpiVpais", "ruleCriteria": "MINIMUM", "ruleValue": 0.9247785022966998}, {"ruleAttribute": "FKaPg0oj", "ruleCriteria": "MINIMUM", "ruleValue": 0.23407168561605662}]}], "groupAdminRoleId": "5kfIsFWR", "groupMaxMember": 93, "groupMemberRoleId": "e1vNhN1e", "name": "87i07mH3"}' \
    > test.out 2>&1
eval_tap $? 3 'CreateGroupConfigurationAdminV1' test.out

#- 4 InitiateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group initiateGroupConfigurationAdminV1 \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 4 'InitiateGroupConfigurationAdminV1' test.out

#- 5 GetGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupConfigurationAdminV1 \
    --configurationCode 'l7HmdClI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 5 'GetGroupConfigurationAdminV1' test.out

#- 6 DeleteGroupConfigurationV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationV1 \
    --configurationCode 'XpqPNltz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'DeleteGroupConfigurationV1' test.out

#- 7 UpdateGroupConfigurationAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationAdminV1 \
    --configurationCode 'JKVevzgS' \
    --namespace "$AB_NAMESPACE" \
    --body '{"description": "60UdP8dB", "groupMaxMember": 28, "name": "xBrdzdOj"}' \
    > test.out 2>&1
eval_tap $? 7 'UpdateGroupConfigurationAdminV1' test.out

#- 8 UpdateGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'Sba6JotU' \
    --configurationCode 'IV0ojO2Z' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "qiYUhClX", "ruleCriteria": "MINIMUM", "ruleValue": 0.28512434323556923}, {"ruleAttribute": "PC5DUWxs", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5380823454256642}, {"ruleAttribute": "BQ5R3guj", "ruleCriteria": "MAXIMUM", "ruleValue": 0.20641543528268935}]}' \
    > test.out 2>&1
eval_tap $? 8 'UpdateGroupConfigurationGlobalRuleAdminV1' test.out

#- 9 DeleteGroupConfigurationGlobalRuleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction 'lo5AaqiG' \
    --configurationCode 'kvADS7yx' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 9 'DeleteGroupConfigurationGlobalRuleAdminV1' test.out

#- 10 GetGroupListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --configurationCode 'itmGRasr' \
    --groupName 'RE9uRxhL' \
    --groupRegion 'Uc0OrHFq' \
    --limit '52' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 10 'GetGroupListAdminV1' test.out

#- 11 GetSingleGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupAdminV1 \
    --groupId 'scHrOcwI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 11 'GetSingleGroupAdminV1' test.out

#- 12 DeleteGroupAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupAdminV1 \
    --groupId '1wvOcoij' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'DeleteGroupAdminV1' test.out

#- 13 GetGroupMembersListAdminV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListAdminV1 \
    --groupId 'WSHh3JCC' \
    --namespace "$AB_NAMESPACE" \
    --limit '84' \
    --offset '81' \
    --order 'ouzmbmOT' \
    > test.out 2>&1
eval_tap $? 13 'GetGroupMembersListAdminV1' test.out

#- 14 GetMemberRolesListAdminV1
./ng net.accelbyte.sdk.cli.Main group getMemberRolesListAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '92' \
    --offset '88' \
    > test.out 2>&1
eval_tap $? 14 'GetMemberRolesListAdminV1' test.out

#- 15 CreateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group createMemberRoleAdminV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "o1GtnMEU", "memberRolePermissions": [{"action": 77, "resourceName": "owk0o2Og"}, {"action": 1, "resourceName": "3FUupXrp"}, {"action": 22, "resourceName": "Xftyqyhz"}]}' \
    > test.out 2>&1
eval_tap $? 15 'CreateMemberRoleAdminV1' test.out

#- 16 GetSingleMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group getSingleMemberRoleAdminV1 \
    --memberRoleId 'KaJ4Eiks' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'GetSingleMemberRoleAdminV1' test.out

#- 17 DeleteMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRoleAdminV1 \
    --memberRoleId 'cm6nD2do' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 17 'DeleteMemberRoleAdminV1' test.out

#- 18 UpdateMemberRoleAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRoleAdminV1 \
    --memberRoleId '6xJta8M2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRoleName": "e7O4sXsa"}' \
    > test.out 2>&1
eval_tap $? 18 'UpdateMemberRoleAdminV1' test.out

#- 19 UpdateMemberRolePermissionAdminV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePermissionAdminV1 \
    --memberRoleId 'ec5evQJM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"memberRolePermissions": [{"action": 91, "resourceName": "2j8McuFG"}, {"action": 57, "resourceName": "P1O0STse"}, {"action": 90, "resourceName": "FMmSZTOq"}]}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMemberRolePermissionAdminV1' test.out

#- 20 GetGroupListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupListPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --groupName 'ymTM3XfT' \
    --groupRegion 'htVBwKgQ' \
    --limit '73' \
    --offset '80' \
    > test.out 2>&1
eval_tap $? 20 'GetGroupListPublicV1' test.out

#- 21 CreateNewGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group createNewGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --body '{"configurationCode": "PnNHUxgV", "customAttributes": {"VzPILdMn": {}, "uEfyWCPF": {}, "F2OhykF3": {}}, "groupDescription": "fVePysUR", "groupIcon": "DwaHvDbG", "groupMaxMember": 6, "groupName": "aDxKKodk", "groupRegion": "XrZjHUAW", "groupRules": {"groupCustomRule": {}, "groupPredefinedRules": [{"allowedAction": "ZlqXYqb2", "ruleDetail": [{"ruleAttribute": "8uyqIJIB", "ruleCriteria": "EQUAL", "ruleValue": 0.07053888085236293}, {"ruleAttribute": "9Z603TfA", "ruleCriteria": "MAXIMUM", "ruleValue": 0.5809104345053131}, {"ruleAttribute": "LZGlUcXE", "ruleCriteria": "EQUAL", "ruleValue": 0.00016580058742443615}]}, {"allowedAction": "tKiiky5O", "ruleDetail": [{"ruleAttribute": "VMN66BKt", "ruleCriteria": "MINIMUM", "ruleValue": 0.3985483024877785}, {"ruleAttribute": "w0XrvaIc", "ruleCriteria": "MAXIMUM", "ruleValue": 0.023351087282450944}, {"ruleAttribute": "hCoZtIBj", "ruleCriteria": "EQUAL", "ruleValue": 0.4019261181578129}]}, {"allowedAction": "cILIztwg", "ruleDetail": [{"ruleAttribute": "boMBNsD2", "ruleCriteria": "MAXIMUM", "ruleValue": 0.916128246705839}, {"ruleAttribute": "0dkCbzd4", "ruleCriteria": "MINIMUM", "ruleValue": 0.7228488328420845}, {"ruleAttribute": "tjdqCMb6", "ruleCriteria": "EQUAL", "ruleValue": 0.32262372752050383}]}]}, "groupType": "TwwdHBAd"}' \
    > test.out 2>&1
eval_tap $? 21 'CreateNewGroupPublicV1' test.out

#- 22 GetSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group getSingleGroupPublicV1 \
    --groupId '1VfbvqKq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 22 'GetSingleGroupPublicV1' test.out

#- 23 UpdateSingleGroupV1
./ng net.accelbyte.sdk.cli.Main group updateSingleGroupV1 \
    --groupId '6KxHnr4R' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "pkuKOMUZ", "groupIcon": "YEpQkY1T", "groupName": "QP3QtJdT", "groupRegion": "rPb8nkhf", "groupType": "m4bsh3bF"}' \
    > test.out 2>&1
eval_tap $? 23 'UpdateSingleGroupV1' test.out

#- 24 DeleteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPublicV1 \
    --groupId 'nOVAMaqG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 24 'DeleteGroupPublicV1' test.out

#- 25 UpdatePatchSingleGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group updatePatchSingleGroupPublicV1 \
    --groupId 'tfBnxNzi' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {}, "groupDescription": "WdKLVOaX", "groupIcon": "KephK55B", "groupName": "wYd0owec", "groupRegion": "XiFPSH7t", "groupType": "YkqQwTJL"}' \
    > test.out 2>&1
eval_tap $? 25 'UpdatePatchSingleGroupPublicV1' test.out

#- 26 UpdateGroupCustomAttributesPublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomAttributesPublicV1 \
    --groupId 'ZGVqhLEP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"customAttributes": {"jfllgCMD": {}, "KoDKCulb": {}, "xqEg2SNH": {}}}' \
    > test.out 2>&1
eval_tap $? 26 'UpdateGroupCustomAttributesPublicV1' test.out

#- 27 AcceptGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupInvitationPublicV1 \
    --groupId 'Afp3QJFB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'AcceptGroupInvitationPublicV1' test.out

#- 28 RejectGroupInvitationPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupInvitationPublicV1 \
    --groupId 'BMsjyBAV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'RejectGroupInvitationPublicV1' test.out

#- 29 JoinGroupV1
./ng net.accelbyte.sdk.cli.Main group joinGroupV1 \
    --groupId 'h3yAlzW1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 29 'JoinGroupV1' test.out

#- 30 CancelGroupJoinRequestV1
./ng net.accelbyte.sdk.cli.Main group cancelGroupJoinRequestV1 \
    --groupId 'KIQei5Cy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'CancelGroupJoinRequestV1' test.out

#- 31 GetGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupJoinRequestPublicV1 \
    --groupId 'j7DTytNk' \
    --namespace "$AB_NAMESPACE" \
    --limit '26' \
    --offset '49' \
    > test.out 2>&1
eval_tap $? 31 'GetGroupJoinRequestPublicV1' test.out

#- 32 GetGroupMembersListPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupMembersListPublicV1 \
    --groupId 'ReGYJPwg' \
    --namespace "$AB_NAMESPACE" \
    --limit '20' \
    --offset '8' \
    --order 'ltRmp1iV' \
    > test.out 2>&1
eval_tap $? 32 'GetGroupMembersListPublicV1' test.out

#- 33 UpdateGroupCustomRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupCustomRulePublicV1 \
    --groupId 'T2TySEkV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"groupCustomRule": {"KEZFAT2n": {}, "6KCB3cSu": {}, "uXjUXbKf": {}}}' \
    > test.out 2>&1
eval_tap $? 33 'UpdateGroupCustomRulePublicV1' test.out

#- 34 UpdateGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group updateGroupPredefinedRulePublicV1 \
    --allowedAction 'LYUSNZqS' \
    --groupId 'v09tJQST' \
    --namespace "$AB_NAMESPACE" \
    --body '{"ruleDetail": [{"ruleAttribute": "MEO0vaVz", "ruleCriteria": "EQUAL", "ruleValue": 0.8804085251554056}, {"ruleAttribute": "fOA9CTGR", "ruleCriteria": "MAXIMUM", "ruleValue": 0.4265389558167809}, {"ruleAttribute": "vVL40ecd", "ruleCriteria": "MAXIMUM", "ruleValue": 0.7476779582768021}]}' \
    > test.out 2>&1
eval_tap $? 34 'UpdateGroupPredefinedRulePublicV1' test.out

#- 35 DeleteGroupPredefinedRulePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteGroupPredefinedRulePublicV1 \
    --allowedAction 'sNKN5cWs' \
    --groupId 'c52uB33e' \
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
    --limit '23' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 37 'GetMemberRolesListPublicV1' test.out

#- 38 UpdateMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group updateMemberRolePublicV1 \
    --memberRoleId 'P1xmgrIc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "rzkLGCPx"}' \
    > test.out 2>&1
eval_tap $? 38 'UpdateMemberRolePublicV1' test.out

#- 39 DeleteMemberRolePublicV1
./ng net.accelbyte.sdk.cli.Main group deleteMemberRolePublicV1 \
    --memberRoleId 'GTsauDVq' \
    --namespace "$AB_NAMESPACE" \
    --body '{"userId": "EqrL21pF"}' \
    > test.out 2>&1
eval_tap $? 39 'DeleteMemberRolePublicV1' test.out

#- 40 GetGroupInvitationRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group getGroupInvitationRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --limit '40' \
    --offset '53' \
    > test.out 2>&1
eval_tap $? 40 'GetGroupInvitationRequestPublicV1' test.out

#- 41 GetUserGroupInformationPublicV1
./ng net.accelbyte.sdk.cli.Main group getUserGroupInformationPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'SLToje49' \
    > test.out 2>&1
eval_tap $? 41 'GetUserGroupInformationPublicV1' test.out

#- 42 InviteGroupPublicV1
./ng net.accelbyte.sdk.cli.Main group inviteGroupPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'Q0WmFnzK' \
    > test.out 2>&1
eval_tap $? 42 'InviteGroupPublicV1' test.out

#- 43 AcceptGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group acceptGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'OdiHplgx' \
    > test.out 2>&1
eval_tap $? 43 'AcceptGroupJoinRequestPublicV1' test.out

#- 44 RejectGroupJoinRequestPublicV1
./ng net.accelbyte.sdk.cli.Main group rejectGroupJoinRequestPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId '8HmQubCu' \
    > test.out 2>&1
eval_tap $? 44 'RejectGroupJoinRequestPublicV1' test.out

#- 45 KickGroupMemberPublicV1
./ng net.accelbyte.sdk.cli.Main group kickGroupMemberPublicV1 \
    --namespace "$AB_NAMESPACE" \
    --userId 'kXXQirOy' \
    > test.out 2>&1
eval_tap $? 45 'KickGroupMemberPublicV1' test.out


rm -f "tmp.dat"

exit $EXIT_CODE