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

@Command(name = "checkUserSubscriptionSubscribableByItemId", mixinStandardHelpOptions = true)
public class CheckUserSubscriptionSubscribableByItemId implements Runnable {

    private static final Logger log = LogManager.getLogger(CheckUserSubscriptionSubscribableByItemId.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--itemId"}, description = "itemId")
    String itemId;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new CheckUserSubscriptionSubscribableByItemId()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            Subscribable response =
            new Subscription(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .checkUserSubscriptionSubscribableByItemId(
                new net.accelbyte.sdk.api.platform.operations.subscription.CheckUserSubscriptionSubscribableByItemId(
                    namespace,
                    userId,
                    itemId
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