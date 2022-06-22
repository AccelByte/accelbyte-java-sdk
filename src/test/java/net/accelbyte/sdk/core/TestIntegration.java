/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.TestMethodOrder;

import net.accelbyte.sdk.api.achievement.models.ModelsAchievementRequest;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementResponse;
import net.accelbyte.sdk.api.achievement.models.ModelsAchievementUpdateRequest;
import net.accelbyte.sdk.api.achievement.models.ModelsIcon;
import net.accelbyte.sdk.api.achievement.models.ModelsPaginatedAchievementResponse;
import net.accelbyte.sdk.api.achievement.operations.achievements.AdminCreateNewAchievement;
import net.accelbyte.sdk.api.achievement.operations.achievements.AdminDeleteAchievement;
import net.accelbyte.sdk.api.achievement.operations.achievements.AdminGetAchievement;
import net.accelbyte.sdk.api.achievement.operations.achievements.AdminListAchievements;
import net.accelbyte.sdk.api.achievement.operations.achievements.AdminUpdateAchievement;
import net.accelbyte.sdk.api.achievement.wrappers.Achievements;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateCreate;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateInfo;
import net.accelbyte.sdk.api.basic.models.UserProfilePrivateUpdate;
import net.accelbyte.sdk.api.basic.operations.user_profile.CreateMyProfile;
import net.accelbyte.sdk.api.basic.operations.user_profile.DeleteUserProfile;
import net.accelbyte.sdk.api.basic.operations.user_profile.GetMyProfileInfo;
import net.accelbyte.sdk.api.basic.operations.user_profile.UpdateMyProfile;
import net.accelbyte.sdk.api.basic.wrappers.UserProfile;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordResponse;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.DeleteGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.GetGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PostGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PutGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.wrappers.PublicGameRecord;
import net.accelbyte.sdk.api.dslogmanager.models.ModelsListTerminatedServersResponse;
import net.accelbyte.sdk.api.dslogmanager.operations.terminated_servers.ListTerminatedServers;
import net.accelbyte.sdk.api.dslogmanager.wrappers.TerminatedServers;
import net.accelbyte.sdk.api.dsmc.models.ModelsClaimSessionRequest;
import net.accelbyte.sdk.api.dsmc.models.ModelsListServerResponse;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchMember;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchingAlly;
import net.accelbyte.sdk.api.dsmc.models.ModelsRequestMatchParty;
import net.accelbyte.sdk.api.dsmc.operations.admin.ListLocalServer;
import net.accelbyte.sdk.api.dsmc.operations.session.ClaimServer;
import net.accelbyte.sdk.api.dsmc.wrappers.Admin;
import net.accelbyte.sdk.api.eventlog.models.ModelsEventResponseV2;
import net.accelbyte.sdk.api.eventlog.models.ModelsGenericQueryPayload;
import net.accelbyte.sdk.api.eventlog.operations.event_v2.GetEventSpecificUserV2Handler;
import net.accelbyte.sdk.api.eventlog.operations.event_v2.QueryEventStreamHandler;
import net.accelbyte.sdk.api.eventlog.wrappers.EventV2;
import net.accelbyte.sdk.api.gametelemetry.models.TelemetryBody;
import net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations.ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet;
import net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations.ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost;
import net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations.ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut;
import net.accelbyte.sdk.api.gametelemetry.wrappers.GametelemetryOperations;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.DeleteAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.GetAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.SaveAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.UpdateAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.wrappers.DataRetrieval;
import net.accelbyte.sdk.api.group.models.ModelsCreateGroupConfigurationRequestV1;
import net.accelbyte.sdk.api.group.models.ModelsCreateGroupConfigurationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsGetGroupConfigurationResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsGroupResponseV1;
import net.accelbyte.sdk.api.group.models.ModelsPublicCreateNewGroupRequestV1;
import net.accelbyte.sdk.api.group.models.ModelsUpdateGroupRequestV1;
import net.accelbyte.sdk.api.group.operations.configuration.CreateGroupConfigurationAdminV1;
import net.accelbyte.sdk.api.group.operations.configuration.DeleteGroupConfigurationV1;
import net.accelbyte.sdk.api.group.operations.configuration.GetGroupConfigurationAdminV1;
import net.accelbyte.sdk.api.group.operations.configuration.InitiateGroupConfigurationAdminV1;
import net.accelbyte.sdk.api.group.operations.group.CreateNewGroupPublicV1;
import net.accelbyte.sdk.api.group.operations.group.DeleteGroupPublicV1;
import net.accelbyte.sdk.api.group.operations.group.GetSingleGroupPublicV1;
import net.accelbyte.sdk.api.group.operations.group.UpdateSingleGroupV1;
import net.accelbyte.sdk.api.group.wrappers.Configuration;
import net.accelbyte.sdk.api.group.wrappers.Group;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.models.ModelPublicUserResponse;
import net.accelbyte.sdk.api.iam.models.ModelUserResponse;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.models.ModelUserUpdateRequest;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4.AuthType;
import net.accelbyte.sdk.api.iam.operations.users.AdminGetMyUserV3;
import net.accelbyte.sdk.api.iam.operations.users.DeleteUser;
import net.accelbyte.sdk.api.iam.operations.users.GetUserByLoginID;
import net.accelbyte.sdk.api.iam.operations.users.GetUserByUserID;
import net.accelbyte.sdk.api.iam.operations.users.UpdateUser;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicCreateUserV4;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
import net.accelbyte.sdk.api.leaderboard.models.ModelsDailyConfig;
import net.accelbyte.sdk.api.leaderboard.models.ModelsGetLeaderboardConfigResp;
import net.accelbyte.sdk.api.leaderboard.models.ModelsLeaderboardConfigReq;
import net.accelbyte.sdk.api.leaderboard.models.ModelsMonthlyConfig;
import net.accelbyte.sdk.api.leaderboard.models.ModelsUpdateLeaderboardConfigReq;
import net.accelbyte.sdk.api.leaderboard.models.ModelsWeeklyConfig;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.CreateLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.DeleteLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.GetLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.UpdateLeaderboardConfigurationAdminV1;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardConfiguration;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementRequest;
import net.accelbyte.sdk.api.legal.models.RetrieveAcceptedAgreementResponse;
import net.accelbyte.sdk.api.legal.operations.agreement.ChangePreferenceConsent;
import net.accelbyte.sdk.api.legal.operations.agreement.RetrieveAgreementsPublic;
import net.accelbyte.sdk.api.legal.wrappers.Agreement;
import net.accelbyte.sdk.api.lobby.models.ModelFreeFormNotificationRequest;
import net.accelbyte.sdk.api.lobby.operations.notification.FreeFormNotification;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
import net.accelbyte.sdk.api.lobby.ws_models.PartyCreateRequest;
import net.accelbyte.sdk.api.matchmaking.models.ModelsAllianceFlexingRule;
import net.accelbyte.sdk.api.matchmaking.models.ModelsAllianceRule;
import net.accelbyte.sdk.api.matchmaking.models.ModelsChannelRequest;
import net.accelbyte.sdk.api.matchmaking.models.ModelsChannelV1;
import net.accelbyte.sdk.api.matchmaking.models.ModelsCreateChannelResponse;
import net.accelbyte.sdk.api.matchmaking.models.ModelsFlexingRule;
import net.accelbyte.sdk.api.matchmaking.models.ModelsMatchOption;
import net.accelbyte.sdk.api.matchmaking.models.ModelsMatchOptionRule;
import net.accelbyte.sdk.api.matchmaking.models.ModelsMatchingRule;
import net.accelbyte.sdk.api.matchmaking.models.ModelsMatchmakingResult;
import net.accelbyte.sdk.api.matchmaking.models.ModelsRuleSet;
import net.accelbyte.sdk.api.matchmaking.models.ModelsSubGameMode;
import net.accelbyte.sdk.api.matchmaking.models.ModelsUpdateChannelRequest;
import net.accelbyte.sdk.api.matchmaking.operations.matchmaking.CreateChannelHandler;
import net.accelbyte.sdk.api.matchmaking.operations.matchmaking.DeleteChannelHandler;
import net.accelbyte.sdk.api.matchmaking.operations.matchmaking.GetAllSessionsInChannel;
import net.accelbyte.sdk.api.matchmaking.operations.matchmaking.GetSingleMatchmakingChannel;
import net.accelbyte.sdk.api.matchmaking.operations.matchmaking.UpdateMatchmakingChannel;
import net.accelbyte.sdk.api.matchmaking.wrappers.Matchmaking;
import net.accelbyte.sdk.api.platform.models.StoreCreate;
import net.accelbyte.sdk.api.platform.models.StoreInfo;
import net.accelbyte.sdk.api.platform.models.StoreUpdate;
import net.accelbyte.sdk.api.platform.operations.store.CreateStore;
import net.accelbyte.sdk.api.platform.operations.store.DeleteStore;
import net.accelbyte.sdk.api.platform.operations.store.GetStore;
import net.accelbyte.sdk.api.platform.operations.store.UpdateStore;
import net.accelbyte.sdk.api.platform.wrappers.Store;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsCreateSessionRequest;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsGameSessionSetting;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsSessionResponse;
import net.accelbyte.sdk.api.sessionbrowser.models.ModelsUpdateSessionRequest;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.CreateSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.DeleteSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.GetSession;
import net.accelbyte.sdk.api.sessionbrowser.operations.session.UpdateSession;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
import net.accelbyte.sdk.api.social.models.StatCreate;
import net.accelbyte.sdk.api.social.models.StatInfo;
import net.accelbyte.sdk.api.social.models.StatItemInc;
import net.accelbyte.sdk.api.social.models.StatItemIncResult;
import net.accelbyte.sdk.api.social.models.StatUpdate;
import net.accelbyte.sdk.api.social.models.UserStatItemPagingSlicedResult;
import net.accelbyte.sdk.api.social.operations.stat_configuration.CreateStat;
import net.accelbyte.sdk.api.social.operations.stat_configuration.DeleteStat;
import net.accelbyte.sdk.api.social.operations.stat_configuration.GetStat;
import net.accelbyte.sdk.api.social.operations.stat_configuration.UpdateStat;
import net.accelbyte.sdk.api.social.operations.user_statistic.CreateUserStatItem;
import net.accelbyte.sdk.api.social.operations.user_statistic.DeleteUserStatItems;
import net.accelbyte.sdk.api.social.operations.user_statistic.GetUserStatItems;
import net.accelbyte.sdk.api.social.operations.user_statistic.IncUserStatItemValue;
import net.accelbyte.sdk.api.social.wrappers.StatConfiguration;
import net.accelbyte.sdk.api.social.wrappers.UserStatistic;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagRequest;
import net.accelbyte.sdk.api.ugc.models.ModelsCreateTagResponse;
import net.accelbyte.sdk.api.ugc.models.ModelsPaginatedGetTagResponse;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminCreateTag;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminDeleteTag;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminGetTag;
import net.accelbyte.sdk.api.ugc.operations.admin_tag.AdminUpdateTag;
import net.accelbyte.sdk.api.ugc.wrappers.AdminTag;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy;
import net.accelbyte.sdk.core.client.HttpClient;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.client.OkhttpWebSocketClient;
import net.accelbyte.sdk.core.client.ReliableHttpClient;
import net.accelbyte.sdk.core.client.DefaultHttpRetryPolicy.RetryIntervalType;
import net.accelbyte.sdk.core.repository.ConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRefreshRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import net.accelbyte.sdk.core.repository.TokenRepository;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegration {
        private AccelByteSDK sdk;
        private String namespace;
        private String username;
        private String password;

        @BeforeAll
        public void setup() throws Exception {
                final HttpClient<?> httpClient = new OkhttpClient();
                final TokenRepository tokenRepo = DefaultTokenRepository.getInstance();
                final ConfigRepository configRepo = new DefaultConfigRepository();
                final AccelByteConfig sdkConfig = new AccelByteConfig(httpClient, tokenRepo, configRepo);

                final String baseUrl = configRepo.getBaseURL();
                final String clientId = configRepo.getClientId();
                final String clientSecret = configRepo.getClientSecret();
                final String username = System.getenv("AB_USERNAME");
                final String password = System.getenv("AB_PASSWORD");
                final String namespace = System.getenv("AB_NAMESPACE");

                assertTrue(baseUrl != null && !baseUrl.isEmpty());
                assertTrue(clientId != null && !clientId.isEmpty());
                assertTrue(clientSecret != null && !clientSecret.isEmpty());
                assertTrue(username != null && !username.isEmpty());
                assertTrue(password != null && !password.isEmpty());
                assertTrue(namespace != null && !namespace.isEmpty());

                this.sdk = new AccelByteSDK(sdkConfig);
                this.namespace = namespace;
                this.username = username;
                this.password = password;

                final boolean isLoginUserOk = sdk.loginUser(username, password);
                final String token = tokenRepo.getToken();

                assertTrue(isLoginUserOk);
                assertTrue(token != null && !token.isEmpty());
        }

        // Admin integration test

        @Test
        @Order(1)
        public void testServiceAchievement() throws Exception {
                final String achievementCode = "java-sdk-test";
                final String achievementName = "Java Server SDK Test";
                final String achievementDescription = "This is a Java Server SDK test";
                final String achievementLanguage = "en";

                final Achievements achievementWrapper = new Achievements(sdk);

                // Create achievement

                final ModelsAchievementRequest createAchievement = ModelsAchievementRequest.builder()
                                .achievementCode(achievementCode)
                                .defaultLanguage(achievementLanguage)
                                .name(Collections.singletonMap(achievementLanguage, achievementName))
                                .description(Collections.singletonMap(achievementLanguage, achievementDescription))
                                .goalValue(1000f)
                                .statCode(achievementCode)
                                .hidden(true)
                                .incremental(false)
                                .lockedIcons(Arrays.asList(new ModelsIcon[] { ModelsIcon.builder()
                                                .slug("shield-locked")
                                                .url("https://cdn.demo.accelbyte.io/files/accelbyte/achievements/50000f325ef841a6972a005779e20991.png")
                                                .build() }))
                                .unlockedIcons(Arrays.asList(new ModelsIcon[] { ModelsIcon.builder()
                                                .slug("shield-unlocked")
                                                .url("https://cdn.demo.accelbyte.io/files/accelbyte/achievements/fe89fd07102f4057be202fbd3fdd9a21.png")
                                                .build() }))
                                .tags(Arrays.asList(new String[] { "sdk", "test", "java" }))
                                .build();
                final ModelsAchievementResponse createAchievementResult = achievementWrapper.adminCreateNewAchievement(
                                AdminCreateNewAchievement.builder()
                                                .namespace(this.namespace)
                                                .body(createAchievement)
                                                .build());
                assertNotNull(createAchievementResult);
                assertEquals(createAchievementResult.getAchievementCode(), achievementCode);

                // Update achievement

                final ModelsAchievementUpdateRequest updateAchievement = ModelsAchievementUpdateRequest.builder()
                                .goalValue(2000f)
                                .build();

                final ModelsAchievementResponse updateAchievementResult = achievementWrapper.adminUpdateAchievement(
                                AdminUpdateAchievement.builder()
                                                .namespace(this.namespace)
                                                .achievementCode(achievementCode)
                                                .body(updateAchievement)
                                                .build());
                assertNotNull(updateAchievementResult);
                assertEquals(updateAchievementResult.getGoalValue(), 2000f);

                // Get achievement by code

                final ModelsAchievementResponse getAchievementResult = achievementWrapper
                                .adminGetAchievement(AdminGetAchievement.builder()
                                                .namespace(this.namespace)
                                                .achievementCode(achievementCode)
                                                .build());
                assertNotNull(getAchievementResult);
                assertEquals(getAchievementResult.getGoalValue(), 2000f);
                assertEquals(getAchievementResult.getName().get("en"), achievementName);

                // Get achievement list

                final ModelsPaginatedAchievementResponse getAchievementListResult = achievementWrapper
                                .adminListAchievements(AdminListAchievements.builder()
                                                .namespace(this.namespace)
                                                .limit(100)
                                                .offset(0)
                                                .build());
                assertNotNull(getAchievementListResult);
                assertTrue(getAchievementListResult.getData().size() > 0);

                // Delete achievement

                achievementWrapper.adminDeleteAchievement(AdminDeleteAchievement.builder()
                                .namespace(this.namespace)
                                .achievementCode(achievementCode)
                                .build());

                // Confirm if achievement is deleted

                assertThrows(HttpResponseException.class, () -> {
                        achievementWrapper.adminGetAchievement(AdminGetAchievement.builder()
                                        .namespace(this.namespace)
                                        .achievementCode(achievementCode)
                                        .build());
                });
        }

        @Test
        @Order(2)
        public void testServiceBasic() throws Exception {
                final String profileFirstName = "Integration Test";
                final String profileLastName = "Java Server SDK";
                final LocalDate profileDateOfBirth = LocalDate.of(2022, 1, 1);
                final String profileLanguage = "en";
                final String profileTimeZone = "Asia/Jakarta";

                final UserProfile profileWrapper = new UserProfile(sdk);

                // Create own user profile

                final UserProfilePrivateCreate createProfile = UserProfilePrivateCreate.builder()
                                .firstName(profileFirstName)
                                .lastName(profileLastName)
                                .dateOfBirth(profileDateOfBirth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                                .language(profileLanguage)
                                .build();

                final UserProfilePrivateInfo createProfileResult = profileWrapper
                                .createMyProfile(CreateMyProfile.builder()
                                                .namespace(this.namespace)
                                                .body(createProfile)
                                                .build());
                assertNotNull(createProfileResult);
                assertEquals(createProfileResult.getFirstName(), profileFirstName);

                // Get own user profile

                final UserProfilePrivateInfo getProfileResult = profileWrapper
                                .getMyProfileInfo(GetMyProfileInfo.builder()
                                                .namespace(this.namespace)
                                                .build());
                assertNotNull(getProfileResult);
                assertEquals(getProfileResult.getLastName(), profileLastName);

                // Update own user profile

                final UserProfilePrivateUpdate updateProfile = UserProfilePrivateUpdate.builder()
                                .timeZone(profileTimeZone)
                                .build();

                final UserProfilePrivateInfo updateProfileResult = profileWrapper
                                .updateMyProfile(UpdateMyProfile.builder()
                                                .namespace(this.namespace)
                                                .body(updateProfile)
                                                .build());
                assertNotNull(updateProfileResult);
                assertEquals(updateProfileResult.getTimeZone(), profileTimeZone);

                // Delete own user profile

                final String userId = getProfileResult.getUserId();

                final UserProfilePrivateInfo delResp = profileWrapper.deleteUserProfile(DeleteUserProfile.builder()
                                .namespace(this.namespace)
                                .userId(userId)
                                .build());
                assertNotNull(delResp);
        }

        @Test
        @Order(3)
        public void testServiceCloudSave() throws Exception {
                final String gameRecordKey = "foo_bar_record";
                final String gameRecordFoo = "bar";
                final String gameRecordFooBar = "foo";
                final int gameRecordFooValue = 4893;

                final PublicGameRecord publicGameRecordWrapper = new PublicGameRecord(sdk);

                // Create game record

                final DummyGameRecord createGameRecord = DummyGameRecord.builder()
                                .Foo(gameRecordFoo)
                                .FooBar(gameRecordFooBar)
                                .FooValue(gameRecordFooValue)
                                .build();

                publicGameRecordWrapper.postGameRecordHandlerV1(PostGameRecordHandlerV1.builder()
                                .namespace(this.namespace)
                                .key(gameRecordKey)
                                .body(createGameRecord)
                                .build());

                // Get game record

                final ModelsGameRecordResponse getGameRecordResult1 = publicGameRecordWrapper
                                .getGameRecordHandlerV1(GetGameRecordHandlerV1.builder()
                                                .namespace(this.namespace)
                                                .key(gameRecordKey)
                                                .build());

                assertNotNull(getGameRecordResult1);
                final Map<String, ?> gameRecordValue1 = getGameRecordResult1.getValue();
                assertNotNull(gameRecordValue1);
                assertTrue(gameRecordValue1.containsKey("foo_bar"));
                assertEquals(gameRecordFooBar, gameRecordValue1.get("foo_bar").toString());

                // Update game record

                DummyGameRecord updateRecord = DummyGameRecord.builder()
                                .Foo(gameRecordFoo)
                                .FooBar(gameRecordFooBar + "update")
                                .FooValue(gameRecordFooValue)
                                .build();

                publicGameRecordWrapper.putGameRecordHandlerV1(PutGameRecordHandlerV1.builder()
                                .namespace(this.namespace)
                                .key(gameRecordKey)
                                .body(updateRecord)
                                .build());

                // Confirm if game record is updated

                final ModelsGameRecordResponse getGameRecordResult2 = publicGameRecordWrapper
                                .getGameRecordHandlerV1(GetGameRecordHandlerV1.builder()
                                                .namespace(this.namespace)
                                                .key(gameRecordKey)
                                                .build());

                assertNotNull(getGameRecordResult2);
                final Map<String, ?> gameRecordValue2 = getGameRecordResult2.getValue();
                assertNotNull(gameRecordValue2);
                assertTrue(gameRecordValue2.containsKey("foo"));
                assertEquals(gameRecordFoo, gameRecordValue2.get("foo").toString());
                assertTrue(gameRecordValue2.containsKey("foo_bar"));
                assertEquals(gameRecordFooBar + "update", gameRecordValue2.get("foo_bar").toString());

                // Delete game record

                publicGameRecordWrapper.deleteGameRecordHandlerV1(DeleteGameRecordHandlerV1.builder()
                                .namespace(this.namespace)
                                .key(gameRecordKey)
                                .build());

                // Confirm if game record is deleted

                assertThrows(HttpResponseException.class, () -> {
                        publicGameRecordWrapper.getGameRecordHandlerV1(GetGameRecordHandlerV1.builder()
                                        .namespace(this.namespace)
                                        .key(gameRecordKey)
                                        .build());
                });
        }

        @Test
        @Order(4)
        public void testServiceDsLogManager() throws Exception {
                final TerminatedServers terminatedServersWrapper = new TerminatedServers(sdk);
                final ModelsListTerminatedServersResponse terminatedServersResult = terminatedServersWrapper
                                .listTerminatedServers(ListTerminatedServers.builder()
                                                .namespace(this.namespace)
                                                .limit(10)
                                                .build());
                assertNotNull(terminatedServersResult);
        }

        @Test
        @Order(5)
        public void testServiceEventLog() throws Exception {
                final Users usersWrapper = new Users(sdk);
                final EventV2 eventV2Wrapper = new EventV2(sdk);

                final ModelUserResponseV3 getUserResult = usersWrapper
                                .adminGetMyUserV3(new AdminGetMyUserV3());

                assertNotNull(getUserResult);

                final ModelsGenericQueryPayload queryEventStream = ModelsGenericQueryPayload.builder()
                                .clientId(sdk.getSdkConfiguration().getConfigRepository().getClientId())
                                .build();

                final ModelsEventResponseV2 queryEventStreamResult1 = eventV2Wrapper
                                .queryEventStreamHandler(QueryEventStreamHandler.builder()
                                                .namespace(this.namespace)
                                                .offset(0)
                                                .pageSize(10)
                                                .body(queryEventStream)
                                                .build());

                assertNotNull(queryEventStreamResult1);
                assertTrue(queryEventStreamResult1.getData().size() > 0);

                final ModelsEventResponseV2 queryEventStreamResult2 = eventV2Wrapper
                                .getEventSpecificUserV2Handler(GetEventSpecificUserV2Handler.builder()
                                                .namespace(this.namespace)
                                                .userId(getUserResult.getUserId())
                                                .offset(0)
                                                .pageSize(10)
                                                .build());

                assertNotNull(queryEventStreamResult2);
                assertTrue(queryEventStreamResult2.getData().size() > 0);
        }

        @Test
        @Order(6)
        public void testServiceGdpr() throws Exception {
                final String email1 = "email1@example.com";
                final String email2 = "email2@dummy.com";

                final DataRetrieval dataRetrievalWrapper = new DataRetrieval(sdk);

                dataRetrievalWrapper.saveAdminEmailConfiguration(
                                SaveAdminEmailConfiguration.builder()
                                                .namespace(this.namespace)
                                                .body(Arrays.asList(new String[] { email1 }))
                                                .build());

                final List<String> emails = dataRetrievalWrapper.getAdminEmailConfiguration(
                                GetAdminEmailConfiguration.builder()
                                                .namespace(this.namespace)
                                                .build());

                assertNotNull(emails);

                dataRetrievalWrapper.updateAdminEmailConfiguration(UpdateAdminEmailConfiguration.builder()
                                .namespace(this.namespace)
                                .body(Arrays.asList(new String[] { email2 }))
                                .build());

                dataRetrievalWrapper.deleteAdminEmailConfiguration(
                                DeleteAdminEmailConfiguration.builder()
                                                .namespace(this.namespace)
                                                .emails(Arrays.asList(new String[] { email2 }))
                                                .build());
        }

        @Test
        @Order(7)
        public void testServiceGroup() throws Exception {
                final String initialConfigCode = "initialConfigurationCode";
                final String configurationCode = "csharpServerSdkConfigCode";
                final String groupName = "Java SDK Test Group";
                final String groupDescriptionUpdated = "Updated description.";

                final Configuration configurationWrapper = new Configuration(sdk);
                final Group groupWrapper = new Group(sdk);

                String defaultAdminRoleId = "";
                String defaultMemberRoleId = "";

                try {
                        final ModelsGetGroupConfigurationResponseV1 getGroupConfigResult = configurationWrapper
                                        .getGroupConfigurationAdminV1(
                                                        GetGroupConfigurationAdminV1.builder()
                                                                        .namespace(this.namespace)
                                                                        .configurationCode(initialConfigCode)
                                                                        .build());
                        assertNotNull(getGroupConfigResult);
                        defaultAdminRoleId = getGroupConfigResult.getGroupAdminRoleId();
                        defaultMemberRoleId = getGroupConfigResult.getGroupMemberRoleId();
                } catch (HttpResponseException rex) {
                        final boolean isNotAvailable = rex.getErrorMessage().contains("73131"); // No inital
                                                                                                // configuration yet
                        if (isNotAvailable) {
                                ModelsCreateGroupConfigurationResponseV1 initiateGroupConfigResult = configurationWrapper
                                                .initiateGroupConfigurationAdminV1(
                                                                InitiateGroupConfigurationAdminV1.builder()
                                                                                .namespace(this.namespace)
                                                                                .build());
                                defaultAdminRoleId = initiateGroupConfigResult.getGroupAdminRoleId();
                                defaultMemberRoleId = initiateGroupConfigResult.getGroupMemberRoleId();
                        } else {
                                throw rex;
                        }
                }

                // Create group configuration

                try {
                        final ModelsCreateGroupConfigurationRequestV1 createGroupConfig = ModelsCreateGroupConfigurationRequestV1
                                        .builder()
                                        .configurationCode(configurationCode)
                                        .description("CSharp SDK Test Configuration Group")
                                        .groupMaxMember(50)
                                        .name("CSharp SDK Test Configuration Group")
                                        .groupAdminRoleId(defaultAdminRoleId)
                                        .groupMemberRoleId(defaultMemberRoleId)
                                        .build();
                        final ModelsCreateGroupConfigurationResponseV1 createGroupConfigResult = configurationWrapper
                                        .createGroupConfigurationAdminV1(
                                                        CreateGroupConfigurationAdminV1.builder()
                                                                        .namespace(this.namespace)
                                                                        .body(createGroupConfig)
                                                                        .build());
                        assertNotNull(createGroupConfigResult);
                } catch (HttpResponseException rex) {
                        boolean isAlreadyExist = rex.getErrorMessage()
                                        .contains("73130"); // Unable to create global
                                                            // configuration: global
                                                            // configuration already exist

                        if (!isAlreadyExist) {
                                throw rex;
                        }
                }

                // Create a group

                final ModelsPublicCreateNewGroupRequestV1 createGroup = ModelsPublicCreateNewGroupRequestV1.builder()
                                .groupName("Java SDK Test Group")
                                .groupType("PUBLIC")
                                .groupDescription("Yeah, anything is welcome here.")
                                .groupMaxMember(100)
                                .groupRegion("us-west-1")
                                .configurationCode(configurationCode)
                                .build();
                final ModelsGroupResponseV1 createGroupResult = groupWrapper
                                .createNewGroupPublicV1(CreateNewGroupPublicV1.builder()
                                                .namespace(this.namespace)
                                                .body(createGroup)
                                                .build());
                assertNotNull(createGroupResult);
                assertEquals(groupName, createGroupResult.getGroupName());

                final String groupId = createGroupResult.getGroupId();

                // Get single group

                final ModelsGroupResponseV1 getSingleGroupResult = groupWrapper
                                .getSingleGroupPublicV1(GetSingleGroupPublicV1.builder()
                                                .namespace(this.namespace)
                                                .groupId(groupId)
                                                .build());
                assertNotNull(getSingleGroupResult);
                assertEquals(groupName, createGroupResult.getGroupName());

                // Update a group

                final ModelsUpdateGroupRequestV1 updateGroup = ModelsUpdateGroupRequestV1.builder()
                                .groupDescription(groupDescriptionUpdated)
                                .build();
                final ModelsGroupResponseV1 updateGroupResult = groupWrapper
                                .updateSingleGroupV1(UpdateSingleGroupV1.builder()
                                                .namespace(this.namespace)
                                                .groupId(groupId)
                                                .body(updateGroup)
                                                .build());

                assertNotNull(updateGroupResult);
                assertEquals(groupDescriptionUpdated, updateGroupResult.getGroupDescription());

                // Delete a group

                groupWrapper.deleteGroupPublicV1(DeleteGroupPublicV1.builder()
                                .namespace(this.namespace)
                                .groupId(groupId)
                                .build());

                // Confirm if group is deleted

                assertThrows(HttpResponseException.class, () -> {
                        groupWrapper.getSingleGroupPublicV1(GetSingleGroupPublicV1.builder()
                                        .namespace(this.namespace)
                                        .groupId(groupId)
                                        .build());
                });

                // Delete group configuration

                configurationWrapper.deleteGroupConfigurationV1(
                                DeleteGroupConfigurationV1.builder()
                                                .namespace(this.namespace)
                                                .configurationCode(configurationCode)
                                                .build());
        }

        @Test
        @Order(8)
        public void testServiceIam() throws Exception, IllegalArgumentException {
                final String userName = ("javasdk_" + GenerateRandomId(8));
                final String userPassword = GenerateRandomPassword(10);
                final String userEmail = (userName + "@test.com");
                final String userDisplayName = "Java Server SDK Test";
                final String userDateOfBirth = "1995-01-10";
                final String userDateOfBirthUpdate = "1996-01-10";
                final String userCountry = "ID";

                final Users usersWrapper = new Users(sdk);
                final UsersV4 usersV4Wrapper = new UsersV4(sdk);

                // Create user

                final AccountCreateUserRequestV4 createUser = AccountCreateUserRequestV4.builder()
                                .authTypeFromEnum(AuthType.EMAILPASSWD)
                                .emailAddress(userEmail)
                                .password(userPassword)
                                .displayName(userDisplayName)
                                .username(userName)
                                .country(userCountry)
                                .dateOfBirth(userDateOfBirth)
                                .build();

                final AccountCreateUserResponseV4 createUserResult = usersV4Wrapper.publicCreateUserV4(
                                PublicCreateUserV4.builder()
                                                .namespace(this.namespace)
                                                .body(createUser)
                                                .build());

                assertNotNull(createUserResult);
                assertEquals(userEmail, createUserResult.getEmailAddress());

                final String userId = createUserResult.getUserId();

                // Get user

                final ModelUserResponse getUserResult = usersWrapper.getUserByUserID(
                                GetUserByUserID.builder()
                                                .namespace(this.namespace)
                                                .userId(userId)
                                                .build());

                assertNotNull(getUserResult);
                assertEquals(userDisplayName, getUserResult.getDisplayName());

                // Update user

                final ModelUserUpdateRequest updateUser = ModelUserUpdateRequest.builder()
                                .dateOfBirth(userDateOfBirthUpdate)
                                .build();

                final ModelUserResponse updateUserResult = usersWrapper.updateUser(
                                UpdateUser.builder()
                                                .namespace(this.namespace)
                                                .userId(userId)
                                                .body(updateUser)
                                                .build());

                assertNotNull(updateUserResult);
                assertNotNull(updateUserResult.getDateOfBirth());

                final Instant userDateOfBirthActual = Instant.parse(updateUserResult.getDateOfBirth());

                assertNotNull(userDateOfBirthActual);
                assertEquals(
                                userDateOfBirthUpdate,
                                userDateOfBirthActual
                                                .atZone(ZoneId.systemDefault())
                                                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));

                // Delete user

                usersWrapper.deleteUser(
                                DeleteUser.builder()
                                                .namespace(this.namespace)
                                                .userId(userId)
                                                .build());

                // Confirm if user is deleted

                assertThrows(HttpResponseException.class, () -> {
                        usersWrapper.getUserByUserID(
                                        GetUserByUserID.builder()
                                                        .namespace(this.namespace)
                                                        .userId(userId)
                                                        .build());
                });
        }

        @Test
        @Order(9)
        public void testServiceLeaderboard() throws Exception {
                final String leaderboardName = "Java Server SDK Leaderboard Test";
                final String leaderboardCode = "javasdklbtest" + java.util.UUID.randomUUID().toString().substring(0, 6);
                final String startTime = Instant.now()
                                .plus(31, ChronoUnit.DAYS)
                                .atZone(ZoneId.systemDefault())
                                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSxxx"));

                final LeaderboardConfiguration leaderboardConfigWrapper = new LeaderboardConfiguration(sdk);

                // Create a leaderboard

                final ModelsLeaderboardConfigReq createLeaderboard = ModelsLeaderboardConfigReq.builder()
                                .leaderboardCode(leaderboardCode)
                                .name(leaderboardName)
                                .statCode("1")
                                .seasonPeriod(36)
                                .descending(false)
                                .startTime(startTime)
                                .daily(ModelsDailyConfig.builder().resetTime("00:00:00").build())
                                .weekly(ModelsWeeklyConfig.builder().resetDay(0).resetTime("00:00:00").build())
                                .monthly(ModelsMonthlyConfig.builder().resetDate(1).resetTime("00:00:00").build())
                                .build();

                final ModelsLeaderboardConfigReq createLeaderboardResult = leaderboardConfigWrapper
                                .createLeaderboardConfigurationAdminV1(CreateLeaderboardConfigurationAdminV1.builder()
                                                .namespace(this.namespace)
                                                .body(createLeaderboard)
                                                .build());

                assertNotNull(createLeaderboardResult);
                assertEquals(leaderboardName, createLeaderboardResult.getName());

                // Get a leaderboard

                final ModelsGetLeaderboardConfigResp getLeaderboardResult1 = leaderboardConfigWrapper
                                .getLeaderboardConfigurationAdminV1(GetLeaderboardConfigurationAdminV1.builder()
                                                .namespace(this.namespace)
                                                .leaderboardCode(leaderboardCode)
                                                .build());

                assertNotNull(getLeaderboardResult1);
                assertEquals(leaderboardName, getLeaderboardResult1.getName());

                // Update a leaderboard

                final ModelsUpdateLeaderboardConfigReq updateLeaderboard = ModelsUpdateLeaderboardConfigReq.builder()
                                .name(leaderboardName)
                                .statCode("1")
                                .startTime(startTime)
                                .seasonPeriod(40)
                                .build();

                final ModelsGetLeaderboardConfigResp updateLeaderboardResult = leaderboardConfigWrapper
                                .updateLeaderboardConfigurationAdminV1(UpdateLeaderboardConfigurationAdminV1.builder()
                                                .namespace(this.namespace)
                                                .leaderboardCode(leaderboardCode)
                                                .body(updateLeaderboard)
                                                .build());

                assertNotNull(updateLeaderboardResult);
                assertEquals(40, updateLeaderboardResult.getSeasonPeriod());

                // Delete a leaderboard

                leaderboardConfigWrapper
                                .deleteLeaderboardConfigurationAdminV1(DeleteLeaderboardConfigurationAdminV1.builder()
                                                .namespace(this.namespace)
                                                .leaderboardCode(leaderboardCode)
                                                .build());

                // Confirm if leaderboard is deleted

                final ModelsGetLeaderboardConfigResp getLeaderboardResult2 = leaderboardConfigWrapper
                                .getLeaderboardConfigurationAdminV1(GetLeaderboardConfigurationAdminV1.builder()
                                                .namespace(this.namespace)
                                                .leaderboardCode(leaderboardCode)
                                                .build());

                assertNotNull(getLeaderboardResult2);
                assertTrue(getLeaderboardResult2.getIsDeleted());
        }

        @Test
        @Order(10)
        public void testServiceLegal() throws Exception {
                final Agreement agreementWrapper = new Agreement(sdk);

                final List<RetrieveAcceptedAgreementResponse> aggrs = agreementWrapper
                                .retrieveAgreementsPublic(RetrieveAgreementsPublic.builder().build());

                assertNotNull(aggrs);

                final List<AcceptAgreementRequest> acceptAgreements = Arrays.asList(new AcceptAgreementRequest[] {
                                AcceptAgreementRequest.builder()
                                                .localizedPolicyVersionId("152b9b0f-7b8e-4a9e-8a9d-8c82420ad8b3")
                                                .policyVersionId("a76ea12c-14fd-46c5-886f-fd3d0ded4408")
                                                .policyId("6adb3d65-b428-4dbc-a08d-e5126c644557") // The marketing
                                                                                                  // policy
                                                .isAccepted(true)
                                                .isNeedToSendEventMarketing(false)
                                                .build()
                });

                agreementWrapper.changePreferenceConsent(
                                ChangePreferenceConsent.builder()
                                                .body(acceptAgreements)
                                                .build());
        }

        @Test
        @Order(11)
        public void testServicePlatform() throws Exception {
                final String storeTitle = "Java Server SDK Store Test";
                final String storeDescription = "Description for Java Server SDK store service integration test.";
                final String storeDescriptionUpdate = "Updated description.";

                final Store storeWrapper = new Store(sdk);

                // TODO Setup store

                // Create a store

                final StoreCreate createStore = StoreCreate.builder()
                                .title(storeTitle)
                                .description(storeDescription)
                                .defaultLanguage("en")
                                .defaultRegion("US")
                                .supportedLanguages(Arrays.asList(new String[] { "en", "id" }))
                                .supportedRegions(Arrays.asList(new String[] { "US", "ID" }))
                                .build();

                final StoreInfo createStoreResult = storeWrapper.createStore(CreateStore.builder()
                                .namespace(this.namespace)
                                .body(createStore)
                                .build());

                assertNotNull(createStoreResult);
                assertEquals(storeTitle, createStoreResult.getTitle());

                final String storeId = createStoreResult.getStoreId();

                // Get a store

                final StoreInfo getStore = storeWrapper.getStore(GetStore.builder()
                                .namespace(this.namespace)
                                .storeId(storeId)
                                .build());

                assertNotNull(getStore);
                assertEquals(storeTitle, getStore.getTitle());

                // Update a store

                final StoreUpdate updateStore = StoreUpdate.builder().description(storeDescriptionUpdate).build();

                final StoreInfo updateStoreResult = storeWrapper.updateStore(UpdateStore.builder()
                                .namespace(this.namespace)
                                .storeId(storeId)
                                .body(updateStore)
                                .build());

                assertNotNull(updateStoreResult);
                assertEquals(storeDescriptionUpdate, updateStoreResult.getDescription());

                // Delete a store

                final StoreInfo deleteStoreResult = storeWrapper.deleteStore(DeleteStore.builder()
                                .namespace(this.namespace)
                                .storeId(storeId)
                                .build());

                assertNotNull(deleteStoreResult);
        }

        @Test
        @Order(12)
        public void testSessionBrowser() throws Exception {
                final String sessionUsername = "email@example.com";
                final String sessionGameVersion = "0.3.0";

                final Session sessionWrapper = new Session(sdk);

                // Create a session

                final ModelsCreateSessionRequest createSession = ModelsCreateSessionRequest.builder()
                                .namespace(this.namespace)
                                .sessionType("p2p")
                                .gameVersion(sessionGameVersion)
                                .username(sessionUsername)
                                .gameSessionSetting(ModelsGameSessionSetting.builder()
                                                .mode("deathmatch")
                                                .allowJoinInProgress(true)
                                                .mapName("Java SDK Integration Test")
                                                .maxPlayer(100)
                                                .build())
                                .build();

                final ModelsSessionResponse createSessionResult = sessionWrapper.createSession(
                                CreateSession.builder()
                                                .namespace(this.namespace)
                                                .body(createSession)
                                                .build());

                assertNotNull(createSessionResult);
                assertEquals(sessionUsername, createSessionResult.getUsername());

                final String sessionId = createSessionResult.getSessionId();

                // Get a session

                final ModelsSessionResponse getSessionResult = sessionWrapper.getSession(
                                GetSession.builder()
                                                .namespace(this.namespace)
                                                .sessionID(sessionId)
                                                .build());

                assertNotNull(getSessionResult);
                assertEquals(sessionGameVersion, getSessionResult.getGameVersion());

                // Update a session

                final ModelsUpdateSessionRequest updateSession = ModelsUpdateSessionRequest.builder()
                                .gameMaxPlayer(150)
                                .build();

                final ModelsSessionResponse updateSessionResult = sessionWrapper.updateSession(
                                UpdateSession.builder()
                                                .namespace(this.namespace)
                                                .sessionID(sessionId)
                                                .body(updateSession)
                                                .build());

                assertNotNull(updateSessionResult);
                assertEquals(150, updateSessionResult.getGameSessionSetting().getMaxPlayer());

                // Delete a session

                final ModelsSessionResponse dResp = sessionWrapper.deleteSession(
                                DeleteSession.builder().namespace(this.namespace).sessionID(sessionId).build());

                assertNotNull(dResp);
        }

        @Test
        @Order(13)
        public void testServiceSocial() throws Exception {
                final String statCode = "javaserversdkteststat";

                final StatConfiguration statConfigWrapper = new StatConfiguration(sdk);

                // Create a statistic

                final StatCreate createStat = StatCreate.builder()
                                .name("Java Server SDK Test Stat")
                                .description("Java server sdk integration test.")
                                .statCode(statCode)
                                .setByFromEnum(StatCreate.SetBy.SERVER)
                                .minimum(0f)
                                .maximum(100f)
                                .defaultValue(50f)
                                .incrementOnly(true)
                                .setAsGlobal(false)
                                .tags(Arrays.asList(new String[] { "java", "server_sdk", "test" }))
                                .build();

                final StatInfo createStatResult = statConfigWrapper.createStat(
                                CreateStat.builder()
                                                .namespace(this.namespace)
                                                .body(createStat)
                                                .build());

                assertNotNull(createStatResult);
                assertEquals("Java Server SDK Test Stat", createStatResult.getName());

                // Get a statistic

                final StatInfo getStatResult = statConfigWrapper.getStat(
                                GetStat.builder()
                                                .namespace(this.namespace)
                                                .statCode(statCode)
                                                .build());

                assertNotNull(getStatResult);
                assertEquals("Java Server SDK Test Stat", getStatResult.getName());

                // Update a statistic

                final StatUpdate updateStat = StatUpdate.builder().description("Updated description.").build();

                final StatInfo updateStatResult = statConfigWrapper.updateStat(
                                UpdateStat.builder().namespace(this.namespace).statCode(statCode).body(updateStat)
                                                .build());

                assertNotNull(updateStatResult);
                assertEquals("Updated description.", updateStatResult.getDescription());

                // Delete a statistic

                statConfigWrapper.deleteStat(DeleteStat.builder().namespace(this.namespace).statCode(statCode).build());
        }

        @Test
        @Order(14)
        public void testServiceUgc() throws Exception {
                final String tagName = "java_server_sdk_test";
                final String tagNameUpdate = "java_server_sdk_test_update";

                final AdminTag adminTagWrapper = new AdminTag(sdk);

                // Create a tag

                final ModelsCreateTagRequest createTag = ModelsCreateTagRequest.builder()
                                .tag(tagName)
                                .build();

                final ModelsCreateTagResponse createTagResult = adminTagWrapper.adminCreateTag(
                                AdminCreateTag.builder()
                                                .namespace(this.namespace)
                                                .body(createTag)
                                                .build());

                assertNotNull(createTagResult);
                assertEquals(tagName, createTagResult.getTag());

                final String tagId = createTagResult.getId();

                // Get tags

                final ModelsPaginatedGetTagResponse getTagResult = adminTagWrapper.adminGetTag(
                                AdminGetTag.builder()
                                                .namespace(this.namespace)
                                                .offset(0)
                                                .limit(10)
                                                .build());

                assertNotNull(getTagResult);

                // Update a tag

                final ModelsCreateTagRequest updateTag = ModelsCreateTagRequest.builder()
                                .tag(tagNameUpdate)
                                .build();

                final ModelsCreateTagResponse updateTagResult = adminTagWrapper.adminUpdateTag(
                                AdminUpdateTag.builder()
                                                .namespace(this.namespace)
                                                .tagId(tagId)
                                                .body(updateTag)
                                                .build());

                assertNotNull(updateTagResult);
                assertEquals(tagNameUpdate, updateTagResult.getTag());

                // Delete a tag

                adminTagWrapper.adminDeleteTag(
                                AdminDeleteTag.builder()
                                                .namespace(this.namespace).tagId(tagId)
                                                .build());
        }

        @Test
        @Order(15)
        public void testServiceGametelemetry() throws Exception {
                final String steamId = "76561199259217491";
                final String playTime = "4";

                final GametelemetryOperations gameTelemetryWrapper = new GametelemetryOperations(sdk);

                final TelemetryBody saveTelemetry = TelemetryBody.builder()
                                .eventId("javasdk")
                                .eventName("javasdkevent")
                                .eventNamespace("test")
                                .eventTimestamp("0001-01-01T00:00:00.000Z")
                                .payload(Collections.singletonMap("foo", "bar"))
                                .build();

                gameTelemetryWrapper.protectedSaveEventsGameTelemetryV1ProtectedEventsPost(
                                ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
                                                .builder()
                                                .body(Arrays.asList(saveTelemetry))
                                                .build());

                boolean isUserNotFound = false;

                try {
                        gameTelemetryWrapper
                                        .protectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut(
                                                        ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut
                                                                        .builder()
                                                                        .playtime(playTime)
                                                                        .steamId(steamId)
                                                                        .build());
                } catch (HttpResponseException hex) {
                        final int httpCode = hex.getHttpCode();
                        final String message = hex.getErrorMessage();
                        isUserNotFound = httpCode == 404 && message != null && message.contains("20008");
                        if (!isUserNotFound) {
                                throw hex; // Error response other than user not found is not acceptable for this test
                        }
                }

                final Map<String, ?> getTelemetry = gameTelemetryWrapper
                                .protectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet(
                                                ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet
                                                                .builder()
                                                                .steamId(steamId)
                                                                .build());

                if (!isUserNotFound) {
                        assertEquals(playTime, getTelemetry.get("total_playtime")); // Only assert total_playtime if
                                                                                    // user is found
                }
        }

        // Token refresh integration test

        @Test
        @Order(40)
        public void testTokenRefreshUser() throws Exception {
                final DefaultTokenRefreshRepository tokenRefreshRepository = new DefaultTokenRefreshRepository();
                final AccelByteSDK sdk = new AccelByteSDK(
                                this.sdk.getSdkConfiguration().getHttpClient(),
                                tokenRefreshRepository,
                                this.sdk.getSdkConfiguration().getConfigRepository());
                final Users usersWrapper = new Users(sdk);

                sdk.loginUser(this.username, this.password);

                assertTrue(tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
                assertTrue(tokenRefreshRepository.getRefreshToken() != null
                                && !"".equals(tokenRefreshRepository.getRefreshToken()));

                // Simulate token expiry within threshold
                tokenRefreshRepository.setTokenExpiresAt(Date.from(Instant.now().plusSeconds(60)));

                usersWrapper.getUserByLoginID(
                                GetUserByLoginID.builder()
                                                .namespace(this.namespace)
                                                .loginId(this.username)
                                                .build());

                assertTrue(tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
                assertTrue(tokenRefreshRepository.getRefreshToken() != null
                                && !"".equals(tokenRefreshRepository.getRefreshToken()));
        }

        @Test
        @Order(40)
        public void testTokenRefreshClient() throws Exception {
                final DefaultTokenRefreshRepository tokenRefreshRepository = new DefaultTokenRefreshRepository();
                final AccelByteSDK sdk = new AccelByteSDK(
                                this.sdk.getSdkConfiguration().getHttpClient(),
                                tokenRefreshRepository,
                                this.sdk.getSdkConfiguration().getConfigRepository());
                final Users usersWrapper = new Users(sdk);

                sdk.loginClient();

                assertTrue(tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
                assertTrue(tokenRefreshRepository.getRefreshToken() == null); // Login client does not return refresh
                                                                              // token

                // Simulate token expiry within threshold
                tokenRefreshRepository.setTokenExpiresAt(Date.from(Instant.now().plusSeconds(60)));

                usersWrapper.getUserByLoginID(
                                GetUserByLoginID.builder()
                                                .namespace(this.namespace)
                                                .loginId(this.username)
                                                .build());

                assertTrue(tokenRefreshRepository.getToken() != null && !"".equals(tokenRefreshRepository.getToken()));
                assertTrue(tokenRefreshRepository.getRefreshToken() == null); // Login client does not return refresh
                                                                              // token
        }

        // Client integration test

        @Test
        @Order(50)
        public void testScenarioUserStats() throws Exception {
                final String statCode = "cs-server-sdk-test";

                final UserStatistic userStatisticWrapper = new UserStatistic(sdk);
                final Users usersWrapper = new Users(sdk);

                final ModelPublicUserResponse getUserResult = usersWrapper.getUserByLoginID(
                                GetUserByLoginID.builder()
                                                .namespace(this.namespace)
                                                .loginId(this.username)
                                                .build());

                assertNotNull(getUserResult);

                final String userId = getUserResult.getUserId();

                userStatisticWrapper.createUserStatItem(CreateUserStatItem.builder()
                                .namespace(this.namespace)
                                .userId(userId)
                                .statCode(statCode)
                                .build());

                final UserStatItemPagingSlicedResult getUserStatItemsResult = userStatisticWrapper
                                .getUserStatItems(GetUserStatItems.builder()
                                                .namespace(this.namespace)
                                                .userId(userId)
                                                .statCodes(statCode)
                                                .offset(0)
                                                .limit(10)
                                                .build());

                assertNotNull(getUserStatItemsResult);
                assertTrue(getUserStatItemsResult.getData().size() > 0);

                final StatItemIncResult incUserStatItemValueResult = userStatisticWrapper
                                .incUserStatItemValue(IncUserStatItemValue.builder()
                                                .namespace(this.namespace)
                                                .userId(userId)
                                                .statCode(statCode)
                                                .body(StatItemInc.builder().inc(5f).build())
                                                .build());

                assertNotNull(incUserStatItemValueResult);

                userStatisticWrapper.deleteUserStatItems(DeleteUserStatItems.builder()
                                .namespace(this.namespace)
                                .userId(userId)
                                .statCode(statCode)
                                .build());
        }

        // Matchmaking integration test

        @Test
        @Order(51)
        public void testScenarioMatchmaking() throws Exception, InterruptedException {
                testDsmcLocalServer();
                testDsmc();
                testMatchmaking();
                testLobby();
                testLobbyWebsocket();
        }

        public void testDsmcLocalServer() throws Exception {
                final Admin adminWrapper = new Admin(sdk);
                final ModelsListServerResponse serverResp = adminWrapper.listLocalServer(ListLocalServer.builder()
                                .namespace(this.namespace)
                                .build());
                assertNotNull(serverResp);
        }

        public void testDsmc() throws Exception, InterruptedException {
                final String targetUsername = "dummy@example.com";
                final String targetNamespace = "armadademotestqa";
                final String targetDeployment = "deployruli";
                final String gameMode = "soloyogs";
                final String partyId = "PARTY_ID";

                final net.accelbyte.sdk.api.dsmc.wrappers.Session dsmcSessionWrapper = new net.accelbyte.sdk.api.dsmc.wrappers.Session(
                                sdk);
                final Admin dsmcAdminWrapper = new Admin(sdk);
                final Session sessionBrowserWrapper = new Session(sdk);

                // Create a session

                final ModelsCreateSessionRequest createSession = ModelsCreateSessionRequest.builder()
                                .sessionType("p2p")
                                .gameVersion("0.3.0")
                                .namespace(targetNamespace)
                                .username(targetUsername)
                                .gameSessionSetting(ModelsGameSessionSetting.builder()
                                                .mode(gameMode)
                                                .allowJoinInProgress(true)
                                                .mapName("CSharp SDK Integration Test")
                                                .maxPlayer(100)
                                                .build())
                                .build();

                final ModelsSessionResponse createSessionResult = sessionBrowserWrapper.createSession(
                                CreateSession.builder().namespace(targetNamespace)
                                                .body(createSession).build());

                assertNotNull(createSessionResult);
                assertEquals(targetUsername, createSessionResult.getUsername());

                final String sessionId = createSessionResult.getSessionId();

                // Create a session

                final net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest createSessionDsmc = net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest
                                .builder()
                                .clientVersion("0.3.0")
                                .configuration("")
                                .deployment(targetDeployment)
                                .gameMode(gameMode)
                                .matchingAllies(Arrays.asList(new ModelsRequestMatchingAlly[] {
                                                ModelsRequestMatchingAlly.builder()
                                                                .matchingParties(Arrays
                                                                                .asList(new ModelsRequestMatchParty[] {
                                                                                                ModelsRequestMatchParty
                                                                                                                .builder()
                                                                                                                .partyAttributes(
                                                                                                                                new HashMap<String, Object>())
                                                                                                                .partyId(partyId)
                                                                                                                .partyMembers(Arrays
                                                                                                                                .asList(new ModelsRequestMatchMember[] {
                                                                                                                                                ModelsRequestMatchMember
                                                                                                                                                                .builder()
                                                                                                                                                                .userId(this.username)
                                                                                                                                                                .build()
                                                                                                                                }))
                                                                                                                .build()
                                                                                }))
                                                                .build()
                                }))
                                .region("")
                                .podName("")
                                .sessionId(sessionId)
                                .namespace(targetNamespace)
                                .build();

                final net.accelbyte.sdk.api.dsmc.models.ModelsSessionResponse createSessionDsmcResult = dsmcSessionWrapper
                                .createSession(net.accelbyte.sdk.api.dsmc.operations.session.CreateSession.builder()
                                                .namespace(targetNamespace)
                                                .body(createSessionDsmc)
                                                .build());

                assertNotNull(createSessionDsmcResult);

                final net.accelbyte.sdk.api.dsmc.models.ModelsSessionResponse getSessionDsmcResult = dsmcSessionWrapper
                                .getSession(net.accelbyte.sdk.api.dsmc.operations.session.GetSession.builder()
                                                .namespace(targetNamespace)
                                                .sessionID(sessionId)
                                                .build());

                assertNotNull(getSessionDsmcResult);

                // Claim (use reliable http retry)

                final DefaultHttpRetryPolicy retryPolicy = new DefaultHttpRetryPolicy() {
                        @Override
                        public boolean doRetry(int attempt, Operation operation, HttpResponse response,
                                        Exception exception) {
                                // Custom logic to handle DSMC claim server 425 server is not ready
                                if (attempt < this.getMaxRetry()) {
                                        if (response != null && response.getCode() == 425) {
                                                try {
                                                        final int multiplier = this
                                                                        .getRetryIntervalType() == RetryIntervalType.EXPONENTIAL
                                                                                        ? attempt
                                                                                        : 1;
                                                        Thread.sleep(this.getRetryInterval() * multiplier); // Wait
                                                                                                            // before
                                                                                                            // retry
                                                } catch (InterruptedException ie) {
                                                        Thread.currentThread().interrupt();
                                                }

                                                return true;
                                        }
                                }

                                return false;
                        }
                };

                final AccelByteSDK sdkReliable = new AccelByteSDK(
                                new ReliableHttpClient(retryPolicy),
                                sdk.getSdkConfiguration().getTokenRepository(),
                                sdk.getSdkConfiguration().getConfigRepository());

                retryPolicy.setRetryIntervalType(RetryIntervalType.LINEAR);
                retryPolicy.setCallTimeout(5000);
                retryPolicy.setMaxRetry(20);
                retryPolicy.setRetryInterval(2000);

                final net.accelbyte.sdk.api.dsmc.wrappers.Session dsmcSessionReliableWrapper = new net.accelbyte.sdk.api.dsmc.wrappers.Session(
                                sdkReliable);

                ModelsClaimSessionRequest claimServer = ModelsClaimSessionRequest.builder()
                                .sessionId(sessionId)
                                .build();

                dsmcSessionReliableWrapper.claimServer(ClaimServer.builder()
                                .namespace(targetNamespace)
                                .body(claimServer)
                                .build());

                // Clean up

                dsmcAdminWrapper.deleteSession(net.accelbyte.sdk.api.dsmc.operations.admin.DeleteSession.builder()
                                .namespace(targetNamespace)
                                .sessionID(sessionId)
                                .build());

                ModelsSessionResponse deleteSessionResult = sessionBrowserWrapper.deleteSession(DeleteSession.builder()
                                .namespace(targetNamespace)
                                .sessionID(sessionId)
                                .build());

                assertNotNull(deleteSessionResult);
        }

        public void testMatchmaking() throws Exception {
                final String channelName = "csharp_sdk_gm_" + GenerateRandomId(8);
                final String channelDescription = "This is a Java Server SDK test";
                final String channelDescriptionUpdate = "This is a Java Server SDK test update";

                Matchmaking matchmakingWrapper = new Matchmaking(sdk);

                // Create a channel

                final ModelsChannelRequest createChannel = ModelsChannelRequest.builder()
                                .deployment("")
                                .description(channelDescription)
                                .findMatchTimeoutSeconds(3600)
                                .gameMode(channelName)
                                .joinable(false)
                                .maxDelayMs(0)
                                .sessionQueueTimeoutSeconds(0)
                                .socialMatchmaking(false)
                                .useSubGamemode(false)
                                .ruleSet(ModelsRuleSet.builder()
                                                .alliance(ModelsAllianceRule.builder()
                                                                .maxNumber(2)
                                                                .minNumber(2)
                                                                .playerMaxNumber(1)
                                                                .playerMinNumber(1)
                                                                .build())
                                                .allianceFlexingRule(new ArrayList<ModelsAllianceFlexingRule>())
                                                .flexingRule(new ArrayList<ModelsFlexingRule>())
                                                .matchOptions(ModelsMatchOptionRule.builder()
                                                                .options(new ArrayList<ModelsMatchOption>())
                                                                .build())
                                                .matchingRule(new ArrayList<ModelsMatchingRule>())
                                                .subGameModes(new HashMap<String, ModelsSubGameMode>())
                                                .build())
                                .build();

                final ModelsCreateChannelResponse createChannelResult = matchmakingWrapper
                                .createChannelHandler(CreateChannelHandler.builder()
                                                .namespace(this.namespace)
                                                .body(createChannel)
                                                .build());

                assertNotNull(createChannelResult);
                assertEquals(channelName, createChannelResult.getGameMode());

                // Get a channel

                final ModelsChannelV1 getSingleChannelResult1 = matchmakingWrapper
                                .getSingleMatchmakingChannel(GetSingleMatchmakingChannel.builder()
                                                .namespace(this.namespace)
                                                .channelName(channelName)
                                                .build());

                assertNotNull(getSingleChannelResult1);
                assertEquals(channelDescription, getSingleChannelResult1.getDescription());

                // Get sessions in channel

                final List<ModelsMatchmakingResult> getSessionsResult = matchmakingWrapper
                                .getAllSessionsInChannel(GetAllSessionsInChannel.builder()
                                                .namespace(this.namespace)
                                                .channelName(channelName)
                                                .build());
                assertNotNull(getSessionsResult);

                // Update a channel

                final ModelsUpdateChannelRequest updateChannel = ModelsUpdateChannelRequest.builder()
                                .description(channelDescriptionUpdate)
                                .build();

                matchmakingWrapper.updateMatchmakingChannel(UpdateMatchmakingChannel.builder()
                                .namespace(this.namespace)
                                .channelName(channelName)
                                .body(updateChannel)
                                .build());

                // Confirm if channel is updated

                final ModelsChannelV1 getSingleChannelResult2 = matchmakingWrapper
                                .getSingleMatchmakingChannel(GetSingleMatchmakingChannel.builder()
                                                .namespace(this.namespace)
                                                .channelName(channelName)
                                                .build());
                assertNotNull(getSingleChannelResult2);
                assertEquals(channelDescriptionUpdate, getSingleChannelResult2.getDescription());

                // Delete a channel

                matchmakingWrapper.deleteChannelHandler(DeleteChannelHandler.builder()
                                .namespace(this.namespace)
                                .channel(channelName)
                                .build());

                // Confirm if channel is deleted

                assertThrows(HttpResponseException.class, () -> {
                        matchmakingWrapper.getSingleMatchmakingChannel(GetSingleMatchmakingChannel.builder()
                                        .namespace(this.namespace)
                                        .channelName(channelName)
                                        .build());
                });
        }

        public void testLobby() throws Exception {
                final Notification notifWrapper = new Notification(sdk);

                // Sending a free from notification to all user(s)

                final ModelFreeFormNotificationRequest notifBody = ModelFreeFormNotificationRequest.builder()
                                .topic("java_sdk_test")
                                .message("This is a Java Server SDK test")
                                .build();

                notifWrapper.freeFormNotification(FreeFormNotification.builder()
                                .namespace(this.namespace)
                                .body(notifBody)
                                .build());
        }

        public void testLobbyWebsocket() throws Exception {
                final String request_id = GenerateRandomId(64);
                final CountDownLatch response = new CountDownLatch(1);
                final StringBuilder responseMessage = new StringBuilder();

                final WebSocketListener listener = new WebSocketListener() {
                        @Override
                        public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
                                if (response.getCount() > 0) {
                                        responseMessage.append(text);
                                        response.countDown();
                                }
                        }
                };

                final OkhttpWebSocketClient ws = OkhttpWebSocketClient.create(
                                new DefaultConfigRepository(),
                                DefaultTokenRepository.getInstance(),
                                listener);

                final String requestMessage = PartyCreateRequest.builder()
                                .id(request_id)
                                .build()
                                .toWSM();

                System.out.println(requestMessage + "\n");

                ws.sendMessage(requestMessage);

                response.await(10, TimeUnit.SECONDS);

                System.out.println(responseMessage + "\n");

                ws.close(1000, "normal close");
        }

        @AfterAll
        public void tear() throws Exception {
                final boolean isLogoutOk = sdk.logout();
                final String token = sdk.getSdkConfiguration().getTokenRepository()
                                .getToken();

                assertTrue(isLogoutOk);
                assertTrue(token == null || token.isEmpty());
        }

        private String GenerateRandomId(int length) {
                return GetRandomString("abcdefghijklmnopqrstuvw0123456789", length);
        }

        private String GenerateRandomPassword(int length) throws IllegalArgumentException {
                if (length < 8) {
                        throw new IllegalArgumentException("Length must be >= 8");
                }
                final String part1 = GetRandomString("ABCDEFGHIJKLMNOPQRSTUVW", (length - 2) / 2);
                final String part2 = GetRandomString("abcdefghijklmnopqrstuvw", (length - 2) / 2);
                final String part3 = GetRandomString("0123456789", 1);
                final String part4 = GetRandomString("!@#$%^&*()", 1);
                return part1 + part2 + part3 + part4;
        }

        private String GetRandomString(String characters, int length) {
                final Random random = new Random();
                final char[] result = new char[length];
                for (int i = 0; i < result.length; i++) {
                        result[i] = characters.charAt(random.nextInt(characters.length()));
                }
                return new String(result);
        }
}
