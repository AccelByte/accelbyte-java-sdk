/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.users;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.Users;
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

@Command(name = "adminListUserIDByPlatformUserIDsV3", mixinStandardHelpOptions = true)
public class AdminListUserIDByPlatformUserIDsV3 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminListUserIDByPlatformUserIDsV3.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--platformId"},
      description = "platformId")
  String platformId;

  @Option(
      names = {"--rawPID"},
      description = "rawPID")
  Boolean rawPID;

  @Option(
      names = {"--rawPUID"},
      description = "rawPUID")
  Boolean rawPUID;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminListUserIDByPlatformUserIDsV3()).execute(args);
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
      final Users wrapper = new Users(sdk);
      final net.accelbyte.sdk.api.iam.operations.users.AdminListUserIDByPlatformUserIDsV3
          operation =
              net.accelbyte.sdk.api.iam.operations.users.AdminListUserIDByPlatformUserIDsV3
                  .builder()
                  .namespace(namespace)
                  .platformId(platformId)
                  .rawPID(rawPID)
                  .rawPUID(rawPUID)
                  .body(new ObjectMapper().readValue(body, ModelPlatformUserIDRequest.class))
                  .build();
      final AccountcommonUserPlatforms response =
          wrapper.adminListUserIDByPlatformUserIDsV3(operation);
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
