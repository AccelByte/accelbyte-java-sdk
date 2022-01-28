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

@Command(name = "publicGetUserSubscriptionBillingHistories", mixinStandardHelpOptions = true)
public class PublicGetUserSubscriptionBillingHistories implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicGetUserSubscriptionBillingHistories.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--subscriptionId"}, description = "subscriptionId")
    String subscriptionId;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--excludeFree"}, description = "excludeFree")
    Boolean excludeFree;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicGetUserSubscriptionBillingHistories()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            BillingHistoryPagingSlicedResult response =
            new Subscription(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .publicGetUserSubscriptionBillingHistories(
                new net.accelbyte.sdk.api.platform.operations.subscription.PublicGetUserSubscriptionBillingHistories(
                    namespace,
                    subscriptionId,
                    userId,
                    excludeFree,
                    limit,
                    offset
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