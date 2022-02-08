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

@Command(name = "getLocaleItemBySku", mixinStandardHelpOptions = true)
public class GetLocaleItemBySku implements Runnable {

    private static final Logger log = LogManager.getLogger(GetLocaleItemBySku.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;

    @Option(names = {"--language"}, description = "language")
    String language;

    @Option(names = {"--populateBundle"}, description = "populateBundle")
    Boolean populateBundle;

    @Option(names = {"--region"}, description = "region")
    String region;

    @Option(names = {"--storeId"}, description = "storeId")
    String storeId;

    @Option(names = {"--sku"}, description = "sku")
    String sku;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new GetLocaleItemBySku()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            PopulatedItemInfo response =
            new Item(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .getLocaleItemBySku(
                new net.accelbyte.sdk.api.platform.operations.item.GetLocaleItemBySku(
                    namespace,
                    activeOnly,
                    language,
                    populateBundle,
                    region,
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