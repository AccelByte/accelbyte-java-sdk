/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.legal.policy_versions;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.PolicyVersions;
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

@Command(name = "updatePolicyVersion", mixinStandardHelpOptions = true)
public class UpdatePolicyVersion implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(UpdatePolicyVersion.class);

  @Option(
      names = {"--policyVersionId"},
      description = "policyVersionId")
  String policyVersionId;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new UpdatePolicyVersion()).execute(args);
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
      PolicyVersions wrapper = new PolicyVersions(sdk);
      final net.accelbyte.sdk.api.legal.operations.policy_versions.UpdatePolicyVersion operation =
          net.accelbyte.sdk.api.legal.operations.policy_versions.UpdatePolicyVersion.builder()
              .policyVersionId(policyVersionId)
              .body(new ObjectMapper().readValue(body, UpdatePolicyVersionRequest.class))
              .build();
      UpdatePolicyVersionResponse response = wrapper.updatePolicyVersion(operation);
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
