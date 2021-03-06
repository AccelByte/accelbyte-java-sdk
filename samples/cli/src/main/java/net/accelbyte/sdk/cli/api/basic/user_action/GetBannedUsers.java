/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.basic.user_action;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.basic.models.*;
import net.accelbyte.sdk.api.basic.wrappers.UserAction;
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

@Command(name = "getBannedUsers", mixinStandardHelpOptions = true)
public class GetBannedUsers implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(GetBannedUsers.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userIds"},
      description = "userIds")
  List<String> userIds;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new GetBannedUsers()).execute(args);
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
      UserAction wrapper = new UserAction(sdk);
      net.accelbyte.sdk.api.basic.operations.user_action.GetBannedUsers operation =
          net.accelbyte.sdk.api.basic.operations.user_action.GetBannedUsers.builder()
              .namespace(namespace)
              .userIds(userIds)
              .build();
      List<ADTOObjectForEqu8UserBanStatus> response = wrapper.getBannedUsers(operation);
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
