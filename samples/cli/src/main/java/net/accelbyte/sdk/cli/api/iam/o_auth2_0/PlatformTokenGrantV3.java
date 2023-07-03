/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.iam.o_auth2_0;

import com.fasterxml.jackson.databind.ObjectMapper;
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

@Command(name = "platformTokenGrantV3", mixinStandardHelpOptions = true)
public class PlatformTokenGrantV3 implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PlatformTokenGrantV3.class);

  @Option(
      names = {"--platformId"},
      description = "platformId")
  String platformId;

  @Option(
      names = {"--additionalData"},
      description = "additionalData")
  String additionalData;

  @Option(
      names = {"--clientId"},
      description = "clientId")
  String clientId;

  @Option(
      names = {"--createHeadless"},
      description = "createHeadless")
  Boolean createHeadless;

  @Option(
      names = {"--deviceId"},
      description = "deviceId")
  String deviceId;

  @Option(
      names = {"--macAddress"},
      description = "macAddress")
  String macAddress;

  @Option(
      names = {"--platformToken"},
      description = "platformToken")
  String platformToken;

  @Option(
      names = {"--skipSetCookie"},
      description = "skipSetCookie")
  Boolean skipSetCookie;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PlatformTokenGrantV3()).execute(args);
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
      final net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3 operation =
          net.accelbyte.sdk.api.iam.operations.o_auth2_0.PlatformTokenGrantV3.builder()
              .platformId(platformId)
              .additionalData(additionalData != null ? additionalData : null)
              .clientId(clientId != null ? clientId : null)
              .createHeadless(createHeadless != null ? createHeadless : null)
              .deviceId(deviceId != null ? deviceId : null)
              .macAddress(macAddress != null ? macAddress : null)
              .platformToken(platformToken != null ? platformToken : null)
              .skipSetCookie(skipSetCookie != null ? skipSetCookie : null)
              .build();
      final OauthmodelTokenResponse response = wrapper.platformTokenGrantV3(operation);
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
