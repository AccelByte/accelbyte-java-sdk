/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import net.accelbyte.sdk.api.eventlog.models.ModelsEventResponseV2;
import net.accelbyte.sdk.api.eventlog.models.ModelsGenericQueryPayload;
import net.accelbyte.sdk.api.eventlog.operations.event_v2.GetEventSpecificUserV2Handler;
import net.accelbyte.sdk.api.eventlog.operations.event_v2.QueryEventStreamHandler;
import net.accelbyte.sdk.api.eventlog.wrappers.EventV2;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminGetMyUserV3;
import net.accelbyte.sdk.api.iam.wrappers.Users;
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
public class TestIntegrationServiceEventLog extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final Users usersWrapper = new Users(sdk);
    final EventV2 eventV2Wrapper = new EventV2(sdk);

    final ModelUserResponseV3 getUserResult =
        usersWrapper.adminGetMyUserV3(AdminGetMyUserV3.builder().build());

    assertNotNull(getUserResult);

    // CASE Get a set of events

    final ModelsGenericQueryPayload queryEventStreamBody =
        ModelsGenericQueryPayload.builder()
            .clientId(sdk.getSdkConfiguration().getConfigRepository().getClientId())
            .build();

    final ModelsEventResponseV2 queryEventStreamResult =
        eventV2Wrapper.queryEventStreamHandler(
            QueryEventStreamHandler.builder()
                .namespace(this.namespace)
                .offset(0)
                .pageSize(10)
                .body(queryEventStreamBody)
                .build());

    // ESAC

    assertNotNull(queryEventStreamResult);

    // CASE Get specific user events

    final ModelsEventResponseV2 getEventSpecificUserResult =
        eventV2Wrapper.getEventSpecificUserV2Handler(
            GetEventSpecificUserV2Handler.builder()
                .namespace(this.namespace)
                .userId(getUserResult.getUserId())
                .offset(0)
                .pageSize(10)
                .build());

    // ESAC

    assertNotNull(getEventSpecificUserResult);
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
