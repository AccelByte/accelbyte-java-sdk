/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.sessionhistory.game_session_detail;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.sessionhistory.models.*;
import net.accelbyte.sdk.api.sessionhistory.wrappers.GameSessionDetail;
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

@Command(name = "adminQueryTicketDetail", mixinStandardHelpOptions = true)
public class AdminQueryTicketDetail implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminQueryTicketDetail.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--endDate"},
      description = "endDate")
  String endDate;

  @Option(
      names = {"--gameMode"},
      description = "gameMode")
  String gameMode;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--order"},
      description = "order")
  String order;

  @Option(
      names = {"--partyID"},
      description = "partyID")
  String partyID;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--startDate"},
      description = "startDate")
  String startDate;

  @Option(
      names = {"--userIDs"},
      description = "userIDs")
  String userIDs;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminQueryTicketDetail()).execute(args);
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
      final GameSessionDetail wrapper = new GameSessionDetail(sdk);
      final net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail
              .AdminQueryTicketDetail
          operation =
              net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail
                  .AdminQueryTicketDetail.builder()
                  .namespace(namespace)
                  .endDate(endDate)
                  .gameMode(gameMode)
                  .limit(limit)
                  .offset(offset)
                  .order(order)
                  .partyID(partyID)
                  .region(region)
                  .startDate(startDate)
                  .userIDs(userIDs)
                  .build();
      final ApimodelsTicketDetailQueryResponse response = wrapper.adminQueryTicketDetail(operation);
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
