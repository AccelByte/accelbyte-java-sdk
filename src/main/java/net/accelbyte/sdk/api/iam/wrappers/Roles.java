package net.accelbyte.sdk.api.iam.wrappers;

import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.operations.roles.*;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponse;
import net.accelbyte.sdk.core.ResponseException;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class Roles {

    private AccelByteSDK sdk;

    public Roles(AccelByteSDK sdk){
        this.sdk = sdk;
    }

    public List<ModelRoleResponseWithManagers> getRoles(GetRoles input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRoles()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountcommonRole createRole(CreateRole input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new CreateRole()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleResponse getRole(GetRole input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRole()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleResponse updateRole(UpdateRole input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new UpdateRole()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteRole(DeleteRole input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteRole()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleAdminStatusResponse getRoleAdminStatus(GetRoleAdminStatus input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRoleAdminStatus()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void setRoleAsAdmin(SetRoleAsAdmin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new SetRoleAsAdmin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void removeRoleAdmin(RemoveRoleAdmin input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RemoveRoleAdmin()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleManagersResponse getRoleManagers(GetRoleManagers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRoleManagers()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void addRoleManagers(AddRoleManagers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AddRoleManagers()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void removeRoleManagers(RemoveRoleManagers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RemoveRoleManagers()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleMembersResponse getRoleMembers(GetRoleMembers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new GetRoleMembers()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void addRoleMembers(AddRoleMembers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AddRoleMembers()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void removeRoleMembers(RemoveRoleMembers input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new RemoveRoleMembers()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void updateRolePermissions(UpdateRolePermissions input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new UpdateRolePermissions()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void addRolePermission(AddRolePermission input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AddRolePermission()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void deleteRolePermission(DeleteRolePermission input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new DeleteRolePermission()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleResponseWithManagersAndPaginationV3 adminGetRolesV3(AdminGetRolesV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetRolesV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public AccountcommonRoleV3 adminCreateRoleV3(AdminCreateRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminCreateRoleV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleResponseV3 adminGetRoleV3(AdminGetRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetRoleV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteRoleV3(AdminDeleteRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteRoleV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleResponseV3 adminUpdateRoleV3(AdminUpdateRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateRoleV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleAdminStatusResponseV3 adminGetRoleAdminStatusV3(AdminGetRoleAdminStatusV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetRoleAdminStatusV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminUpdateAdminRoleStatusV3(AdminUpdateAdminRoleStatusV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminUpdateAdminRoleStatusV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminRemoveRoleAdminV3(AdminRemoveRoleAdminV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminRemoveRoleAdminV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleManagersResponsesV3 adminGetRoleManagersV3(AdminGetRoleManagersV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetRoleManagersV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminAddRoleManagersV3(AdminAddRoleManagersV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminAddRoleManagersV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminRemoveRoleManagersV3(AdminRemoveRoleManagersV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminRemoveRoleManagersV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleMembersResponseV3 adminGetRoleMembersV3(AdminGetRoleMembersV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetRoleMembersV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminAddRoleMembersV3(AdminAddRoleMembersV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminAddRoleMembersV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminRemoveRoleMembersV3(AdminRemoveRoleMembersV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminRemoveRoleMembersV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminUpdateRolePermissionsV3(AdminUpdateRolePermissionsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminUpdateRolePermissionsV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminAddRolePermissionsV3(AdminAddRolePermissionsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminAddRolePermissionsV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteRolePermissionsV3(AdminDeleteRolePermissionsV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteRolePermissionsV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteRolePermissionV3(AdminDeleteRolePermissionV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteRolePermissionV3()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleNamesResponseV3 publicGetRolesV3(PublicGetRolesV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetRolesV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleResponse publicGetRoleV3(PublicGetRoleV3 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new PublicGetRoleV3()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelListRoleV4Response adminGetRolesV4(AdminGetRolesV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetRolesV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleV4Response adminCreateRoleV4(AdminCreateRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminCreateRoleV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleV4Response adminGetRoleV4(AdminGetRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminGetRoleV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteRoleV4(AdminDeleteRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteRoleV4()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleV4Response adminUpdateRoleV4(AdminUpdateRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateRoleV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleV4Response adminUpdateRolePermissionsV4(AdminUpdateRolePermissionsV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminUpdateRolePermissionsV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelRoleV4Response adminAddRolePermissionsV4(AdminAddRolePermissionsV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminAddRolePermissionsV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminDeleteRolePermissionsV4(AdminDeleteRolePermissionsV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminDeleteRolePermissionsV4()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelListAssignedUsersV4Response adminListAssignedUsersV4(AdminListAssignedUsersV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminListAssignedUsersV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public ModelAssignedUserV4Response adminAssignUserToRoleV4(AdminAssignUserToRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            return new AdminAssignUserToRoleV4()
                .parseResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

    public void adminRevokeUserFromRoleV4(AdminRevokeUserFromRoleV4 input) throws ResponseException, IOException {
        HttpResponse httpResponse = sdk.runRequest(input);
            new AdminRevokeUserFromRoleV4()
                .handleEmptyResponse(
            httpResponse.getCode(), httpResponse.getContentType(), httpResponse.getPayload()
            );
    }

}
