/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ams.images;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.ams.models.*;
import net.accelbyte.sdk.api.ams.wrappers.Images;
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

@Command(name = "imageUnmarkForDeletion", mixinStandardHelpOptions = true)
public class ImageUnmarkForDeletion implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(ImageUnmarkForDeletion.class);

  @Option(
      names = {"--imageID"},
      description = "imageID")
  String imageID;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new ImageUnmarkForDeletion()).execute(args);
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
      final Images wrapper = new Images(sdk);
      final net.accelbyte.sdk.api.ams.operations.images.ImageUnmarkForDeletion operation =
          net.accelbyte.sdk.api.ams.operations.images.ImageUnmarkForDeletion.builder()
              .imageID(imageID)
              .namespace(namespace)
              .build();
      wrapper.imageUnmarkForDeletion(operation);
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