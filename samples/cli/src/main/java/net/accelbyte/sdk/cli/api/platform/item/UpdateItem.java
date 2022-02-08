package net.accelbyte.sdk.cli.api.platform.item;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Item;
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

@Command(name = "updateItem", mixinStandardHelpOptions = true)
public class UpdateItem implements Runnable {

    private static final Logger log = LogManager.getLogger(UpdateItem.class);

    @Option(names = {"--itemId"}, description = "itemId")
    String itemId;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--storeId"}, description = "storeId")
    String storeId;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateItem()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            FullItemInfo response =
            new Item(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateItem(
                new net.accelbyte.sdk.api.platform.operations.item.UpdateItem(
                    itemId,
                    namespace,
                    storeId,
                    new ObjectMapper().readValue(body, ItemUpdate.class)  
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