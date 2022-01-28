package net.accelbyte.sdk.cli.api.platform.item;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Item;
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

@Command(name = "getItemIdBySku", mixinStandardHelpOptions = true)
public class GetItemIdBySku implements Runnable {

    private static final Logger log = LogManager.getLogger(GetItemIdBySku.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;

    @Option(names = {"--storeId"}, description = "storeId")
    String storeId;

    @Option(names = {"--sku"}, description = "sku")
    String sku;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetItemIdBySku()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ItemId response =
            new Item(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new ConfigRepositoryImpl()
                    ))

            .getItemIdBySku(
                new net.accelbyte.sdk.api.platform.operations.item.GetItemIdBySku(
                    namespace,
                    activeOnly,
                    storeId,
                    sku
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