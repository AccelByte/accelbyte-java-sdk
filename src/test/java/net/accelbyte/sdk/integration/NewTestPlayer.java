/*
 * Copyright (c) 2026 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import net.accelbyte.sdk.api.iam.models.AccountCreateTestUserRequestV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateTestUserRequestV4.AuthType;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.operations.users.AdminDeleteUserInformationV3;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicCreateTestUserV4;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
import net.accelbyte.sdk.core.AccelByteConfig;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;

/**
 * Creates an ITestPlayer object by creating a new user via IAM.
 *
 * @param sdkClient AccelByteSDK object with necessary access and permission to create a user.
 * @param namespace The namespace in which to create the test user.
 * @param deleteOnLogout Set true to delete the created user on logout.
 */
public class NewTestPlayer implements TestPlayer {

  private final boolean deleteOnLogout;
  private final AccelByteSDK sdkClient;
  private final AccelByteSDK sdk;
  private final DefaultTokenRepository tokenRepo;
  private final String namespace;
  private final String userEmail;
  private String userId = "";

  public NewTestPlayer(AccelByteSDK sdkClient, String namespace, boolean deleteOnLogout)
      throws Exception {
    this.deleteOnLogout = deleteOnLogout;
    this.sdkClient = sdkClient;
    this.namespace = namespace;

    final String userName = "javasdk_" + TestHelper.generateRandomId(8);
    final String userPassword = TestHelper.generateRandomPassword(10);
    this.userEmail = userName + "@dummy.com";

    final UsersV4 usersV4Wrapper = new UsersV4(sdkClient);
    final AccountCreateUserResponseV4 createResult =
        usersV4Wrapper.publicCreateTestUserV4(
            PublicCreateTestUserV4.builder()
                .namespace(namespace)
                .body(
                    AccountCreateTestUserRequestV4.builder()
                        .authTypeFromEnum(AuthType.EMAILPASSWD)
                        .emailAddress(this.userEmail)
                        .password(userPassword)
                        .displayName(
                            "Java SDK Test Player " + TestHelper.generateRandomId(3))
                        .username(userName)
                        .country("ID")
                        .dateOfBirth("1995-01-10")
                        .uniqueDisplayName(userName)
                        .build())
                .build());

    if (createResult != null && createResult.getUserId() != null) {
      this.userId = createResult.getUserId();
    }

    this.tokenRepo = new DefaultTokenRepository();
    this.sdk =
        new AccelByteSDK(
            new AccelByteConfig(
                sdkClient.getSdkConfiguration().getHttpClient(),
                this.tokenRepo,
                sdkClient.getSdkConfiguration().getConfigRepository()));

    this.sdk.loginUser(this.userEmail, userPassword);
  }

  @Override
  public String getAccessToken() throws Exception {
    return tokenRepo.getToken();
  }

  @Override
  public String getUserId() throws Exception {
    return userId;
  }

  @Override
  public AccelByteSDK getSdk() {
    return sdk;
  }

  @Override
  public void login() throws Exception {
    // No-op: the user is already logged in during construction
  }

  @Override
  public void logout() throws Exception {
    sdk.logout();
    if (deleteOnLogout && !userId.isEmpty()) {
      final Users usersWrapper = new Users(sdkClient);
      usersWrapper.adminDeleteUserInformationV3(
          AdminDeleteUserInformationV3.builder()
              .namespace(namespace)
              .userId(userId)
              .build());
    }
  }

  @Override
  public void run(TestPlayer.PlayerAction action) throws Exception {
    action.accept(sdk, this);
  }
}
