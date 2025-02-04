/*
 * Copyright (c) 2022-2025 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.integration;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Map;
import java.util.Random;
import net.accelbyte.sdk.api.cloudsave.models.ModelsBinaryInfoResponse;
import net.accelbyte.sdk.api.cloudsave.models.ModelsBinaryRecordRequest;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameBinaryRecordAdminResponse;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameBinaryRecordCreate;
import net.accelbyte.sdk.api.cloudsave.models.ModelsGameRecordResponse;
import net.accelbyte.sdk.api.cloudsave.models.ModelsPlayerRecordResponse;
import net.accelbyte.sdk.api.cloudsave.models.ModelsUploadBinaryRecordResponse;
import net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminDeleteGameBinaryRecordV1;
import net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminGetGameBinaryRecordV1;
import net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminPostGameBinaryRecordV1;
import net.accelbyte.sdk.api.cloudsave.operations.admin_game_binary_record.AdminPutGameBinaryRecordV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.DeleteGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.GetGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PostGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_game_record.PutGameRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.DeletePlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.GetPlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.PostPlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.operations.public_player_record.PutPlayerRecordHandlerV1;
import net.accelbyte.sdk.api.cloudsave.wrappers.AdminGameBinaryRecord;
import net.accelbyte.sdk.api.cloudsave.wrappers.PublicGameRecord;
import net.accelbyte.sdk.api.cloudsave.wrappers.PublicPlayerRecord;
import net.accelbyte.sdk.api.iam.models.ModelUserResponseV3;
import net.accelbyte.sdk.api.iam.operations.users.AdminGetMyUserV3;
import net.accelbyte.sdk.api.iam.wrappers.Users;
import net.accelbyte.sdk.core.DummyGameRecord;
import net.accelbyte.sdk.core.DummyPlayerRecord;
import net.accelbyte.sdk.core.HttpResponseException;
import org.junit.jupiter.api.*;

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
  public void testGameRecord() throws Exception {
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

  @Test
  @Order(1)
  public void testPlayerRecord() throws Exception {
    final String playerRecordKey = "foo_bar_record";
    final String playerRecordFoo = "bar";
    final String playerRecordFooBar = "foo";
    final String playerRecordFooBarUpdate = "foo_update";
    final int playerRecordFooValue = 4893;

    final PublicPlayerRecord publicPlayerRecord = new PublicPlayerRecord(sdk);

    // TODO: For now we're using this to get userId, since token parser hasn't merged yet
    final Users usersWrapper = new Users(sdk);
    final ModelUserResponseV3 getUserResult =
        usersWrapper.adminGetMyUserV3(AdminGetMyUserV3.builder().build());
    assertNotNull(getUserResult);

    final String userId = getUserResult.getUserId();

    // CASE Create a player record

    final DummyPlayerRecord createPlayerRecordBody =
        DummyPlayerRecord.builder()
            .Foo(playerRecordFoo)
            .FooBar(playerRecordFooBar)
            .FooValue(playerRecordFooValue)
            .build();

    publicPlayerRecord.postPlayerRecordHandlerV1(
        PostPlayerRecordHandlerV1.builder()
            .namespace(this.namespace)
            .userId(userId)
            .key(playerRecordKey)
            .body(createPlayerRecordBody)
            .build());

    // ESAC

    // CASE Get a player record

    final ModelsPlayerRecordResponse getPlayerRecordResult =
        publicPlayerRecord.getPlayerRecordHandlerV1(
            GetPlayerRecordHandlerV1.builder()
                .namespace(this.namespace)
                .userId(userId)
                .key(playerRecordKey)
                .build());

    // ESAC

    assertNotNull(getPlayerRecordResult);

    final Map<String, ?> playerRecordValue1 = getPlayerRecordResult.getValue();

    assertNotNull(playerRecordValue1);
    assertTrue(playerRecordValue1.containsKey("foo_bar"));
    assertEquals(playerRecordFooBar, playerRecordValue1.get("foo_bar").toString());

    // CASE Update a player record

    DummyPlayerRecord updateRecord =
        DummyPlayerRecord.builder()
            .Foo(playerRecordFoo)
            .FooBar(playerRecordFooBarUpdate)
            .FooValue(playerRecordFooValue)
            .build();

    publicPlayerRecord.putPlayerRecordHandlerV1(
        PutPlayerRecordHandlerV1.builder()
            .namespace(this.namespace)
            .userId(userId)
            .key(playerRecordKey)
            .body(updateRecord)
            .build());

    // ESAC

    // Confirm if player record is updated

    final ModelsPlayerRecordResponse getGameRecordConfirmResult =
        publicPlayerRecord.getPlayerRecordHandlerV1(
            GetPlayerRecordHandlerV1.builder()
                .namespace(this.namespace)
                .userId(userId)
                .key(playerRecordKey)
                .build());

    assertNotNull(getGameRecordConfirmResult);
    final Map<String, ?> gameRecordValue2 = getGameRecordConfirmResult.getValue();
    assertNotNull(gameRecordValue2);
    assertTrue(gameRecordValue2.containsKey("foo"));
    assertEquals(playerRecordFoo, gameRecordValue2.get("foo").toString());
    assertTrue(gameRecordValue2.containsKey("foo_bar"));
    assertEquals(playerRecordFooBarUpdate, gameRecordValue2.get("foo_bar").toString());

    // CASE Delete a player record

    publicPlayerRecord.deletePlayerRecordHandlerV1(
        DeletePlayerRecordHandlerV1.builder()
            .namespace(this.namespace)
            .userId(userId)
            .key(playerRecordKey)
            .build());

    // ESAC

    // Confirm if player record is deleted

    assertThrows(
        HttpResponseException.class,
        () -> {
          publicPlayerRecord.getPlayerRecordHandlerV1(
              GetPlayerRecordHandlerV1.builder()
                  .namespace(this.namespace)
                  .key(playerRecordKey)
                  .build());
        });
  }

  @Test
  @Order(1)
  public void testUploadAndDownload() throws Exception {

    final Random random = new Random();

    byte[] sBinary = new byte[32];
    random.nextBytes(sBinary);

    final String binaryGameRecordKey = "foo_bar_binary_record_" + TestHelper.generateRandomId(6);
    final String binaryContentType = "application/octet-stream";

    // System.out.println("Record Key: " + binaryGameRecordKey);

    final AdminGameBinaryRecord adminGameBinaryRecord = new AdminGameBinaryRecord(sdk);

    // create and upload binary record
    final ModelsUploadBinaryRecordResponse cResponse =
        adminGameBinaryRecord.adminPostGameBinaryRecordV1(
            AdminPostGameBinaryRecordV1.builder()
                .namespace(this.namespace)
                .body(
                    ModelsGameBinaryRecordCreate.builder()
                        .key(binaryGameRecordKey)
                        .fileType("bin")
                        .setBy("CLIENT")
                        .build())
                .build());

    assertNotNull(cResponse);
    final String uploadUrl = cResponse.getUrl();
    assertNotNull(uploadUrl);

    final boolean isSuccess = sdk.uploadBinaryData(uploadUrl, sBinary, binaryContentType);
    assertTrue(isSuccess);

    if (isSuccess) {
      adminGameBinaryRecord.adminPutGameBinaryRecordV1(
          AdminPutGameBinaryRecordV1.builder()
              .namespace(this.namespace)
              .key(binaryGameRecordKey)
              .body(
                  ModelsBinaryRecordRequest.builder()
                      .contentType(binaryContentType)
                      .fileLocation(cResponse.getFileLocation())
                      .build())
              .build());
    }

    // get and download binary record
    final ModelsGameBinaryRecordAdminResponse sResponse =
        adminGameBinaryRecord.adminGetGameBinaryRecordV1(
            AdminGetGameBinaryRecordV1.builder()
                .namespace(this.namespace)
                .key(binaryGameRecordKey)
                .build());
    assertNotNull(sResponse);

    final ModelsBinaryInfoResponse binaryInfo = sResponse.getBinaryInfo();
    assertNotNull(binaryInfo);

    final String downloadUrl = binaryInfo.getUrl();
    assertNotNull(downloadUrl);

    byte[] downloadedData = sdk.downloadBinaryData(downloadUrl);
    assertArrayEquals(sBinary, downloadedData);

    // delete binary record
    adminGameBinaryRecord.adminDeleteGameBinaryRecordV1(
        AdminDeleteGameBinaryRecordV1.builder()
            .namespace(this.namespace)
            .key(binaryGameRecordKey)
            .build());
  }

  @AfterAll
  public void tear() throws Exception {
    super.tear();
  }
}
