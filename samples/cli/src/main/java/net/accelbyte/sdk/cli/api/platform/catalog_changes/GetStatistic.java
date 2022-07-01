/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.platform.catalog_changes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.platform.models.*;
import net.accelbyte.sdk.api.platform.wrappers.CatalogChanges;
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

@Command(name = "getStatistic", mixinStandardHelpOptions = true)
public class GetStatistic implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(GetStatistic.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--storeId"}, description = "storeId")
    String storeId;

    @Option(names = {"--action"}, description = "action")
    String action;

    @Option(names = {"--itemSku"}, description = "itemSku")
    String itemSku;

    @Option(names = {"--itemType"}, description = "itemType")
    String itemType;

    @Option(names = {"--type"}, description = "type")
    String type;

    @Option(names = {"--updatedAtEnd"}, description = "updatedAtEnd")
    String updatedAtEnd;

    @Option(names = {"--updatedAtStart"}, description = "updatedAtStart")
    String updatedAtStart;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new GetStatistic()).execute(args);
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
            CatalogChanges wrapper = new CatalogChanges(sdk);
            net.accelbyte.sdk.api.platform.operations.catalog_changes.GetStatistic operation =
                    net.accelbyte.sdk.api.platform.operations.catalog_changes.GetStatistic.builder()
                            .namespace(namespace)
                            .storeId(storeId)
                            .action(action)
                            .itemSku(itemSku)
                            .itemType(itemType)
                            .type(type)
                            .updatedAtEnd(updatedAtEnd)
                            .updatedAtStart(updatedAtStart)
                            .build();
            CatalogChangeStatistics response =
                    wrapper.getStatistic(operation);
            String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful with response below:\n{}", responseString);
            return 0;
        } catch (HttpResponseException e) {
            log.error("HttpResponseException occur with message below:\n{}", e.getMessage());
            System.err.print(e.getHttpCode());
        } catch (Exception e) {
            log.error("Exception occur with message below:\n{}", e.getMessage());
        }
        return 1;
    }
}