package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import net.accelbyte.sdk.api.csm.models.ApimodelAppItem;
import net.accelbyte.sdk.api.csm.models.ApimodelCPURequest;
import net.accelbyte.sdk.api.csm.models.ApimodelCreateAppV2Request;
import net.accelbyte.sdk.api.csm.models.ApimodelGetListOfConfigurationsV2Response;
import net.accelbyte.sdk.api.csm.models.ApimodelMemoryRequest;
import net.accelbyte.sdk.api.csm.models.ApimodelSaveConfigurationV2Request;
import net.accelbyte.sdk.api.csm.models.ApimodelSaveConfigurationV2Response;
import net.accelbyte.sdk.api.csm.models.ApimodelUpdateConfigurationV2Request;
import net.accelbyte.sdk.api.csm.models.ApimodelUpdateConfigurationV2Response;
import net.accelbyte.sdk.api.csm.operations.app_v2.CreateAppV2;
import net.accelbyte.sdk.api.csm.operations.app_v2.DeleteAppV2;
import net.accelbyte.sdk.api.csm.operations.app_v2.GetAppV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.DeleteSecretV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.DeleteVariableV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.GetListOfSecretsV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.GetListOfVariablesV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.SaveSecretV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.SaveVariableV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.UpdateSecretV2;
import net.accelbyte.sdk.api.csm.operations.configuration_v2.UpdateVariableV2;
import net.accelbyte.sdk.api.csm.wrappers.AppV2;
import net.accelbyte.sdk.api.csm.wrappers.ConfigurationV2;
import net.accelbyte.sdk.core.HttpResponseException;

import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceCsm extends TestIntegration {
  public String EXTEND_APP_NAME = "test-java-app-integration";

  @BeforeAll
  public void setup() throws Exception {
    super.setup();

    final AppV2 appV2Wrapper = new AppV2(sdk);

    boolean isExtendAppExists = false;

    try {
      appV2Wrapper.getAppV2(GetAppV2.builder()
          .app(EXTEND_APP_NAME)
          .namespace(namespace)
          .build());

      isExtendAppExists = true;
    } catch (HttpResponseException hrex) {
      if (hrex.getHttpCode() != 404) {
        throw hrex;
      }
    }

    if (isExtendAppExists) {
      appV2Wrapper.deleteAppV2(DeleteAppV2.builder()
          .app(EXTEND_APP_NAME)
          .namespace(namespace)
          .forced("true")
          .build());
    }
  }

  @Test
  @Order(1)
  public void testExtendApp() throws Exception {
    final AppV2 appV2Wrapper = new AppV2(sdk);

    // CASE Create Extend app

    final CreateAppV2 createAppV2Op = CreateAppV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .body(ApimodelCreateAppV2Request.builder()
            .cpu(ApimodelCPURequest.builder().requestCPU(100).build())
            .description("test integration create extend app for extend sdk")
            .memory(ApimodelMemoryRequest.builder().requestMemory(100).build())
            .scenario("service-extension")
            .build())
        .build();

    final ApimodelAppItem createAppV2Res = appV2Wrapper.createAppV2(createAppV2Op);

    // ESAC

    assertNotNull(createAppV2Res);

    // CASE Get Extend app

    final GetAppV2 getAppV2Op = GetAppV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .build();

    final ApimodelAppItem getAppv2Res = appV2Wrapper.getAppV2(getAppV2Op);

    // ESAC

    assertEquals(EXTEND_APP_NAME, getAppv2Res.getAppName());

    final int waitAppCreatedCount = 60;

    for (int i = 0; i < waitAppCreatedCount; i++) {
      final ApimodelAppItem response = appV2Wrapper.getAppV2(GetAppV2.builder()
          .app(EXTEND_APP_NAME)
          .namespace(namespace)
          .build());

      if (response.getAppStatus().equals("app-undeployed")) {
        return;
      }

      System.out.printf("Waiting until Extend app created (%d/%d)\n", i + 1, waitAppCreatedCount);

      Thread.sleep(10000);
    }

    fail("Timeout waiting until Extend app created!");
  }

  @Test
  @Order(2)
  public void testSecretVariable() throws Exception {
    final ConfigurationV2 wrapper = new ConfigurationV2(sdk);

    // CASE Save secret variable

    final SaveSecretV2 saveSecretV2Op = SaveSecretV2
        .builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .body(ApimodelSaveConfigurationV2Request.builder()
            .configName("THIS_IS_A_SECRET")
            .value("ssshhhh")
            .source("plaintext")
            .applyMask(true)
            .build())
        .build();

    final ApimodelSaveConfigurationV2Response saveSecretV2Res = wrapper.saveSecretV2(saveSecretV2Op);

    // ESAC

    assertNotNull(saveSecretV2Res);

    final String secretConfigId = saveSecretV2Res.getConfigId();

    // CASE Get secret variable list

    final GetListOfSecretsV2 getListOfSecretsV2Op = GetListOfSecretsV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .build();

    final ApimodelGetListOfConfigurationsV2Response getListOfSecretsV2Res = wrapper
        .getListOfSecretsV2(getListOfSecretsV2Op);

    // ESAC

    assertNotNull(getListOfSecretsV2Res);

    // CASE Update secret variable

    final UpdateSecretV2 updateSecretV2Op = UpdateSecretV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(secretConfigId)
        .namespace(namespace)
        .body(ApimodelUpdateConfigurationV2Request.builder()
            .value("silence")
            .applyMask(true)
            .build())
        .build();

    final ApimodelUpdateConfigurationV2Response updateSecretV2Res = wrapper.updateSecretV2(updateSecretV2Op);

    // ESAC

    assertNotNull(updateSecretV2Res);

    // CASE Delete secret variable

    final DeleteSecretV2 operation = DeleteSecretV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(secretConfigId)
        .namespace(namespace)
        .build();

    wrapper.deleteSecretV2(operation);

    // ESAC
  }

  @Test
  @Order(3)
  public void testEnvironmentVariable() throws Exception {
    final ConfigurationV2 wrapper = new ConfigurationV2(sdk);

    // CASE Save environment variable

    final SaveVariableV2 saveVariableV2Op = SaveVariableV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .body(ApimodelSaveConfigurationV2Request.builder()
            .configName("MY_ENV_VAR")
            .value("helloworld!")
            .source("plaintext")
            .applyMask(true)
            .build())
        .build();

    final ApimodelSaveConfigurationV2Response saveVariableV2Res = wrapper.saveVariableV2(saveVariableV2Op);

    // ESAC

    assertNotNull(saveVariableV2Res);

    final String envConfigId = saveVariableV2Res.getConfigId();

    // CASE Get environment variable list

    final GetListOfVariablesV2 getListOfVariablesV2Op = GetListOfVariablesV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .build();
    final ApimodelGetListOfConfigurationsV2Response getListOfVariablesV2Res = wrapper
        .getListOfVariablesV2(getListOfVariablesV2Op);

    // ESAC

    assertNotNull(getListOfVariablesV2Res);

    // CASE Update environment variable

    final UpdateVariableV2 updateVariableV2Op = UpdateVariableV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(envConfigId)
        .namespace(namespace)
        .body(ApimodelUpdateConfigurationV2Request.builder()
            .value("hellosekai!")
            .applyMask(true)
            .build())
        .build();
    final ApimodelUpdateConfigurationV2Response updateVariableV2Res = wrapper.updateVariableV2(updateVariableV2Op);

    // ESAC

    assertNotNull(updateVariableV2Res);

    // CASE Delete environment variable

    final DeleteVariableV2 operation = DeleteVariableV2.builder()
        .app(EXTEND_APP_NAME)
        .configId(envConfigId)
        .namespace(namespace)
        .build();

    wrapper.deleteVariableV2(operation);

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    final AppV2 appV2Wrapper = new AppV2(sdk);

    // CASE Delete Extend app

    final DeleteAppV2 deleteAppV2Op = DeleteAppV2.builder()
        .app(EXTEND_APP_NAME)
        .namespace(namespace)
        .forced("true")
        .build();

    appV2Wrapper.deleteAppV2(deleteAppV2Op);

    // ESAC

    super.tear();
  }
}
