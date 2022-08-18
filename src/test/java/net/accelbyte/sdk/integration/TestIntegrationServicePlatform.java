/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import net.accelbyte.sdk.api.platform.models.StoreCreate;
import net.accelbyte.sdk.api.platform.models.StoreInfo;
import net.accelbyte.sdk.api.platform.models.StoreUpdate;
import net.accelbyte.sdk.api.platform.operations.store.CreateStore;
import net.accelbyte.sdk.api.platform.operations.store.DeleteStore;
import net.accelbyte.sdk.api.platform.operations.store.GetStore;
import net.accelbyte.sdk.api.platform.operations.store.UpdateStore;
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

    // CASE Delete a store

    final StoreInfo deleteStoreResult =
        storeWrapper.deleteStore(
            DeleteStore.builder().namespace(this.namespace).storeId(storeId).build());

    // ESAC

    assertNotNull(deleteStoreResult);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
