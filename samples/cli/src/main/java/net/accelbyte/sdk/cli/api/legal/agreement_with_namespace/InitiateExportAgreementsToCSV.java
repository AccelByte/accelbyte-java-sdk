/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.legal.agreement_with_namespace;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.AgreementWithNamespace;
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

@Command(name = "initiateExportAgreementsToCSV", mixinStandardHelpOptions = true)
public class InitiateExportAgreementsToCSV implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(InitiateExportAgreementsToCSV.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--end"},
      description = "end")
  String end;

  @Option(
      names = {"--policyVersionId"},
      description = "policyVersionId")
  String policyVersionId;

  @Option(
      names = {"--start"},
      description = "start")
  String start;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new InitiateExportAgreementsToCSV()).execute(args);
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
      final AgreementWithNamespace wrapper = new AgreementWithNamespace(sdk);
      final net.accelbyte.sdk.api.legal.operations.agreement_with_namespace
              .InitiateExportAgreementsToCSV
          operation =
              net.accelbyte.sdk.api.legal.operations.agreement_with_namespace
                  .InitiateExportAgreementsToCSV.builder()
                  .namespace(namespace)
                  .end(end)
                  .policyVersionId(policyVersionId)
                  .start(start)
                  .build();
      final InitiateExportAgreementsToCSVResponse response =
          wrapper.initiateExportAgreementsToCSV(operation);
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
