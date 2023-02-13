/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operations.member_request.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class MemberRequest {

  private AccelByteSDK sdk;

  public MemberRequest(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetGroupJoinRequestPublicV1
   */
  public ModelsGetMemberRequestsListResponseV1 getGroupJoinRequestPublicV1(
      GetGroupJoinRequestPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupInvitationRequestPublicV1
   */
  public ModelsGetMemberRequestsListResponseV1 getGroupInvitationRequestPublicV1(
      GetGroupInvitationRequestPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupInviteRequestPublicV2
   */
  public ModelsGetMemberRequestsListResponseV1 getGroupInviteRequestPublicV2(
      GetGroupInviteRequestPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetGroupJoinRequestPublicV2
   */
  public ModelsGetMemberRequestsListResponseV1 getGroupJoinRequestPublicV2(
      GetGroupJoinRequestPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMyGroupJoinRequestV2
   */
  public ModelsGetMemberRequestsListResponseV1 getMyGroupJoinRequestV2(
      GetMyGroupJoinRequestV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
