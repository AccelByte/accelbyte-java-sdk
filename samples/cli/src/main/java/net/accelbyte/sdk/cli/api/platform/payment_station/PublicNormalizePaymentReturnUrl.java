/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.payment_station;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentStation;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "publicNormalizePaymentReturnUrl", mixinStandardHelpOptions = true)
public class PublicNormalizePaymentReturnUrl implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicNormalizePaymentReturnUrl.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--payerID"}, description = "payerID")
    String payerID;

    @Option(names = {"--foreinginvoice"}, description = "foreinginvoice")
    String foreinginvoice;

    @Option(names = {"--invoiceId"}, description = "invoiceId")
    String invoiceId;

    @Option(names = {"--payload"}, description = "payload")
    String payload;

    @Option(names = {"--redirectResult"}, description = "redirectResult")
    String redirectResult;

    @Option(names = {"--resultCode"}, description = "resultCode")
    String resultCode;

    @Option(names = {"--sessionId"}, description = "sessionId")
    String sessionId;

    @Option(names = {"--status"}, description = "status")
    String status;

    @Option(names = {"--token"}, description = "token")
    String token;

    @Option(names = {"--type"}, description = "type")
    String type;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--orderNo"}, description = "orderNo")
    String orderNo;

    @Option(names = {"--paymentOrderNo"}, description = "paymentOrderNo")
    String paymentOrderNo;

    @Option(names = {"--paymentProvider"}, description = "paymentProvider")
    String paymentProvider;

    @Option(names = {"--returnUrl"}, description = "returnUrl")
    String returnUrl;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new PublicNormalizePaymentReturnUrl()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() {
        try {
            OkhttpClient httpClient = new OkhttpClient();
            if (logging) {
                httpClient.setLogger(new OkhttpLogger());
            }
            AccelByteSDK sdk = new AccelByteSDK(httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
            
            new PaymentStation(sdk)
            .publicNormalizePaymentReturnUrl(
                new net.accelbyte.sdk.api.platform.operations.payment_station.PublicNormalizePaymentReturnUrl(
                    namespace,
                    payerID,
                    foreinginvoice,
                    invoiceId,
                    payload,
                    redirectResult,
                    resultCode,
                    sessionId,
                    status,
                    token,
                    type,
                    userId,
                    orderNo,
                    paymentOrderNo,
                    paymentProvider,
                    returnUrl
                )
            );
            log.info("Operation successful");
            return 0;
        } catch (HttpResponseException e) {
            log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}