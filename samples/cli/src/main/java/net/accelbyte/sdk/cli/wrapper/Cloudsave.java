/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.cloudsave.admin_concurrent_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_game_binary_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_game_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_player_binary_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_player_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.admin_tags.*;
import net.accelbyte.sdk.cli.api.cloudsave.concurrent_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.plugin_config.*;
import net.accelbyte.sdk.cli.api.cloudsave.public_game_binary_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.public_game_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.public_player_binary_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.public_player_record.*;
import net.accelbyte.sdk.cli.api.cloudsave.public_tags.*;
import net.accelbyte.sdk.cli.api.cloudsave.ttl_config.*;
import picocli.CommandLine.Command;

@Command(
    name = "cloudsave",
    mixinStandardHelpOptions = true,
    subcommands = {
      AdminListAdminGameRecordV1.class,
      AdminBulkGetAdminGameRecordV1.class,
      AdminGetAdminGameRecordV1.class,
      AdminPutAdminGameRecordV1.class,
      AdminPostAdminGameRecordV1.class,
      AdminDeleteAdminGameRecordV1.class,
      AdminListGameBinaryRecordsV1.class,
      AdminPostGameBinaryRecordV1.class,
      AdminGetGameBinaryRecordV1.class,
      AdminPutGameBinaryRecordV1.class,
      AdminDeleteGameBinaryRecordV1.class,
      AdminPutGameBinaryRecorMetadataV1.class,
      AdminPostGameBinaryPresignedURLV1.class,
      DeleteGameBinaryRecordTTLConfig.class,
      AdminPutAdminGameRecordConcurrentHandlerV1.class,
      AdminPutGameRecordConcurrentHandlerV1.class,
      GetPluginConfig.class,
      CreatePluginConfig.class,
      DeletePluginConfig.class,
      UpdatePluginConfig.class,
      ListGameRecordsHandlerV1.class,
      AdminGetGameRecordHandlerV1.class,
      AdminPutGameRecordHandlerV1.class,
      AdminPostGameRecordHandlerV1.class,
      AdminDeleteGameRecordHandlerV1.class,
      DeleteGameRecordTTLConfig.class,
      AdminListTagsHandlerV1.class,
      AdminPostTagHandlerV1.class,
      AdminDeleteTagHandlerV1.class,
      BulkGetAdminPlayerRecordByUserIdsV1.class,
      BulkGetPlayerRecordSizeHandlerV1.class,
      ListPlayerRecordHandlerV1.class,
      AdminBulkPutPlayerRecordsByKeyHandlerV1.class,
      AdminBulkGetPlayerRecordsByUserIDsHandlerV1.class,
      AdminListAdminUserRecordsV1.class,
      AdminBulkGetAdminPlayerRecordV1.class,
      AdminGetAdminPlayerRecordV1.class,
      AdminPutAdminPlayerRecordV1.class,
      AdminPostPlayerAdminRecordV1.class,
      AdminDeleteAdminPlayerRecordV1.class,
      AdminListPlayerBinaryRecordsV1.class,
      AdminPostPlayerBinaryRecordV1.class,
      AdminGetPlayerBinaryRecordV1.class,
      AdminPutPlayerBinaryRecordV1.class,
      AdminDeletePlayerBinaryRecordV1.class,
      AdminPutPlayerBinaryRecorMetadataV1.class,
      AdminPostPlayerBinaryPresignedURLV1.class,
      AdminPutAdminPlayerRecordConcurrentHandlerV1.class,
      AdminPutPlayerRecordConcurrentHandlerV1.class,
      AdminPutPlayerPublicRecordConcurrentHandlerV1.class,
      AdminRetrievePlayerRecords.class,
      AdminPutPlayerRecordsHandlerV1.class,
      AdminGetPlayerRecordsHandlerV1.class,
      AdminGetPlayerRecordHandlerV1.class,
      AdminPutPlayerRecordHandlerV1.class,
      AdminPostPlayerRecordHandlerV1.class,
      AdminDeletePlayerRecordHandlerV1.class,
      AdminGetPlayerPublicRecordHandlerV1.class,
      AdminPutPlayerPublicRecordHandlerV1.class,
      AdminPostPlayerPublicRecordHandlerV1.class,
      AdminDeletePlayerPublicRecordHandlerV1.class,
      AdminGetPlayerRecordSizeHandlerV1.class,
      ListGameBinaryRecordsV1.class,
      PostGameBinaryRecordV1.class,
      BulkGetGameBinaryRecordV1.class,
      GetGameBinaryRecordV1.class,
      PutGameBinaryRecordV1.class,
      DeleteGameBinaryRecordV1.class,
      PostGameBinaryPresignedURLV1.class,
      PutGameRecordConcurrentHandlerV1.class,
      GetGameRecordsBulk.class,
      GetGameRecordHandlerV1.class,
      PutGameRecordHandlerV1.class,
      PostGameRecordHandlerV1.class,
      DeleteGameRecordHandlerV1.class,
      PublicListTagsHandlerV1.class,
      BulkGetPlayerPublicBinaryRecordsV1.class,
      BulkGetPlayerPublicRecordHandlerV1.class,
      ListMyBinaryRecordsV1.class,
      BulkGetMyBinaryRecordV1.class,
      RetrievePlayerRecords.class,
      GetPlayerRecordsBulkHandlerV1.class,
      PublicDeletePlayerPublicRecordHandlerV1.class,
      PostPlayerBinaryRecordV1.class,
      ListOtherPlayerPublicBinaryRecordsV1.class,
      BulkGetOtherPlayerPublicBinaryRecordsV1.class,
      GetPlayerBinaryRecordV1.class,
      PutPlayerBinaryRecordV1.class,
      DeletePlayerBinaryRecordV1.class,
      PutPlayerBinaryRecorMetadataV1.class,
      PostPlayerBinaryPresignedURLV1.class,
      GetPlayerPublicBinaryRecordsV1.class,
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
