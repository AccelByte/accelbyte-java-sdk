package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operations.group_member.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class GroupMember {

    private AccelByteSDK sdk;

    public GroupMember(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public ModelsGetGroupMemberListResponseV1 getGroupMembersListAdminV1(GetGroupMembersListAdminV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetGroupMembersListAdminV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsMemberRequestGroupResponseV1 acceptGroupInvitationPublicV1(AcceptGroupInvitationPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AcceptGroupInvitationPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsMemberRequestGroupResponseV1 rejectGroupInvitationPublicV1(RejectGroupInvitationPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RejectGroupInvitationPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsJoinGroupResponseV1 joinGroupV1(JoinGroupV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new JoinGroupV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsMemberRequestGroupResponseV1 cancelGroupJoinRequestV1(CancelGroupJoinRequestV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CancelGroupJoinRequestV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetGroupMemberListResponseV1 getGroupMembersListPublicV1(GetGroupMembersListPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetGroupMembersListPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsLeaveGroupResponseV1 leaveGroupPublicV1(LeaveGroupPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new LeaveGroupPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsGetUserGroupInformationResponseV1 getUserGroupInformationPublicV1(GetUserGroupInformationPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetUserGroupInformationPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsUserInvitationResponseV1 inviteGroupPublicV1(InviteGroupPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new InviteGroupPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsMemberRequestGroupResponseV1 acceptGroupJoinRequestPublicV1(AcceptGroupJoinRequestPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AcceptGroupJoinRequestPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsMemberRequestGroupResponseV1 rejectGroupJoinRequestPublicV1(RejectGroupJoinRequestPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new RejectGroupJoinRequestPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelsKickGroupMemberResponseV1 kickGroupMemberPublicV1(KickGroupMemberPublicV1 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new KickGroupMemberPublicV1()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
