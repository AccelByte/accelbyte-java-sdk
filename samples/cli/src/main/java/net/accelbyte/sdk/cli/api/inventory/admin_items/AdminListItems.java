/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.inventory.admin_items;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.inventory.models.*;
import net.accelbyte.sdk.api.inventory.wrappers.AdminItems;
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

@Command(name = "adminListItems", mixinStandardHelpOptions = true)
public class AdminListItems implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminListItems.class);

  @Option(
      names = {"--inventoryId"},
      description = "inventoryId")
  String inventoryId;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--qtyGte"},
      description = "qtyGte")
  Integer qtyGte;

  @Option(
      names = {"--sortBy"},
      description = "sortBy")
  String sortBy;

  @Option(
      names = {"--sourceItemId"},
      description = "sourceItemId")
  String sourceItemId;

  @Option(
      names = {"--tags"},
      description = "tags")
  String tags;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminListItems()).execute(args);
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
      final AdminItems wrapper = new AdminItems(sdk);
      final net.accelbyte.sdk.api.inventory.operations.admin_items.AdminListItems operation =
          net.accelbyte.sdk.api.inventory.operations.admin_items.AdminListItems.builder()
              .inventoryId(inventoryId)
              .namespace(namespace)
              .limit(limit)
              .offset(offset)
              .qtyGte(qtyGte)
              .sortBy(sortBy)
              .sourceItemId(sourceItemId)
              .tags(tags)
              .build();
      final ApimodelsListItemResp response = wrapper.adminListItems(operation);
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
