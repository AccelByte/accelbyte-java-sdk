/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.chat.topic;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.wrappers.Topic;
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

@Command(name = "adminChatHistory", mixinStandardHelpOptions = true)
public class AdminChatHistory implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminChatHistory.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--chatId"},
      description = "chatId")
  List<String> chatId;

  @Option(
      names = {"--endCreatedAt"},
      description = "endCreatedAt")
  Integer endCreatedAt;

  @Option(
      names = {"--keyword"},
      description = "keyword")
  String keyword;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--order"},
      description = "order")
  String order;

  @Option(
      names = {"--senderUserId"},
      description = "senderUserId")
  String senderUserId;

  @Option(
      names = {"--shardId"},
      description = "shardId")
  String shardId;

  @Option(
      names = {"--startCreatedAt"},
      description = "startCreatedAt")
  Integer startCreatedAt;

  @Option(
      names = {"--topic"},
      description = "topic")
  List<String> topic;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminChatHistory()).execute(args);
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
      final Topic wrapper = new Topic(sdk);
      final net.accelbyte.sdk.api.chat.operations.topic.AdminChatHistory operation =
          net.accelbyte.sdk.api.chat.operations.topic.AdminChatHistory.builder()
              .namespace(namespace)
              .chatId(chatId)
              .endCreatedAt(endCreatedAt)
              .keyword(keyword)
              .limit(limit)
              .offset(offset)
              .order(order)
              .senderUserId(senderUserId)
              .shardId(shardId)
              .startCreatedAt(startCreatedAt)
              .topic(topic)
              .build();
      final ModelsChatMessageWithPaginationResponse response = wrapper.adminChatHistory(operation);
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
