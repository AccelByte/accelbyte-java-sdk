/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.invoice;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Invoice;
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

@Command(name = "downloadInvoiceDetails", mixinStandardHelpOptions = true)
public class DownloadInvoiceDetails implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(DownloadInvoiceDetails.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--feature"},
      description = "feature")
  String feature;

  @Option(
      names = {"--itemId"},
      description = "itemId")
  String itemId;

  @Option(
      names = {"--itemType"},
      description = "itemType")
  String itemType;

  @Option(
      names = {"--endTime"},
      description = "endTime")
  String endTime;

  @Option(
      names = {"--startTime"},
      description = "startTime")
  String startTime;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new DownloadInvoiceDetails()).execute(args);
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
      Invoice wrapper = new Invoice(sdk);
      final net.accelbyte.sdk.api.platform.operations.invoice.DownloadInvoiceDetails operation =
          net.accelbyte.sdk.api.platform.operations.invoice.DownloadInvoiceDetails.builder()
              .namespace(namespace)
              .feature(feature)
              .itemId(itemId)
              .itemType(itemType)
              .endTime(endTime)
              .startTime(startTime)
              .build();
      wrapper.downloadInvoiceDetails(operation);
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
