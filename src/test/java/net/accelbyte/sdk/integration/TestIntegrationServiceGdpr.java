/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.DeleteAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.GetAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.SaveAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.operations.data_retrieval.UpdateAdminEmailConfiguration;
import net.accelbyte.sdk.api.gdpr.wrappers.DataRetrieval;
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
public class TestIntegrationServiceGdpr extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String email1 = "email1@example.com";
    final String email2 = "email2@dummy.com";

    final DataRetrieval dataRetrievalWrapper = new DataRetrieval(sdk);

    // CASE Save admin email configuration

    dataRetrievalWrapper.saveAdminEmailConfiguration(
        SaveAdminEmailConfiguration.builder()
            .namespace(this.namespace)
            .body(Arrays.asList(new String[] {email1}))
            .build());

    // ESAC

    // CASE Get admin email configuration

    final List<String> emails =
        dataRetrievalWrapper.getAdminEmailConfiguration(
            GetAdminEmailConfiguration.builder().namespace(this.namespace).build());

    // ESAC

    assertNotNull(emails);

    // CASE Update admin email configuration

    dataRetrievalWrapper.updateAdminEmailConfiguration(
        UpdateAdminEmailConfiguration.builder()
            .namespace(this.namespace)
            .body(Arrays.asList(new String[] {email2}))
            .build());

    // ESAC

    // CASE Delete admin email configuration

    dataRetrievalWrapper.deleteAdminEmailConfiguration(
        DeleteAdminEmailConfiguration.builder()
            .namespace(this.namespace)
            .emails(Arrays.asList(new String[] {email2}))
            .build());

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
