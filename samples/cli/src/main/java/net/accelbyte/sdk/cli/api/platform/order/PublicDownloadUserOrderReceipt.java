/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.order;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Order;
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

@Command(name = "publicDownloadUserOrderReceipt", mixinStandardHelpOptions = true)
public class PublicDownloadUserOrderReceipt implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PublicDownloadUserOrderReceipt.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--orderNo"},
      description = "orderNo")
  String orderNo;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PublicDownloadUserOrderReceipt()).execute(args);
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
      Order wrapper = new Order(sdk);
      net.accelbyte.sdk.api.platform.operations.order.PublicDownloadUserOrderReceipt operation =
          net.accelbyte.sdk.api.platform.operations.order.PublicDownloadUserOrderReceipt.builder()
              .namespace(namespace)
              .orderNo(orderNo)
              .userId(userId)
              .build();
      wrapper.publicDownloadUserOrderReceipt(operation);
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
