/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.match2.backfill;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.match2.models.*;
import net.accelbyte.sdk.api.match2.wrappers.Backfill;
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

@Command(name = "adminQueryBackfill", mixinStandardHelpOptions = true)
public class AdminQueryBackfill implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminQueryBackfill.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--fromTime"},
      description = "fromTime")
  String fromTime;

  @Option(
      names = {"--isActive"},
      description = "isActive")
  Boolean isActive;

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
      names = {"--playerID"},
      description = "playerID")
  String playerID;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--sessionID"},
      description = "sessionID")
  String sessionID;

  @Option(
      names = {"--toTime"},
      description = "toTime")
  String toTime;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminQueryBackfill()).execute(args);
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
      final Backfill wrapper = new Backfill(sdk);
      final net.accelbyte.sdk.api.match2.operations.backfill.AdminQueryBackfill operation =
          net.accelbyte.sdk.api.match2.operations.backfill.AdminQueryBackfill.builder()
              .namespace(namespace)
              .fromTime(fromTime)
              .isActive(isActive)
              .limit(limit)
              .matchPool(matchPool)
              .offset(offset)
              .playerID(playerID)
              .region(region)
              .sessionID(sessionID)
              .toTime(toTime)
              .build();
      final ApiListBackfillQueryResponse response = wrapper.adminQueryBackfill(operation);
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
