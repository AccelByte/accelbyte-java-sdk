/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import net.accelbyte.sdk.api.iam.models.AccountCreateTestUserRequestV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateTestUserRequestV4.AuthType;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.models.AccountcommonOverrideRolePermission;
import net.accelbyte.sdk.api.iam.models.AccountcommonPermission;
import net.accelbyte.sdk.api.iam.models.ModelListRoleV4Response;
import net.accelbyte.sdk.api.iam.models.ModelRoleOverrideResponse;
import net.accelbyte.sdk.api.iam.models.ModelRoleOverrideStatsUpdateRequest;
import net.accelbyte.sdk.api.iam.models.ModelRoleOverrideUpdateRequest;
import net.accelbyte.sdk.api.iam.models.ModelRolePermissionResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelRoleV4Response;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateRequestV3;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserPublicInfoResponseV4;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserUpdateRequestV3;
import net.accelbyte.sdk.api.iam.operations.override_role_config_v3.AdminChangeRoleOverrideConfigStatusV3;
import net.accelbyte.sdk.api.iam.operations.override_role_config_v3.AdminGetRoleNamespacePermissionV3;
import net.accelbyte.sdk.api.iam.operations.override_role_config_v3.AdminUpdateRoleOverrideConfigV3;
import net.accelbyte.sdk.api.iam.operations.roles.AdminGetRolesV4;
import net.accelbyte.sdk.api.iam.operations.users.AdminDeleteUserInformationV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminUpdateUserV3;
import net.accelbyte.sdk.api.iam.operations.users.PublicCreateUserV3;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicCreateTestUserV4;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicGetUserPublicInfoByUserIdV4;
import net.accelbyte.sdk.api.iam.wrappers.OverrideRoleConfigV3;
import net.accelbyte.sdk.api.iam.wrappers.Roles;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
import net.accelbyte.sdk.core.HttpResponseException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceIam extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void testV3() throws Exception {
    final String userName = ("javasdk_" + TestHelper.generateRandomId(8));
    final String userPassword = TestHelper.generateRandomPassword(10);
    final String userEmail = (userName + "@test.com");
    final String userDisplayName = "Java Server SDK Test";
    final String userDateOfBirth = "1995-01-10";
    final String userCountry = "ID";

    final Users usersWrapper = new Users(sdk);
    final UsersV4 usersV4Wrapper = new UsersV4(sdk);

    // CASE Create a user (v3)

    final ModelUserCreateRequestV3 createUserV3 =
        ModelUserCreateRequestV3.builder()
            .authType("EMAILPASSWD")
            .emailAddress(userEmail)
            .password(userPassword)
            .displayName(userDisplayName)
            .country(userCountry)
            .dateOfBirth(userDateOfBirth)
            .uniqueDisplayName(userName)
            .build();

    final ModelUserCreateResponseV3 createUserV3Result =
        usersWrapper.publicCreateUserV3(
            PublicCreateUserV3.builder().namespace(namespace).body(createUserV3).build());

    // ESAC

    assertNotNull(createUserV3Result);
    assertEquals(userEmail, createUserV3Result.getEmailAddress());

    final String userId = createUserV3Result.getUserId();

    // Clean up

    usersWrapper.adminDeleteUserInformationV3(
        AdminDeleteUserInformationV3.builder().namespace(this.namespace).userId(userId).build());

    assertThrows(
        HttpResponseException.class,
        () -> {
          usersV4Wrapper.publicGetUserPublicInfoByUserIdV4(
              PublicGetUserPublicInfoByUserIdV4.builder()
                  .namespace(this.namespace)
                  .userId(userId)
                  .build());
        });
  }

  @Test
  @Order(2)
  public void testV4() throws Exception {
    final String userName = ("javasdk_" + TestHelper.generateRandomId(8));
    final String userPassword = TestHelper.generateRandomPassword(10);
    final String userEmail = (userName + "@test.com");
    final String userDisplayName = "Java Server SDK Test";
    final String userDateOfBirth = "1995-01-10";
    final String userDateOfBirthUpdate = "1996-01-10";
    final String userCountry = "ID";

    final Users usersWrapper = new Users(sdk);
    final UsersV4 usersV4Wrapper = new UsersV4(sdk);

    // CASE Create a user

    final AccountCreateTestUserRequestV4 createUser =
        AccountCreateTestUserRequestV4.builder()
            .authTypeFromEnum(AuthType.EMAILPASSWD)
            .emailAddress(userEmail)
            .password(userPassword)
            .displayName(userDisplayName)
            .username(userName)
            .country(userCountry)
            .dateOfBirth(userDateOfBirth)
            .uniqueDisplayName(userName)
            .build();

    final AccountCreateUserResponseV4 createUserResult =
        usersV4Wrapper.publicCreateTestUserV4(
            PublicCreateTestUserV4.builder().namespace(this.namespace).body(createUser).build());

    // ESAC

    assertNotNull(createUserResult);
    assertEquals(userEmail, createUserResult.getEmailAddress());

    final String userId = createUserResult.getUserId();

    // CASE Get a user

    final ModelUserPublicInfoResponseV4 getUserResult =
        usersV4Wrapper.publicGetUserPublicInfoByUserIdV4(
            PublicGetUserPublicInfoByUserIdV4.builder()
                .namespace(this.namespace)
                .userId(userId)
                .build());

    // ESAC

    assertNotNull(getUserResult);
    assertEquals(userDisplayName, getUserResult.getDisplayName());

    // CASE Update a user

    final ModelUserUpdateRequestV3 updateUser =
        ModelUserUpdateRequestV3.builder().dateOfBirth(userDateOfBirthUpdate).build();

    final ModelUserResponseV3 updateUserResult =
        usersWrapper.adminUpdateUserV3(
            AdminUpdateUserV3.builder()
                .namespace(this.namespace)
                .userId(userId)
                .body(updateUser)
                .build());

    // ESAC

    assertNotNull(updateUserResult);
    assertNotNull(updateUserResult.getDateOfBirth());

    final Instant userDateOfBirthActual = Instant.parse(updateUserResult.getDateOfBirth());

    assertNotNull(userDateOfBirthActual);
    assertEquals(
        userDateOfBirthUpdate,
        userDateOfBirthActual
            .atZone(ZoneId.systemDefault())
            .format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));

    // CASE Delete a user

    usersWrapper.adminDeleteUserInformationV3(
        AdminDeleteUserInformationV3.builder().namespace(this.namespace).userId(userId).build());

    // ESAC

    // Confirm if user is deleted

    assertThrows(
        HttpResponseException.class,
        () -> {
          usersV4Wrapper.publicGetUserPublicInfoByUserIdV4(
              PublicGetUserPublicInfoByUserIdV4.builder()
                  .namespace(this.namespace)
                  .userId(userId)
                  .build());
        });
  }

  protected Integer findAndCheckResourceActionFromRole(
      OverrideRoleConfigV3 wrapper, String roleId, String resourceToCheck) throws Exception {
    final ModelRolePermissionResponseV3 permissions =
        wrapper.adminGetRoleNamespacePermissionV3(
            AdminGetRoleNamespacePermissionV3.builder()
                .namespace(this.namespace)
                .roleId(roleId)
                .build());

    if (permissions == null) throw new Exception("Role's permissions object is null.");

    Integer resultAction = -1;
    for (AccountcommonPermission permission : permissions.getPermissions()) {
      if (permission.getResource().equalsIgnoreCase(resourceToCheck)) {
        resultAction = permission.getAction();
        break;
      }
    }

    return resultAction;
  }

  @Test
  @Order(3)
  public void roleOverrideTest() throws Exception {

    final String roleIdentityToUpdate = "USER";
    final String resourceToCheck = "NAMESPACE:{namespace}:PROFILE";
    final Integer actionToCheck = 7;
    final Integer updatedActionToCheck = 2;
    final Integer checkCount = 20;
    final Integer checkInterval = 1000;

    final Roles roleWrapper = new Roles(sdk);
    final OverrideRoleConfigV3 roleConfigWrapper = new OverrideRoleConfigV3(sdk);

    final ModelListRoleV4Response roles =
        roleWrapper.adminGetRolesV4(AdminGetRolesV4.builder().adminRole(false).build());

    String userRoleId = "";
    for (ModelRoleV4Response role : roles.getData()) {
      if (role.getRoleName().equalsIgnoreCase(roleIdentityToUpdate)) {
        userRoleId = role.getRoleId();
        break;
      }
    }

    assertFalse(userRoleId.equals(""));

    final Integer oAction =
        this.findAndCheckResourceActionFromRole(roleConfigWrapper, userRoleId, resourceToCheck);
    assertEquals(actionToCheck, oAction);

    // Do role override
    List<AccountcommonOverrideRolePermission> exclusionList =
        new ArrayList<AccountcommonOverrideRolePermission>();
    exclusionList.add(
        AccountcommonOverrideRolePermission.builder()
            .resource(resourceToCheck)
            .actions(new ArrayList<Integer>(Arrays.asList(1, 4)))
            .build());

    final ModelRoleOverrideResponse updateResponse =
        roleConfigWrapper.adminUpdateRoleOverrideConfigV3(
            AdminUpdateRoleOverrideConfigV3.builder()
                .namespace(this.namespace)
                .identity(roleIdentityToUpdate)
                .body(ModelRoleOverrideUpdateRequest.builder().exclusions(exclusionList).build())
                .build());
    assertNotNull(updateResponse);

    // Activate role override
    final ModelRoleOverrideResponse activateResponse =
        roleConfigWrapper.adminChangeRoleOverrideConfigStatusV3(
            AdminChangeRoleOverrideConfigStatusV3.builder()
                .namespace(this.namespace)
                .identity(roleIdentityToUpdate)
                .body(ModelRoleOverrideStatsUpdateRequest.builder().active(true).build())
                .build());
    assertNotNull(activateResponse);
    assertTrue(activateResponse.getActive());

    try {
      Boolean uValid = false;
      Integer currentCount = 0;
      while (currentCount < checkCount) {
        Integer uAction =
            this.findAndCheckResourceActionFromRole(roleConfigWrapper, userRoleId, resourceToCheck);
        if (uAction == updatedActionToCheck) {
          uValid = true;
          break;
        }

        currentCount++;
        Thread.sleep(checkInterval);
      }

      assertTrue(uValid);
    } finally {
      // Deactivate role override
      roleConfigWrapper.adminChangeRoleOverrideConfigStatusV3(
          AdminChangeRoleOverrideConfigStatusV3.builder()
              .namespace(this.namespace)
              .identity(roleIdentityToUpdate)
              .body(ModelRoleOverrideStatsUpdateRequest.builder().active(false).build())
              .build());
    }
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
