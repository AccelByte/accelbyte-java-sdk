/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.reporting.admin_extension_categories_and_auto_moderation_actions;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.reporting.models.*;
import net.accelbyte.sdk.api.reporting.wrappers.AdminExtensionCategoriesAndAutoModerationActions;
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

@Command(name = "adminFindExtensionCategoryList", mixinStandardHelpOptions = true)
public class AdminFindExtensionCategoryList implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminFindExtensionCategoryList.class);

  @Option(
      names = {"--order"},
      description = "order")
  String order;

  @Option(
      names = {"--sortBy"},
      description = "sortBy")
  String sortBy;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminFindExtensionCategoryList()).execute(args);
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
      final AdminExtensionCategoriesAndAutoModerationActions wrapper =
          new AdminExtensionCategoriesAndAutoModerationActions(sdk);
      final net.accelbyte.sdk.api.reporting.operations
              .admin_extension_categories_and_auto_moderation_actions.AdminFindExtensionCategoryList
          operation =
              net.accelbyte.sdk.api.reporting.operations
                  .admin_extension_categories_and_auto_moderation_actions
                  .AdminFindExtensionCategoryList.builder()
                  .order(order)
                  .sortBy(sortBy)
                  .build();
      final RestapiExtensionCategoryListApiResponse response =
          wrapper.adminFindExtensionCategoryList(operation);
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