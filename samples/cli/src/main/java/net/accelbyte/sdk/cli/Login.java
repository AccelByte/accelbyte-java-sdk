/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli;

import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "login", mixinStandardHelpOptions = true)
public class Login implements Runnable {
  private static final Logger log = LogManager.getLogger(Login.class);

  @Option(
      names = {"-u", "--username"},
      description = "username")
  String username;

  @Option(
      names = {"-p", "--password"},
      description = "password")
  String password;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  @Override
  public void run() {
    OkhttpClient httpClient = new OkhttpClient();
    if (logging) {
      httpClient.setLogger(new OkhttpLogger());
    }
    AccelByteSDK sdk =
        new AccelByteSDK(
            httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
    boolean login = sdk.loginUser(username, password);
    if (login) {
      log.info("login success");
    } else {
      log.fatal("login failed");
    }
  }
}
