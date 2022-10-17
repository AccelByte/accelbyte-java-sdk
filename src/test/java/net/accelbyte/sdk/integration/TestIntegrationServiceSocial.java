/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Arrays;
import java.util.List;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminGetMyUserV3;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.social.models.StatCreate;
import net.accelbyte.sdk.api.social.models.StatInfo;
import net.accelbyte.sdk.api.social.models.StatItemInc;
import net.accelbyte.sdk.api.social.models.StatItemIncResult;
import net.accelbyte.sdk.api.social.models.StatUpdate;
import net.accelbyte.sdk.api.social.models.UserStatItemPagingSlicedResult;
import net.accelbyte.sdk.api.social.operations.stat_configuration.CreateStat;
import net.accelbyte.sdk.api.social.operations.stat_configuration.DeleteStat;
import net.accelbyte.sdk.api.social.operations.stat_configuration.ExportStats;
import net.accelbyte.sdk.api.social.operations.stat_configuration.GetStat;
import net.accelbyte.sdk.api.social.operations.stat_configuration.UpdateStat;
import net.accelbyte.sdk.api.social.operations.user_statistic.CreateUserStatItem;
import net.accelbyte.sdk.api.social.operations.user_statistic.DeleteUserStatItems;
import net.accelbyte.sdk.api.social.operations.user_statistic.GetUserStatItems;
import net.accelbyte.sdk.api.social.operations.user_statistic.IncUserStatItemValue;
import net.accelbyte.sdk.api.social.wrappers.StatConfiguration;
import net.accelbyte.sdk.api.social.wrappers.UserStatistic;
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
public class TestIntegrationServiceSocial extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void testStat() throws Exception {
    final String statName = "Java Server SDK Integration Test";
    final String statCode = "javaserversdkteststat";
    final String statDescription = "This is a test";
    final String statDescriptionUpdated = "This is a test";
    final List<String> statTags = Arrays.asList(new String[] {"java", "server_sdk", "test"});

    final StatConfiguration statConfigWrapper = new StatConfiguration(sdk);

    // CASE Create a statistic

    final StatCreate createStatBody =
        StatCreate.builder()
            .name(statName)
            .description(statDescription)
            .statCode(statCode)
            .setByFromEnum(StatCreate.SetBy.SERVER)
            .minimum(0f)
            .maximum(100f)
            .defaultValue(50f)
            .incrementOnly(true)
            .setAsGlobal(false)
            .tags(statTags)
            .build();

    final StatInfo createStatResult =
        statConfigWrapper.createStat(
            CreateStat.builder().namespace(this.namespace).body(createStatBody).build());

    // ESAC

    assertNotNull(createStatResult);
    assertEquals(statName, createStatResult.getName());

    // CASE Get a statistic

    final StatInfo getStatResult =
        statConfigWrapper.getStat(
            GetStat.builder().namespace(this.namespace).statCode(statCode).build());

    assertNotNull(getStatResult);
    assertEquals(statName, getStatResult.getName());

    // ESAC

    // CASE Update a statistic

    final StatUpdate updateStat = StatUpdate.builder().description(statDescriptionUpdated).build();

    final StatInfo updateStatResult =
        statConfigWrapper.updateStat(
            UpdateStat.builder()
                .namespace(this.namespace)
                .statCode(statCode)
                .body(updateStat)
                .build());

    // ESAC

    assertNotNull(updateStatResult);
    assertEquals(statDescriptionUpdated, updateStatResult.getDescription());

    final File exportStatsFile = new File("export-stats.json");

    if (exportStatsFile.exists()) {
      exportStatsFile.delete();
    }

    exportStatsFile.deleteOnExit();

    // CASE Export statistics

    final InputStream exportStatsResult =
        statConfigWrapper.exportStats(ExportStats.builder().namespace(namespace).build());
    java.nio.file.Files.copy(
        exportStatsResult,
        exportStatsFile.toPath(),
        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
    org.apache.commons.io.IOUtils.closeQuietly(exportStatsResult);

    // ESAC

    assertTrue(exportStatsFile.exists());
    assertTrue(Files.size(exportStatsFile.toPath()) > 0);

    // CASE Delete a statistic

    statConfigWrapper.deleteStat(
        DeleteStat.builder().namespace(this.namespace).statCode(statCode).build());

    // ESAC
  }

  @Test
  @Order(2)
  public void testUserStat() throws Exception {
    final String statCode = "cs-server-sdk-test";

    final UserStatistic userStatisticWrapper = new UserStatistic(sdk);
    final Users usersWrapper = new Users(sdk);

    final ModelUserResponseV3 getUserResult =
        usersWrapper.adminGetMyUserV3(AdminGetMyUserV3.builder().build());

    assertNotNull(getUserResult);

    final String userId = getUserResult.getUserId();

    // CASE Create user stat item

    userStatisticWrapper.createUserStatItem(
        CreateUserStatItem.builder()
            .namespace(this.namespace)
            .userId(userId)
            .statCode(statCode)
            .build());

    // ESAC

    // CASE Get user stat items

    final UserStatItemPagingSlicedResult getUserStatItemsResult =
        userStatisticWrapper.getUserStatItems(
            GetUserStatItems.builder()
                .namespace(this.namespace)
                .userId(userId)
                .statCodes(statCode)
                .offset(0)
                .limit(10)
                .build());

    // ESAC

    assertNotNull(getUserStatItemsResult);
    assertTrue(getUserStatItemsResult.getData().size() > 0);

    // CASE Update user stat item value

    final StatItemIncResult incUserStatItemValueResult =
        userStatisticWrapper.incUserStatItemValue(
            IncUserStatItemValue.builder()
                .namespace(this.namespace)
                .userId(userId)
                .statCode(statCode)
                .body(StatItemInc.builder().inc(5f).build())
                .build());

    // ESAC

    assertNotNull(incUserStatItemValueResult);

    // CASE Delete user stat item

    userStatisticWrapper.deleteUserStatItems(
        DeleteUserStatItems.builder()
            .namespace(this.namespace)
            .userId(userId)
            .statCode(statCode)
            .build());

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
