/*
 * Copyright (c) 2023 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.ArrayList;
import java.util.UUID;

import org.junit.jupiter.api.*;

import net.accelbyte.sdk.api.chat.models.ModelsDictionary;
import net.accelbyte.sdk.api.chat.models.ModelsDictionaryInsertRequest;
import net.accelbyte.sdk.api.chat.models.ModelsDictionaryQueryResult;
import net.accelbyte.sdk.api.chat.models.ModelsDictionaryUpdateRequest;
import net.accelbyte.sdk.api.chat.operations.profanity.AdminProfanityCreate;
import net.accelbyte.sdk.api.chat.operations.profanity.AdminProfanityDelete;
import net.accelbyte.sdk.api.chat.operations.profanity.AdminProfanityQuery;
import net.accelbyte.sdk.api.chat.operations.profanity.AdminProfanityUpdate;
import net.accelbyte.sdk.api.chat.wrappers.Profanity;

@Tag("test-integration")
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class TestIntegrationServiceChat extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String profanityPrefix = "assert";
    final String profanityWord1 = String.format("%s%s", profanityPrefix, UUID.randomUUID());
    final String profanityWord2 = String.format("%s%s", profanityPrefix, UUID.randomUUID());

    final Profanity profanityWrapper = new Profanity(sdk);

    // CASE Add word to profanity filter

    final AdminProfanityCreate adminProfanityCreateOp = AdminProfanityCreate
        .builder()
        .namespace(namespace)
        .body(ModelsDictionaryInsertRequest.builder()
            .falseNegative(new ArrayList<String>())
            .falsePositive(new ArrayList<String>())
            .word(profanityWord1)
            .wordType("FALSEPOSITIVE")
            .build())
        .build();

    final ModelsDictionary adminProfanityCreateResponse = profanityWrapper.adminProfanityCreate(adminProfanityCreateOp);

    // ESAC

    assertNotNull(adminProfanityCreateResponse.getId());

    final String profanityId = adminProfanityCreateResponse.getId();

    // CASE Update word in profanity filter

    final AdminProfanityUpdate adminProfanityUpdateOp = AdminProfanityUpdate.builder()
        .id(profanityId)
        .namespace(namespace)
        .body(ModelsDictionaryUpdateRequest.builder()
            .falseNegative(new ArrayList<String>())
            .falsePositive(new ArrayList<String>())
            .word(profanityWord2)
            .wordType("FALSEPOSITIVE")
            .build())
        .build();

    profanityWrapper.adminProfanityUpdate(adminProfanityUpdateOp);

    // ESAC

    // CASE Query word in profanity filter

    final AdminProfanityQuery adminProfanityQueryOp = AdminProfanityQuery.builder()
        .namespace(namespace)
        .startWith(profanityPrefix)
        .build();

    final ModelsDictionaryQueryResult adminProfanityQueryResponse = profanityWrapper
        .adminProfanityQuery(adminProfanityQueryOp);

    // ESAC

    assertTrue(adminProfanityQueryResponse.getData().size() > 0);
    assertTrue(adminProfanityQueryResponse.getData().stream().anyMatch(it -> it.getWord().equals(profanityWord2)));

    // CASE Delete word from profanity filter

    final AdminProfanityDelete adminProfanityDeleteOp = AdminProfanityDelete.builder()
        .id(profanityId)
        .namespace(namespace)
        .build();

    profanityWrapper.adminProfanityDelete(adminProfanityDeleteOp);

    // ESAC
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
