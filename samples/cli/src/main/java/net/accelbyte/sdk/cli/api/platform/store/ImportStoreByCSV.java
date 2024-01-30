/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.store;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.File;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Store;
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

@Command(name = "importStoreByCSV", mixinStandardHelpOptions = true)
public class ImportStoreByCSV implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(ImportStoreByCSV.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--storeId"},
      description = "storeId")
  String storeId;

  @Option(
      names = {"--category"},
      description = "category")
  File category;

  @Option(
      names = {"--display"},
      description = "display")
  File display;

  @Option(
      names = {"--item"},
      description = "item")
  File item;

  @Option(
      names = {"--notes"},
      description = "notes")
  String notes;

  @Option(
      names = {"--section"},
      description = "section")
  File section;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new ImportStoreByCSV()).execute(args);
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
      final Store wrapper = new Store(sdk);
      final net.accelbyte.sdk.api.platform.operations.store.ImportStoreByCSV operation =
          net.accelbyte.sdk.api.platform.operations.store.ImportStoreByCSV.builder()
              .namespace(namespace)
              .storeId(storeId)
              .category(category != null ? category : null)
              .display(display != null ? display : null)
              .item(item != null ? item : null)
              .notes(notes != null ? notes : null)
              .section(section != null ? section : null)
              .build();
      final ImportStoreResult response = wrapper.importStoreByCSV(operation);
      final String responseString =
          new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
      log.info("Operation successful\n{}", responseString);
      return 0;
    } catch (HttpResponseException e) {
      log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
    } catch (Exception e) {
      log.error("An exception was thrown", e);
    }
    return 1;
  }
}
