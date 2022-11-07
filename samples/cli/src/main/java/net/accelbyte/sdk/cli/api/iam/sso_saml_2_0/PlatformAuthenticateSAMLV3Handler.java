/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.sso_saml_2_0;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.SSOSAML20;
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

@Command(name = "platformAuthenticateSAMLV3Handler", mixinStandardHelpOptions = true)
public class PlatformAuthenticateSAMLV3Handler implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PlatformAuthenticateSAMLV3Handler.class);

  @Option(
      names = {"--platformId"},
      description = "platformId")
  String platformId;

  @Option(
      names = {"--code"},
      description = "code")
  String code;

  @Option(
      names = {"--error"},
      description = "error")
  String error;

  @Option(
      names = {"--state"},
      description = "state")
  String state;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PlatformAuthenticateSAMLV3Handler()).execute(args);
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
      final SSOSAML20 wrapper = new SSOSAML20(sdk);
      final net.accelbyte.sdk.api.iam.operations.sso_saml_2_0.PlatformAuthenticateSAMLV3Handler
          operation =
              net.accelbyte.sdk.api.iam.operations.sso_saml_2_0.PlatformAuthenticateSAMLV3Handler
                  .builder()
                  .platformId(platformId)
                  .code(code)
                  .error(error)
                  .state(state)
                  .build();
      wrapper.platformAuthenticateSAMLV3Handler(operation);
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
