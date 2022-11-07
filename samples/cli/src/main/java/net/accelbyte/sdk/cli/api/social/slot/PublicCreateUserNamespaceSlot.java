/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.social.slot;

import java.io.File;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.social.models.*;
import net.accelbyte.sdk.api.social.wrappers.Slot;
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

@Command(name = "publicCreateUserNamespaceSlot", mixinStandardHelpOptions = true)
public class PublicCreateUserNamespaceSlot implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PublicCreateUserNamespaceSlot.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--label"},
      description = "label")
  String label;

  @Option(
      names = {"--tags"},
      description = "tags")
  List<String> tags;

  @Option(
      names = {"--checksum"},
      description = "checksum")
  String checksum;

  @Option(
      names = {"--customAttribute"},
      description = "customAttribute")
  String customAttribute;

  @Option(
      names = {"--file"},
      description = "file")
  File file;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PublicCreateUserNamespaceSlot()).execute(args);
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
      final Slot wrapper = new Slot(sdk);
      final net.accelbyte.sdk.api.social.operations.slot.PublicCreateUserNamespaceSlot operation =
          net.accelbyte.sdk.api.social.operations.slot.PublicCreateUserNamespaceSlot.builder()
              .namespace(namespace)
              .userId(userId)
              .label(label)
              .tags(tags)
              .checksum(checksum != null ? checksum : null)
              .customAttribute(customAttribute != null ? customAttribute : null)
              .file(file != null ? file : null)
              .build();
      wrapper.publicCreateUserNamespaceSlot(operation);
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
