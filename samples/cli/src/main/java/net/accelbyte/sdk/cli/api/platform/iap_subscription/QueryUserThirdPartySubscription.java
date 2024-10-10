/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.iap_subscription;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.IAPSubscription;
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

@Command(name = "queryUserThirdPartySubscription", mixinStandardHelpOptions = true)
public class QueryUserThirdPartySubscription implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(QueryUserThirdPartySubscription.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--activeOnly"},
      description = "activeOnly")
  Boolean activeOnly;

  @Option(
      names = {"--groupId"},
      description = "groupId")
  String groupId;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--platform"},
      description = "platform")
  String platform;

  @Option(
      names = {"--productId"},
      description = "productId")
  String productId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new QueryUserThirdPartySubscription()).execute(args);
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
      final IAPSubscription wrapper = new IAPSubscription(sdk);
      final net.accelbyte.sdk.api.platform.operations.iap_subscription
              .QueryUserThirdPartySubscription
          operation =
              net.accelbyte.sdk.api.platform.operations.iap_subscription
                  .QueryUserThirdPartySubscription.builder()
                  .namespace(namespace)
                  .userId(userId)
                  .activeOnly(activeOnly)
                  .groupId(groupId)
                  .limit(limit)
                  .offset(offset)
                  .platform(platform)
                  .productId(productId)
                  .build();
      final ThirdPartyUserSubscriptionPagingSlicedResult response =
          wrapper.queryUserThirdPartySubscription(operation);
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
