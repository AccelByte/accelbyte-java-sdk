/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.session.game_session;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.wrappers.GameSession;
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

@Command(name = "adminQueryGameSessions", mixinStandardHelpOptions = true)
public class AdminQueryGameSessions implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminQueryGameSessions.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--configurationName"},
      description = "configurationName")
  String configurationName;

  @Option(
      names = {"--dsPodName"},
      description = "dsPodName")
  String dsPodName;

  @Option(
      names = {"--fromTime"},
      description = "fromTime")
  String fromTime;

  @Option(
      names = {"--gameMode"},
      description = "gameMode")
  String gameMode;

  @Option(
      names = {"--isPersistent"},
      description = "isPersistent")
  String isPersistent;

  @Option(
      names = {"--isSoftDeleted"},
      description = "isSoftDeleted")
  String isSoftDeleted;

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
      names = {"--memberID"},
      description = "memberID")
  String memberID;

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
      names = {"--sessionID"},
      description = "sessionID")
  String sessionID;

  @Option(
      names = {"--status"},
      description = "status")
  String status;

  @Option(
      names = {"--statusV2"},
      description = "statusV2")
  String statusV2;

  @Option(
      names = {"--toTime"},
      description = "toTime")
  String toTime;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminQueryGameSessions()).execute(args);
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
      final GameSession wrapper = new GameSession(sdk);
      final net.accelbyte.sdk.api.session.operations.game_session.AdminQueryGameSessions operation =
          net.accelbyte.sdk.api.session.operations.game_session.AdminQueryGameSessions.builder()
              .namespace(namespace)
              .configurationName(configurationName)
              .dsPodName(dsPodName)
              .fromTime(fromTime)
              .gameMode(gameMode)
              .isPersistent(isPersistent)
              .isSoftDeleted(isSoftDeleted)
              .joinability(joinability)
              .limit(limit)
              .matchPool(matchPool)
              .memberID(memberID)
              .offset(offset)
              .order(order)
              .orderBy(orderBy)
              .sessionID(sessionID)
              .status(status)
              .statusV2(statusV2)
              .toTime(toTime)
              .build();
      final ApimodelsGameSessionQueryResponse response = wrapper.adminQueryGameSessions(operation);
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
