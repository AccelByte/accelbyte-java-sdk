/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.gdpr.data_retrieval_headless;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.gdpr.models.*;
import net.accelbyte.sdk.api.gdpr.wrappers.DataRetrievalHeadless;
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

@Command(name = "publicSubmitMyHeadlessPersonalDataRequest", mixinStandardHelpOptions = true)
public class PublicSubmitMyHeadlessPersonalDataRequest implements Callable<Integer> {

  private static final Logger log =
      LogManager.getLogger(PublicSubmitMyHeadlessPersonalDataRequest.class);

  @Option(
      names = {"--email"},
      description = "email")
  String email;

  @Option(
      names = {"--languageTag"},
      description = "languageTag")
  String languageTag;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PublicSubmitMyHeadlessPersonalDataRequest()).execute(args);
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
      final DataRetrievalHeadless wrapper = new DataRetrievalHeadless(sdk);
      final net.accelbyte.sdk.api.gdpr.operations.data_retrieval_headless
              .PublicSubmitMyHeadlessPersonalDataRequest
          operationRequest =
              net.accelbyte.sdk.api.gdpr.operations.data_retrieval_headless
                  .PublicSubmitMyHeadlessPersonalDataRequest.builder()
                  .email(email != null ? email : null)
                  .languageTag(languageTag != null ? languageTag : null)
                  .build();
      final ModelsDataRetrievalResponse response =
          wrapper.publicSubmitMyHeadlessPersonalDataRequest(operationRequest);
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
