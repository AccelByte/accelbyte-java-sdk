/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.seasonpass.season;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.seasonpass.models.*;
import net.accelbyte.sdk.api.seasonpass.wrappers.Season;
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

@Command(name = "queryUserExpGrantHistory", mixinStandardHelpOptions = true)
public class QueryUserExpGrantHistory implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(QueryUserExpGrantHistory.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--from"},
      description = "from")
  String from;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--seasonId"},
      description = "seasonId")
  String seasonId;

  @Option(
      names = {"--source"},
      description = "source")
  String source;

  @Option(
      names = {"--tags"},
      description = "tags")
  List<String> tags;

  @Option(
      names = {"--to"},
      description = "to")
  String to;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new QueryUserExpGrantHistory()).execute(args);
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
      final Season wrapper = new Season(sdk);
      final net.accelbyte.sdk.api.seasonpass.operations.season.QueryUserExpGrantHistory operation =
          net.accelbyte.sdk.api.seasonpass.operations.season.QueryUserExpGrantHistory.builder()
              .namespace(namespace)
              .userId(userId)
              .from(from)
              .limit(limit)
              .offset(offset)
              .seasonId(seasonId)
              .source(source)
              .tags(tags)
              .to(to)
              .build();
      final ExpGrantHistoryPagingSlicedResult response =
          wrapper.queryUserExpGrantHistory(operation);
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
