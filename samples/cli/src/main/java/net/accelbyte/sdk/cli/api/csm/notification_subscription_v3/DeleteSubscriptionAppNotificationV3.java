/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.csm.notification_subscription_v3;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.csm.models.*;
import net.accelbyte.sdk.api.csm.wrappers.NotificationSubscriptionV3;
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

@Command(name = "deleteSubscriptionAppNotificationV3", mixinStandardHelpOptions = true)
public class DeleteSubscriptionAppNotificationV3 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DeleteSubscriptionAppNotificationV3.class);

  @Option(
      names = {"--app"},
      description = "app")
  String app;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--emailAddress"},
      description = "emailAddress")
  String emailAddress;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DeleteSubscriptionAppNotificationV3()).execute(args);
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
      final NotificationSubscriptionV3 wrapper = new NotificationSubscriptionV3(sdk);
      final net.accelbyte.sdk.api.csm.operations.notification_subscription_v3
              .DeleteSubscriptionAppNotificationV3
          operation =
              net.accelbyte.sdk.api.csm.operations.notification_subscription_v3
                  .DeleteSubscriptionAppNotificationV3.builder()
                  .app(app)
                  .namespace(namespace)
                  .emailAddress(emailAddress)
                  .userId(userId)
                  .build();
      wrapper.deleteSubscriptionAppNotificationV3(operation);
      log.info("Operation successful");
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}
