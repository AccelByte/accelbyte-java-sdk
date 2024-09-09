/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.campaign;

import java.io.File;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Campaign;
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

@Command(name = "download", mixinStandardHelpOptions = true)
public class Download implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(Download.class);

  @Option(
      names = {"--campaignId"},
      description = "campaignId")
  String campaignId;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--batchName"},
      description = "batchName")
  String batchName;

  @Option(
      names = {"--batchNo"},
      description = "batchNo",
      split = ",")
  List<Integer> batchNo;

  @Option(
      names = {"--withBatchName"},
      description = "withBatchName")
  Boolean withBatchName;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new Download()).execute(args);
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
      final Campaign wrapper = new Campaign(sdk);
      final net.accelbyte.sdk.api.platform.operations.campaign.Download operation =
          net.accelbyte.sdk.api.platform.operations.campaign.Download.builder()
              .campaignId(campaignId)
              .namespace(namespace)
              .batchName(batchName)
              .batchNo(batchNo)
              .withBatchName(withBatchName)
              .build();
      final InputStream response = wrapper.download(operation);
      final File outputFile = new File("response.out");
      java.nio.file.Files.copy(
          response, outputFile.toPath(), java.nio.file.StandardCopyOption.REPLACE_EXISTING);
      org.apache.commons.io.IOUtils.closeQuietly(response);
      log.info("Operation successful\n{}", "response.out");
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}
