/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.session.party;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.session.models.*;
import net.accelbyte.sdk.api.session.wrappers.Party;
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

@Command(name = "adminQueryParties", mixinStandardHelpOptions = true)
public class AdminQueryParties implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(AdminQueryParties.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--isSoftDeleted"},
      description = "isSoftDeleted")
  String isSoftDeleted;

  @Option(
      names = {"--joinability"},
      description = "joinability")
  String joinability;

  @Option(
      names = {"--key"},
      description = "key")
  String key;

  @Option(
      names = {"--leaderID"},
      description = "leaderID")
  String leaderID;

  @Option(
      names = {"--limit"},
      description = "limit")
  Integer limit;

  @Option(
      names = {"--memberID"},
      description = "memberID")
  String memberID;

  @Option(
      names = {"--memberStatus"},
      description = "memberStatus")
  String memberStatus;

  @Option(
      names = {"--offset"},
      description = "offset")
  Integer offset;

  @Option(
      names = {"--order"},
      description = "order")
  String order;

  @Option(
      names = {"--orderBy"},
      description = "orderBy")
  String orderBy;

  @Option(
      names = {"--partyID"},
      description = "partyID")
  String partyID;

  @Option(
      names = {"--value"},
      description = "value")
  String value;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new AdminQueryParties()).execute(args);
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
      final Party wrapper = new Party(sdk);
      final net.accelbyte.sdk.api.session.operations.party.AdminQueryParties operation =
          net.accelbyte.sdk.api.session.operations.party.AdminQueryParties.builder()
              .namespace(namespace)
              .isSoftDeleted(isSoftDeleted)
              .joinability(joinability)
              .key(key)
              .leaderID(leaderID)
              .limit(limit)
              .memberID(memberID)
              .memberStatus(memberStatus)
              .offset(offset)
              .order(order)
              .orderBy(orderBy)
              .partyID(partyID)
              .value(value)
              .build();
      final ApimodelsPartyQueryResponse response = wrapper.adminQueryParties(operation);
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
