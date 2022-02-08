package net.accelbyte.sdk.cli.api.platform.subscription;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Subscription;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.InputStream;
import java.util.*;

@Command(name = "processUserSubscriptionNotification", mixinStandardHelpOptions = true)
public class ProcessUserSubscriptionNotification implements Runnable {

    private static final Logger log = LogManager.getLogger(ProcessUserSubscriptionNotification.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--subscriptionId"}, description = "subscriptionId")
    String subscriptionId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new ProcessUserSubscriptionNotification()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            new Subscription(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .processUserSubscriptionNotification(
                new net.accelbyte.sdk.api.platform.operations.subscription.ProcessUserSubscriptionNotification(
                    namespace,
                    subscriptionId,
                    userId,
                    new ObjectMapper().readValue(body, TradeNotification.class)  
                )
            );
            log.info("Operation successful");
        } catch (Exception e) {
            log.error("Exception occur with message : [{}]", e.getMessage());
        }
    }
}