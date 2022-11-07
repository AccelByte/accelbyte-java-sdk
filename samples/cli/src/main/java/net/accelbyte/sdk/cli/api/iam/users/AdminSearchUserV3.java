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

@Command(name = "adminSearchUserV3", mixinStandardHelpOptions = true)
public class AdminSearchUserV3 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminSearchUserV3.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--by"},
      description = "by")
  String by;

  @Option(
      names = {"--endDate"},
      description = "endDate")
  String endDate;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--platformBy"},
      description = "platformBy")
  String platformBy;

  @Option(
      names = {"--platformId"},
      description = "platformId")
  String platformId;

  @Option(
      names = {"--query"},
      description = "query")
  String query;

  @Option(
      names = {"--startDate"},
      description = "startDate")
  String startDate;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminSearchUserV3()).execute(args);
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
      final net.accelbyte.sdk.api.iam.operations.users.AdminSearchUserV3 operation =
          net.accelbyte.sdk.api.iam.operations.users.AdminSearchUserV3.builder()
              .namespace(namespace)
              .by(by)
              .endDate(endDate)
              .limit(limit)
              .offset(offset)
              .platformBy(platformBy)
              .platformId(platformId)
              .query(query)
              .startDate(startDate)
              .build();
      final ModelSearchUsersResponseWithPaginationV3 response =
          wrapper.adminSearchUserV3(operation);
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
