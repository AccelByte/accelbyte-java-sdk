/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_data_v3;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardDataV3;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

@Command(name = "deleteUserRankingByCycleIdAdminV3", mixinStandardHelpOptions = true)
public class DeleteUserRankingByCycleIdAdminV3 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DeleteUserRankingByCycleIdAdminV3.class);

  @Option(
      names = {"--cycleId"},
      description = "cycleId")
  String cycleId;

  @Option(
      names = {"--leaderboardCode"},
      description = "leaderboardCode")
  String leaderboardCode;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DeleteUserRankingByCycleIdAdminV3()).execute(args);
    System.exit(exitCode);
  }

  @Override
  public Integer call() {
    try {
      final OkhttpClient httpClient = new OkhttpClient();
      if (logging) {
        httpClient.setLogger(new OkhttpLogger());
      }
      final AccelByteSDK sdk =
          new AccelByteSDK(
              httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
      final LeaderboardDataV3 wrapper = new LeaderboardDataV3(sdk);
      final net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data_v3
              .DeleteUserRankingByCycleIdAdminV3
          operation =
              net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data_v3
                  .DeleteUserRankingByCycleIdAdminV3.builder()
                  .cycleId(cycleId)
                  .leaderboardCode(leaderboardCode)
                  .namespace(namespace)
                  .userId(userId)
                  .build();
      wrapper.deleteUserRankingByCycleIdAdminV3(operation);
      log.info("Operation successful");
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}
