/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.catalog_changes;

import com.fasterxml.jackson.databind.ObjectMapper;
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

@Command(name = "queryChanges", mixinStandardHelpOptions = true)
public class QueryChanges implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(QueryChanges.class);

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
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--selected"},
      description = "selected")
  Boolean selected;

  @Option(
      names = {"--sortBy"},
      description = "sortBy")
  List<String> sortBy;

  @Option(
      names = {"--status"},
      description = "status")
  String status;

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
      names = {"--withTotal"},
      description = "withTotal")
  Boolean withTotal;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new QueryChanges()).execute(args);
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
      final net.accelbyte.sdk.api.platform.operations.catalog_changes.QueryChanges operation =
          net.accelbyte.sdk.api.platform.operations.catalog_changes.QueryChanges.builder()
              .namespace(namespace)
              .storeId(storeId)
              .action(action)
              .itemSku(itemSku)
              .itemType(itemType)
              .limit(limit)
              .offset(offset)
              .selected(selected)
              .sortBy(sortBy)
              .status(status)
              .type(type)
              .updatedAtEnd(updatedAtEnd)
              .updatedAtStart(updatedAtStart)
              .withTotal(withTotal)
              .build();
      final CatalogChangePagingResult response = wrapper.queryChanges(operation);
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
