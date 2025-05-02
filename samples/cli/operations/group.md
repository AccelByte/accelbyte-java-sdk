## Java Extend SDK CLI Sample App Operation Index for Group service

### Operation ListGroupConfigurationAdminV1

```sh
$ build/install/cli/bin/cli group listGroupConfigurationAdminV1 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateGroupConfigurationAdminV1

```sh
$ build/install/cli/bin/cli group createGroupConfigurationAdminV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation InitiateGroupConfigurationAdminV1

```sh
$ build/install/cli/bin/cli group initiateGroupConfigurationAdminV1 \
    --namespace <namespace value>
```

### Operation GetGroupConfigurationAdminV1

```sh
$ build/install/cli/bin/cli group getGroupConfigurationAdminV1 \
    --configurationCode <configurationCode value> \
    --namespace <namespace value>
```

### Operation DeleteGroupConfigurationV1

```sh
$ build/install/cli/bin/cli group deleteGroupConfigurationV1 \
    --configurationCode <configurationCode value> \
    --namespace <namespace value>
```

### Operation UpdateGroupConfigurationAdminV1

```sh
$ build/install/cli/bin/cli group updateGroupConfigurationAdminV1 \
    --configurationCode <configurationCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateGroupConfigurationGlobalRuleAdminV1

```sh
$ build/install/cli/bin/cli group updateGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction <allowedAction value> \
    --configurationCode <configurationCode value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteGroupConfigurationGlobalRuleAdminV1

```sh
$ build/install/cli/bin/cli group deleteGroupConfigurationGlobalRuleAdminV1 \
    --allowedAction <allowedAction value> \
    --configurationCode <configurationCode value> \
    --namespace <namespace value>
```

### Operation GetGroupListAdminV1

```sh
$ build/install/cli/bin/cli group getGroupListAdminV1 \
    --namespace <namespace value> \
    --configurationCode <configurationCode value - optional> \
    --groupName <groupName value - optional> \
    --groupRegion <groupRegion value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetSingleGroupAdminV1

```sh
$ build/install/cli/bin/cli group getSingleGroupAdminV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation DeleteGroupAdminV1

```sh
$ build/install/cli/bin/cli group deleteGroupAdminV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation GetGroupMembersListAdminV1

```sh
$ build/install/cli/bin/cli group getGroupMembersListAdminV1 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional>
```

### Operation GetMemberRolesListAdminV1

```sh
$ build/install/cli/bin/cli group getMemberRolesListAdminV1 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateMemberRoleAdminV1

```sh
$ build/install/cli/bin/cli group createMemberRoleAdminV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetSingleMemberRoleAdminV1

```sh
$ build/install/cli/bin/cli group getSingleMemberRoleAdminV1 \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value>
```

### Operation DeleteMemberRoleAdminV1

```sh
$ build/install/cli/bin/cli group deleteMemberRoleAdminV1 \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value>
```

### Operation UpdateMemberRoleAdminV1

```sh
$ build/install/cli/bin/cli group updateMemberRoleAdminV1 \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateMemberRolePermissionAdminV1

```sh
$ build/install/cli/bin/cli group updateMemberRolePermissionAdminV1 \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetGroupListPublicV1

```sh
$ build/install/cli/bin/cli group getGroupListPublicV1 \
    --namespace <namespace value> \
    --groupName <groupName value - optional> \
    --groupRegion <groupRegion value - optional> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation CreateNewGroupPublicV1

```sh
$ build/install/cli/bin/cli group createNewGroupPublicV1 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetSingleGroupPublicV1

```sh
$ build/install/cli/bin/cli group getSingleGroupPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation UpdateSingleGroupV1

```sh
$ build/install/cli/bin/cli group updateSingleGroupV1 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteGroupPublicV1

```sh
$ build/install/cli/bin/cli group deleteGroupPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation UpdatePatchSingleGroupPublicV1

```sh
$ build/install/cli/bin/cli group updatePatchSingleGroupPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateGroupCustomAttributesPublicV1

```sh
$ build/install/cli/bin/cli group updateGroupCustomAttributesPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AcceptGroupInvitationPublicV1

```sh
$ build/install/cli/bin/cli group acceptGroupInvitationPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation RejectGroupInvitationPublicV1

```sh
$ build/install/cli/bin/cli group rejectGroupInvitationPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation JoinGroupV1

```sh
$ build/install/cli/bin/cli group joinGroupV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation CancelGroupJoinRequestV1

```sh
$ build/install/cli/bin/cli group cancelGroupJoinRequestV1 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation GetGroupJoinRequestPublicV1

```sh
$ build/install/cli/bin/cli group getGroupJoinRequestPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetGroupMembersListPublicV1

```sh
$ build/install/cli/bin/cli group getGroupMembersListPublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional> \
    --order <order value - optional>
```

### Operation UpdateGroupCustomRulePublicV1

```sh
$ build/install/cli/bin/cli group updateGroupCustomRulePublicV1 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateGroupPredefinedRulePublicV1

```sh
$ build/install/cli/bin/cli group updateGroupPredefinedRulePublicV1 \
    --allowedAction <allowedAction value> \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteGroupPredefinedRulePublicV1

```sh
$ build/install/cli/bin/cli group deleteGroupPredefinedRulePublicV1 \
    --allowedAction <allowedAction value> \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation LeaveGroupPublicV1

```sh
$ build/install/cli/bin/cli group leaveGroupPublicV1 \
    --namespace <namespace value>
```

### Operation GetMemberRolesListPublicV1

```sh
$ build/install/cli/bin/cli group getMemberRolesListPublicV1 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation UpdateMemberRolePublicV1

```sh
$ build/install/cli/bin/cli group updateMemberRolePublicV1 \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteMemberRolePublicV1

```sh
$ build/install/cli/bin/cli group deleteMemberRolePublicV1 \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetGroupInvitationRequestPublicV1

```sh
$ build/install/cli/bin/cli group getGroupInvitationRequestPublicV1 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetUserGroupInformationPublicV1

```sh
$ build/install/cli/bin/cli group getUserGroupInformationPublicV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation InviteGroupPublicV1

```sh
$ build/install/cli/bin/cli group inviteGroupPublicV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AcceptGroupJoinRequestPublicV1

```sh
$ build/install/cli/bin/cli group acceptGroupJoinRequestPublicV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation RejectGroupJoinRequestPublicV1

```sh
$ build/install/cli/bin/cli group rejectGroupJoinRequestPublicV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation KickGroupMemberPublicV1

```sh
$ build/install/cli/bin/cli group kickGroupMemberPublicV1 \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetListGroupByIDsAdminV2

```sh
$ build/install/cli/bin/cli group getListGroupByIDsAdminV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetUserJoinedGroupInformationPublicV2

```sh
$ build/install/cli/bin/cli group getUserJoinedGroupInformationPublicV2 \
    --namespace <namespace value> \
    --userId <userId value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation AdminGetUserGroupStatusInformationV2

```sh
$ build/install/cli/bin/cli group adminGetUserGroupStatusInformationV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation CreateNewGroupPublicV2

```sh
$ build/install/cli/bin/cli group createNewGroupPublicV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetListGroupByIDsV2

```sh
$ build/install/cli/bin/cli group getListGroupByIDsV2 \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdatePutSingleGroupPublicV2

```sh
$ build/install/cli/bin/cli group updatePutSingleGroupPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteGroupPublicV2

```sh
$ build/install/cli/bin/cli group deleteGroupPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation UpdatePatchSingleGroupPublicV2

```sh
$ build/install/cli/bin/cli group updatePatchSingleGroupPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateGroupCustomAttributesPublicV2

```sh
$ build/install/cli/bin/cli group updateGroupCustomAttributesPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation AcceptGroupInvitationPublicV2

```sh
$ build/install/cli/bin/cli group acceptGroupInvitationPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation RejectGroupInvitationPublicV2

```sh
$ build/install/cli/bin/cli group rejectGroupInvitationPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation GetGroupInviteRequestPublicV2

```sh
$ build/install/cli/bin/cli group getGroupInviteRequestPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation JoinGroupV2

```sh
$ build/install/cli/bin/cli group joinGroupV2 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation GetGroupJoinRequestPublicV2

```sh
$ build/install/cli/bin/cli group getGroupJoinRequestPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation LeaveGroupPublicV2

```sh
$ build/install/cli/bin/cli group leaveGroupPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation UpdateGroupCustomRulePublicV2

```sh
$ build/install/cli/bin/cli group updateGroupCustomRulePublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation UpdateGroupPredefinedRulePublicV2

```sh
$ build/install/cli/bin/cli group updateGroupPredefinedRulePublicV2 \
    --allowedAction <allowedAction value> \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteGroupPredefinedRulePublicV2

```sh
$ build/install/cli/bin/cli group deleteGroupPredefinedRulePublicV2 \
    --allowedAction <allowedAction value> \
    --groupId <groupId value> \
    --namespace <namespace value>
```

### Operation GetMemberRolesListPublicV2

```sh
$ build/install/cli/bin/cli group getMemberRolesListPublicV2 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation UpdateMemberRolePublicV2

```sh
$ build/install/cli/bin/cli group updateMemberRolePublicV2 \
    --groupId <groupId value> \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation DeleteMemberRolePublicV2

```sh
$ build/install/cli/bin/cli group deleteMemberRolePublicV2 \
    --groupId <groupId value> \
    --memberRoleId <memberRoleId value> \
    --namespace <namespace value> \
    --body <json string for request body>
```

### Operation GetUserGroupInformationPublicV2

```sh
$ build/install/cli/bin/cli group getUserGroupInformationPublicV2 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation GetMyGroupJoinRequestV2

```sh
$ build/install/cli/bin/cli group getMyGroupJoinRequestV2 \
    --namespace <namespace value> \
    --limit <limit value - optional> \
    --offset <offset value - optional>
```

### Operation InviteGroupPublicV2

```sh
$ build/install/cli/bin/cli group inviteGroupPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation CancelInvitationGroupMemberV2

```sh
$ build/install/cli/bin/cli group cancelInvitationGroupMemberV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation AcceptGroupJoinRequestPublicV2

```sh
$ build/install/cli/bin/cli group acceptGroupJoinRequestPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation RejectGroupJoinRequestPublicV2

```sh
$ build/install/cli/bin/cli group rejectGroupJoinRequestPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation KickGroupMemberPublicV2

```sh
$ build/install/cli/bin/cli group kickGroupMemberPublicV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

### Operation GetUserGroupStatusInformationV2

```sh
$ build/install/cli/bin/cli group getUserGroupStatusInformationV2 \
    --groupId <groupId value> \
    --namespace <namespace value> \
    --userId <userId value>
```

