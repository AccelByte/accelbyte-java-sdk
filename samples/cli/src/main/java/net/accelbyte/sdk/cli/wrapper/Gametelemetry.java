/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.gametelemetry.gametelemetry_operations.*;
import net.accelbyte.sdk.cli.api.gametelemetry.telemetry.*;
import picocli.CommandLine.Command;

@Command(
    name = "gametelemetry",
    mixinStandardHelpOptions = true,
    subcommands = {
      GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.class,
      ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.class,
      ProtectedGetPlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimeGet.class,
      ProtectedUpdatePlaytimeGameTelemetryV1ProtectedSteamIdsSteamIdPlaytimePlaytimePut.class,
    })
public class Gametelemetry implements Runnable {

  @Override
  public void run() {}
}
