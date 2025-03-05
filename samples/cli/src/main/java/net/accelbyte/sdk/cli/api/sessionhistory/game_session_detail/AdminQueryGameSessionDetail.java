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

@Command(name = "adminQueryGameSessionDetail", mixinStandardHelpOptions = true)
public class AdminQueryGameSessionDetail implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminQueryGameSessionDetail.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--completedOnly"},
      description = "completedOnly")
  String completedOnly;

  @Option(
      names = {"--configurationName"},
      description = "configurationName")
  String configurationName;

  @Option(
      names = {"--dsPodName"},
      description = "dsPodName")
  String dsPodName;

  @Option(
      names = {"--endDate"},
      description = "endDate")
  String endDate;

  @Option(
      names = {"--gameSessionID"},
      description = "gameSessionID")
  String gameSessionID;

  @Option(
      names = {"--isPersistent"},
      description = "isPersistent")
  String isPersistent;

  @Option(
      names = {"--joinability"},
      description = "joinability")
  String joinability;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--matchPool"},
      description = "matchPool")
  String matchPool;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--order"},
      description = "order")
  String order;

  @Option(
      names = {"--orderBy"},
      description = "orderBy")
  String orderBy;

  @Option(
      names = {"--startDate"},
      description = "startDate")
  String startDate;

  @Option(
      names = {"--statusV2"},
      description = "statusV2")
  String statusV2;

  @Option(
      names = {"--userID"},
      description = "userID")
  String userID;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminQueryGameSessionDetail()).execute(args);
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
              .AdminQueryGameSessionDetail
          operation =
              net.accelbyte.sdk.api.sessionhistory.operations.game_session_detail
                  .AdminQueryGameSessionDetail.builder()
                  .namespace(namespace)
                  .completedOnly(completedOnly)
                  .configurationName(configurationName)
                  .dsPodName(dsPodName)
                  .endDate(endDate)
                  .gameSessionID(gameSessionID)
                  .isPersistent(isPersistent)
                  .joinability(joinability)
                  .limit(limit)
                  .matchPool(matchPool)
                  .offset(offset)
                  .order(order)
                  .orderBy(orderBy)
                  .startDate(startDate)
                  .statusV2(statusV2)
                  .userID(userID)
                  .build();
      final ApimodelsGameSessionDetailQueryResponse response =
          wrapper.adminQueryGameSessionDetail(operation);
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
