/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import net.accelbyte.sdk.api.match2.models.ApiListMatchFunctionsResponse;
import net.accelbyte.sdk.api.match2.operations.match_functions.MatchFunctionList;
import net.accelbyte.sdk.api.match2.operations.operations.GetHealthcheckInfoV1;
import net.accelbyte.sdk.api.match2.wrappers.MatchFunctions;
import net.accelbyte.sdk.api.match2.wrappers.Operations;
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
public class TestIntegrationServiceMatch2 extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {

    final Operations operationsWrapper = new Operations(sdk);

    operationsWrapper.getHealthcheckInfoV1(GetHealthcheckInfoV1.builder().build());

    final MatchFunctions matchFunctionsWrapper = new MatchFunctions(sdk);

    final ApiListMatchFunctionsResponse response =
        matchFunctionsWrapper.matchFunctionList(
            MatchFunctionList.builder().namespace(this.namespace).build());

    assertNotNull(response);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
