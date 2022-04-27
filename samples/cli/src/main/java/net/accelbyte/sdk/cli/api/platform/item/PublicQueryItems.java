/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.item;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.Item;
import net.accelbyte.sdk.cli.repository.CLITokenRepositoryImpl;
import net.accelbyte.sdk.core.AccelByteSDK;
import net.accelbyte.sdk.core.HttpResponseException;
import net.accelbyte.sdk.core.client.OkhttpClient;
import net.accelbyte.sdk.core.logging.OkhttpLogger;
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

@Command(name = "publicQueryItems", mixinStandardHelpOptions = true)
public class PublicQueryItems implements Callable<Integer> {

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


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new PublicQueryItems()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() {
        try {
            OkhttpClient httpClient = new OkhttpClient();
            if (logging) {
                httpClient.setLogger(new OkhttpLogger());
            }
            AccelByteSDK sdk = new AccelByteSDK(httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
            Item wrapper = new Item(sdk);
            net.accelbyte.sdk.api.platform.operations.item.PublicQueryItems operation =
                    net.accelbyte.sdk.api.platform.operations.item.PublicQueryItems.builder()
                            .namespace(namespace)
                            .appType(appType)
                            .baseAppId(baseAppId)
                            .categoryPath(categoryPath)
                            .features(features)
                            .itemType(itemType)
                            .language(language)
                            .limit(limit)
                            .offset(offset)
                            .region(region)
                            .sortBy(sortBy)
                            .storeId(storeId)
                            .tags(tags)
                            .build();
            ItemPagingSlicedResult response =
                    wrapper.publicQueryItems(operation);
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (HttpResponseException e) {
            log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (IOException e) {
            log.error("IOException occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}