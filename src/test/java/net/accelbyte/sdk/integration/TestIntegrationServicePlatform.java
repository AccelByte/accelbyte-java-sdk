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
import net.accelbyte.sdk.api.platform.models.ExportStoreRequest;
import net.accelbyte.sdk.api.platform.models.ImportStoreResult;
import net.accelbyte.sdk.api.platform.models.StoreCreate;
import net.accelbyte.sdk.api.platform.models.StoreInfo;
import net.accelbyte.sdk.api.platform.models.StoreUpdate;
import net.accelbyte.sdk.api.platform.operations.reward.ExportRewards;
import net.accelbyte.sdk.api.platform.operations.store.CreateStore;
import net.accelbyte.sdk.api.platform.operations.store.DeleteStore;
import net.accelbyte.sdk.api.platform.operations.store.ExportStore1;
import net.accelbyte.sdk.api.platform.operations.store.GetStore;
import net.accelbyte.sdk.api.platform.operations.store.ImportStore1;
import net.accelbyte.sdk.api.platform.operations.store.UpdateStore;
import net.accelbyte.sdk.api.platform.wrappers.Reward;
import net.accelbyte.sdk.api.platform.wrappers.Store;
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
public class TestIntegrationServicePlatform extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String storeTitle = "Java Server SDK Store Test";
    final String storeDescription =
        "Description for Java Server SDK store service integration test";
    final String storeDescriptionUpdate = "Updated description";

    final Store storeWrapper = new Store(sdk);
    final Reward rewardWrapper = new Reward(sdk);

    // CASE Create a store

    final StoreCreate createStoreBody =
        StoreCreate.builder()
            .title(storeTitle)
            .description(storeDescription)
            .defaultLanguage("en")
            .defaultRegion("US")
            .supportedLanguages(Arrays.asList(new String[] {"en", "id"}))
            .supportedRegions(Arrays.asList(new String[] {"US", "ID"}))
            .build();

    final StoreInfo createStoreResult =
        storeWrapper.createStore(
            CreateStore.builder().namespace(this.namespace).body(createStoreBody).build());

    // ESAC

    assertNotNull(createStoreResult);
    assertEquals(storeTitle, createStoreResult.getTitle());

    final String storeId = createStoreResult.getStoreId();

    // CASE Get a store

    final StoreInfo getStoreBody =
        storeWrapper.getStore(
            GetStore.builder().namespace(this.namespace).storeId(storeId).build());

    // ESAC

    assertNotNull(getStoreBody);
    assertEquals(storeTitle, getStoreBody.getTitle());

    // CASE Update a store

    final StoreUpdate updateStoreBody =
        StoreUpdate.builder().description(storeDescriptionUpdate).build();

    final StoreInfo updateStoreResult =
        storeWrapper.updateStore(
            UpdateStore.builder()
                .namespace(this.namespace)
                .storeId(storeId)
                .body(updateStoreBody)
                .build());

    // ESAC

    assertNotNull(updateStoreResult);
    assertEquals(storeDescriptionUpdate, updateStoreResult.getDescription());

    final File exportStoreFile = new File("export-store.zip");

    if (exportStoreFile.exists()) {
      exportStoreFile.delete();
    }

    exportStoreFile.deleteOnExit();

    // CASE Export a store

    final ExportStoreRequest exportStoreBody = ExportStoreRequest.builder().build();

    final InputStream exportStoreResult =
        storeWrapper.exportStore1(
            ExportStore1.builder()
                .namespace(namespace)
                .storeId(storeId)
                .body(exportStoreBody)
                .build());
    java.nio.file.Files.copy(
        exportStoreResult,
        exportStoreFile.toPath(),
        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
    org.apache.commons.io.IOUtils.closeQuietly(exportStoreResult);

    // ESAC

    assertTrue(exportStoreFile.exists());
    assertTrue(Files.size(exportStoreFile.toPath()) > 0);

    // CASE Import a store

    final ImportStoreResult importStoreResult =
        storeWrapper.importStore1(
            ImportStore1.builder()
                .namespace(namespace)
                .storeId(storeId)
                .file(exportStoreFile)
                .build());

    // ESAC

    assertTrue(importStoreResult.getSuccess());

    // CASE Delete a store

    final StoreInfo deleteStoreResult =
        storeWrapper.deleteStore(
            DeleteStore.builder().namespace(this.namespace).storeId(storeId).build());

    // ESAC

    assertNotNull(deleteStoreResult);

    final File exportRewardFile = new File("export-rewards.json");

    if (exportRewardFile.exists()) {
      exportRewardFile.delete();
    }

    exportRewardFile.deleteOnExit();

    // CASE Export rewards

    final InputStream exportRewardsResult =
        rewardWrapper.exportRewards(ExportRewards.builder().namespace(namespace).build());
    java.nio.file.Files.copy(
        exportRewardsResult,
        exportRewardFile.toPath(),
        java.nio.file.StandardCopyOption.REPLACE_EXISTING);
    org.apache.commons.io.IOUtils.closeQuietly(exportRewardsResult);

    // ESAC

    assertTrue(exportRewardFile.exists());
    assertTrue(Files.size(exportRewardFile.toPath()) > 0);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
