/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli;

import java.util.concurrent.Callable;
import net.accelbyte.sdk.cli.wrapper.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;

@CommandLine.Command(
    name = "sdk",
    mixinStandardHelpOptions = true,
    version = "1.0.0",
    subcommands = {
      Login.class,
      Logout.class,
      LoginClient.class,
      LobbyWebsocket.class,
      // API
      Achievement.class,
      Ams.class,
      Basic.class,
      Challenge.class,
      Chat.class,
      Cloudsave.class,
      Csm.class,
      Dsartifact.class,
      Dslogmanager.class,
      Dsmc.class,
      Gametelemetry.class,
      Gdpr.class,
      Group.class,
      Iam.class,
      Inventory.class,
      Leaderboard.class,
      Legal.class,
      Lobby.class,
      Loginqueue.class,
      Match2.class,
      Matchmaking.class,
      Platform.class,
      Qosm.class,
      Reporting.class,
      Seasonpass.class,
      Session.class,
      Sessionbrowser.class,
      Sessionhistory.class,
      Social.class,
      Ugc.class
      // API
    })
public class Main implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(Main.class);

  public static void main(String[] args) {
    int exitStatus =
        new CommandLine(new Main()).setCaseInsensitiveEnumValuesAllowed(true).execute(args);
    System.exit(exitStatus);
  }

  @Override
  public Integer call() throws Exception {
    log.info("welcome to java cli app");
    return 0;
  }
}
