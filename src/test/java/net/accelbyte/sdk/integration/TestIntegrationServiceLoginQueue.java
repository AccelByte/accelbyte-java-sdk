/*
 * Copyright (c) 2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import net.accelbyte.sdk.api.loginqueue.models.ApimodelsConfigurationRequest;
import net.accelbyte.sdk.api.loginqueue.models.ApimodelsConfigurationResponse;
import net.accelbyte.sdk.api.loginqueue.operations.admin_v1.AdminGetConfiguration;
import net.accelbyte.sdk.api.loginqueue.operations.admin_v1.AdminUpdateConfiguration;
import net.accelbyte.sdk.api.loginqueue.wrappers.AdminV1;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceLoginQueue extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    if (isUsingAGSStarter()) {
      return; // SKIP
    }

    final AdminV1 wrapper = new AdminV1(sdk);
    final int maxLoginRate = 100;

    // CASE Get configuration

    final ApimodelsConfigurationResponse config = wrapper.adminGetConfiguration(AdminGetConfiguration.builder()
        .namespace(namespace)
        .build());

    // ESAC

    assertNotNull(config);

    // CASE Update configurationF

    final ApimodelsConfigurationResponse configUpdate = wrapper.adminUpdateConfiguration(AdminUpdateConfiguration
        .builder()
        .namespace(namespace)
        .body(ApimodelsConfigurationRequest.builder().maxLoginRate(maxLoginRate).build())
        .build());

    // ESAC

    assertNotNull(configUpdate);
    assertEquals(maxLoginRate, configUpdate.getMaxLoginRate());
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
