/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.clawback;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Clawback;
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

@Command(name = "queryIAPClawbackHistory", mixinStandardHelpOptions = true)
public class QueryIAPClawbackHistory implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(QueryIAPClawbackHistory.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--endTime"},
      description = "endTime")
  String endTime;

  @Option(
      names = {"--eventType"},
      description = "eventType")
  String eventType;

  @Option(
      names = {"--externalOrderId"},
      description = "externalOrderId")
  String externalOrderId;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--startTime"},
      description = "startTime")
  String startTime;

  @Option(
      names = {"--status"},
      description = "status")
  String status;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new QueryIAPClawbackHistory()).execute(args);
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
      final Clawback wrapper = new Clawback(sdk);
      final net.accelbyte.sdk.api.platform.operations.clawback.QueryIAPClawbackHistory operation =
          net.accelbyte.sdk.api.platform.operations.clawback.QueryIAPClawbackHistory.builder()
              .namespace(namespace)
              .endTime(endTime)
              .eventType(eventType)
              .externalOrderId(externalOrderId)
              .limit(limit)
              .offset(offset)
              .startTime(startTime)
              .status(status)
              .userId(userId)
              .build();
      final IAPClawbackPagingSlicedResult response = wrapper.queryIAPClawbackHistory(operation);
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
