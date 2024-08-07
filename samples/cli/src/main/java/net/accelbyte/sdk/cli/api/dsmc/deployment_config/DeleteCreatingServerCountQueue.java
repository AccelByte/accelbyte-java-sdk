/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.dsmc.deployment_config;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.dsmc.models.*;
import net.accelbyte.sdk.api.dsmc.wrappers.DeploymentConfig;
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

@Command(name = "deleteCreatingServerCountQueue", mixinStandardHelpOptions = true)
public class DeleteCreatingServerCountQueue implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DeleteCreatingServerCountQueue.class);

  @Option(
      names = {"--deployment"},
      description = "deployment")
  String deployment;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--version"},
      description = "version")
  String version;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DeleteCreatingServerCountQueue()).execute(args);
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
      final DeploymentConfig wrapper = new DeploymentConfig(sdk);
      final net.accelbyte.sdk.api.dsmc.operations.deployment_config.DeleteCreatingServerCountQueue
          operation =
              net.accelbyte.sdk.api.dsmc.operations.deployment_config.DeleteCreatingServerCountQueue
                  .builder()
                  .deployment(deployment)
                  .namespace(namespace)
                  .version(version)
                  .build();
      wrapper.deleteCreatingServerCountQueue(operation);
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
