/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.cloudsave.admin_concurrent_record;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.cloudsave.models.*;
import net.accelbyte.sdk.api.cloudsave.wrappers.AdminConcurrentRecord;
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

@Command(name = "adminPutGameRecordConcurrentHandlerV1", mixinStandardHelpOptions = true)
public class AdminPutGameRecordConcurrentHandlerV1 implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(AdminPutGameRecordConcurrentHandlerV1.class);

  @Option(
      names = {"--key"},
      description = "key")
  String key;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminPutGameRecordConcurrentHandlerV1()).execute(args);
    System.exit(exitCode);
  }

  @Override
  public Integer call() {
    try {
      OkhttpClient httpClient = new OkhttpClient();
      if (logging) {
        httpClient.setLogger(new OkhttpLogger());
      }
      AccelByteSDK sdk =
          new AccelByteSDK(
              httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
      AdminConcurrentRecord wrapper = new AdminConcurrentRecord(sdk);
      net.accelbyte.sdk.api.cloudsave.operations.admin_concurrent_record
              .AdminPutGameRecordConcurrentHandlerV1
          operation =
              net.accelbyte.sdk.api.cloudsave.operations.admin_concurrent_record
                  .AdminPutGameRecordConcurrentHandlerV1.builder()
                  .key(key)
                  .namespace(namespace)
                  .body(
                      new ObjectMapper().readValue(body, ModelsAdminConcurrentRecordRequest.class))
                  .build();
      wrapper.adminPutGameRecordConcurrentHandlerV1(operation);
      log.info("Operation successful");
      return 0;
    } catch (HttpResponseException e) {
      log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
      System.err.print(e.getHttpCode());
    } catch (Exception e) {
      log.error("Exception occur with message below:\n{}", e.getMessage());
    }
    return 1;
  }
}
