package net.accelbyte.sdk.cli.api.platform.subscription;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Subscription;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.ConfigRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.InputStream;
import java.util.*;

@Command(name = "recurringChargeSubscription", mixinStandardHelpOptions = true)
public class RecurringChargeSubscription implements Runnable {

    private static final Logger log = LogManager.getLogger(RecurringChargeSubscription.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--subscriptionId"}, description = "subscriptionId")
    String subscriptionId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new RecurringChargeSubscription()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            RecurringChargeResult response =
            new Subscription(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .recurringChargeSubscription(
                new net.accelbyte.sdk.api.platform.operations.subscription.RecurringChargeSubscription(
                    namespace,
                    subscriptionId
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