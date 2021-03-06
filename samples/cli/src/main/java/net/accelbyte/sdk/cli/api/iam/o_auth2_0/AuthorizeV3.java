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
      OkhttpClient httpClient = new OkhttpClient();
      if (logging) {
        httpClient.setLogger(new OkhttpLogger());
      }
      AccelByteSDK sdk =
          new AccelByteSDK(
              httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
      OAuth20 wrapper = new OAuth20(sdk);
      net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3 operation =
          net.accelbyte.sdk.api.iam.operations.o_auth2_0.AuthorizeV3.builder()
              .codeChallenge(codeChallenge)
              .codeChallengeMethod(codeChallengeMethod)
              .createHeadless(createHeadless)
              .redirectUri(redirectUri)
              .scope(scope)
              .state(state)
              .targetAuthPage(targetAuthPage)
              .clientId(clientId)
              .responseType(responseType)
              .build();
      wrapper.authorizeV3(operation);
      log.info("Operation successful");
      return 0;
    } catch (HttpResponseException e) {
      log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
      System.err.print(e.getHttpCode());
    } catch (Exception e) {
      log.error("Exception occur with message below:\n{}", e.getMessage());
    }
    return 1;
  }
}
