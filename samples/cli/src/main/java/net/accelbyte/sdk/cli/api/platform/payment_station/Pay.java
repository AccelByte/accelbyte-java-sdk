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

@Command(name = "pay", mixinStandardHelpOptions = true)
public class Pay implements Runnable {

    private static final Logger log = LogManager.getLogger(Pay.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--paymentOrderNo"}, description = "paymentOrderNo")
    String paymentOrderNo;

    @Option(names = {"--paymentProvider"}, description = "paymentProvider")
    String paymentProvider;

    @Option(names = {"--zipCode"}, description = "zipCode")
    String zipCode;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new Pay()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            PaymentProcessResult response =
            new PaymentStation(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .pay(
                new net.accelbyte.sdk.api.platform.operations.payment_station.Pay(
                    namespace,
                    paymentOrderNo,
                    paymentProvider,
                    zipCode,
                    new ObjectMapper().readValue(body, PaymentToken.class)  
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