/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.gametelemetry.gametelemetry_operations;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.gametelemetry.models.*;
import net.accelbyte.sdk.api.gametelemetry.wrappers.GametelemetryOperations;
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
    name = "protectedSaveEventsGameTelemetryV1ProtectedEventsPost",
    mixinStandardHelpOptions = true)
public class ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.class);

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode =
        new CommandLine(new ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost()).execute(args);
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
      final GametelemetryOperations wrapper = new GametelemetryOperations(sdk);
      final net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations
              .ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost
          operation =
              net.accelbyte.sdk.api.gametelemetry.operations.gametelemetry_operations
                  .ProtectedSaveEventsGameTelemetryV1ProtectedEventsPost.builder()
                  .body(
                      new ObjectMapper()
                          .readValue(body, new TypeReference<List<TelemetryBody>>() {}))
                  .build();
      wrapper.protectedSaveEventsGameTelemetryV1ProtectedEventsPost(operation);
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
