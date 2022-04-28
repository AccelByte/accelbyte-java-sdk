/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import org.jetbrains.annotations.NotNull;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

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
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.client.OkhttpWebSocketClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import net.accelbyte.sdk.core.repository.DefaultTokenRepository;
import okhttp3.WebSocket;
import okhttp3.WebSocketListener;

@Tag("test-integration")
public class TestIntegration {
        private static AccelByteSDK _sdk;

        @BeforeAll
        static void setup() {
                AccelByteConfig sdkConfig = new AccelByteConfig(
                                new OkhttpClient(),
                                DefaultTokenRepository.getInstance(),
                                new DefaultConfigRepository());

                String baseUrl = sdkConfig
                                .getConfigRepository()
                                .getBaseURL();
                String clientId = sdkConfig
                                .getConfigRepository()
                                .getClientId();
                String clientSecret = sdkConfig
                                .getConfigRepository()
                                .getClientSecret();

                _sdk = new AccelByteSDK(sdkConfig);

                String username = System.getenv("AB_USERNAME");
                String password = System.getenv("AB_PASSWORD");
                String namespace = System.getenv("AB_NAMESPACE");

                Assertions.assertTrue(baseUrl != null &&
                                !baseUrl.isEmpty());
                Assertions.assertTrue(clientId != null &&
                                !clientId.isEmpty());
                Assertions.assertTrue(clientSecret != null &&
                                !clientSecret.isEmpty());
                Assertions.assertTrue(username != null && !username.isEmpty());
                Assertions.assertTrue(password != null && !password.isEmpty());
                Assertions.assertTrue(namespace != null && !namespace.isEmpty());

                boolean isLoginUserOk;

                isLoginUserOk = _sdk.loginUser(username, password);

                String token = _sdk.getSdkConfiguration()
                                .getTokenRepository()
                                .getToken();

                Assertions.assertTrue(isLoginUserOk);
                Assertions.assertTrue(token != null && !token.isEmpty());
        }

        // Admin integration tests

        @Test
        public void AchievementServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String achievementCode = "java-sdk-test";
                final String achievementName = "Java Server SDK Test";
                final String achievementDesc = "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...";

                Achievements wAchievements = new Achievements(_sdk);

                // Creating achievement

                ModelsAchievementRequest newAchievement = ModelsAchievementRequest.builder()
                                .achievementCode(achievementCode)
                                .defaultLanguage("en")
                                .name(Collections.singletonMap("en", achievementName))
                                .description(Collections.singletonMap("en", achievementDesc))
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

                ModelsAchievementResponse cResp = wAchievements.adminCreateNewAchievement(
                                AdminCreateNewAchievement.builder()
                                                .namespace(namespace)
                                                .body(newAchievement)
                                                .build());

                Assertions.assertNotNull(cResp);
                Assertions.assertEquals(cResp.getAchievementCode(), achievementCode);

                // Updating achievement

                ModelsAchievementUpdateRequest updateAchievement = ModelsAchievementUpdateRequest.builder()
                                .goalValue(2000f)
                                .build();

                ModelsAchievementResponse uResp = wAchievements.adminUpdateAchievement(
                                AdminUpdateAchievement.builder()
                                                .namespace(namespace)
                                                .achievementCode(achievementCode)
                                                .body(updateAchievement)
                                                .build());
                Assertions.assertNotNull(uResp);
                Assertions.assertEquals(uResp.getGoalValue(), 2000f);

                // Retrieve achievement by code

                ModelsAchievementResponse rResp = wAchievements.adminGetAchievement(AdminGetAchievement.builder()
                                .namespace(namespace)
                                .achievementCode(achievementCode)
                                .build());
                Assertions.assertNotNull(rResp);
                Assertions.assertEquals(rResp.getGoalValue(), 2000f);
                Assertions.assertEquals(rResp.getName().get("en"), achievementName);

                // Get all achievements

                ModelsPaginatedAchievementResponse gaResp = wAchievements
                                .adminListAchievements(AdminListAchievements.builder()
                                                .namespace(namespace)
                                                .limit(100)
                                                .offset(0)
                                                .build());
                Assertions.assertNotNull(gaResp);
                Assertions.assertTrue(gaResp.getData().size() > 0);

                // Delete achievement

                wAchievements.adminDeleteAchievement(AdminDeleteAchievement.builder()
                                .namespace(namespace)
                                .achievementCode(achievementCode)
                                .build());

                // Finally, recheck if the data is truly deleted.

                Assertions.assertThrows(HttpResponseException.class, () -> {
                        wAchievements.adminGetAchievement(AdminGetAchievement.builder()
                                        .namespace(namespace)
                                        .achievementCode(achievementCode)
                                        .build());
                });
        }

        @Test
        public void BasicServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String profileFirstName = "Integration Test";
                final String profileLastName = "Java Server SDK";
                final LocalDate profileDateOfBirth = LocalDate.of(2022, 1, 1);
                final String profileLanguage = "en";
                final String profileTimeZone = "Asia/Jakarta";

                UserProfile wProfile = new UserProfile(_sdk);

                // Create user's own profile info

                UserProfilePrivateCreate createProfile = UserProfilePrivateCreate.builder()
                                .firstName(profileFirstName)
                                .lastName(profileLastName)
                                .dateOfBirth(profileDateOfBirth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                                .language(profileLanguage)
                                .build();

                UserProfilePrivateInfo cInfo = wProfile.createMyProfile(CreateMyProfile.builder()
                                .namespace(namespace)
                                .body(createProfile)
                                .build());
                Assertions.assertNotNull(cInfo);
                Assertions.assertEquals(cInfo.getFirstName(), profileFirstName);

                // Get user's own profile info

                UserProfilePrivateInfo ownResp = wProfile.getMyProfileInfo(GetMyProfileInfo.builder()
                                .namespace(namespace)
                                .build());
                Assertions.assertNotNull(ownResp);
                Assertions.assertEquals(ownResp.getLastName(), profileLastName);

                // Update user's own profile info

                UserProfilePrivateUpdate updateProfile = UserProfilePrivateUpdate.builder()
                                .timeZone(profileTimeZone)
                                .build();

                UserProfilePrivateInfo updResp = wProfile.updateMyProfile(UpdateMyProfile.builder()
                                .namespace(namespace)
                                .body(updateProfile)
                                .build());
                Assertions.assertNotNull(updResp);
                Assertions.assertEquals(updResp.getTimeZone(), profileTimeZone);

                // Delete user's own profile info

                String userId = ownResp.getUserId();

                UserProfilePrivateInfo delResp = wProfile.deleteUserProfile(DeleteUserProfile.builder()
                                .namespace(namespace)
                                .userId(userId)
                                .build());
                Assertions.assertNotNull(delResp);
        }

        @Test
        public void CloudSaveServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String gameRecordKey = "foo_bar_record";
                final String gameRecordFoo = "bar";
                final String gameRecordFooBar = "foo";
                final int gameRecordFooValue = 4893;

                PublicGameRecord wPublicGameRecord = new PublicGameRecord(_sdk);

                // Create new game record

                DummyGameRecord gameRecord = DummyGameRecord.builder()
                                .Foo(gameRecordFoo)
                                .FooBar(gameRecordFooBar)
                                .FooValue(gameRecordFooValue)
                                .build();

                wPublicGameRecord.postGameRecordHandlerV1(PostGameRecordHandlerV1.builder()
                                .namespace(namespace)
                                .key(gameRecordKey)
                                .body(gameRecord)
                                .build());

                // Get game record

                ModelsGameRecordResponse gRecord = wPublicGameRecord
                                .getGameRecordHandlerV1(GetGameRecordHandlerV1.builder()
                                                .namespace(namespace)
                                                .key(gameRecordKey)
                                                .build());

                Assertions.assertNotNull(gRecord);

                Map<String, ?> gRecordValue = gRecord.getValue();

                Assertions.assertNotNull(gRecordValue);

                Assertions.assertTrue(gRecordValue.containsKey("foo_bar"));
                Assertions.assertEquals(gameRecordFooBar, gRecordValue.get("foo_bar").toString());

                // Update game record

                DummyGameRecord updateRecord = DummyGameRecord.builder()
                                .Foo(gameRecordFoo)
                                .FooBar(gameRecordFooBar + "update")
                                .FooValue(gameRecordFooValue)
                                .build();

                wPublicGameRecord.putGameRecordHandlerV1(PutGameRecordHandlerV1.builder()
                                .namespace(namespace)
                                .key(gameRecordKey)
                                .body(updateRecord)
                                .build());

                // Re-check updated game record

                gRecord = wPublicGameRecord.getGameRecordHandlerV1(GetGameRecordHandlerV1.builder()
                                .namespace(namespace)
                                .key(gameRecordKey)
                                .build());

                Assertions.assertNotNull(gRecord);

                gRecordValue = gRecord.getValue();

                Assertions.assertNotNull(gRecordValue);

                Assertions.assertTrue(gRecordValue.containsKey("foo"));
                Assertions.assertEquals(gameRecordFoo, gRecordValue.get("foo").toString());

                Assertions.assertTrue(gRecordValue.containsKey("foo_bar"));
                Assertions.assertEquals(gameRecordFooBar + "update", gRecordValue.get("foo_bar").toString());

                // Delete game record

                wPublicGameRecord.deleteGameRecordHandlerV1(DeleteGameRecordHandlerV1.builder()
                                .namespace(namespace)
                                .key(gameRecordKey)
                                .build());

                // Finally, recheck if the data is truly deleted

                Assertions.assertThrows(HttpResponseException.class, () -> {
                        wPublicGameRecord.getGameRecordHandlerV1(GetGameRecordHandlerV1.builder()
                                        .namespace(namespace)
                                        .key(gameRecordKey)
                                        .build());
                });
        }

        @Test
        public void DSLogManagerServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");

                TerminatedServers wTerminatedServers = new TerminatedServers(_sdk);
                ModelsListTerminatedServersResponse tsResp = wTerminatedServers
                                .listTerminatedServers(ListTerminatedServers.builder()
                                                .namespace(namespace)
                                                .limit(10)
                                                .build());

                Assertions.assertNotNull(tsResp);
        }

        @Test
        public void EventLogServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");

                Users wUsers = new Users(_sdk);

                ModelUserResponseV3 eMyUser = wUsers
                                .adminGetMyUserV3(
                                                new AdminGetMyUserV3());
                Assertions.assertNotNull(eMyUser);

                EventV2 wEvent = new EventV2(_sdk);

                ModelsGenericQueryPayload eQueryPayload = ModelsGenericQueryPayload.builder()
                                .clientId(_sdk.getSdkConfiguration().getConfigRepository().getClientId())
                                .build();

                ModelsEventResponseV2 eResp = wEvent.queryEventStreamHandler(QueryEventStreamHandler.builder()
                                .namespace(namespace)
                                .offset(0)
                                .pageSize(10)
                                .body(eQueryPayload)
                                .build());
                Assertions.assertNotNull(eResp);
                Assertions.assertTrue(eResp.getData().size() > 0);

                eResp = wEvent.getEventSpecificUserV2Handler(GetEventSpecificUserV2Handler.builder()
                                .namespace(namespace)
                                .userId(eMyUser.getUserId())
                                .offset(0)
                                .pageSize(10)
                                .build());
                Assertions.assertNotNull(eResp);
                Assertions.assertTrue(eResp.getData().size() > 0);
        }

        @Test
        public void GDPRServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String emailToTest = "dummy@example.com";
                final String anotherEmailToTest = "another_email_to_test@dummy.com";

                DataRetrieval wGdprRetrieval = new DataRetrieval(_sdk);

                wGdprRetrieval.saveAdminEmailConfiguration(
                                SaveAdminEmailConfiguration.builder()
                                                .namespace(namespace)
                                                .body(Arrays.asList(new String[] { emailToTest }))
                                                .build());

                List<String> emails = wGdprRetrieval.getAdminEmailConfiguration(
                                GetAdminEmailConfiguration.builder()
                                                .namespace(namespace)
                                                .build());

                Assertions.assertNotNull(emails);

                wGdprRetrieval.updateAdminEmailConfiguration(UpdateAdminEmailConfiguration.builder()
                                .namespace(namespace)
                                .body(Arrays.asList(new String[] { anotherEmailToTest }))
                                .build());

                wGdprRetrieval.deleteAdminEmailConfiguration(
                                DeleteAdminEmailConfiguration.builder()
                                                .namespace(namespace)
                                                .emails(Arrays.asList(new String[] { anotherEmailToTest }))
                                                .build());
        }

        @Test
        public void GroupServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String initialConfigCode = "initialConfigurationCode";
                final String configurationCode = "csharpServerSdkConfigCode";
                final String groupName = "Java SDK Test Group";
                final String groupDescriptionUpdated = "Updated description.";
                String defaultAdminRoleId = "";
                String defaultMemberRoleId = "";

                Configuration wConfig = new Configuration(_sdk);
                Group wGroup = new Group(_sdk);

                try {
                        ModelsGetGroupConfigurationResponseV1 gConfigCheck = wConfig
                                        .getGroupConfigurationAdminV1(
                                                        GetGroupConfigurationAdminV1.builder()
                                                                        .namespace(namespace)
                                                                        .configurationCode(initialConfigCode)
                                                                        .build());

                        Assertions.assertNotNull(gConfigCheck);

                        defaultAdminRoleId = gConfigCheck.getGroupAdminRoleId();
                        defaultMemberRoleId = gConfigCheck.getGroupMemberRoleId();
                } catch (HttpResponseException rex) {
                        boolean isInitialConfigurationNotAvailable = rex.getErrorMessage()
                                        .contains("73131"); // No inital configuration yet

                        if (isInitialConfigurationNotAvailable) {
                                ModelsCreateGroupConfigurationResponseV1 iConfigResp = wConfig
                                                .initiateGroupConfigurationAdminV1(
                                                                InitiateGroupConfigurationAdminV1.builder()
                                                                                .namespace(namespace)
                                                                                .build());

                                defaultAdminRoleId = iConfigResp.getGroupAdminRoleId();
                                defaultMemberRoleId = iConfigResp.getGroupMemberRoleId();
                        } else {
                                throw rex;
                        }
                }

                // Create group configuration

                ModelsCreateGroupConfigurationRequestV1 gcRequest = ModelsCreateGroupConfigurationRequestV1.builder()
                                .configurationCode(configurationCode)
                                .description("CSharp SDK Test Configuration Group")
                                .groupMaxMember(50)
                                .name("CSharp SDK Test Configuration Group")
                                .groupAdminRoleId(defaultAdminRoleId)
                                .groupMemberRoleId(defaultMemberRoleId)
                                .build();

                try {
                        ModelsCreateGroupConfigurationResponseV1 gcResp = wConfig.createGroupConfigurationAdminV1(
                                        CreateGroupConfigurationAdminV1.builder()
                                                        .namespace(namespace)
                                                        .body(gcRequest)
                                                        .build());

                        Assertions.assertNotNull(gcResp);
                } catch (HttpResponseException rex) {
                        boolean isAlreadyExist = rex.getErrorMessage()
                                        .contains("73130"); // unable to create global
                                                            // configuration: global
                                                            // configuration already exist

                        if (!isAlreadyExist) {
                                throw rex;
                        }
                }

                // Create a group

                ModelsPublicCreateNewGroupRequestV1 createGroup = ModelsPublicCreateNewGroupRequestV1.builder()
                                .groupName("Java SDK Test Group")
                                .groupType("PUBLIC")
                                .groupDescription("Yeah, anything is welcome here.")
                                .groupMaxMember(100)
                                .groupRegion("us-west-1")
                                .configurationCode(configurationCode)
                                .build();

                ModelsGroupResponseV1 cGroup = wGroup.createNewGroupPublicV1(CreateNewGroupPublicV1.builder()
                                .namespace(namespace)
                                .body(createGroup)
                                .build());
                Assertions.assertNotNull(cGroup);

                Assertions.assertEquals(groupName, cGroup.getGroupName());

                String group_id = cGroup.getGroupId();

                // Get single group

                ModelsGroupResponseV1 gGroup = wGroup.getSingleGroupPublicV1(GetSingleGroupPublicV1.builder()
                                .namespace(namespace)
                                .groupId(group_id)
                                .build());

                Assertions.assertNotNull(gGroup);

                Assertions.assertEquals(groupName, cGroup.getGroupName());

                // Update a group

                ModelsUpdateGroupRequestV1 updateGroup = ModelsUpdateGroupRequestV1.builder()
                                .groupDescription(groupDescriptionUpdated)
                                .build();

                ModelsGroupResponseV1 uGroup = wGroup.updateSingleGroupV1(UpdateSingleGroupV1.builder()
                                .namespace(namespace)
                                .groupId(group_id)
                                .body(updateGroup)
                                .build());

                Assertions.assertNotNull(uGroup);
                Assertions.assertEquals(groupDescriptionUpdated, uGroup.getGroupDescription());

                // Delete a group

                wGroup.deleteGroupPublicV1(DeleteGroupPublicV1.builder()
                                .namespace(namespace)
                                .groupId(group_id)
                                .build());

                // Finally, recheck if the data is truly deleted.

                Assertions.assertThrows(HttpResponseException.class, () -> {
                        wGroup.getSingleGroupPublicV1(GetSingleGroupPublicV1.builder()
                                        .namespace(namespace)
                                        .groupId(group_id)
                                        .build());
                });

                // Delete group configuration

                wConfig.deleteGroupConfigurationV1(
                                DeleteGroupConfigurationV1.builder()
                                                .namespace(namespace)
                                                .configurationCode(configurationCode)
                                                .build());
        }

        @Test
        public void IamServiceTests() throws HttpResponseException, IOException, IllegalArgumentException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String userName = ("javasdk_" + GenerateRandomId(8));
                final String userPassword = GenerateRandomPassword(10);
                final String userEmail = (userName + "@test.com");
                final String userDisplayName = "Java Server SDK Test";
                final String userDateOfBirth = "1995-01-10";
                final String userDateOfBirthUpdated = "1996-01-10";

                Users wIamUser = new Users(_sdk);
                UsersV4 wIamUserV4 = new UsersV4(_sdk);

                // Create user

                AccountCreateUserRequestV4 newUser = AccountCreateUserRequestV4.builder()
                                .authType("EMAILPASSWD")
                                .emailAddress(userEmail)
                                .password(userPassword)
                                .displayName(userDisplayName)
                                .username(userName)
                                .country("ID")
                                .dateOfBirth(userDateOfBirth)
                                .build();

                AccountCreateUserResponseV4 cuResp = wIamUserV4.publicCreateUserV4(
                                PublicCreateUserV4.builder()
                                                .namespace(namespace)
                                                .body(newUser)
                                                .build());

                Assertions.assertNotNull(cuResp);
                Assertions.assertEquals(userEmail, cuResp.getEmailAddress());

                String user_id = cuResp.getUserId();

                // Get the user

                ModelUserResponse gUser = wIamUser.getUserByUserID(
                                GetUserByUserID.builder()
                                                .namespace(namespace)
                                                .userId(user_id)
                                                .build());

                Assertions.assertNotNull(gUser);
                Assertions.assertEquals(userDisplayName, gUser.getDisplayName());

                // Update user

                ModelUserUpdateRequest updateUser = ModelUserUpdateRequest.builder()
                                .dateOfBirth(userDateOfBirthUpdated)
                                .build();

                ModelUserResponse uuResp = wIamUser.updateUser(
                                UpdateUser.builder()
                                                .namespace(namespace)
                                                .userId(user_id)
                                                .body(updateUser)
                                                .build());

                Assertions.assertNotNull(uuResp);
                Assertions.assertNotNull(uuResp.getDateOfBirth());
                Assertions.assertEquals(userDateOfBirthUpdated,
                                Instant.parse(uuResp.getDateOfBirth())
                                                .atZone(ZoneId.systemDefault())
                                                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));

                // Delete user

                wIamUser.deleteUser(
                                DeleteUser.builder()
                                                .namespace(namespace)
                                                .userId(user_id)
                                                .build());

                // Finally, recheck if the data is truly deleted.

                Assertions.assertThrows(HttpResponseException.class, () -> {
                        wIamUser.getUserByUserID(
                                        GetUserByUserID.builder()
                                                        .namespace(namespace)
                                                        .userId(user_id)
                                                        .build());
                });
        }

        @Test
        public void LeaderboardServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String leaderboarsName = "Java SDK Leaderboard Test";

                LeaderboardConfiguration wLeaderboard = new LeaderboardConfiguration(_sdk);
                String leaderboard_code = "javasdklbtest" + java.util.UUID.randomUUID().toString().substring(0, 6);
                String start_time = Instant.now()
                                .plus(31, ChronoUnit.DAYS)
                                .atZone(ZoneId.systemDefault())
                                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSxxx"));

                // Create a leaderboard

                ModelsLeaderboardConfigReq newLeaderboard = ModelsLeaderboardConfigReq.builder()
                                .leaderboardCode(leaderboard_code)
                                .name(leaderboarsName)
                                .statCode("1")
                                .seasonPeriod(36)
                                .descending(false)
                                .startTime(start_time)
                                .daily(ModelsDailyConfig.builder().resetTime("00:00:00").build())
                                .weekly(ModelsWeeklyConfig.builder().resetDay(0).resetTime("00:00:00").build())
                                .monthly(ModelsMonthlyConfig.builder().resetDate(1).resetTime("00:00:00").build())
                                .build();

                ModelsLeaderboardConfigReq cLeaderboard = wLeaderboard
                                .createLeaderboardConfigurationAdminV1(CreateLeaderboardConfigurationAdminV1.builder()
                                                .namespace(namespace)
                                                .body(newLeaderboard)
                                                .build());

                Assertions.assertNotNull(cLeaderboard);
                Assertions.assertEquals(leaderboarsName, cLeaderboard.getName());

                // Get a leaderboard

                ModelsGetLeaderboardConfigResp gLeaderboard = wLeaderboard
                                .getLeaderboardConfigurationAdminV1(GetLeaderboardConfigurationAdminV1.builder()
                                                .namespace(namespace)
                                                .leaderboardCode(leaderboard_code)
                                                .build());

                Assertions.assertNotNull(gLeaderboard);
                Assertions.assertEquals(leaderboarsName, gLeaderboard.getName());

                // Update a leaderboard

                ModelsUpdateLeaderboardConfigReq updateLeaderboard = ModelsUpdateLeaderboardConfigReq.builder()
                                .name(leaderboarsName)
                                .statCode("1")
                                .startTime(start_time)
                                .seasonPeriod(40)
                                .build();

                ModelsGetLeaderboardConfigResp uLeaderboard = wLeaderboard
                                .updateLeaderboardConfigurationAdminV1(UpdateLeaderboardConfigurationAdminV1.builder()
                                                .namespace(namespace)
                                                .leaderboardCode(leaderboard_code)
                                                .body(updateLeaderboard)
                                                .build());

                Assertions.assertNotNull(uLeaderboard);
                Assertions.assertEquals(40, uLeaderboard.getSeasonPeriod());

                // Delete a leaderboard

                wLeaderboard.deleteLeaderboardConfigurationAdminV1(DeleteLeaderboardConfigurationAdminV1.builder()
                                .namespace(namespace)
                                .leaderboardCode(leaderboard_code)
                                .build());

                // Finally, recheck if the data is truly deleted

                ModelsGetLeaderboardConfigResp dcLeaderboard = wLeaderboard
                                .getLeaderboardConfigurationAdminV1(GetLeaderboardConfigurationAdminV1.builder()
                                                .namespace(namespace)
                                                .leaderboardCode(leaderboard_code)
                                                .build());

                Assertions.assertNotNull(dcLeaderboard);
                Assertions.assertTrue(dcLeaderboard.getIsDeleted());
        }

        @Test
        public void LegalServiceTests() throws HttpResponseException, IOException {
                Agreement wLegalAgreement = new Agreement(_sdk);

                List<RetrieveAcceptedAgreementResponse> aggrs = wLegalAgreement
                                .retrieveAgreementsPublic(RetrieveAgreementsPublic.builder().build());

                Assertions.assertNotNull(aggrs);

                List<AcceptAgreementRequest> aggreementRequests = Arrays.asList(new AcceptAgreementRequest[] {
                                AcceptAgreementRequest.builder()
                                                .localizedPolicyVersionId("152b9b0f-7b8e-4a9e-8a9d-8c82420ad8b3")
                                                .policyVersionId("a76ea12c-14fd-46c5-886f-fd3d0ded4408")
                                                .policyId("6adb3d65-b428-4dbc-a08d-e5126c644557") // The marketing
                                                                                                  // policy
                                                .isAccepted(true)
                                                .isNeedToSendEventMarketing(false)
                                                .build()
                });

                wLegalAgreement.changePreferenceConsent(
                                ChangePreferenceConsent.builder()
                                                .body(aggreementRequests)
                                                .build());
        }

        @Test
        public void PlatformServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String storeTitle = "Java SDK Store Test";
                final String storeDescription = "Description for Java Server SDK store service integration test.";
                final String storeDescriptionUpdated = "Updated description.";

                Store wStore = new Store(_sdk);

                // TODO Setup store

                // Create a store

                StoreCreate createStore = StoreCreate.builder()
                                .title(storeTitle)
                                .description(storeDescription)
                                .defaultLanguage("en")
                                .defaultRegion("US")
                                .supportedLanguages(Arrays.asList(new String[] { "en", "id" }))
                                .supportedRegions(Arrays.asList(new String[] { "US", "ID" }))
                                .build();

                StoreInfo cStore = wStore.createStore(CreateStore.builder()
                                .namespace(namespace)
                                .body(createStore)
                                .build());

                Assertions.assertNotNull(cStore);
                Assertions.assertEquals(storeTitle, cStore.getTitle());

                String store_id = cStore.getStoreId();

                // Get a store

                StoreInfo gStore = wStore.getStore(GetStore.builder()
                                .namespace(namespace)
                                .storeId(store_id)
                                .build());

                Assertions.assertNotNull(gStore);
                Assertions.assertEquals(storeTitle, gStore.getTitle());

                // Update a store

                StoreUpdate updateStore = StoreUpdate.builder().description(storeDescriptionUpdated).build();

                StoreInfo cStoreUpdate = wStore.updateStore(UpdateStore.builder()
                                .namespace(namespace)
                                .storeId(store_id)
                                .body(updateStore)
                                .build());

                Assertions.assertNotNull(cStoreUpdate);
                Assertions.assertEquals(storeDescriptionUpdated, cStoreUpdate.getDescription());

                // Delete a store

                StoreInfo dStore = wStore.deleteStore(DeleteStore.builder()
                                .namespace(namespace)
                                .storeId(store_id)
                                .build());

                Assertions.assertNotNull(dStore);
        }

        //@Test
        public void SessionBrowserServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");

                String usernameToTest = "dummy@example.com";
                String session_id = "";

                Session wSBSession = new Session(_sdk);

                // Create a session

                ModelsCreateSessionRequest createSession = ModelsCreateSessionRequest.builder()
                                .namespace(namespace)
                                .sessionType("p2p")
                                .gameVersion("0.3.0")
                                .username(usernameToTest)
                                .gameSessionSetting(ModelsGameSessionSetting.builder()
                                                .mode("deathmatch")
                                                .allowJoinInProgress(true)
                                                .mapName("Java SDK Integration Test")
                                                .maxPlayer(100)
                                                .build())
                                .build();

                ModelsSessionResponse cResp = wSBSession.createSession(
                                CreateSession.builder()
                                                .namespace(namespace)
                                                .body(createSession)
                                                .build());

                Assertions.assertNotNull(cResp);
                Assertions.assertEquals(usernameToTest, cResp.getUsername());

                session_id = cResp.getSessionId();

                // Get a session

                ModelsSessionResponse gResp = wSBSession.getSession(
                                GetSession.builder()
                                                .namespace(namespace)
                                                .sessionID(session_id)
                                                .build());

                Assertions.assertNotNull(gResp);
                Assertions.assertEquals("0.3.0", gResp.getGameVersion());

                // Update a session

                ModelsUpdateSessionRequest updateSession = ModelsUpdateSessionRequest.builder()
                                .gameMaxPlayer(150)
                                .build();

                ModelsSessionResponse uResp = wSBSession.updateSession(
                                UpdateSession.builder()
                                                .namespace(namespace)
                                                .sessionID(session_id)
                                                .body(updateSession)
                                                .build());

                Assertions.assertNotNull(uResp);
                Assertions.assertEquals(150, uResp.getGameSessionSetting().getMaxPlayer());

                // Delete a session

                ModelsSessionResponse dResp = wSBSession.deleteSession(
                                DeleteSession.builder().namespace(namespace).sessionID(session_id).build());

                Assertions.assertNotNull(dResp);
        }

        @Test
        public void SocialServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");

                String stat_code = "javaserversdkteststat";

                StatConfiguration wStatConfig = new StatConfiguration(_sdk);

                // Create a statistic

                StatCreate createStat = StatCreate.builder()
                                .name("Java Server SDK Test Stat")
                                .description("Java server sdk integration test.")
                                .statCode(stat_code)
                                .setByFromEnum(StatCreate.SetBy.SERVER)
                                .minimum(0f)
                                .maximum(100f)
                                .defaultValue(50f)
                                .incrementOnly(true)
                                .setAsGlobal(false)
                                .tags(Arrays.asList(new String[] { "java", "server_sdk", "test" }))
                                .build();

                StatInfo cStat = wStatConfig.createStat(
                                CreateStat.builder()
                                                .namespace(namespace)
                                                .body(createStat)
                                                .build());

                Assertions.assertNotNull(cStat);
                Assertions.assertEquals("Java Server SDK Test Stat", cStat.getName());

                // Get a statistic

                StatInfo gStat = wStatConfig.getStat(
                                GetStat.builder()
                                                .namespace(namespace)
                                                .statCode(stat_code)
                                                .build());

                Assertions.assertNotNull(gStat);
                Assertions.assertEquals("Java Server SDK Test Stat", gStat.getName());

                // Update a statistic

                StatUpdate updateStat = StatUpdate.builder().description("Updated description.").build();

                StatInfo uStat = wStatConfig.updateStat(
                                UpdateStat.builder().namespace(namespace).statCode(stat_code).body(updateStat).build());

                Assertions.assertNotNull(uStat);
                Assertions.assertEquals("Updated description.", uStat.getDescription());

                // Delete a statistic

                wStatConfig.deleteStat(DeleteStat.builder().namespace(namespace).statCode(stat_code).build());
        }

        @Test
        public void UGCServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");

                String tag_name = "java_server_sdk_test";
                String tag_name_u = "java_server_sdk_test_update";

                AdminTag wAdminTag = new AdminTag(_sdk);

                // Create a tag

                ModelsCreateTagRequest createTag = ModelsCreateTagRequest.builder().tag(tag_name).build();

                ModelsCreateTagResponse cTag = wAdminTag.adminCreateTag(
                                AdminCreateTag.builder().namespace(namespace).body(createTag).build());

                Assertions.assertNotNull(cTag);
                Assertions.assertEquals(tag_name, cTag.getTag());

                String tag_id = cTag.getId();

                // Get tags

                ModelsPaginatedGetTagResponse gTag = wAdminTag.adminGetTag(
                                AdminGetTag.builder()
                                                .namespace(namespace)
                                                .offset(0)
                                                .limit(10)
                                                .build());

                Assertions.assertNotNull(gTag);

                // Update a tag

                ModelsCreateTagRequest updateTag = ModelsCreateTagRequest.builder().tag(tag_name_u).build();

                ModelsCreateTagResponse uTag = wAdminTag.adminUpdateTag(
                                AdminUpdateTag.builder()
                                                .namespace(namespace)
                                                .tagId(tag_id)
                                                .body(updateTag)
                                                .build());

                Assertions.assertNotNull(uTag);
                Assertions.assertEquals(tag_name_u, uTag.getTag());

                // Delete a tag

                wAdminTag.adminDeleteTag(
                                AdminDeleteTag.builder().namespace(namespace).tagId(tag_id).build());
        }

        // Client integration test

        @Test
        public void SocialServiceUserStatTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String user_login_id = System.getenv("AB_USERNAME");
                final String stat_code = "cs-server-sdk-test";

                UserStatistic wUserStat = new UserStatistic(_sdk);

                Users wUsers = new Users(_sdk);
                ModelPublicUserResponse uResp = wUsers.getUserByLoginID(
                                GetUserByLoginID.builder()
                                                .namespace(namespace)
                                                .loginId(user_login_id)
                                                .build());

                Assertions.assertNotNull(uResp);
                String user_id = uResp.getUserId();

                wUserStat.createUserStatItem(CreateUserStatItem.builder()
                                .namespace(namespace)
                                .userId(user_id)
                                .statCode(stat_code)
                                .build());

                UserStatItemPagingSlicedResult gsResult = wUserStat.getUserStatItems(GetUserStatItems.builder()
                                .namespace(namespace)
                                .userId(user_id)
                                .statCodes(stat_code)
                                .offset(0)
                                .limit(10)
                                .build());

                Assertions.assertNotNull(gsResult);
                Assertions.assertTrue(gsResult.getData().size() > 0);

                StatItemIncResult incResult = wUserStat.incUserStatItemValue(IncUserStatItemValue.builder()
                                .namespace(namespace)
                                .userId(user_id)
                                .statCode(stat_code)
                                .body(StatItemInc.builder().inc(5f).build())
                                .build());

                Assertions.assertNotNull(incResult);

                wUserStat.deleteUserStatItems(DeleteUserStatItems.builder()
                                .namespace(namespace)
                                .userId(user_id)
                                .statCode(stat_code)
                                .build());
        }

        // Matchmaking integration test

        @Test
        public void MatchmakingTestSuite() throws HttpResponseException, IOException, InterruptedException {
                SessionBrowserServiceTests();           // Temporary workaround to run SessionBrowserServiceTests before MatchmakingTestSuite

                DSMCListLocalServerTest();
                DSMCServiceTests();
                MatchmakingServiceApiTests();
                LobbyAPIServiceTests();
                LobbyWebSocketServiceTests();
        }

        public void DSMCListLocalServerTest() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                Admin wDsmcAdmin = new Admin(_sdk);
                ModelsListServerResponse serverResp = wDsmcAdmin.listLocalServer(ListLocalServer.builder()
                                .namespace(namespace)
                                .build());
                Assertions.assertNotNull(serverResp);
        }

        public void DSMCServiceTests() throws HttpResponseException, IOException, InterruptedException {
                final String usernameToTest = "dummy@example.com";
                final String target_namespace = "armadademotestqa";
                final String target_deployment = "deployruli";
                final String game_mode = "soloyogs";
                final String party_id = "PARTY_ID";
                final String party_user_id = System.getenv("AB_USERNAME");

                net.accelbyte.sdk.api.dsmc.wrappers.Session wSession = new net.accelbyte.sdk.api.dsmc.wrappers.Session(
                                _sdk);
                Admin wDsmcAdmin = new Admin(_sdk);

                Session wSBSession = new Session(_sdk);

                // Create a session

                ModelsCreateSessionRequest createSession = ModelsCreateSessionRequest.builder()
                                .sessionType("p2p")
                                .gameVersion("0.3.0")
                                .namespace(target_namespace)
                                .username(usernameToTest)
                                .gameSessionSetting(ModelsGameSessionSetting.builder()
                                                .mode(game_mode)
                                                .allowJoinInProgress(true)
                                                .mapName("CSharp SDK Integration Test")
                                                .maxPlayer(100)
                                                .build())
                                .build();

                ModelsSessionResponse cResp = wSBSession.createSession(
                                CreateSession.builder().namespace(target_namespace)
                                                .body(createSession).build());

                Assertions.assertNotNull(cResp);
                Assertions.assertEquals(usernameToTest, cResp.getUsername());
                String session_id = cResp.getSessionId();

                // Create a session

                net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest sessionRequest = net.accelbyte.sdk.api.dsmc.models.ModelsCreateSessionRequest
                                .builder()
                                .clientVersion("0.3.0")
                                .configuration("")
                                .deployment(target_deployment)
                                .gameMode(game_mode)
                                .matchingAllies(Arrays.asList(new ModelsRequestMatchingAlly[] {
                                                ModelsRequestMatchingAlly.builder()
                                                                .matchingParties(Arrays
                                                                                .asList(new ModelsRequestMatchParty[] {
                                                                                                ModelsRequestMatchParty
                                                                                                                .builder()
                                                                                                                .partyAttributes(
                                                                                                                                new HashMap<String, Object>())
                                                                                                                .partyId(party_id)
                                                                                                                .partyMembers(Arrays
                                                                                                                                .asList(new ModelsRequestMatchMember[] {
                                                                                                                                                ModelsRequestMatchMember
                                                                                                                                                                .builder()
                                                                                                                                                                .userId(party_user_id)
                                                                                                                                                                .build()
                                                                                                                                }))
                                                                                                                .build()
                                                                                }))
                                                                .build()
                                }))
                                .region("")
                                .podName("")
                                .sessionId(session_id)
                                .namespace(target_namespace)
                                .build();

                net.accelbyte.sdk.api.dsmc.models.ModelsSessionResponse csResp = wSession
                                .createSession(net.accelbyte.sdk.api.dsmc.operations.session.CreateSession.builder()
                                                .namespace(target_namespace)
                                                .body(sessionRequest)
                                                .build());
                Assertions.assertNotNull(csResp);

                csResp = wSession.getSession(net.accelbyte.sdk.api.dsmc.operations.session.GetSession.builder()
                                .namespace(target_namespace)
                                .sessionID(session_id)
                                .build());
                Assertions.assertNotNull(csResp);

                // Waiting for the server to be ready

                Thread.sleep(5000);

                // Claim

                ModelsClaimSessionRequest claimServer = ModelsClaimSessionRequest.builder()
                                .sessionId(session_id)
                                .build();

                wSession.claimServer(ClaimServer.builder()
                                .namespace(target_namespace)
                                .body(claimServer)
                                .build());

                // Clean up

                wDsmcAdmin.deleteSession(net.accelbyte.sdk.api.dsmc.operations.admin.DeleteSession.builder()
                                .namespace(target_namespace)
                                .sessionID(session_id)
                                .build());

                ModelsSessionResponse delResp = wSBSession.deleteSession(DeleteSession.builder()
                                .namespace(target_namespace)
                                .sessionID(session_id)
                                .build());
                Assertions.assertNotNull(delResp);
        }

        public void MatchmakingServiceApiTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");
                final String channelName = "csharp_sdk_gm_" + GenerateRandomId(8);
                final String channelDescription = "CSharp Server SDK Test";
                final String channelDescriptionUpdated = "Updated description.";

                Matchmaking wMatchmaking = new Matchmaking(_sdk);

                // Create a channel

                ModelsChannelRequest channelReq = ModelsChannelRequest.builder()
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

                ModelsCreateChannelResponse cResp = wMatchmaking.createChannelHandler(CreateChannelHandler.builder()
                                .namespace(namespace)
                                .body(channelReq)
                                .build());

                Assertions.assertNotNull(cResp);
                Assertions.assertEquals(channelName, cResp.getGameMode());

                // Get a channel

                ModelsChannelV1 gResp = wMatchmaking.getSingleMatchmakingChannel(GetSingleMatchmakingChannel.builder()
                                .namespace(namespace)
                                .channelName(channelName)
                                .build());

                Assertions.assertNotNull(gResp);
                Assertions.assertEquals(channelDescription, gResp.getDescription());

                // Get sessions in channel

                List<ModelsMatchmakingResult> mResults = wMatchmaking
                                .getAllSessionsInChannel(GetAllSessionsInChannel.builder()
                                                .namespace(namespace)
                                                .channelName(channelName)
                                                .build());
                Assertions.assertNotNull(mResults);

                // Update a channel

                ModelsUpdateChannelRequest updateChannel = ModelsUpdateChannelRequest.builder()
                                .description(channelDescriptionUpdated)
                                .build();

                wMatchmaking.updateMatchmakingChannel(UpdateMatchmakingChannel.builder()
                                .namespace(namespace)
                                .channelName(channelName)
                                .body(updateChannel)
                                .build());

                // Get a channel back to confirm update

                gResp = wMatchmaking.getSingleMatchmakingChannel(GetSingleMatchmakingChannel.builder()
                                .namespace(namespace)
                                .channelName(channelName)
                                .build());
                Assertions.assertNotNull(gResp);
                Assertions.assertEquals(channelDescriptionUpdated, gResp.getDescription());

                // Delete a channel

                wMatchmaking.deleteChannelHandler(DeleteChannelHandler.builder()
                                .namespace(namespace)
                                .channel(channelName)
                                .build());

                // Finally, recheck if the data is truly deleted

                Assertions.assertThrows(HttpResponseException.class, () -> {
                        wMatchmaking.getSingleMatchmakingChannel(GetSingleMatchmakingChannel.builder()
                                        .namespace(namespace)
                                        .channelName(channelName)
                                        .build());
                });
        }

        public void LobbyAPIServiceTests() throws HttpResponseException, IOException {
                final String namespace = System.getenv("AB_NAMESPACE");

                Notification wLobbyNotification = new Notification(_sdk);

                // Sending a free from notification to all user(s)

                ModelFreeFormNotificationRequest notifBody = ModelFreeFormNotificationRequest.builder()
                                .topic("csharp_sdk_test")
                                .message("This is integration test for CSharp Server SDK.")
                                .build();

                wLobbyNotification.freeFormNotification(FreeFormNotification.builder()
                                .namespace(namespace)
                                .body(notifBody)
                                .build());
        }

        public void LobbyWebSocketServiceTests() throws InterruptedException {
                final String request_id = GenerateRandomId(64);
                final CountDownLatch response = new CountDownLatch(1);
                final StringBuilder responseMessage = new StringBuilder();

                WebSocketListener listener = new WebSocketListener() {
                        @Override
                        public void onMessage(@NotNull WebSocket webSocket, @NotNull String text) {
                                if (response.getCount() > 0) {
                                        responseMessage.append(text);
                                        response.countDown();
                                }
                        }
                };

                OkhttpWebSocketClient ws = OkhttpWebSocketClient.create(
                                new DefaultConfigRepository(),
                                DefaultTokenRepository.getInstance(),
                                listener);

                String requestMessage = PartyCreateRequest.builder()
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
        static void tear() {
                boolean isLogoutOk;

                isLogoutOk = _sdk.logout();

                String token = _sdk.getSdkConfiguration().getTokenRepository()
                                .getToken();

                Assertions.assertTrue(isLogoutOk);
                Assertions.assertTrue(token == null || token.isEmpty());
        }

        private String GenerateRandomId(int length) {
                return GetRandomString("abcdefghijklmnopqrstuvw0123456789", length);
        }

        private String GenerateRandomPassword(int length) throws IllegalArgumentException {
                if (length < 8) {
                        throw new IllegalArgumentException("Length must be >= 8");
                }
                String part1 = GetRandomString("ABCDEFGHIJKLMNOPQRSTUVW", (length - 2) / 2);
                String part2 = GetRandomString("abcdefghijklmnopqrstuvw", (length - 2) / 2);
                String part3 = GetRandomString("0123456789", 1);
                String part4 = GetRandomString("!@#$%^&*()", 1);
                return part1 + part2 + part3 + part4;
        }

        private String GetRandomString(String characters, int length) {
                final Random random = new Random();
                char[] result = new char[length];
                for (int i = 0; i < result.length; i++) {
                        result[i] = characters.charAt(random.nextInt(characters.length()));
                }
                return new String(result);
        }
}
