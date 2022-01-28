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

@Command(name = "queryUserSubscriptions", mixinStandardHelpOptions = true)
public class QueryUserSubscriptions implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryUserSubscriptions.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--chargeStatus"}, description = "chargeStatus")
    String chargeStatus;

    @Option(names = {"--itemId"}, description = "itemId")
    String itemId;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--sku"}, description = "sku")
    String sku;

    @Option(names = {"--status"}, description = "status")
    String status;

    @Option(names = {"--subscribedBy"}, description = "subscribedBy")
    String subscribedBy;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryUserSubscriptions()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            SubscriptionPagingSlicedResult response =
            new Subscription(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .queryUserSubscriptions(
                new net.accelbyte.sdk.api.platform.operations.subscription.QueryUserSubscriptions(
                    namespace,
                    userId,
                    chargeStatus,
                    itemId,
                    limit,
                    offset,
                    sku,
                    status,
                    subscribedBy
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