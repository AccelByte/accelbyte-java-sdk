/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuth20;
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

@Command(name = "authorizeV3", mixinStandardHelpOptions = true)
public class AuthorizeV3 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AuthorizeV3.class);

  @Option(
      names = {"--codeChallenge"},
      description = "codeChallenge")
  String codeChallenge;

  @Option(
      names = {"--codeChallengeMethod"},
      description = "codeChallengeMethod")
  String codeChallengeMethod;

  @Option(
      names = {"--createHeadless"},
      description = "createHeadless")
  Boolean createHeadless;

  @Option(
      names = {"--oneTimeLinkCode"},
      description = "oneTimeLinkCode")
  String oneTimeLinkCode;

  @Option(
      names = {"--redirectUri"},
      description = "redirectUri")
  String redirectUri;

  @Option(
      names = {"--scope"},
      description = "scope")
  String scope;

  @Option(
      names = {"--state"},
      description = "state")
  String state;

  @Option(
      names = {"--targetAuthPage"},
      description = "targetAuthPage")
  String targetAuthPage;

  @Option(
      names = {"--useRedirectUriAsLoginUrlWhenLocked"},
      description = "useRedirectUriAsLoginUrlWhenLocked")
  Boolean useRedirectUriAsLoginUrlWhenLocked;

  @Option(
      names = {"--clientId"},
      description = "clientId")
  String clientId;

  @Option(
      names = {"--responseType"},
      description = "responseType")
  String responseType;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AuthorizeV3()).execute(args);
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
      final OAuth20 wrapper = new OAuth20(sdk);
      final net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3 operation =
          net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3.builder()
              .codeChallenge(codeChallenge)
              .codeChallengeMethod(codeChallengeMethod)
              .createHeadless(createHeadless)
              .oneTimeLinkCode(oneTimeLinkCode)
              .redirectUri(redirectUri)
              .scope(scope)
              .state(state)
              .targetAuthPage(targetAuthPage)
              .useRedirectUriAsLoginUrlWhenLocked(useRedirectUriAsLoginUrlWhenLocked)
              .clientId(clientId)
              .responseType(responseType)
              .build();
      wrapper.authorizeV3(operation);
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
