/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Map;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordResponse;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.DeleteGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.GetGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PostGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PutGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.wrappers.PublicGameRecord;
import net.accelbyte.sdk.core.DummyGameRecord;
import net.accelbyte.sdk.core.HttpResponseException;
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
public class TestIntegrationServiceCloudSave extends TestIntegration {
  @BeforeAll
  public void setup() throws Exception {
    super.setup();
  }

  @Test
  @Order(1)
  public void test() throws Exception {
    final String gameRecordKey = "foo_bar_record";
    final String gameRecordFoo = "bar";
    final String gameRecordFooBar = "foo";
    final String gameRecordFooBarUpdate = "foo_update";
    final int gameRecordFooValue = 4893;

    final PublicGameRecord publicGameRecordWrapper = new PublicGameRecord(sdk);

    // CASE Create a game record

    final DummyGameRecord createGameRecordBody =
        DummyGameRecord.builder()
            .Foo(gameRecordFoo)
            .FooBar(gameRecordFooBar)
            .FooValue(gameRecordFooValue)
            .build();

    publicGameRecordWrapper.postGameRecordHandlerV1(
        PostGameRecordHandlerV1.builder()
            .namespace(this.namespace)
            .key(gameRecordKey)
            .body(createGameRecordBody)
            .build());

    // ESAC

    // CASE Get a game record

    final ModelsGameRecordResponse getGameRecordResult =
        publicGameRecordWrapper.getGameRecordHandlerV1(
            GetGameRecordHandlerV1.builder().namespace(this.namespace).key(gameRecordKey).build());

    // ESAC

    assertNotNull(getGameRecordResult);

    final Map<String, ?> gameRecordValue1 = getGameRecordResult.getValue();

    assertNotNull(gameRecordValue1);
    assertTrue(gameRecordValue1.containsKey("foo_bar"));
    assertEquals(gameRecordFooBar, gameRecordValue1.get("foo_bar").toString());

    // CASE Update a game record

    DummyGameRecord updateRecord =
        DummyGameRecord.builder()
            .Foo(gameRecordFoo)
            .FooBar(gameRecordFooBarUpdate)
            .FooValue(gameRecordFooValue)
            .build();

    publicGameRecordWrapper.putGameRecordHandlerV1(
        PutGameRecordHandlerV1.builder()
            .namespace(this.namespace)
            .key(gameRecordKey)
            .body(updateRecord)
            .build());

    // ESAC

    // Confirm if game record is updated

    final ModelsGameRecordResponse getGameRecordConfirmResult =
        publicGameRecordWrapper.getGameRecordHandlerV1(
            GetGameRecordHandlerV1.builder().namespace(this.namespace).key(gameRecordKey).build());

    assertNotNull(getGameRecordConfirmResult);
    final Map<String, ?> gameRecordValue2 = getGameRecordConfirmResult.getValue();
    assertNotNull(gameRecordValue2);
    assertTrue(gameRecordValue2.containsKey("foo"));
    assertEquals(gameRecordFoo, gameRecordValue2.get("foo").toString());
    assertTrue(gameRecordValue2.containsKey("foo_bar"));
    assertEquals(gameRecordFooBarUpdate, gameRecordValue2.get("foo_bar").toString());

    // CASE Delete a game record

    publicGameRecordWrapper.deleteGameRecordHandlerV1(
        DeleteGameRecordHandlerV1.builder().namespace(this.namespace).key(gameRecordKey).build());

    // ESAC

    // Confirm if game record is deleted

    assertThrows(
        HttpResponseException.class,
        () -> {
          publicGameRecordWrapper.getGameRecordHandlerV1(
              GetGameRecordHandlerV1.builder()
                  .namespace(this.namespace)
                  .key(gameRecordKey)
                  .build());
        });
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
