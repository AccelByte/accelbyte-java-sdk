/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.sessionbrowser.session;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
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

@Command(name = "adminSearchSessionsV2", mixinStandardHelpOptions = true)
public class AdminSearchSessionsV2 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminSearchSessionsV2.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--channel"},
      description = "channel")
  String channel;

  @Option(
      names = {"--deleted"},
      description = "deleted")
  Boolean deleted;

  @Option(
      names = {"--matchID"},
      description = "matchID")
  String matchID;

  @Option(
      names = {"--partyID"},
      description = "partyID")
  String partyID;

  @Option(
      names = {"--userID"},
      description = "userID")
  String userID;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminSearchSessionsV2()).execute(args);
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
      Session wrapper = new Session(sdk);
      net.accelbyte.sdk.api.sessionbrowser.operations.session.AdminSearchSessionsV2 operation =
          net.accelbyte.sdk.api.sessionbrowser.operations.session.AdminSearchSessionsV2.builder()
              .namespace(namespace)
              .channel(channel)
              .deleted(deleted)
              .matchID(matchID)
              .partyID(partyID)
              .userID(userID)
              .limit(limit)
              .offset(offset)
              .build();
      ModelsGetSessionHistorySearchResponseV2 response = wrapper.adminSearchSessionsV2(operation);
      String responseString =
          new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
      log.info("Operation successful with response below:\n{}", responseString);
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
