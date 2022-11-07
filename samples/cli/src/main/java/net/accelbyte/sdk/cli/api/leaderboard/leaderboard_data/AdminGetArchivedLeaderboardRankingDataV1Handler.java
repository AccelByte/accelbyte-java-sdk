/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_data;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardData;
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

@Command(name = "adminGetArchivedLeaderboardRankingDataV1Handler", mixinStandardHelpOptions = true)
public class AdminGetArchivedLeaderboardRankingDataV1Handler implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(AdminGetArchivedLeaderboardRankingDataV1Handler.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--slug"},
      description = "slug")
  String slug;

  @Option(
      names = {"--leaderboardCodes"},
      description = "leaderboardCodes")
  String leaderboardCodes;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode =
        new CommandLine(new AdminGetArchivedLeaderboardRankingDataV1Handler()).execute(args);
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
      final LeaderboardData wrapper = new LeaderboardData(sdk);
      final net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data
              .AdminGetArchivedLeaderboardRankingDataV1Handler
          operation =
              net.accelbyte.sdk.api.leaderboard.operations.leaderboard_data
                  .AdminGetArchivedLeaderboardRankingDataV1Handler.builder()
                  .namespace(namespace)
                  .slug(slug)
                  .leaderboardCodes(leaderboardCodes)
                  .build();
      final List<ModelsArchiveLeaderboardSignedURLResponse> response =
          wrapper.adminGetArchivedLeaderboardRankingDataV1Handler(operation);
      final String responseString =
          new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
      log.info("Operation successful\n{}", responseString);
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}
