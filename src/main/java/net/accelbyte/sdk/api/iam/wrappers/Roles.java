/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.api.iam.wrappers;

import java.util.*;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.roles.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;

public class Roles {

  private AccelByteSDK sdk;

  public Roles(AccelByteSDK sdk) {
    this.sdk = sdk;
  }

  /**
   * @see GetRoles
   * @deprecated
   */
  @Deprecated
  public List<ModelRoleResponseWithManagers> getRoles(GetRoles input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see CreateRole
   * @deprecated
   */
  @Deprecated
  public AccountcommonRole createRole(CreateRole input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRole
   * @deprecated
   */
  @Deprecated
  public ModelRoleResponse getRole(GetRole input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateRole
   * @deprecated
   */
  @Deprecated
  public ModelRoleResponse updateRole(UpdateRole input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteRole
   * @deprecated
   */
  @Deprecated
  public void deleteRole(DeleteRole input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRoleAdminStatus
   * @deprecated
   */
  @Deprecated
  public ModelRoleAdminStatusResponse getRoleAdminStatus(GetRoleAdminStatus input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see SetRoleAsAdmin
   * @deprecated
   */
  @Deprecated
  public void setRoleAsAdmin(SetRoleAsAdmin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RemoveRoleAdmin
   * @deprecated
   */
  @Deprecated
  public void removeRoleAdmin(RemoveRoleAdmin input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRoleManagers
   * @deprecated
   */
  @Deprecated
  public ModelRoleManagersResponse getRoleManagers(GetRoleManagers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddRoleManagers
   * @deprecated
   */
  @Deprecated
  public void addRoleManagers(AddRoleManagers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RemoveRoleManagers
   * @deprecated
   */
  @Deprecated
  public void removeRoleManagers(RemoveRoleManagers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see GetRoleMembers
   * @deprecated
   */
  @Deprecated
  public ModelRoleMembersResponse getRoleMembers(GetRoleMembers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddRoleMembers
   * @deprecated
   */
  @Deprecated
  public void addRoleMembers(AddRoleMembers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see RemoveRoleMembers
   * @deprecated
   */
  @Deprecated
  public void removeRoleMembers(RemoveRoleMembers input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see UpdateRolePermissions
   * @deprecated
   */
  @Deprecated
  public void updateRolePermissions(UpdateRolePermissions input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AddRolePermission
   * @deprecated
   */
  @Deprecated
  public void addRolePermission(AddRolePermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see DeleteRolePermission
   * @deprecated
   */
  @Deprecated
  public void deleteRolePermission(DeleteRolePermission input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRolesV3
   */
  public ModelRoleResponseWithManagersAndPaginationV3 adminGetRolesV3(AdminGetRolesV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateRoleV3
   */
  public AccountcommonRoleV3 adminCreateRoleV3(AdminCreateRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRoleV3
   */
  public ModelRoleResponseV3 adminGetRoleV3(AdminGetRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteRoleV3
   */
  public void adminDeleteRoleV3(AdminDeleteRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateRoleV3
   */
  public ModelRoleResponseV3 adminUpdateRoleV3(AdminUpdateRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRoleAdminStatusV3
   */
  public ModelRoleAdminStatusResponseV3 adminGetRoleAdminStatusV3(AdminGetRoleAdminStatusV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateAdminRoleStatusV3
   */
  public void adminUpdateAdminRoleStatusV3(AdminUpdateAdminRoleStatusV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRemoveRoleAdminV3
   */
  public void adminRemoveRoleAdminV3(AdminRemoveRoleAdminV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRoleManagersV3
   */
  public ModelRoleManagersResponsesV3 adminGetRoleManagersV3(AdminGetRoleManagersV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddRoleManagersV3
   */
  public void adminAddRoleManagersV3(AdminAddRoleManagersV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRemoveRoleManagersV3
   */
  public void adminRemoveRoleManagersV3(AdminRemoveRoleManagersV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRoleMembersV3
   */
  public ModelRoleMembersResponseV3 adminGetRoleMembersV3(AdminGetRoleMembersV3 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddRoleMembersV3
   */
  public void adminAddRoleMembersV3(AdminAddRoleMembersV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRemoveRoleMembersV3
   */
  public void adminRemoveRoleMembersV3(AdminRemoveRoleMembersV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateRolePermissionsV3
   */
  public void adminUpdateRolePermissionsV3(AdminUpdateRolePermissionsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddRolePermissionsV3
   */
  public void adminAddRolePermissionsV3(AdminAddRolePermissionsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteRolePermissionsV3
   */
  public void adminDeleteRolePermissionsV3(AdminDeleteRolePermissionsV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteRolePermissionV3
   */
  public void adminDeleteRolePermissionV3(AdminDeleteRolePermissionV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetRolesV3
   */
  public ModelRoleNamesResponseV3 publicGetRolesV3(PublicGetRolesV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see PublicGetRoleV3
   */
  public ModelRoleResponse publicGetRoleV3(PublicGetRoleV3 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRolesV4
   */
  public ModelListRoleV4Response adminGetRolesV4(AdminGetRolesV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminCreateRoleV4
   */
  public ModelRoleV4Response adminCreateRoleV4(AdminCreateRoleV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminGetRoleV4
   */
  public ModelRoleV4Response adminGetRoleV4(AdminGetRoleV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteRoleV4
   */
  public void adminDeleteRoleV4(AdminDeleteRoleV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateRoleV4
   */
  public ModelRoleV4Response adminUpdateRoleV4(AdminUpdateRoleV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminUpdateRolePermissionsV4
   */
  public ModelRoleV4Response adminUpdateRolePermissionsV4(AdminUpdateRolePermissionsV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAddRolePermissionsV4
   */
  public ModelRoleV4Response adminAddRolePermissionsV4(AdminAddRolePermissionsV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminDeleteRolePermissionsV4
   */
  public void adminDeleteRolePermissionsV4(AdminDeleteRolePermissionsV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminListAssignedUsersV4
   */
  public ModelListAssignedUsersV4Response adminListAssignedUsersV4(AdminListAssignedUsersV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminAssignUserToRoleV4
   */
  public ModelAssignedUserV4Response adminAssignUserToRoleV4(AdminAssignUserToRoleV4 input)
      throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    return input.parseResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }

  /**
   * @see AdminRevokeUserFromRoleV4
   */
  public void adminRevokeUserFromRoleV4(AdminRevokeUserFromRoleV4 input) throws Exception {
    final HttpResponse httpResponse = sdk.runRequest(input);
    input.handleEmptyResponse(
        httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload());
  }
}
