/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.clients_config_v3;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.ClientsConfigV3;
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

@Command(name = "adminUpdateAvailablePermissionsByModule", mixinStandardHelpOptions = true)
public class AdminUpdateAvailablePermissionsByModule implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(AdminUpdateAvailablePermissionsByModule.class);

  @Option(
      names = {"--forceDelete"},
      description = "forceDelete")
  Boolean forceDelete;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminUpdateAvailablePermissionsByModule()).execute(args);
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
      final ClientsConfigV3 wrapper = new ClientsConfigV3(sdk);
      final net.accelbyte.sdk.api.iam.operations.clients_config_v3
              .AdminUpdateAvailablePermissionsByModule
          operation =
              net.accelbyte.sdk.api.iam.operations.clients_config_v3
                  .AdminUpdateAvailablePermissionsByModule.builder()
                  .forceDelete(forceDelete)
                  .body(
                      new ObjectMapper().readValue(body, ClientmodelListUpsertModulesRequest.class))
                  .build();
      wrapper.adminUpdateAvailablePermissionsByModule(operation);
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
