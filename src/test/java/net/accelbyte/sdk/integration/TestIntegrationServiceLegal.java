/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;
import net.accelbyte.sdk.api.legal.models.AcceptAgreementRequest;
import net.accelbyte.sdk.api.legal.models.RetrieveAcceptedAgreementResponse;
import net.accelbyte.sdk.api.legal.operations.agreement.ChangePreferenceConsent;
import net.accelbyte.sdk.api.legal.operations.agreement.RetrieveAgreementsPublic;
import net.accelbyte.sdk.api.legal.wrappers.Agreement;
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
public class TestIntegrationServiceLegal extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final Agreement agreementWrapper = new Agreement(sdk);

    // CASE Get agreements

    final List<RetrieveAcceptedAgreementResponse> agreements =
        agreementWrapper.retrieveAgreementsPublic(RetrieveAgreementsPublic.builder().build());

    // ESAC

    assertNotNull(agreements);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
