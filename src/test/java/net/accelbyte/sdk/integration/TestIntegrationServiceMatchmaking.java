/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
class TestIntegrationServiceMatchmaking extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String channelName = "csharp_sdk_gm_" + TestHelper.generateRandomId(8);
    final String channelDescription = "This is a Java Server SDK test";
    final String channelDescriptionUpdate = "This is a Java Server SDK test update";

    Matchmaking matchmakingWrapper = new Matchmaking(sdk);

    // CASE Create a channel

    final ModelsChannelRequest createChannelBody =
        ModelsChannelRequest.builder()
            .deployment("")
            .description(channelDescription)
            .findMatchTimeoutSeconds(3600)
            .gameMode(channelName)
            .joinable(false)
            .maxDelayMs(0)
            .sessionQueueTimeoutSeconds(0)
            .socialMatchmaking(false)
            .useSubGamemode(false)
            .ruleSet(
                ModelsRuleSet.builder()
                    .alliance(
                        ModelsAllianceRule.builder()
                            .maxNumber(2)
                            .minNumber(2)
                            .playerMaxNumber(1)
                            .playerMinNumber(1)
                            .build())
                    .allianceFlexingRule(new ArrayList<ModelsAllianceFlexingRule>())
                    .flexingRule(new ArrayList<ModelsFlexingRule>())
                    .matchOptions(
                        ModelsMatchOptionRule.builder()
                            .options(new ArrayList<ModelsMatchOption>())
                            .build())
                    .matchingRule(new ArrayList<ModelsMatchingRule>())
                    .subGameModes(new HashMap<String, ModelsSubGameMode>())
                    .build())
            .build();

    final ModelsCreateChannelResponse createChannelResult =
        matchmakingWrapper.createChannelHandler(
            CreateChannelHandler.builder()
                .namespace(this.namespace)
                .body(createChannelBody)
                .build());

    // ESAC

    assertNotNull(createChannelResult);
    assertEquals(channelName, createChannelResult.getGameMode());

    // CASE Get a channel

    final ModelsChannelV1 getSingleChannelResult =
        matchmakingWrapper.getSingleMatchmakingChannel(
            GetSingleMatchmakingChannel.builder()
                .namespace(this.namespace)
                .channelName(channelName)
                .build());

    // ESAC

    assertNotNull(getSingleChannelResult);
    assertEquals(channelDescription, getSingleChannelResult.getDescription());

    // CASE Get sessions in channel

    final List<ModelsMatchmakingResult> getSessionsResult =
        matchmakingWrapper.getAllSessionsInChannel(
            GetAllSessionsInChannel.builder()
                .namespace(this.namespace)
                .channelName(channelName)
                .build());

    // ESAC

    assertNotNull(getSessionsResult);

    // CASE Update a channel

    final ModelsUpdateChannelRequest updateChannelBody =
        ModelsUpdateChannelRequest.builder().description(channelDescriptionUpdate).build();

    matchmakingWrapper.updateMatchmakingChannel(
        UpdateMatchmakingChannel.builder()
            .namespace(this.namespace)
            .channelName(channelName)
            .body(updateChannelBody)
            .build());

    // ESAC

    // Confirm if channel is updated

    final ModelsChannelV1 getSingleChannelConfirmResult =
        matchmakingWrapper.getSingleMatchmakingChannel(
            GetSingleMatchmakingChannel.builder()
                .namespace(this.namespace)
                .channelName(channelName)
                .build());

    assertNotNull(getSingleChannelConfirmResult);
    assertEquals(channelDescriptionUpdate, getSingleChannelConfirmResult.getDescription());

    // CASE Delete a channel

    matchmakingWrapper.deleteChannelHandler(
        DeleteChannelHandler.builder().namespace(this.namespace).channel(channelName).build());

    // ESAC

    // Confirm if channel is deleted

    assertThrows(
        HttpResponseException.class,
        () -> {
          matchmakingWrapper.getSingleMatchmakingChannel(
              GetSingleMatchmakingChannel.builder()
                  .namespace(this.namespace)
                  .channelName(channelName)
                  .build());
        });
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
