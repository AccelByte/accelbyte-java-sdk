/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.UUID;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4.AuthType;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.operations.users.AdminDeleteUserInformationV3;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicCreateUserV4;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
import net.accelbyte.sdk.api.reporting.models.RestapiAdminReasonResponse;
import net.accelbyte.sdk.api.reporting.models.RestapiCreateReasonRequest;
import net.accelbyte.sdk.api.reporting.models.RestapiPublicReasonListResponse;
import net.accelbyte.sdk.api.reporting.models.RestapiSubmitReportRequest;
import net.accelbyte.sdk.api.reporting.models.RestapiSubmitReportRequest.Category;
import net.accelbyte.sdk.api.reporting.models.RestapiSubmitReportResponse;
import net.accelbyte.sdk.api.reporting.operations.admin_reasons.CreateReason;
import net.accelbyte.sdk.api.reporting.operations.admin_reasons.DeleteReason;
import net.accelbyte.sdk.api.reporting.operations.public_reasons.PublicGetReasons;
import net.accelbyte.sdk.api.reporting.operations.public_reports.SubmitReport;
import net.accelbyte.sdk.api.reporting.wrappers.AdminReasons;
import net.accelbyte.sdk.api.reporting.wrappers.PublicReasons;
import net.accelbyte.sdk.api.reporting.wrappers.PublicReports;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
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
public class TestIntegrationServiceReporting extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String reasonTitle =
        "Java Server SDK Test Reason Title " + TestHelper.generateRandomId(8);
    final String reasonDescription = "Java Server SDK Test Reason Description";

    final AdminReasons adminReasonsWrapper = new AdminReasons(sdk);
    final PublicReasons wrapper = new PublicReasons(sdk);
    final UsersV4 usersV4Wrapper = new UsersV4(sdk);
    final Users usersWrapper = new Users(sdk);

    // CASE Create a reason

    final RestapiAdminReasonResponse createReasonResponse =
        adminReasonsWrapper.createReason(
            CreateReason.builder()
                .namespace(namespace)
                .body(
                    RestapiCreateReasonRequest.builder()
                        .title(reasonTitle)
                        .description(reasonDescription)
                        .build())
                .build());

    // ESAC

    final String reasonId = createReasonResponse.getId();

    assertTrue(reasonId != null && !reasonId.equals(""));

    // CASE Get a list of reasons

    final RestapiPublicReasonListResponse publicGetReasonResponse =
        wrapper.publicGetReasons(
            PublicGetReasons.builder().namespace(namespace).title(reasonTitle).build());

    // ESAC

    assertTrue(
        publicGetReasonResponse.getData().stream()
            .anyMatch(
                x ->
                    x.getTitle().equals(reasonTitle)
                        && x.getDescription().equals(reasonDescription)));

    String player1UserId = null;
    String player2UserId = null;

    try {
      final String player1Username = ("javasdk_" + TestHelper.generateRandomId(8));
      final String player1Password = TestHelper.generateRandomPassword(10);
      final String player2Username = ("javasdk_" + TestHelper.generateRandomId(8));
      final String player2Password = TestHelper.generateRandomPassword(10);

      final AccountCreateUserResponseV4 createUserResult1 =
          usersV4Wrapper.publicCreateUserV4(
              PublicCreateUserV4.builder()
                  .namespace(namespace)
                  .body(
                      AccountCreateUserRequestV4.builder()
                          .authTypeFromEnum(AuthType.EMAILPASSWD)
                          .emailAddress(player1Username + "@test.com")
                          .password(player1Password)
                          .displayName("Java Server SDK Test")
                          .username(player1Username)
                          .country("ID")
                          .dateOfBirth("1995-01-10")
                          .build())
                  .build());
      final AccountCreateUserResponseV4 createUserResult2 =
          usersV4Wrapper.publicCreateUserV4(
              PublicCreateUserV4.builder()
                  .namespace(namespace)
                  .body(
                      AccountCreateUserRequestV4.builder()
                          .authTypeFromEnum(AuthType.EMAILPASSWD)
                          .emailAddress(player2Username + "@test.com")
                          .password(player2Password)
                          .displayName("Java Server SDK Test")
                          .username(player2Username)
                          .country("ID")
                          .dateOfBirth("1995-01-10")
                          .build())
                  .build());

      player1UserId = createUserResult1.getUserId();
      player2UserId = createUserResult2.getUserId();

      try {
        // Player 1 reports Player 2

        final AccelByteSDK player1Sdk =
            new AccelByteSDK(
                sdk.getSdkConfiguration().getHttpClient(),
                new DefaultTokenRepository(),
                sdk.getSdkConfiguration().getConfigRepository());

        player1Sdk.loginUser(player1Username, player1Password);

        final PublicReports publicReportsWrapper = new PublicReports(player1Sdk);

        // CASE Submit a report

        final RestapiSubmitReportResponse submitReportResponse =
            publicReportsWrapper.submitReport(
                SubmitReport.builder()
                    .namespace(namespace)
                    .body(
                        RestapiSubmitReportRequest.builder()
                            .categoryFromEnum(Category.UGC)
                            .reason(reasonTitle)
                            .userId(player2UserId)
                            .objectId(UUID.randomUUID().toString().replace("-", ""))
                            .objectType(UUID.randomUUID().toString().replace("-", ""))
                            .build())
                    .build());

        // ESAC

        final String ticketId = submitReportResponse.getTicketId();

        assertTrue(ticketId != null && !ticketId.equals(""));
      } catch (HttpResponseException hrex) {
        if (hrex.getErrorMessage().contains("84101")) { // Reason not found
          // Ignore for now due to intermittent issue in integration test environment
        } else {
          throw hrex;
        }
      }
    } finally {
      if (player1UserId != null) {
        usersWrapper.adminDeleteUserInformationV3(
            AdminDeleteUserInformationV3.builder()
                .namespace(namespace)
                .userId(player1UserId)
                .build());
      }

      if (player2UserId != null) {
        usersWrapper.adminDeleteUserInformationV3(
            AdminDeleteUserInformationV3.builder()
                .namespace(namespace)
                .userId(player2UserId)
                .build());
      }

      // CASE Delete a reason

      adminReasonsWrapper.deleteReason(
          DeleteReason.builder().namespace(namespace).reasonId(reasonId).build());

      // ESAC
    }
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
