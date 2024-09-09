/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.gametelemetry.telemetry;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.api.gametelemetry.wrappers.Telemetry;
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
      names = {"--deviceType"},
      description = "deviceType")
  String deviceType;

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
      names = {"--flightId"},
      description = "flightId")
  String flightId;

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
      names = {"--userId"},
      description = "userId")
  String userId;

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
      final OkhttpClient httpClient = new OkhttpClient();
      if (logging) {
        httpClient.setLogger(new OkhttpLogger());
      }
      final AccelByteSDK sdk =
          new AccelByteSDK(
              httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
      final Telemetry wrapper = new Telemetry(sdk);
      final net.accelbyte.sdk.api.gametelemetry.operations.telemetry
              .GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet
          operation =
              net.accelbyte.sdk.api.gametelemetry.operations.telemetry
                  .GetEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet.builder()
                  .namespace(namespace)
                  .deviceType(deviceType)
                  .endTime(endTime)
                  .eventId(eventId)
                  .eventName(eventName)
                  .eventPayload(eventPayload)
                  .flightId(flightId)
                  .limit(limit)
                  .offset(offset)
                  .startTime(startTime)
                  .userId(userId)
                  .build();
      final PagedResponseGetNamespaceEventResponse response =
          wrapper.getEventsGameTelemetryV1AdminNamespacesNamespaceEventsGet(operation);
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
