/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operations.group_member.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GroupMember {

  private AccelByteSDK sdk;

  public GroupMember(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetGroupMembersListAdminV1
   */
  public ModelsGetGroupMemberListResponseV1 getGroupMembersListAdminV1(
      GetGroupMembersListAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupInvitationPublicV1
   */
  public ModelsMemberRequestGroupResponseV1 acceptGroupInvitationPublicV1(
      AcceptGroupInvitationPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupInvitationPublicV1
   */
  public ModelsMemberRequestGroupResponseV1 rejectGroupInvitationPublicV1(
      RejectGroupInvitationPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see JoinGroupV1
   */
  public ModelsJoinGroupResponseV1 joinGroupV1(JoinGroupV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CancelGroupJoinRequestV1
   */
  public ModelsMemberRequestGroupResponseV1 cancelGroupJoinRequestV1(CancelGroupJoinRequestV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupMembersListPublicV1
   */
  public ModelsGetGroupMemberListResponseV1 getGroupMembersListPublicV1(
      GetGroupMembersListPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LeaveGroupPublicV1
   */
  public ModelsLeaveGroupResponseV1 leaveGroupPublicV1(LeaveGroupPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserGroupInformationPublicV1
   */
  public ModelsGetUserGroupInformationResponseV1 getUserGroupInformationPublicV1(
      GetUserGroupInformationPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InviteGroupPublicV1
   */
  public ModelsUserInvitationResponseV1 inviteGroupPublicV1(InviteGroupPublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupJoinRequestPublicV1
   */
  public ModelsMemberRequestGroupResponseV1 acceptGroupJoinRequestPublicV1(
      AcceptGroupJoinRequestPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupJoinRequestPublicV1
   */
  public ModelsMemberRequestGroupResponseV1 rejectGroupJoinRequestPublicV1(
      RejectGroupJoinRequestPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see KickGroupMemberPublicV1
   */
  public ModelsKickGroupMemberResponseV1 kickGroupMemberPublicV1(KickGroupMemberPublicV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserJoinedGroupInformationPublicV2
   */
  public ModelsGetGroupMemberListResponseV1 getUserJoinedGroupInformationPublicV2(
      GetUserJoinedGroupInformationPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupInvitationPublicV2
   */
  public ModelsMemberRequestGroupResponseV1 acceptGroupInvitationPublicV2(
      AcceptGroupInvitationPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupInvitationPublicV2
   */
  public ModelsMemberRequestGroupResponseV1 rejectGroupInvitationPublicV2(
      RejectGroupInvitationPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see JoinGroupV2
   */
  public ModelsJoinGroupResponseV1 joinGroupV2(JoinGroupV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see LeaveGroupPublicV2
   */
  public ModelsLeaveGroupResponseV1 leaveGroupPublicV2(LeaveGroupPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserGroupInformationPublicV2
   */
  public ModelsGetGroupMemberListResponseV1 getUserGroupInformationPublicV2(
      GetUserGroupInformationPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see InviteGroupPublicV2
   */
  public ModelsUserInvitationResponseV1 inviteGroupPublicV2(InviteGroupPublicV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CancelInvitationGroupMemberV2
   */
  public ModelsCancelInvitationGroupResponseV2 cancelInvitationGroupMemberV2(
      CancelInvitationGroupMemberV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AcceptGroupJoinRequestPublicV2
   */
  public ModelsMemberRequestGroupResponseV1 acceptGroupJoinRequestPublicV2(
      AcceptGroupJoinRequestPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RejectGroupJoinRequestPublicV2
   */
  public ModelsMemberRequestGroupResponseV1 rejectGroupJoinRequestPublicV2(
      RejectGroupJoinRequestPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see KickGroupMemberPublicV2
   */
  public ModelsKickGroupMemberResponseV1 kickGroupMemberPublicV2(KickGroupMemberPublicV2 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetUserGroupStatusInformationV2
   */
  public ModelsGetUserGroupInformationResponseV1 getUserGroupStatusInformationV2(
      GetUserGroupStatusInformationV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
