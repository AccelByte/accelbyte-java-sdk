package net.accelbyte.sdk.cli.api.platform.item;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Item;
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

@Command(name = "queryItems", mixinStandardHelpOptions = true)
public class QueryItems implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(QueryItems.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;

    @Option(names = {"--appType"}, description = "appType")
    String appType;

    @Option(names = {"--availableDate"}, description = "availableDate")
    String availableDate;

    @Option(names = {"--baseAppId"}, description = "baseAppId")
    String baseAppId;

    @Option(names = {"--categoryPath"}, description = "categoryPath")
    String categoryPath;

    @Option(names = {"--features"}, description = "features")
    String features;

    @Option(names = {"--itemType"}, description = "itemType")
    String itemType;

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

    @Option(names = {"--targetNamespace"}, description = "targetNamespace")
    String targetNamespace;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new QueryItems()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            FullItemPagingSlicedResult response =
            new Item(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .queryItems(
                new net.accelbyte.sdk.api.platform.operations.item.QueryItems(
                    namespace,
                    activeOnly,
                    appType,
                    availableDate,
                    baseAppId,
                    categoryPath,
                    features,
                    itemType,
                    limit,
                    offset,
                    region,
                    sortBy,
                    storeId,
                    tags,
                    targetNamespace
                )
            );
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (ResponseException e) {
            log.error("ResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}