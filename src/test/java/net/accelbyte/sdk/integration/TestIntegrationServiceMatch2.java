/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Collections;

import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserResponseV4;
import net.accelbyte.sdk.api.iam.models.AccountCreateUserRequestV4.AuthType;
import net.accelbyte.sdk.api.iam.operations.users.AdminDeleteUserInformationV3;
import net.accelbyte.sdk.api.iam.operations.users_v4.PublicCreateUserV4;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.iam.wrappers.UsersV4;
import net.accelbyte.sdk.api.match2.models.ApiListMatchFunctionsResponse;
import net.accelbyte.sdk.api.match2.models.ApiListMatchPoolsResponse;
import net.accelbyte.sdk.api.match2.models.ApiMatchPool;
import net.accelbyte.sdk.api.match2.models.ApiMatchRuleSet;
import net.accelbyte.sdk.api.match2.models.ApiMatchTicketRequest;
import net.accelbyte.sdk.api.match2.models.ApiMatchTicketResponse;
import net.accelbyte.sdk.api.match2.operations.match_functions.MatchFunctionList;
import net.accelbyte.sdk.api.match2.operations.match_pools.CreateMatchPool;
import net.accelbyte.sdk.api.match2.operations.match_pools.DeleteMatchPool;
import net.accelbyte.sdk.api.match2.operations.match_pools.MatchPoolList;
import net.accelbyte.sdk.api.match2.operations.match_tickets.CreateMatchTicket;
import net.accelbyte.sdk.api.match2.operations.match_tickets.DeleteMatchTicket;
import net.accelbyte.sdk.api.match2.operations.operations.GetHealthcheckInfoV1;
import net.accelbyte.sdk.api.match2.operations.rule_sets.CreateRuleSet;
import net.accelbyte.sdk.api.match2.operations.rule_sets.DeleteRuleSet;
import net.accelbyte.sdk.api.match2.wrappers.MatchFunctions;
import net.accelbyte.sdk.api.match2.wrappers.MatchPools;
import net.accelbyte.sdk.api.match2.wrappers.MatchTickets;
import net.accelbyte.sdk.api.match2.wrappers.Operations;
import net.accelbyte.sdk.api.match2.wrappers.RuleSets;
import net.accelbyte.sdk.api.session.models.ApimodelsCreateConfigurationTemplateRequest;
import net.accelbyte.sdk.api.session.models.ApimodelsCreateGameSessionRequest;
import net.accelbyte.sdk.api.session.models.ApimodelsGameSessionResponse;
import net.accelbyte.sdk.api.session.operations.configuration_template.AdminCreateConfigurationTemplateV1;
import net.accelbyte.sdk.api.session.operations.configuration_template.AdminDeleteConfigurationTemplateV1;
import net.accelbyte.sdk.api.session.operations.game_session.CreateGameSession;
import net.accelbyte.sdk.api.session.operations.game_session.DeleteGameSession;
import net.accelbyte.sdk.api.session.wrappers.ConfigurationTemplate;
import net.accelbyte.sdk.api.session.wrappers.GameSession;
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
public class TestIntegrationServiceMatch2 extends TestIntegration {
    @BeforeAll
    public void setup() throws Exception {
        super.setup();
    }

    @Test
    @Order(1)
    public void testHealth() throws Exception {

        final Operations operationsWrapper = new Operations(sdk);

        operationsWrapper.getHealthcheckInfoV1(GetHealthcheckInfoV1.builder().build());
    }

    @Test
    @Order(1)
    public void testMatchPool() throws Exception {
        final String nameSuffix = TestHelper.GenerateRandomId(4);

        final String cfgTemplateName = "java_sdk_template_" + nameSuffix;
        final String rulesetName = "java_sdk_ruleset_" + nameSuffix;
        final String poolName = "java_sdk_pool_" + nameSuffix;

        final ConfigurationTemplate configurationTemplateWrapper = new ConfigurationTemplate(sdk);
        final RuleSets ruleSetsWrapper = new RuleSets(sdk);
        final MatchPools matchPoolsWrapper = new MatchPools(sdk);
        final UsersV4 usersV4Wrapper = new UsersV4(sdk);
        final Users usersWrapper = new Users(sdk);

        configurationTemplateWrapper.adminCreateConfigurationTemplateV1(AdminCreateConfigurationTemplateV1.builder()
                .namespace(namespace)
                .body(ApimodelsCreateConfigurationTemplateRequest.builder()
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

        // CASE Create a match rule set

        ruleSetsWrapper.createRuleSet(CreateRuleSet
                .builder()
                .namespace(namespace)
                .body(ApiMatchRuleSet.builder().name(rulesetName).data(
                        "{\"alliance\":{\"minNumber\":\"2\",\"maxNumber\":\"10\",\"playerMinNumber\":\"2\",\"playerMaxNumber\":\"4\"},\"matchingRules\":[{\"attribute\":\"\",\"criteria\":\"distance\",\"reference\":\"\"}],\"flexingRules\":[{\"duration\":\"600\",\"attribute\":\"\",\"criteria\":\"distance\",\"reference\":\"\"}],\"match_options\":{\"options\":[{\"name\":\"\",\"type\":\"any\"}]},\"alliance_flexing_rule\":[{\"duration\":\"600\",\"min_number\":\"\",\"max_number\":\"\",\"player_min_number\":\"\",\"player_max_number\":\"\"}]}")
                        .build())
                .build());

        // ESAC

        // CASE Create a match pool

        matchPoolsWrapper.createMatchPool(CreateMatchPool.builder()
                .namespace(namespace)
                .body(ApiMatchPool.builder()
                        .name(poolName)
                        .matchFunction("basic")
                        .sessionTemplate(cfgTemplateName)
                        .backfillTicketExpirationSeconds(600)
                        .ruleSet(rulesetName)
                        .ticketExpirationSeconds(600)
                        .build())
                .build());

        // ESAC

        // CASE List match pools

        final ApiListMatchPoolsResponse matchPoolListResult = matchPoolsWrapper
                .matchPoolList(MatchPoolList.builder().namespace(namespace).build());

        // ESAC

        assertNotNull(matchPoolListResult);
        assertTrue(matchPoolListResult.getData().stream().anyMatch(mp -> mp.getName().equals(poolName)));

        final AccelByteSDK player1Sdk = new AccelByteSDK(
                sdk.getSdkConfiguration().getHttpClient(),
                new DefaultTokenRepository(),
                sdk.getSdkConfiguration().getConfigRepository());

        String player1UserId = null;

        try {
            final String player1Username = ("javasdk_" + TestHelper.GenerateRandomId(8));
            final String player1Password = TestHelper.GenerateRandomPassword(10);

            final AccountCreateUserResponseV4 createUserResult = usersV4Wrapper.publicCreateUserV4(
                    PublicCreateUserV4.builder()
                            .namespace(namespace)
                            .body(AccountCreateUserRequestV4.builder()
                                    .authTypeFromEnum(AuthType.EMAILPASSWD)
                                    .emailAddress(player1Username + "@test.com")
                                    .password(player1Password)
                                    .displayName("Java Server SDK Test")
                                    .username(player1Username)
                                    .country("ID")
                                    .dateOfBirth("1995-01-10")
                                    .build())
                            .build());

            player1UserId = createUserResult.getUserId();

            player1Sdk.loginUser(player1Username, player1Password);

            final GameSession player1GameSessionWrapper = new GameSession(player1Sdk);
            final MatchTickets player1MatchTicketWrapper = new MatchTickets(player1Sdk);

            final ApimodelsGameSessionResponse createGameSessionResult = player1GameSessionWrapper
                    .createGameSession(CreateGameSession.builder()
                            .namespace(namespace)
                            .body(ApimodelsCreateGameSessionRequest.builder().configurationName(cfgTemplateName)
                                    .build())
                            .build());

            final String gameSessionId = createGameSessionResult.getId();

            // CASE Player create a match ticket

            final ApiMatchTicketResponse createMatchTicketResult = player1MatchTicketWrapper
                    .createMatchTicket(CreateMatchTicket.builder()
                            .namespace(namespace)
                            .body(ApiMatchTicketRequest.builder().matchPool(poolName).sessionID(gameSessionId).build())
                            .build());

            // ESAC

            final String ticketId = createMatchTicketResult.getMatchTicketID();

            // CASE Player delete a match ticket

            player1MatchTicketWrapper
                    .deleteMatchTicket(DeleteMatchTicket.builder().namespace(namespace).ticketid(ticketId).build());

            // ESAC

            player1GameSessionWrapper
                    .deleteGameSession(
                            DeleteGameSession.builder().namespace(namespace).sessionId(gameSessionId).build());
        } finally {
            player1Sdk.logout();

            if (player1UserId != null) {
                usersWrapper.adminDeleteUserInformationV3(
                        AdminDeleteUserInformationV3.builder().namespace(namespace).userId(player1UserId).build());
            }
        }

        // CASE Delete a match pool

        matchPoolsWrapper.deleteMatchPool(DeleteMatchPool.builder().namespace(namespace).pool(poolName).build());

        // ESAC

        // CASE Delete a match rule set

        ruleSetsWrapper.deleteRuleSet(DeleteRuleSet.builder().namespace(namespace).ruleset(rulesetName).build());

        // ESAC

        configurationTemplateWrapper.adminDeleteConfigurationTemplateV1(
                AdminDeleteConfigurationTemplateV1.builder().namespace(namespace).name(cfgTemplateName).build());
    }

    @Test
    @Order(1)
    public void testMatchFunction() throws Exception {
        final MatchFunctions matchFunctionsWrapper = new MatchFunctions(sdk);

        final ApiListMatchFunctionsResponse response = matchFunctionsWrapper.matchFunctionList(
                MatchFunctionList.builder().namespace(this.namespace).build());

        assertNotNull(response);
    }

    @AfterAll
    public void tear() throws Exception {
        super.tear();
    }
}