package net.accelbyte.sdk.cli.api.platform.order_dedicated;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.OrderDedicated;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.ResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.repository.DefaultConfigRepository;
import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.concurrent.Callable;

@Command(name = "syncOrders", mixinStandardHelpOptions = true)
public class SyncOrders implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(SyncOrders.class);

    @Option(names = {"--nextEvaluatedKey"}, description = "nextEvaluatedKey")
    String nextEvaluatedKey;

    @Option(names = {"--end"}, description = "end")
    String end;

    @Option(names = {"--start"}, description = "start")
    String start;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new SyncOrders()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            OrderSyncResult response =
            new OrderDedicated(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .syncOrders(
                new net.accelbyte.sdk.api.platform.operations.order_dedicated.SyncOrders(
                    nextEvaluatedKey,
                    end,
                    start
                )
            );
            log.info("Operation successful");
            String result = new ObjectMapper().writeValueAsString(response);
            log.info("result: [{}]", result);
            return 0;
        } catch (ResponseException e) {
            log.error("Response occur with message : [{}]", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message : [{}]", e.getMessage());
        }
        return 1;
    }
}