/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.catalog_changes;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.CatalogChanges;
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

@Command(name = "selectAllRecordsByCriteria", mixinStandardHelpOptions = true)
public class SelectAllRecordsByCriteria implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(SelectAllRecordsByCriteria.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--storeId"},
      description = "storeId")
  String storeId;

  @Option(
      names = {"--action"},
      description = "action")
  String action;

  @Option(
      names = {"--itemSku"},
      description = "itemSku")
  String itemSku;

  @Option(
      names = {"--itemType"},
      description = "itemType")
  String itemType;

  @Option(
      names = {"--selected"},
      description = "selected")
  Boolean selected;

  @Option(
      names = {"--type"},
      description = "type")
  String type;

  @Option(
      names = {"--updatedAtEnd"},
      description = "updatedAtEnd")
  String updatedAtEnd;

  @Option(
      names = {"--updatedAtStart"},
      description = "updatedAtStart")
  String updatedAtStart;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new SelectAllRecordsByCriteria()).execute(args);
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
      final CatalogChanges wrapper = new CatalogChanges(sdk);
      final net.accelbyte.sdk.api.platform.operations.catalog_changes.SelectAllRecordsByCriteria
          operation =
              net.accelbyte.sdk.api.platform.operations.catalog_changes.SelectAllRecordsByCriteria
                  .builder()
                  .namespace(namespace)
                  .storeId(storeId)
                  .action(action)
                  .itemSku(itemSku)
                  .itemType(itemType)
                  .selected(selected)
                  .type(type)
                  .updatedAtEnd(updatedAtEnd)
                  .updatedAtStart(updatedAtStart)
                  .build();
      wrapper.selectAllRecordsByCriteria(operation);
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
