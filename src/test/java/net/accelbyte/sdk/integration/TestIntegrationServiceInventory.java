/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminGetMyUserV3;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.operations.admin_inventories.AdminCreateInventory;
import net.accelbyte.sdk.api.inventory.operations.admin_inventories.AdminGetInventory;
import net.accelbyte.sdk.api.inventory.operations.admin_inventories.AdminUpdateInventory;
import net.accelbyte.sdk.api.inventory.operations.admin_inventories.DeleteInventory;
import net.accelbyte.sdk.api.inventory.operations.admin_inventory_configurations.AdminCreateInventoryConfiguration;
import net.accelbyte.sdk.api.inventory.operations.admin_inventory_configurations.AdminDeleteInventoryConfiguration;
import net.accelbyte.sdk.api.inventory.wrappers.AdminInventories;
import net.accelbyte.sdk.api.inventory.wrappers.AdminInventoryConfigurations;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
class TestIntegrationServiceInventory extends TestIntegration {

  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {

    final Users usersWrapper = new Users(sdk);

    final ModelUserResponseV3 getUserResult =
        usersWrapper.adminGetMyUserV3(AdminGetMyUserV3.builder().build());

    assertNotNull(getUserResult);

    final String userId = getUserResult.getUserId();

    final String codeInventoryConfig =
        "java-sdk-code-" + java.util.UUID.randomUUID().toString().substring(0, 4);

    // CASE Create inventory configuration
    final ApimodelsCreateInventoryConfigurationReq createInventoryConfigBody =
        ApimodelsCreateInventoryConfigurationReq.builder()
            .code(codeInventoryConfig)
            .description("testing")
            .initialMaxSlots(3)
            .maxInstancesPerUser(2)
            .maxUpgradeSlots(5)
            .name(codeInventoryConfig)
            .build();

    final ApimodelsInventoryConfigurationResp createInventoryConfigResult =
        new AdminInventoryConfigurations(sdk)
            .adminCreateInventoryConfiguration(
                AdminCreateInventoryConfiguration.builder()
                    .body(createInventoryConfigBody)
                    .namespace(this.namespace)
                    .build());

    assertNotNull(createInventoryConfigResult);

    // CASE Create inventory
    final ApimodelsCreateInventoryReq createInventoryBody =
        ApimodelsCreateInventoryReq.builder()
            .inventoryConfigurationCode(createInventoryConfigResult.getCode())
            .userId(userId)
            .build();

    final ApimodelsInventoryResp createInventoryResult =
        new AdminInventories(sdk)
            .adminCreateInventory(
                AdminCreateInventory.builder()
                    .body(createInventoryBody)
                    .namespace(this.namespace)
                    .build());

    assertNotNull(createInventoryResult);

    // CASE Get Inventory
    final ApimodelsInventoryResp getInventoryResult =
        new AdminInventories(sdk)
            .adminGetInventory(
                AdminGetInventory.builder()
                    .inventoryId(createInventoryResult.getId())
                    .namespace(this.namespace)
                    .build());

    assertNotNull(getInventoryResult);

    // CASE Update inventory
    final ApimodelsUpdateInventoryReq updateInventoryBody =
        ApimodelsUpdateInventoryReq.builder().incMaxSlots(2).build();

    final ApimodelsInventoryResp updateInventoryResult =
        new AdminInventories(sdk)
            .adminUpdateInventory(
                AdminUpdateInventory.builder()
                    .body(updateInventoryBody)
                    .inventoryId(createInventoryResult.getId())
                    .namespace(this.namespace)
                    .build());

    assertNotNull(updateInventoryResult);

    // CASE Delete inventory
    final ApimodelsDeleteInventoryReq deleteInventoryBody =
        ApimodelsDeleteInventoryReq.builder().message("delete").build();

    new AdminInventories(sdk)
        .deleteInventory(
            DeleteInventory.builder()
                .body(deleteInventoryBody)
                .inventoryId(createInventoryResult.getId())
                .namespace(this.namespace)
                .build());

    // Clean up inventory configuration
    new AdminInventoryConfigurations(sdk)
        .adminDeleteInventoryConfiguration(
            AdminDeleteInventoryConfiguration.builder()
                .inventoryConfigurationId(createInventoryConfigResult.getId())
                .namespace(this.namespace)
                .build());
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
