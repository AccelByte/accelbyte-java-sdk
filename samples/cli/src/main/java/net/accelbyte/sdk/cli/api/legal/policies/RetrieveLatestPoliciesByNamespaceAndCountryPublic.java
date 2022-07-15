/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.legal.policies;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.Policies;
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

@Command(
    name = "retrieveLatestPoliciesByNamespaceAndCountryPublic",
    mixinStandardHelpOptions = true)
public class RetrieveLatestPoliciesByNamespaceAndCountryPublic implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(RetrieveLatestPoliciesByNamespaceAndCountryPublic.class);

  @Option(
      names = {"--countryCode"},
      description = "countryCode")
  String countryCode;

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--alwaysIncludeDefault"},
      description = "alwaysIncludeDefault")
  Boolean alwaysIncludeDefault;

  @Option(
      names = {"--defaultOnEmpty"},
      description = "defaultOnEmpty")
  Boolean defaultOnEmpty;

  @Option(
      names = {"--policyType"},
      description = "policyType")
  String policyType;

  @Option(
      names = {"--tags"},
      description = "tags")
  String tags;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode =
        new CommandLine(new RetrieveLatestPoliciesByNamespaceAndCountryPublic()).execute(args);
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
      Policies wrapper = new Policies(sdk);
      net.accelbyte.sdk.api.legal.operations.policies
              .RetrieveLatestPoliciesByNamespaceAndCountryPublic
          operation =
              net.accelbyte.sdk.api.legal.operations.policies
                  .RetrieveLatestPoliciesByNamespaceAndCountryPublic.builder()
                  .countryCode(countryCode)
                  .namespace(namespace)
                  .alwaysIncludeDefault(alwaysIncludeDefault)
                  .defaultOnEmpty(defaultOnEmpty)
                  .policyType(policyType)
                  .tags(tags)
                  .build();
      List<RetrievePolicyPublicResponse> response =
          wrapper.retrieveLatestPoliciesByNamespaceAndCountryPublic(operation);
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
