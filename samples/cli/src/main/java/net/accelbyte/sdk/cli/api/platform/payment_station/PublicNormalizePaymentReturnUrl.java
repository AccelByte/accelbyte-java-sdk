/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.payment_station;

import java.util.*;
import java.util.concurrent.Callable;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentStation;
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

@Command(name = "publicNormalizePaymentReturnUrl", mixinStandardHelpOptions = true)
public class PublicNormalizePaymentReturnUrl implements Callable<Integer> {

  private static final Logger log = LogManager.getLogger(PublicNormalizePaymentReturnUrl.class);

  @Option(
      names = {"--namespace"},
      description = "namespace")
  String namespace;

  @Option(
      names = {"--payerID"},
      description = "payerID")
  String payerID;

  @Option(
      names = {"--foreinginvoice"},
      description = "foreinginvoice")
  String foreinginvoice;

  @Option(
      names = {"--invoiceId"},
      description = "invoiceId")
  String invoiceId;

  @Option(
      names = {"--payload"},
      description = "payload")
  String payload;

  @Option(
      names = {"--redirectResult"},
      description = "redirectResult")
  String redirectResult;

  @Option(
      names = {"--resultCode"},
      description = "resultCode")
  String resultCode;

  @Option(
      names = {"--sessionId"},
      description = "sessionId")
  String sessionId;

  @Option(
      names = {"--status"},
      description = "status")
  String status;

  @Option(
      names = {"--token"},
      description = "token")
  String token;

  @Option(
      names = {"--type"},
      description = "type")
  String type;

  @Option(
      names = {"--userId"},
      description = "userId")
  String userId;

  @Option(
      names = {"--orderNo"},
      description = "orderNo")
  String orderNo;

  @Option(
      names = {"--paymentOrderNo"},
      description = "paymentOrderNo")
  String paymentOrderNo;

  @Option(
      names = {"--paymentProvider"},
      description = "paymentProvider")
  String paymentProvider;

  @Option(
      names = {"--returnUrl"},
      description = "returnUrl")
  String returnUrl;

  @Option(
      names = {"--logging"},
      description = "logger")
  boolean logging;

  public static void main(String[] args) {
    int exitCode = new CommandLine(new PublicNormalizePaymentReturnUrl()).execute(args);
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
      final PaymentStation wrapper = new PaymentStation(sdk);
      final net.accelbyte.sdk.api.platform.operations.payment_station
              .PublicNormalizePaymentReturnUrl
          operation =
              net.accelbyte.sdk.api.platform.operations.payment_station
                  .PublicNormalizePaymentReturnUrl.builder()
                  .namespace(namespace)
                  .payerID(payerID)
                  .foreinginvoice(foreinginvoice)
                  .invoiceId(invoiceId)
                  .payload(payload)
                  .redirectResult(redirectResult)
                  .resultCode(resultCode)
                  .sessionId(sessionId)
                  .status(status)
                  .token(token)
                  .type(type)
                  .userId(userId)
                  .orderNo(orderNo)
                  .paymentOrderNo(paymentOrderNo)
                  .paymentProvider(paymentProvider)
                  .returnUrl(returnUrl)
                  .build();
      wrapper.publicNormalizePaymentReturnUrl(operation);
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
