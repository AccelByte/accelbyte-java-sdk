package net.accelbyte.sdk.cli.api.platform.item;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Item;
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

@Command(name = "publicQueryItems", mixinStandardHelpOptions = true)
public class PublicQueryItems implements Runnable {

    private static final Logger log = LogManager.getLogger(PublicQueryItems.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--appType"}, description = "appType")
    String appType;

    @Option(names = {"--baseAppId"}, description = "baseAppId")
    String baseAppId;

    @Option(names = {"--categoryPath"}, description = "categoryPath")
    String categoryPath;

    @Option(names = {"--features"}, description = "features")
    String features;

    @Option(names = {"--itemType"}, description = "itemType")
    String itemType;

    @Option(names = {"--language"}, description = "language")
    String language;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--region"}, description = "region")
    String region;

    @Option(names = {"--sortBy"}, description = "sortBy")
    String sortBy;

    @Option(names = {"--storeId"}, description = "storeId")
    String storeId;

    @Option(names = {"--tags"}, description = "tags")
    String tags;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new PublicQueryItems()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public void run() {
        try {
            ItemPagingSlicedResult response =
            new Item(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .publicQueryItems(
                new net.accelbyte.sdk.api.platform.operations.item.PublicQueryItems(
                    namespace,
                    appType,
                    baseAppId,
                    categoryPath,
                    features,
                    itemType,
                    language,
                    limit,
                    offset,
                    region,
                    sortBy,
                    storeId,
                    tags
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