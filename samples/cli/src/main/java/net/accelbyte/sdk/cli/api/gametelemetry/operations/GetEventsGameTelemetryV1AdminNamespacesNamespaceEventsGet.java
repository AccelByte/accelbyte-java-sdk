/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.gametelemetry.operations;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.api.gametelemetry.wrappers.Operations;
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

@Command(
    name = "getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet",
    mixinStandardHelpOptions = true)
public class GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
    implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--endTime"},
      description = "endTime")
  String endTime;

  @Option(
      names = {"--eventId"},
      description = "eventId")
  String eventId;

  @Option(
      names = {"--eventName"},
      description = "eventName")
  String eventName;

  @Option(
      names = {"--eventPayload"},
      description = "eventPayload")
  String eventPayload;

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
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode =
        new CommandLine(new GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet())
            .execute(args);
    System.exit(exitCode);
  }

  @Override
  public Integer call() {
    try {
      OkhttpClient httpClient = new OkhttpClient();
      if (logging) {
        httpClient.setLogger(new OkhttpLogger());
      }
      AccelByteSDK sdk =
          new AccelByteSDK(
              httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
      Operations wrapper = new Operations(sdk);
      net.accelbyte.sdk.api.gametelemetry.operations.operations
              .GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
          operation =
              net.accelbyte.sdk.api.gametelemetry.operations.operations
                  .GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.builder()
                  .namespace(namespace)
                  .endTime(endTime)
                  .eventId(eventId)
                  .eventName(eventName)
                  .eventPayload(eventPayload)
                  .limit(limit)
                  .offset(offset)
                  .startTime(startTime)
                  .build();
      wrapper.getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet(operation);
      log.info("Operation successful");
      return 0;
    } catch (HttpResponseException e) {
      log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
      System.err.print(e.getHttpCode());
    } catch (Exception e) {
      log.error("Exception occur with message below:\n{}", e.getMessage());
    }
    return 1;
  }
}