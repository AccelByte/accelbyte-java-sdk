/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4.AuthType;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.operations.users.AdminDeleteUserInformationV3;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicCreateUserV4;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
import net.accelbyte.sdk.api.session.models.ApimodelsConfigurationTemplateResponse;
import net.accelbyte.sdk.api.session.models.ApimodelsCreateConfigurationTemplateRequest;
import net.accelbyte.sdk.api.session.models.ApimodelsCreateGameSessionRequest;
import net.accelbyte.sdk.api.session.models.ApimodelsCreatePartyRequest;
import net.accelbyte.sdk.api.session.models.ApimodelsGameSessionQueryResponse;
import net.accelbyte.sdk.api.session.models.ApimodelsGameSessionResponse;
import net.accelbyte.sdk.api.session.models.ApimodelsJoinByCodeRequest;
import net.accelbyte.sdk.api.session.models.ApimodelsPartySessionResponse;
import net.accelbyte.sdk.api.session.models.ApimodelsRequestMember;
import net.accelbyte.sdk.api.session.models.ApimodelsUpdateConfigurationTemplateRequest;
import net.accelbyte.sdk.api.session.models.ApimodelsUserResponse;
import net.accelbyte.sdk.api.session.operations.configuration_template.AdminCreateConfigurationTemplateV1;
import net.accelbyte.sdk.api.session.operations.configuration_template.AdminDeleteConfigurationTemplateV1;
import net.accelbyte.sdk.api.session.operations.configuration_template.AdminGetConfigurationTemplateV1;
import net.accelbyte.sdk.api.session.operations.configuration_template.AdminUpdateConfigurationTemplateV1;
import net.accelbyte.sdk.api.session.operations.game_session.CreateGameSession;
import net.accelbyte.sdk.api.session.operations.game_session.DeleteGameSession;
import net.accelbyte.sdk.api.session.operations.game_session.JoinGameSession;
import net.accelbyte.sdk.api.session.operations.game_session.LeaveGameSession;
import net.accelbyte.sdk.api.session.operations.game_session.PublicQueryGameSessions;
import net.accelbyte.sdk.api.session.operations.party.PublicGetParty;
import net.accelbyte.sdk.api.session.operations.party.PublicPartyJoinCode;
import net.accelbyte.sdk.api.session.wrappers.ConfigurationTemplate;
import net.accelbyte.sdk.api.session.wrappers.GameSession;
import net.accelbyte.sdk.api.session.wrappers.Party;
import net.accelbyte.sdk.core.AccelByteSDK;
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
public class TestIntegrationServiceSession extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup(false);

    sdk.loginClient();
  }

  @Test
  @Order(1)
  public void testConfigurationTemplate() throws Exception {
    final String cfgTemplateName = "java_sdk_template_" + TestHelper.generateRandomId(4);

    final ConfigurationTemplate configurationTemplateWrapper = new ConfigurationTemplate(sdk);

    // CASE Create session configuration template

    configurationTemplateWrapper.adminCreateConfigurationTemplateV1(
        AdminCreateConfigurationTemplateV1.builder()
            .namespace(namespace)
            .body(
                ApimodelsCreateConfigurationTemplateRequest.builder()
                    .name(cfgTemplateName)
                    .type("P2P")
                    .minPlayers(2)
                    .maxPlayers(2)
                    .inviteTimeout(60)
                    .inactiveTimeout(60)
                    .joinability("OPEN")
                    .clientVersion("1.0.0")
                    .requestedRegions(Collections.singletonList("us-west-2"))
                    .build())
            .build());

    // ESAC

    // CASE Get session configuration template

    final ApimodelsConfigurationTemplateResponse adminGetConfigurationTemplateResult =
        configurationTemplateWrapper.adminGetConfigurationTemplateV1(
            AdminGetConfigurationTemplateV1.builder()
                .name(cfgTemplateName)
                .namespace(namespace)
                .build());

    // ESAC

    assertNotNull(adminGetConfigurationTemplateResult);
    assertEquals("P2P", adminGetConfigurationTemplateResult.getType());
    assertEquals("OPEN", adminGetConfigurationTemplateResult.getJoinability());
    assertEquals(2, adminGetConfigurationTemplateResult.getMaxPlayers());

    // CASE Update session configuration template

    final ApimodelsConfigurationTemplateResponse adminUpdateConfigurationTemplateResult =
        configurationTemplateWrapper.adminUpdateConfigurationTemplateV1(
            AdminUpdateConfigurationTemplateV1.builder()
                .name(cfgTemplateName)
                .namespace(namespace)
                .body(
                    ApimodelsUpdateConfigurationTemplateRequest.builder()
                        .name(cfgTemplateName)
                        .type("P2P")
                        .joinability("OPEN")
                        .maxPlayers(4)
                        .build())
                .build());

    // ESAC

    assertNotNull(adminUpdateConfigurationTemplateResult);
    assertEquals(4, adminUpdateConfigurationTemplateResult.getMaxPlayers());

    // CASE Delete session configuration template

    configurationTemplateWrapper.adminDeleteConfigurationTemplateV1(
        AdminDeleteConfigurationTemplateV1.builder()
            .namespace(namespace)
            .name(cfgTemplateName)
            .build());

    // ESAC
  }

  @Test
  @Order(1)
  public void testGameSession() throws Exception {
    final String cfgTemplateName = "java_sdk_template_" + TestHelper.generateRandomId(4);

    final ConfigurationTemplate configurationTemplateWrapper = new ConfigurationTemplate(sdk);
    final GameSession gameSessionWrapper = new GameSession(sdk);
    final UsersV4 usersV4Wrapper = new UsersV4(sdk);
    final Users usersWrapper = new Users(sdk);

    configurationTemplateWrapper.adminCreateConfigurationTemplateV1(
        AdminCreateConfigurationTemplateV1.builder()
            .namespace(namespace)
            .body(
                ApimodelsCreateConfigurationTemplateRequest.builder()
                    .name(cfgTemplateName)
                    .type("P2P")
                    .minPlayers(2)
                    .maxPlayers(2)
                    .inviteTimeout(60)
                    .inactiveTimeout(60)
                    .joinability("OPEN")
                    .clientVersion("1.0.0")
                    .requestedRegions(Collections.singletonList("us-west-2"))
                    .build())
            .build());

    final AccelByteSDK player1Sdk =
        new AccelByteSDK(
            sdk.getSdkConfiguration().getHttpClient(),
            new DefaultTokenRepository(),
            sdk.getSdkConfiguration().getConfigRepository());
    final AccelByteSDK player2Sdk =
        new AccelByteSDK(
            sdk.getSdkConfiguration().getHttpClient(),
            new DefaultTokenRepository(),
            sdk.getSdkConfiguration().getConfigRepository());

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

      player1UserId = createUserResult1.getUserId();

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

      player2UserId = createUserResult2.getUserId();

      player1Sdk.loginUser(player1Username, player1Password);
      player2Sdk.loginUser(player2Username, player2Password);

      final GameSession player1GameSessionWrapper = new GameSession(player1Sdk);
      final GameSession player2GameSessionWrapper = new GameSession(player2Sdk);

      // CASE Create a game session

      final ApimodelsGameSessionResponse createGameSessionResult =
          player1GameSessionWrapper.createGameSession(
              CreateGameSession.builder()
                  .namespace(namespace)
                  .body(
                      ApimodelsCreateGameSessionRequest.builder()
                          .configurationName(cfgTemplateName)
                          .build())
                  .build());

      // ESAC

      final String gameSessionId = createGameSessionResult.getId();

      assertTrue(gameSessionId != null && !gameSessionId.isEmpty());

      // CASE Join a game session

      final ApimodelsGameSessionResponse joinGameSessionResult =
          player2GameSessionWrapper.joinGameSession(
              JoinGameSession.builder().namespace(namespace).sessionId(gameSessionId).build());

      assertNotNull(joinGameSessionResult);

      // ESAC

      // CASE Get game session

      final ApimodelsGameSessionResponse getGameSessionResult =
          gameSessionWrapper.getGameSession(
              net.accelbyte.sdk.api.session.operations.game_session.GetGameSession.builder()
                  .namespace(namespace)
                  .sessionId(gameSessionId)
                  .build());

      // ESAC

      assertNotNull(getGameSessionResult);
      assertEquals(2, getGameSessionResult.getMembers().size());
      final List<String> userIds =
          getGameSessionResult.getMembers().stream()
              .map(ApimodelsUserResponse::getId)
              .collect(Collectors.toList());
      assertTrue(userIds.contains(player1UserId));
      assertTrue(userIds.contains(player2UserId));

      // CASE Leave game session

      player2GameSessionWrapper.leaveGameSession(
          LeaveGameSession.builder().namespace(namespace).sessionId(gameSessionId).build());

      // ESAC

      // CASE Delete game session

      player1GameSessionWrapper.deleteGameSession(
          DeleteGameSession.builder().namespace(namespace).sessionId(gameSessionId).build());

      // ESAC

    } finally {
      player1Sdk.logout();
      player2Sdk.logout();

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
    }

    configurationTemplateWrapper.adminDeleteConfigurationTemplateV1(
        AdminDeleteConfigurationTemplateV1.builder()
            .namespace(namespace)
            .name(cfgTemplateName)
            .build());
  }

  @Test
  @Order(1)
  public void testQueryGameSessions() throws Exception {
    final GameSession gameSessionWrapper = new GameSession(sdk);

    final ApimodelsGameSessionQueryResponse publicQueryGameSessionsResult =
        gameSessionWrapper.publicQueryGameSessions(
            PublicQueryGameSessions.builder()
                .namespace(namespace)
                .body(Collections.emptyMap())
                .build());

    assertNotNull(publicQueryGameSessionsResult);
  }

  @Test
  @Order(1)
  public void testParty() throws Exception {
    final String cfgTemplateName = "java_sdk_template_" + TestHelper.generateRandomId(4);

    final ConfigurationTemplate configurationTemplateWrapper = new ConfigurationTemplate(sdk);
    final UsersV4 usersV4Wrapper = new UsersV4(sdk);
    final Users usersWrapper = new Users(sdk);
    final Party partyWrapper = new Party(sdk);

    configurationTemplateWrapper.adminCreateConfigurationTemplateV1(
        AdminCreateConfigurationTemplateV1.builder()
            .namespace(namespace)
            .body(
                ApimodelsCreateConfigurationTemplateRequest.builder()
                    .name(cfgTemplateName)
                    .type("P2P")
                    .minPlayers(2)
                    .maxPlayers(2)
                    .inviteTimeout(60)
                    .inactiveTimeout(60)
                    .joinability("OPEN")
                    .clientVersion("1.0.0")
                    .requestedRegions(Collections.singletonList("us-west-2"))
                    .build())
            .build());

    final AccelByteSDK player1Sdk =
        new AccelByteSDK(
            sdk.getSdkConfiguration().getHttpClient(),
            new DefaultTokenRepository(),
            sdk.getSdkConfiguration().getConfigRepository());
    final AccelByteSDK player2Sdk =
        new AccelByteSDK(
            sdk.getSdkConfiguration().getHttpClient(),
            new DefaultTokenRepository(),
            sdk.getSdkConfiguration().getConfigRepository());

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

      player1UserId = createUserResult1.getUserId();

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

      player2UserId = createUserResult2.getUserId();

      player1Sdk.loginUser(player1Username, player1Password);
      player2Sdk.loginUser(player2Username, player2Password);

      final Party player1PartyWrapper = new Party(player1Sdk);
      final Party player2PartyWrapper = new Party(player2Sdk);

      // CASE User create a party

      final ApimodelsPartySessionResponse publicCreatePartyResult =
          player1PartyWrapper.publicCreateParty(
              net.accelbyte.sdk.api.session.operations.party.PublicCreateParty.builder()
                  .namespace(namespace)
                  .body(
                      ApimodelsCreatePartyRequest.builder()
                          .configurationName(cfgTemplateName)
                          .members(
                              Collections.singletonList(
                                  ApimodelsRequestMember.builder().id(player1UserId).build()))
                          .build())
                  .build());

      // ESAC

      assertNotNull(publicCreatePartyResult);

      final String partyId = publicCreatePartyResult.getId();
      final String joinCode = publicCreatePartyResult.getCode();

      // CASE User join a party with code

      final ApimodelsPartySessionResponse publicPartyJoinCodeResult =
          player2PartyWrapper.publicPartyJoinCode(
              PublicPartyJoinCode.builder()
                  .namespace(namespace)
                  .body(ApimodelsJoinByCodeRequest.builder().code(joinCode).build())
                  .build());

      // ESAC

      assertNotNull(publicPartyJoinCodeResult);

      // CASE Get party detail

      final ApimodelsPartySessionResponse publicGetPartyResult1 =
          partyWrapper.publicGetParty(
              PublicGetParty.builder().namespace(namespace).partyId(partyId).build());

      // ESAC

      assertNotNull(publicGetPartyResult1);
      assertEquals(2, publicGetPartyResult1.getMembers().size());
      final List<String> userIds1 =
          publicGetPartyResult1.getMembers().stream()
              .map(ApimodelsUserResponse::getId)
              .collect(Collectors.toList());
      assertTrue(userIds1.contains(player1UserId));
      assertTrue(userIds1.contains(player2UserId));

      // CASE User leave a party

      player2PartyWrapper.publicPartyLeave(
          net.accelbyte.sdk.api.session.operations.party.PublicPartyLeave.builder()
              .namespace(namespace)
              .partyId(partyId)
              .build());

      // ESAC

      final ApimodelsPartySessionResponse publicGetPartyResult2 =
          partyWrapper.publicGetParty(
              PublicGetParty.builder().namespace(namespace).partyId(partyId).build());

      assertNotNull(publicGetPartyResult2);
      assertEquals(2, publicGetPartyResult2.getMembers().size());
      final List<String> userIds2 =
          publicGetPartyResult2.getMembers().stream()
              .filter(m -> !m.getStatus().equals("LEFT"))
              .map(ApimodelsUserResponse::getId)
              .collect(Collectors.toList());
      assertTrue(userIds2.contains(player1UserId));
      assertFalse(userIds2.contains(player2UserId));
    } finally {
      player1Sdk.logout();
      player2Sdk.logout();

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
    }

    configurationTemplateWrapper.adminDeleteConfigurationTemplateV1(
        AdminDeleteConfigurationTemplateV1.builder()
            .namespace(namespace)
            .name(cfgTemplateName)
            .build());
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
