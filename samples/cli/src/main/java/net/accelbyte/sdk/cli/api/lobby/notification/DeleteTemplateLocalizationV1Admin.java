/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.lobby.notification;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.lobby.models.*;
import net.accelbyte.sdk.api.lobby.wrappers.Notification;
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

@Command(name = "deleteTemplateLocalizationV1Admin", mixinStandardHelpOptions = true)
public class DeleteTemplateLocalizationV1Admin implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DeleteTemplateLocalizationV1Admin.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--templateLanguage"},
      description = "templateLanguage")
  String templateLanguage;

  @Option(
      names = {"--templateSlug"},
      description = "templateSlug")
  String templateSlug;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DeleteTemplateLocalizationV1Admin()).execute(args);
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
      final Notification wrapper = new Notification(sdk);
      final net.accelbyte.sdk.api.lobby.operations.notification.DeleteTemplateLocalizationV1Admin
          operation =
              net.accelbyte.sdk.api.lobby.operations.notification.DeleteTemplateLocalizationV1Admin
                  .builder()
                  .namespace(namespace)
                  .templateLanguage(templateLanguage)
                  .templateSlug(templateSlug)
                  .build();
      wrapper.deleteTemplateLocalizationV1Admin(operation);
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
