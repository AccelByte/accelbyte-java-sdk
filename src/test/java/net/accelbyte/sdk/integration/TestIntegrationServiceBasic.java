/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateCreate;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateInfo;
import net.accelbyte.sdk.api.basic.models.UserProfileUpdate;
import net.accelbyte.sdk.api.basic.operations.user_profile.CreateMyProfile;
import net.accelbyte.sdk.api.basic.operations.user_profile.DeleteUserProfile;
import net.accelbyte.sdk.api.basic.operations.user_profile.GetMyProfileInfo;
import net.accelbyte.sdk.api.basic.operations.user_profile.UpdateMyProfile;
import net.accelbyte.sdk.api.basic.wrappers.UserProfile;
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
public class TestIntegrationServiceBasic extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String profileFirstName = "Java Server SDK";
    final String profileLastName = "Integration Test";
    final String profileDateOfBirth =
        LocalDate.of(2022, 1, 1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
    final String profileLanguage = "en";
    final String profileTimeZone = "Asia/Jakarta";

    final UserProfile userProfileWrapper = new UserProfile(sdk);

    // Check existing user profile (if any)

    try {
      final UserProfilePrivateInfo getProfileResult =
          userProfileWrapper.getMyProfileInfo(
              GetMyProfileInfo.builder().namespace(this.namespace).build());

      assertNotNull(getProfileResult);

      final String userId = getProfileResult.getUserId();

      final UserProfilePrivateInfo deleteUserProfileResult =
          userProfileWrapper.deleteUserProfile(
              DeleteUserProfile.builder().namespace(this.namespace).userId(userId).build());

      assertNotNull(deleteUserProfileResult);
    } catch (HttpResponseException hex) {
      final int httpCode = hex.getHttpCode();
      final String errorMessage = hex.getErrorMessage();
      final boolean isUserProfileNotFound =
          httpCode == 404 && errorMessage.contains("11440"); // User profile not found
      if (!isUserProfileNotFound) {
        throw hex; // Error other than user profile not found is not acceptable
      }
    }

    // CASE Create a user profile

    final UserProfilePrivateCreate createProfileBody =
        UserProfilePrivateCreate.builder()
            .firstName(profileFirstName)
            .lastName(profileLastName)
            .dateOfBirth(profileDateOfBirth)
            .language(profileLanguage)
            .build();

    final UserProfilePrivateInfo createProfileResult =
        userProfileWrapper.createMyProfile(
            CreateMyProfile.builder().namespace(this.namespace).body(createProfileBody).build());

    // ESAC

    assertNotNull(createProfileResult);
    assertEquals(createProfileResult.getFirstName(), profileFirstName);

    // CASE Get a user profile

    final UserProfilePrivateInfo getProfileResult =
        userProfileWrapper.getMyProfileInfo(
            GetMyProfileInfo.builder().namespace(this.namespace).build());

    // ESAC

    assertNotNull(getProfileResult);
    assertEquals(getProfileResult.getLastName(), profileLastName);

    // CASE Update a user profile

    final UserProfileUpdate updateProfileBody =
        UserProfileUpdate.builder().timeZone(profileTimeZone).build();

    final UserProfilePrivateInfo updateProfileResult =
        userProfileWrapper.updateMyProfile(
            UpdateMyProfile.builder().namespace(this.namespace).body(updateProfileBody).build());

    // ESAC

    assertNotNull(updateProfileResult);
    assertEquals(updateProfileResult.getTimeZone(), profileTimeZone);

    // CASE Delete a user profile

    final String userId = getProfileResult.getUserId();

    final UserProfilePrivateInfo deleteUserProfileResult =
        userProfileWrapper.deleteUserProfile(
            DeleteUserProfile.builder().namespace(this.namespace).userId(userId).build());

    // ESAC

    assertNotNull(deleteUserProfileResult);

    // Confirm if user profile is deleted

    assertThrows(
        HttpResponseException.class,
        () -> {
          userProfileWrapper.getMyProfileInfo(
              GetMyProfileInfo.builder().namespace(this.namespace).build());
        });
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
