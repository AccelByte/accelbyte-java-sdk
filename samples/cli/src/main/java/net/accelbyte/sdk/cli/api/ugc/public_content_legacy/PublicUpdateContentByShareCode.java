/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ugc.public_content_legacy;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.PublicContentLegacy;
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

@Command(name = "publicUpdateContentByShareCode", mixinStandardHelpOptions = true)
public class PublicUpdateContentByShareCode implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PublicUpdateContentByShareCode.class);

  @Option(
      names = {"--channelId"},
      description = "channelId")
  String channelId;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--shareCode"},
      description = "shareCode")
  String shareCode;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PublicUpdateContentByShareCode()).execute(args);
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
      final PublicContentLegacy wrapper = new PublicContentLegacy(sdk);
      final net.accelbyte.sdk.api.ugc.operations.public_content_legacy
              .PublicUpdateContentByShareCode
          operation =
              net.accelbyte.sdk.api.ugc.operations.public_content_legacy
                  .PublicUpdateContentByShareCode.builder()
                  .channelId(channelId)
                  .namespace(namespace)
                  .shareCode(shareCode)
                  .userId(userId)
                  .body(new ObjectMapper().readValue(body, ModelsUpdateContentRequest.class))
                  .build();
      final ModelsCreateContentResponse response =
          wrapper.publicUpdateContentByShareCode(operation);
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
