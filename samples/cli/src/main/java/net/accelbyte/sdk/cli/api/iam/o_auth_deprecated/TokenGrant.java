/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth_deprecated;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.iam.models.*;
import net.accelbyte.sdk.api.iam.wrappers.OAuthDeprecated;
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

@Command(name = "tokenGrant", mixinStandardHelpOptions = true)
public class TokenGrant implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(TokenGrant.class);

  @Option(
      names = {"--code"},
      description = "code")
  String code;

  @Option(
      names = {"--extendExp"},
      description = "extendExp")
  Boolean extendExp;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--password"},
      description = "password")
  String password;

  @Option(
      names = {"--redirectUri"},
      description = "redirectUri")
  String redirectUri;

  @Option(
      names = {"--refreshToken"},
      description = "refreshToken")
  String refreshToken;

  @Option(
      names = {"--username"},
      description = "username")
  String username;

  @Option(
      names = {"--grantType"},
      description = "grantType")
  String grantType;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new TokenGrant()).execute(args);
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
      OAuthDeprecated wrapper = new OAuthDeprecated(sdk);
      net.accelbyte.sdk.api.iam.operations.o_auth_deprecated.TokenGrant operation =
          net.accelbyte.sdk.api.iam.operations.o_auth_deprecated.TokenGrant.builder()
              .code(code != null ? code : null)
              .extendExp(extendExp != null ? extendExp : null)
              .namespace(namespace != null ? namespace : null)
              .password(password != null ? password : null)
              .redirectUri(redirectUri != null ? redirectUri : null)
              .refreshToken(refreshToken != null ? refreshToken : null)
              .username(username != null ? username : null)
              .grantType(grantType != null ? grantType : null)
              .build();
      OauthmodelTokenResponse response = wrapper.tokenGrant(operation);
      String responseString =
          new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
      log.info("Operation successful with response below:\n{}", responseString);
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
