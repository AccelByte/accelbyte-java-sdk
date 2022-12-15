/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4.AuthType;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.models.ModelPublicUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateRequestV3;
import net.accelbyte.sdk.api.iam.models.ModelUserCreateResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserUpdateRequestV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminDeleteUserInformationV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminUpdateUserV3;
import net.accelbyte.sdk.api.iam.operations.users.PublicCreateUserV3;
import net.accelbyte.sdk.api.iam.operations.users.PublicGetUserByUserIdV3;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicCreateUserV4;
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

    // CASE Create a user (v3)

    final ModelUserCreateRequestV3 createUserV3 =
        ModelUserCreateRequestV3.builder()
            .authType("EMAILPASSWD")
            .emailAddress(userEmail)
            .password(userPassword)
            .displayName(userDisplayName)
            .country(userCountry)
            .dateOfBirth(userDateOfBirth)
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
          usersWrapper.publicGetUserByUserIdV3(
              PublicGetUserByUserIdV3.builder().namespace(this.namespace).userId(userId).build());
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

    final AccountCreateUserRequestV4 createUser =
        AccountCreateUserRequestV4.builder()
            .authTypeFromEnum(AuthType.EMAILPASSWD)
            .emailAddress(userEmail)
            .password(userPassword)
            .displayName(userDisplayName)
            .username(userName)
            .country(userCountry)
            .dateOfBirth(userDateOfBirth)
            .build();

    final AccountCreateUserResponseV4 createUserResult =
        usersV4Wrapper.publicCreateUserV4(
            PublicCreateUserV4.builder().namespace(this.namespace).body(createUser).build());

    // ESAC

    assertNotNull(createUserResult);
    assertEquals(userEmail, createUserResult.getEmailAddress());

    final String userId = createUserResult.getUserId();

    // CASE Get a user

    final ModelPublicUserResponseV3 getUserResult =
        usersWrapper.publicGetUserByUserIdV3(
            PublicGetUserByUserIdV3.builder().namespace(this.namespace).userId(userId).build());

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
          usersWrapper.publicGetUserByUserIdV3(
              PublicGetUserByUserIdV3.builder().namespace(this.namespace).userId(userId).build());
        });
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
