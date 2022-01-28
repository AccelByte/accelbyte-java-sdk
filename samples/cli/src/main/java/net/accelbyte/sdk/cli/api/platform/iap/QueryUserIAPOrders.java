package net.accelbyte.sdk.cli.api.platform.iap;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.IAP;
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

@Command(name = "queryUserIAPOrders", mixinStandardHelpOptions = true)
public class QueryUserIAPOrders implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryUserIAPOrders.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--endTime"}, description = "endTime")
    String endTime;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--productId"}, description = "productId")
    String productId;

    @Option(names = {"--startTime"}, description = "startTime")
    String startTime;

    @Option(names = {"--status"}, description = "status")
    String status;

    @Option(names = {"--type"}, description = "type")
    String type;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryUserIAPOrders()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            IAPOrderPagingSlicedResult response =
            new IAP(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .queryUserIAPOrders(
                new net.accelbyte.sdk.api.platform.operations.iap.QueryUserIAPOrders(
                    namespace,
                    userId,
                    endTime,
                    limit,
                    offset,
                    productId,
                    startTime,
                    status,
                    type
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