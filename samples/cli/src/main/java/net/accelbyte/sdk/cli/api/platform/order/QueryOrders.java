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

@Command(name = "queryOrders", mixinStandardHelpOptions = true)
public class QueryOrders implements Runnable {

    private static final Logger log = LogManager.getLogger(QueryOrders.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--endTime"}, description = "endTime")
    String endTime;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--orderNos"}, description = "orderNos")
    List<String> orderNos;

    @Option(names = {"--sortBy"}, description = "sortBy")
    String sortBy;

    @Option(names = {"--startTime"}, description = "startTime")
    String startTime;

    @Option(names = {"--status"}, description = "status")
    String status;

    @Option(names = {"--withTotal"}, description = "withTotal")
    Boolean withTotal;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryOrders()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            OrderPagingResult response =
            new Order(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .queryOrders(
                new net.accelbyte.sdk.api.platform.operations.order.QueryOrders(
                    namespace,
                    endTime,
                    limit,
                    offset,
                    orderNos,
                    sortBy,
                    startTime,
                    status,
                    withTotal
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