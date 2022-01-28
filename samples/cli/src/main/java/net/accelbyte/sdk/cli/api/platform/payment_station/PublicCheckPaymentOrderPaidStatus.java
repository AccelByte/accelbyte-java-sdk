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

@Command(name = "publicCheckPaymentOrderPaidStatus", mixinStandardHelpOptions = true)
public class PublicCheckPaymentOrderPaidStatus implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicCheckPaymentOrderPaidStatus.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--paymentOrderNo"}, description = "paymentOrderNo")
    String paymentOrderNo;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicCheckPaymentOrderPaidStatus()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            PaymentOrderPaidResult response =
            new PaymentStation(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicCheckPaymentOrderPaidStatus(
                new net.accelbyte.sdk.api.platform.operations.payment_station.PublicCheckPaymentOrderPaidStatus(
                    namespace,
                    paymentOrderNo
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}