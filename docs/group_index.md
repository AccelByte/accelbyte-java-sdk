# Group Service Index

&nbsp;  

## Operations

### Configuration Wrapper:  [Configuration](../src/main/java/net/accelbyte/sdk/api/group/wrappers/Configuration.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/group/v1/admin/namespaces/{namespace}/configuration` | GET | ListGroupConfigurationAdminV1 | [ListGroupConfigurationAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/ListGroupConfigurationAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/configuration` | POST | CreateGroupConfigurationAdminV1 | [CreateGroupConfigurationAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/CreateGroupConfigurationAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/configuration/initiate` | POST | InitiateGroupConfigurationAdminV1 | [InitiateGroupConfigurationAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/InitiateGroupConfigurationAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}` | GET | GetGroupConfigurationAdminV1 | [GetGroupConfigurationAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/GetGroupConfigurationAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}` | DELETE | DeleteGroupConfigurationV1 | [DeleteGroupConfigurationV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/DeleteGroupConfigurationV1.java) |
| `/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}` | PATCH | UpdateGroupConfigurationAdminV1 | [UpdateGroupConfigurationAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/UpdateGroupConfigurationAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}/rules/{allowedAction}` | PUT | UpdateGroupConfigurationGlobalRuleAdminV1 | [UpdateGroupConfigurationGlobalRuleAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/UpdateGroupConfigurationGlobalRuleAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/configuration/{configurationCode}/rules/{allowedAction}` | DELETE | DeleteGroupConfigurationGlobalRuleAdminV1 | [DeleteGroupConfigurationGlobalRuleAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/configuration/DeleteGroupConfigurationGlobalRuleAdminV1.java) |

### Group Wrapper:  [Group](../src/main/java/net/accelbyte/sdk/api/group/wrappers/Group.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/group/v1/admin/namespaces/{namespace}/groups` | GET | GetGroupListAdminV1 | [GetGroupListAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/GetGroupListAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/groups/{groupId}` | GET | GetSingleGroupAdminV1 | [GetSingleGroupAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/GetSingleGroupAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/groups/{groupId}` | DELETE | DeleteGroupAdminV1 | [DeleteGroupAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/DeleteGroupAdminV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups` | GET | GetGroupListPublicV1 | [GetGroupListPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/GetGroupListPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups` | POST | CreateNewGroupPublicV1 | [CreateNewGroupPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/CreateNewGroupPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}` | GET | GetSingleGroupPublicV1 | [GetSingleGroupPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/GetSingleGroupPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}` | PUT | UpdateSingleGroupV1 | [UpdateSingleGroupV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/UpdateSingleGroupV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}` | DELETE | DeleteGroupPublicV1 | [DeleteGroupPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/DeleteGroupPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}` | PATCH | UpdatePatchSingleGroupPublicV1 | [UpdatePatchSingleGroupPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/UpdatePatchSingleGroupPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/attributes/custom` | PUT | UpdateGroupCustomAttributesPublicV1 | [UpdateGroupCustomAttributesPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/UpdateGroupCustomAttributesPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/rules/custom` | PUT | UpdateGroupCustomRulePublicV1 | [UpdateGroupCustomRulePublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/UpdateGroupCustomRulePublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/rules/defined/{allowedAction}` | PUT | UpdateGroupPredefinedRulePublicV1 | [UpdateGroupPredefinedRulePublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/UpdateGroupPredefinedRulePublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/rules/defined/{allowedAction}` | DELETE | DeleteGroupPredefinedRulePublicV1 | [DeleteGroupPredefinedRulePublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group/DeleteGroupPredefinedRulePublicV1.java) |

### Group Member Wrapper:  [GroupMember](../src/main/java/net/accelbyte/sdk/api/group/wrappers/GroupMember.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/group/v1/admin/namespaces/{namespace}/groups/{groupId}/members` | GET | GetGroupMembersListAdminV1 | [GetGroupMembersListAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/GetGroupMembersListAdminV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/invite/accept` | POST | AcceptGroupInvitationPublicV1 | [AcceptGroupInvitationPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/AcceptGroupInvitationPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/invite/reject` | POST | RejectGroupInvitationPublicV1 | [RejectGroupInvitationPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/RejectGroupInvitationPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/join` | POST | JoinGroupV1 | [JoinGroupV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/JoinGroupV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/join/cancel` | POST | CancelGroupJoinRequestV1 | [CancelGroupJoinRequestV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/CancelGroupJoinRequestV1.java) |
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/members` | GET | GetGroupMembersListPublicV1 | [GetGroupMembersListPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/GetGroupMembersListPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/leave` | POST | LeaveGroupPublicV1 | [LeaveGroupPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/LeaveGroupPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/users/{userId}` | GET | GetUserGroupInformationPublicV1 | [GetUserGroupInformationPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/GetUserGroupInformationPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/users/{userId}/invite` | POST | InviteGroupPublicV1 | [InviteGroupPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/InviteGroupPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/users/{userId}/join/accept` | POST | AcceptGroupJoinRequestPublicV1 | [AcceptGroupJoinRequestPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/AcceptGroupJoinRequestPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/users/{userId}/join/reject` | POST | RejectGroupJoinRequestPublicV1 | [RejectGroupJoinRequestPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/RejectGroupJoinRequestPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/users/{userId}/kick` | POST | KickGroupMemberPublicV1 | [KickGroupMemberPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_member/KickGroupMemberPublicV1.java) |

### Group Roles Wrapper:  [GroupRoles](../src/main/java/net/accelbyte/sdk/api/group/wrappers/GroupRoles.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/group/v1/admin/namespaces/{namespace}/roles` | GET | GetMemberRolesListAdminV1 | [GetMemberRolesListAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/GetMemberRolesListAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/roles` | POST | CreateMemberRoleAdminV1 | [CreateMemberRoleAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/CreateMemberRoleAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}` | GET | GetSingleMemberRoleAdminV1 | [GetSingleMemberRoleAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/GetSingleMemberRoleAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}` | DELETE | DeleteMemberRoleAdminV1 | [DeleteMemberRoleAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/DeleteMemberRoleAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}` | PATCH | UpdateMemberRoleAdminV1 | [UpdateMemberRoleAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/UpdateMemberRoleAdminV1.java) |
| `/group/v1/admin/namespaces/{namespace}/roles/{memberRoleId}/permissions` | PUT | UpdateMemberRolePermissionAdminV1 | [UpdateMemberRolePermissionAdminV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/UpdateMemberRolePermissionAdminV1.java) |
| `/group/v1/public/namespaces/{namespace}/roles` | GET | GetMemberRolesListPublicV1 | [GetMemberRolesListPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/GetMemberRolesListPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/roles/{memberRoleId}/members` | POST | UpdateMemberRolePublicV1 | [UpdateMemberRolePublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/UpdateMemberRolePublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/roles/{memberRoleId}/members` | DELETE | DeleteMemberRolePublicV1 | [DeleteMemberRolePublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/group_roles/DeleteMemberRolePublicV1.java) |

### Member Request Wrapper:  [MemberRequest](../src/main/java/net/accelbyte/sdk/api/group/wrappers/MemberRequest.java)
| Endpoint | Method | ID | Class |
|---|---|---|---|
| `/group/v1/public/namespaces/{namespace}/groups/{groupId}/join/request` | GET | GetGroupJoinRequestPublicV1 | [GetGroupJoinRequestPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/member_request/GetGroupJoinRequestPublicV1.java) |
| `/group/v1/public/namespaces/{namespace}/users/me/invite/request` | GET | GetGroupInvitationRequestPublicV1 | [GetGroupInvitationRequestPublicV1](../src/main/java/net/accelbyte/sdk/api/group/operations/member_request/GetGroupInvitationRequestPublicV1.java) |


&nbsp;  

## Models

| Model | Class |
|---|---|
| `models.AssignRoleToMemberRequestV1` | [ModelsAssignRoleToMemberRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsAssignRoleToMemberRequestV1.java) |
| `models.CreateGroupConfigurationRequestV1` | [ModelsCreateGroupConfigurationRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsCreateGroupConfigurationRequestV1.java) |
| `models.CreateGroupConfigurationResponseV1` | [ModelsCreateGroupConfigurationResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsCreateGroupConfigurationResponseV1.java) |
| `models.CreateMemberRoleRequestV1` | [ModelsCreateMemberRoleRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsCreateMemberRoleRequestV1.java) |
| `models.CreateMemberRoleResponseV1` | [ModelsCreateMemberRoleResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsCreateMemberRoleResponseV1.java) |
| `models.GetGroupConfigurationResponseV1` | [ModelsGetGroupConfigurationResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGetGroupConfigurationResponseV1.java) |
| `models.GetGroupMemberListResponseV1` | [ModelsGetGroupMemberListResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGetGroupMemberListResponseV1.java) |
| `models.GetGroupsListResponseV1` | [ModelsGetGroupsListResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGetGroupsListResponseV1.java) |
| `models.GetMemberRequestsListResponseV1` | [ModelsGetMemberRequestsListResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGetMemberRequestsListResponseV1.java) |
| `models.GetMemberRoleResponseV1` | [ModelsGetMemberRoleResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGetMemberRoleResponseV1.java) |
| `models.GetMemberRolesListResponseV1` | [ModelsGetMemberRolesListResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGetMemberRolesListResponseV1.java) |
| `models.GetUserGroupInformationResponseV1` | [ModelsGetUserGroupInformationResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGetUserGroupInformationResponseV1.java) |
| `models.GroupMember` | [ModelsGroupMember](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGroupMember.java) |
| `models.GroupResponseV1` | [ModelsGroupResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGroupResponseV1.java) |
| `models.GroupRule` | [ModelsGroupRule](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGroupRule.java) |
| `models.GroupRule.groupCustomRule` | [ModelsGroupRuleGroupCustomRule](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsGroupRuleGroupCustomRule.java) |
| `models.JoinGroupResponseV1` | [ModelsJoinGroupResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsJoinGroupResponseV1.java) |
| `models.KickGroupMemberResponseV1` | [ModelsKickGroupMemberResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsKickGroupMemberResponseV1.java) |
| `models.LeaveGroupResponseV1` | [ModelsLeaveGroupResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsLeaveGroupResponseV1.java) |
| `models.ListConfigurationResponseV1` | [ModelsListConfigurationResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsListConfigurationResponseV1.java) |
| `models.MemberRequestGroupResponseV1` | [ModelsMemberRequestGroupResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsMemberRequestGroupResponseV1.java) |
| `models.MemberRequestResponseV1` | [ModelsMemberRequestResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsMemberRequestResponseV1.java) |
| `models.Pagination` | [ModelsPagination](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsPagination.java) |
| `models.PublicCreateNewGroupRequestV1` | [ModelsPublicCreateNewGroupRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsPublicCreateNewGroupRequestV1.java) |
| `models.RemoveRoleFromMemberRequestV1` | [ModelsRemoveRoleFromMemberRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsRemoveRoleFromMemberRequestV1.java) |
| `models.RolePermission` | [ModelsRolePermission](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsRolePermission.java) |
| `models.Rule` | [ModelsRule](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsRule.java) |
| `models.RuleInformation` | [ModelsRuleInformation](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsRuleInformation.java) |
| `models.UpdateGroupConfigurationGlobalRulesRequestV1` | [ModelsUpdateGroupConfigurationGlobalRulesRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupConfigurationGlobalRulesRequestV1.java) |
| `models.UpdateGroupConfigurationRequestV1` | [ModelsUpdateGroupConfigurationRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupConfigurationRequestV1.java) |
| `models.UpdateGroupConfigurationResponseV1` | [ModelsUpdateGroupConfigurationResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupConfigurationResponseV1.java) |
| `models.UpdateGroupCustomAttributesRequestV1` | [ModelsUpdateGroupCustomAttributesRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupCustomAttributesRequestV1.java) |
| `models.UpdateGroupCustomRuleRequestV1` | [ModelsUpdateGroupCustomRuleRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupCustomRuleRequestV1.java) |
| `models.UpdateGroupPredefinedRuleRequestV1` | [ModelsUpdateGroupPredefinedRuleRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupPredefinedRuleRequestV1.java) |
| `models.UpdateGroupRequestV1` | [ModelsUpdateGroupRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupRequestV1.java) |
| `models.UpdateGroupRequestV1.customAttributes` | [ModelsUpdateGroupRequestV1CustomAttributes](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateGroupRequestV1CustomAttributes.java) |
| `models.UpdateMemberRolePermissionsRequestV1` | [ModelsUpdateMemberRolePermissionsRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateMemberRolePermissionsRequestV1.java) |
| `models.UpdateMemberRoleRequestV1` | [ModelsUpdateMemberRoleRequestV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateMemberRoleRequestV1.java) |
| `models.UpdateMemberRoleResponseV1` | [ModelsUpdateMemberRoleResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUpdateMemberRoleResponseV1.java) |
| `models.UserInvitationResponseV1` | [ModelsUserInvitationResponseV1](../src/main/java/net/accelbyte/sdk/api/group/models/ModelsUserInvitationResponseV1.java) |
| `response.ErrorResponse` | [ResponseErrorResponse](../src/main/java/net/accelbyte/sdk/api/group/models/ResponseErrorResponse.java) |
