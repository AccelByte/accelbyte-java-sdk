package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import net.accelbyte.sdk.api.ams.models.ApiAMSRegionsResponse;
import net.accelbyte.sdk.api.ams.models.ApiAvailableInstanceTypesResponse;
import net.accelbyte.sdk.api.ams.operations.ams_info.InfoRegions;
import net.accelbyte.sdk.api.ams.operations.ams_info.InfoSupportedInstances;
import net.accelbyte.sdk.api.ams.wrappers.AMSInfo;
import org.junit.jupiter.api.*;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceAms extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final AMSInfo amsInfoWrapper = new AMSInfo(sdk);

    // CASE Get AMS info for info region operation

    final ApiAMSRegionsResponse infoRegions =
        amsInfoWrapper.infoRegions(InfoRegions.builder().namespace(this.namespace).build());

    // ESAC

    assertNotNull(infoRegions);
    assertTrue(infoRegions.getRegions().size() > 0);

    // CASE Get AMS info for info region operation

    final ApiAvailableInstanceTypesResponse infoInstances =
        amsInfoWrapper.infoSupportedInstances(
            InfoSupportedInstances.builder().namespace(this.namespace).build());

    // ESAC

    assertNotNull(infoInstances);
    assertTrue(infoInstances.getAvailableInstanceTypes().size() > 0);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
