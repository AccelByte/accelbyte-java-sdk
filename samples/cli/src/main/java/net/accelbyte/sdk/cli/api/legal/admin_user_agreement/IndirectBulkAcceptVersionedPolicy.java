/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.legal.admin_user_agreement;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.legal.models.*;
import net.accelbyte.sdk.api.legal.wrappers.AdminUserAgreement;
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

@Command(name = "indirectBulkAcceptVersionedPolicy", mixinStandardHelpOptions = true)
public class IndirectBulkAcceptVersionedPolicy implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(IndirectBulkAcceptVersionedPolicy.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--publisherUserId"},
      description = "publisherUserId")
  String publisherUserId;

  @Option(
      names = {"--clientId"},
      description = "clientId")
  String clientId;

  @Option(
      names = {"--countryCode"},
      description = "countryCode")
  String countryCode;

  @Option(
      names = {"--body"},
      description = "body")
  String body;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new IndirectBulkAcceptVersionedPolicy()).execute(args);
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
      final AdminUserAgreement wrapper = new AdminUserAgreement(sdk);
      final net.accelbyte.sdk.api.legal.operations.admin_user_agreement
              .IndirectBulkAcceptVersionedPolicy
          operation =
              net.accelbyte.sdk.api.legal.operations.admin_user_agreement
                  .IndirectBulkAcceptVersionedPolicy.builder()
                  .namespace(namespace)
                  .userId(userId)
                  .publisherUserId(publisherUserId)
                  .clientId(clientId)
                  .countryCode(countryCode)
                  .body(
                      new ObjectMapper()
                          .readValue(body, new TypeReference<List<AcceptAgreementRequest>>() {}))
                  .build();
      final AcceptAgreementResponse response = wrapper.indirectBulkAcceptVersionedPolicy(operation);
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
