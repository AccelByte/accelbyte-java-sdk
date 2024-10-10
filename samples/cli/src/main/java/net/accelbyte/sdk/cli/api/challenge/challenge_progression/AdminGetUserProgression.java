/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.challenge.challenge_progression;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.challenge.models.*;
import net.accelbyte.sdk.api.challenge.wrappers.ChallengeProgression;
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

@Command(name = "adminGetUserProgression", mixinStandardHelpOptions = true)
public class AdminGetUserProgression implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminGetUserProgression.class);

  @Option(
      names = {"--challengeCode"},
      description = "challengeCode")
  String challengeCode;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--dateTime"},
      description = "dateTime")
  String dateTime;

  @Option(
      names = {"--goalCode"},
      description = "goalCode")
  String goalCode;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--tags"},
      description = "tags",
      split = ",")
  List<String> tags;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminGetUserProgression()).execute(args);
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
      final ChallengeProgression wrapper = new ChallengeProgression(sdk);
      final net.accelbyte.sdk.api.challenge.operations.challenge_progression.AdminGetUserProgression
          operation =
              net.accelbyte.sdk.api.challenge.operations.challenge_progression
                  .AdminGetUserProgression.builder()
                  .challengeCode(challengeCode)
                  .namespace(namespace)
                  .userId(userId)
                  .dateTime(dateTime)
                  .goalCode(goalCode)
                  .limit(limit)
                  .offset(offset)
                  .tags(tags)
                  .build();
      final ModelUserProgressionResponse response = wrapper.adminGetUserProgression(operation);
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
