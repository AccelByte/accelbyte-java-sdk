/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.cloudsave.ttl_config;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.wrappers.TTLConfig;
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

@Command(name = "deleteGameBinaryRecordTTLConfig", mixinStandardHelpOptions = true)
public class DeleteGameBinaryRecordTTLConfig implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DeleteGameBinaryRecordTTLConfig.class);

  @Option(
      names = {"--key"},
      description = "key")
  String key;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DeleteGameBinaryRecordTTLConfig()).execute(args);
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
      final TTLConfig wrapper = new TTLConfig(sdk);
      final net.accelbyte.sdk.api.cloudsave.operations.ttl_config.DeleteGameBinaryRecordTTLConfig
          operation =
              net.accelbyte.sdk.api.cloudsave.operations.ttl_config.DeleteGameBinaryRecordTTLConfig
                  .builder()
                  .key(key)
                  .namespace(namespace)
                  .build();
      wrapper.deleteGameBinaryRecordTTLConfig(operation);
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
