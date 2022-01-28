package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.group.configuration.*;
import net.accelbyte.sdk.cli.api.group.group.*;
import net.accelbyte.sdk.cli.api.group.group_member.*;
import net.accelbyte.sdk.cli.api.group.group_roles.*;
import net.accelbyte.sdk.cli.api.group.member_request.*;

import picocli.CommandLine.Command;

@Command(name = "group",
        mixinStandardHelpOptions = true,
        subcommands = {
                ListGroupConfigurationAdminV1.class,
                CreateGroupConfigurationAdminV1.class,
                InitiateGroupConfigurationAdminV1.class,
                GetGroupConfigurationAdminV1.class,
                DeleteGroupConfigurationV1.class,
                UpdateGroupConfigurationAdminV1.class,
                UpdateGroupConfigurationGlobalRuleAdminV1.class,
                DeleteGroupConfigurationGlobalRuleAdminV1.class,
                GetGroupListAdminV1.class,
                GetSingleGroupAdminV1.class,
                DeleteGroupAdminV1.class,
                GetGroupMembersListAdminV1.class,
                GetMemberRolesListAdminV1.class,
                CreateMemberRoleAdminV1.class,
                GetSingleMemberRoleAdminV1.class,
                DeleteMemberRoleAdminV1.class,
                UpdateMemberRoleAdminV1.class,
                UpdateMemberRolePermissionAdminV1.class,
                GetGroupListPublicV1.class,
                CreateNewGroupPublicV1.class,
                GetSingleGroupPublicV1.class,
                UpdateSingleGroupV1.class,
                DeleteGroupPublicV1.class,
                UpdatePatchSingleGroupPublicV1.class,
                UpdateGroupCustomAttributesPublicV1.class,
                AcceptGroupInvitationPublicV1.class,
                RejectGroupInvitationPublicV1.class,
                JoinGroupV1.class,
                CancelGroupJoinRequestV1.class,
                GetGroupJoinRequestPublicV1.class,
                GetGroupMembersListPublicV1.class,
                UpdateGroupCustomRulePublicV1.class,
                UpdateGroupPredefinedRulePublicV1.class,
                DeleteGroupPredefinedRulePublicV1.class,
                LeaveGroupPublicV1.class,
                GetMemberRolesListPublicV1.class,
                UpdateMemberRolePublicV1.class,
                DeleteMemberRolePublicV1.class,
                GetGroupInvitationRequestPublicV1.class,
                GetUserGroupInformationPublicV1.class,
                InviteGroupPublicV1.class,
                AcceptGroupJoinRequestPublicV1.class,
                RejectGroupJoinRequestPublicV1.class,
                KickGroupMemberPublicV1.class,
        }
)
public class Group implements Runnable {

    @Override
    public void run() {

    }
}