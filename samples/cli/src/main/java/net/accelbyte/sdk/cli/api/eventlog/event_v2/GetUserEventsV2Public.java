/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.eventlog.event_v2;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.EventV2;
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

@Command(name = "getUserEventsV2Public", mixinStandardHelpOptions = true)
public class GetUserEventsV2Public implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(GetUserEventsV2Public.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--endDate"},
      description = "endDate")
  String endDate;

  @Option(
      names = {"--eventName"},
      description = "eventName")
  String eventName;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--pageSize"},
      description = "pageSize")
  Integer pageSize;

  @Option(
      names = {"--startDate"},
      description = "startDate")
  String startDate;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new GetUserEventsV2Public()).execute(args);
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
      final EventV2 wrapper = new EventV2(sdk);
      final net.accelbyte.sdk.api.eventlog.operations.event_v2.GetUserEventsV2Public operation =
          net.accelbyte.sdk.api.eventlog.operations.event_v2.GetUserEventsV2Public.builder()
              .namespace(namespace)
              .userId(userId)
              .endDate(endDate)
              .eventName(eventName)
              .offset(offset)
              .pageSize(pageSize)
              .startDate(startDate)
              .build();
      final ModelsEventResponseV2 response = wrapper.getUserEventsV2Public(operation);
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
