package net.accelbyte.sdk.cli.api.platform.order;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Order;
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

@Command(name = "publicQueryUserOrders", mixinStandardHelpOptions = true)
public class PublicQueryUserOrders implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicQueryUserOrders.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--itemId"}, description = "itemId")
    String itemId;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--status"}, description = "status")
    String status;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicQueryUserOrders()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OrderPagingSlicedResult response =
            new Order(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicQueryUserOrders(
                new net.accelbyte.sdk.api.platform.operations.order.PublicQueryUserOrders(
                    namespace,
                    userId,
                    itemId,
                    limit,
                    offset,
                    status
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