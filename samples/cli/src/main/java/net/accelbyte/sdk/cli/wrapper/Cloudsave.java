/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.cloudsave.admin_concurrent_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_game_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_player_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.concurrent_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.public_game_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.public_player_record.*;
import picocli.CommandLine.Command;

@Command(
    name = "cloudsave",
    mixinStandardHelpOptions = true,
    subcommands = {
      AdminPutGameRecordConcurrentHandlerV1.class,
      ListGameRecordsHandlerV1.class,
      AdminGetGameRecordHandlerV1.class,
      AdminPutGameRecordHandlerV1.class,
      AdminPostGameRecordHandlerV1.class,
      AdminDeleteGameRecordHandlerV1.class,
      BulkGetPlayerRecordSizeHandlerV1.class,
      ListPlayerRecordHandlerV1.class,
      AdminPutPlayerRecordConcurrentHandlerV1.class,
      AdminPutPlayerPublicRecordConcurrentHandlerV1.class,
      AdminRetrievePlayerRecords.class,
      AdminGetPlayerRecordHandlerV1.class,
      AdminPutPlayerRecordHandlerV1.class,
      AdminPostPlayerRecordHandlerV1.class,
      AdminDeletePlayerRecordHandlerV1.class,
      AdminGetPlayerPublicRecordHandlerV1.class,
      AdminPutPlayerPublicRecordHandlerV1.class,
      AdminPostPlayerPublicRecordHandlerV1.class,
      AdminDeletePlayerPublicRecordHandlerV1.class,
      AdminGetPlayerRecordSizeHandlerV1.class,
      PutGameRecordConcurrentHandlerV1.class,
      GetGameRecordsBulk.class,
      GetGameRecordHandlerV1.class,
      PutGameRecordHandlerV1.class,
      PostGameRecordHandlerV1.class,
      DeleteGameRecordHandlerV1.class,
      BulkGetPlayerPublicRecordHandlerV1.class,
      RetrievePlayerRecords.class,
      GetPlayerRecordsBulkHandlerV1.class,
      PublicDeletePlayerPublicRecordHandlerV1.class,
      PutPlayerRecordConcurrentHandlerV1.class,
      PutPlayerPublicRecordConcurrentHandlerV1.class,
      GetOtherPlayerPublicRecordKeyHandlerV1.class,
      GetOtherPlayerPublicRecordHandlerV1.class,
      GetPlayerRecordHandlerV1.class,
      PutPlayerRecordHandlerV1.class,
      PostPlayerRecordHandlerV1.class,
      DeletePlayerRecordHandlerV1.class,
      GetPlayerPublicRecordHandlerV1.class,
      PutPlayerPublicRecordHandlerV1.class,
      PostPlayerPublicRecordHandlerV1.class,
    })
public class Cloudsave implements Runnable {

  @Override
  public void run() {}
}
