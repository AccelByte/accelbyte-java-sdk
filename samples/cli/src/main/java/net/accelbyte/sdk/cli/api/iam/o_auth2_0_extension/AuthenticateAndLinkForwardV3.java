/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0_extension;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20Extension;
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

@Command(name = "authenticateAndLinkForwardV3", mixinStandardHelpOptions = true)
public class AuthenticateAndLinkForwardV3 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AuthenticateAndLinkForwardV3.class);

  @Option(
      names = {"--extendExp"},
      description = "extendExp")
  Boolean extendExp;

  @Option(
      names = {"--clientId"},
      description = "clientId")
  String clientId;

  @Option(
      names = {"--linkingToken"},
      description = "linkingToken")
  String linkingToken;

  @Option(
      names = {"--password"},
      description = "password")
  String password;

  @Option(
      names = {"--username"},
      description = "username")
  String username;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AuthenticateAndLinkForwardV3()).execute(args);
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
      final OAuth20Extension wrapper = new OAuth20Extension(sdk);
      final net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.AuthenticateAndLinkForwardV3
          operation =
              net.accelbyte.sdk.api.iam.operations.o_auth2_0_extension.AuthenticateAndLinkForwardV3
                  .builder()
                  .extendExp(extendExp != null ? extendExp : null)
                  .clientId(clientId != null ? clientId : null)
                  .linkingToken(linkingToken != null ? linkingToken : null)
                  .password(password != null ? password : null)
                  .username(username != null ? username : null)
                  .build();
      wrapper.authenticateAndLinkForwardV3(operation);
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
