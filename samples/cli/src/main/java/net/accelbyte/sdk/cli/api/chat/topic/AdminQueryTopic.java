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

@Command(name = "adminQueryTopic", mixinStandardHelpOptions = true)
public class AdminQueryTopic implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminQueryTopic.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--includeMembers"},
      description = "includeMembers")
  Boolean includeMembers;

  @Option(
      names = {"--includePastMembers"},
      description = "includePastMembers")
  Boolean includePastMembers;

  @Option(
      names = {"--includePastTopics"},
      description = "includePastTopics")
  Boolean includePastTopics;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--topic"},
      description = "topic",
      split = ",")
  List<String> topic;

  @Option(
      names = {"--topicSubType"},
      description = "topicSubType")
  String topicSubType;

  @Option(
      names = {"--topicType"},
      description = "topicType")
  String topicType;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminQueryTopic()).execute(args);
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
      final net.accelbyte.sdk.api.chat.operations.topic.AdminQueryTopic operation =
          net.accelbyte.sdk.api.chat.operations.topic.AdminQueryTopic.builder()
              .namespace(namespace)
              .includeMembers(includeMembers)
              .includePastMembers(includePastMembers)
              .includePastTopics(includePastTopics)
              .limit(limit)
              .offset(offset)
              .topic(topic)
              .topicSubType(topicSubType)
              .topicType(topicType)
              .userId(userId)
              .build();
      final List<ModelsTopicInfo> response = wrapper.adminQueryTopic(operation);
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
