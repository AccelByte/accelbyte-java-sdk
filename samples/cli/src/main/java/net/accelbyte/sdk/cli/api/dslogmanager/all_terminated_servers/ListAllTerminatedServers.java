/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.dslogmanager.all_terminated_servers;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.wrappers.AllTerminatedServers;
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

@Command(name = "listAllTerminatedServers", mixinStandardHelpOptions = true)
public class ListAllTerminatedServers implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(ListAllTerminatedServers.class);

  @Option(
      names = {"--deployment"},
      description = "deployment")
  String deployment;

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
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--next"},
      description = "next")
  String next;

  @Option(
      names = {"--partyId"},
      description = "partyId")
  String partyId;

  @Option(
      names = {"--podName"},
      description = "podName")
  String podName;

  @Option(
      names = {"--previous"},
      description = "previous")
  String previous;

  @Option(
      names = {"--provider"},
      description = "provider")
  String provider;

  @Option(
      names = {"--region"},
      description = "region")
  String region;

  @Option(
      names = {"--sessionId"},
      description = "sessionId")
  String sessionId;

  @Option(
      names = {"--startDate"},
      description = "startDate")
  String startDate;

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
    int exitCode = new CommandLine(new ListAllTerminatedServers()).execute(args);
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
      final AllTerminatedServers wrapper = new AllTerminatedServers(sdk);
      final net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers
              .ListAllTerminatedServers
          operation =
              net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers
                  .ListAllTerminatedServers.builder()
                  .deployment(deployment)
                  .endDate(endDate)
                  .gameMode(gameMode)
                  .limit(limit)
                  .namespace(namespace)
                  .next(next)
                  .partyId(partyId)
                  .podName(podName)
                  .previous(previous)
                  .provider(provider)
                  .region(region)
                  .sessionId(sessionId)
                  .startDate(startDate)
                  .status(status)
                  .userId(userId)
                  .build();
      final ModelsListTerminatedServersResponse response =
          wrapper.listAllTerminatedServers(operation);
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
