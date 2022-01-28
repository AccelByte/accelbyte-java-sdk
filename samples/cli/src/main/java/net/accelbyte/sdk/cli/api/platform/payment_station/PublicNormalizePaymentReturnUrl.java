package net.accelbyte.sdk.cli.api.platform.payment_station;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentStation;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "publicNormalizePaymentReturnUrl", mixinStandardHelpOptions = true)
public class PublicNormalizePaymentReturnUrl implements Runnable {

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

    @Option(names = {"--resultCode"}, description = "resultCode")
    String resultCode;

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


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicNormalizePaymentReturnUrl()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new PaymentStation(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicNormalizePaymentReturnUrl(
                new net.accelbyte.sdk.api.platform.operations.payment_station.PublicNormalizePaymentReturnUrl(
                    namespace,
                    payerID,
                    foreinginvoice,
                    invoiceId,
                    payload,
                    resultCode,
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
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}