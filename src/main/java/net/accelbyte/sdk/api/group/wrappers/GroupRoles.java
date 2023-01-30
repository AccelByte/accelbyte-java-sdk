/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.group.wrappers;

import net.accelbyte.sdk.api.group.models.*;
import net.accelbyte.sdk.api.group.operations.group_roles.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class GroupRoles {

  private AccelByteSDK sdk;

  public GroupRoles(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetMemberRolesListAdminV1
   */
  public ModelsGetMemberRolesListResponseV1 getMemberRolesListAdminV1(
      GetMemberRolesListAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateMemberRoleAdminV1
   */
  public ModelsMemberRoleResponseV1 createMemberRoleAdminV1(CreateMemberRoleAdminV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetSingleMemberRoleAdminV1
   */
  public ModelsMemberRoleResponseV1 getSingleMemberRoleAdminV1(GetSingleMemberRoleAdminV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteMemberRoleAdminV1
   */
  public void deleteMemberRoleAdminV1(DeleteMemberRoleAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMemberRoleAdminV1
   */
  public ModelsMemberRoleResponseV1 updateMemberRoleAdminV1(UpdateMemberRoleAdminV1 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMemberRolePermissionAdminV1
   */
  public ModelsMemberRoleResponseV1 updateMemberRolePermissionAdminV1(
      UpdateMemberRolePermissionAdminV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMemberRolesListPublicV1
   */
  public ModelsGetMemberRolesListResponseV1 getMemberRolesListPublicV1(
      GetMemberRolesListPublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMemberRolePublicV1
   */
  public ModelsGetUserGroupInformationResponseV1 updateMemberRolePublicV1(
      UpdateMemberRolePublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteMemberRolePublicV1
   */
  public void deleteMemberRolePublicV1(DeleteMemberRolePublicV1 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetMemberRolesListPublicV2
   */
  public ModelsGetMemberRolesListResponseV1 getMemberRolesListPublicV2(
      GetMemberRolesListPublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateMemberRolePublicV2
   */
  public ModelsGetUserGroupInformationResponseV1 updateMemberRolePublicV2(
      UpdateMemberRolePublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteMemberRolePublicV2
   */
  public void deleteMemberRolePublicV2(DeleteMemberRolePublicV2 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
