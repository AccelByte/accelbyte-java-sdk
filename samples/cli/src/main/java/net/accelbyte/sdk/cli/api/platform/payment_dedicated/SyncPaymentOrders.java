package net.accelbyte.sdk.cli.api.platform.payment_dedicated;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.PaymentDedicated;
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

@Command(name = "syncPaymentOrders", mixinStandardHelpOptions = true)
public class SyncPaymentOrders implements Runnable {

    private static final Logger log = LogManager.getLogger(SyncPaymentOrders.class);

    @Option(names = {"--nextEvaluatedKey"}, description = "nextEvaluatedKey")
    String nextEvaluatedKey;

    @Option(names = {"--end"}, description = "end")
    String end;

    @Option(names = {"--start"}, description = "start")
    String start;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SyncPaymentOrders()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            PaymentOrderSyncResult response =
            new PaymentDedicated(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .syncPaymentOrders(
                new net.accelbyte.sdk.api.platform.operations.payment_dedicated.SyncPaymentOrders(
                    nextEvaluatedKey,
                    end,
                    start
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