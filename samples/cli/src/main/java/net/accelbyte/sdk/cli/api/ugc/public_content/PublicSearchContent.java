/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.ugc.public_content;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.ugc.models.*;
import net.accelbyte.sdk.api.ugc.wrappers.PublicContent;
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

@Command(name = "publicSearchContent", mixinStandardHelpOptions = true)
public class PublicSearchContent implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(PublicSearchContent.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--creator"}, description = "creator")
    String creator;

    @Option(names = {"--isofficial"}, description = "isofficial")
    String isofficial;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--name"}, description = "name")
    String name;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--orderby"}, description = "orderby")
    String orderby;

    @Option(names = {"--sortby"}, description = "sortby")
    String sortby;

    @Option(names = {"--subtype"}, description = "subtype")
    String subtype;

    @Option(names = {"--tags"}, description = "tags")
    List<String> tags;

    @Option(names = {"--type"}, description = "type")
    String type;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new PublicSearchContent()).execute(args);
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
            PublicContent wrapper = new PublicContent(sdk);
            net.accelbyte.sdk.api.ugc.operations.public_content.PublicSearchContent operation =
                    net.accelbyte.sdk.api.ugc.operations.public_content.PublicSearchContent.builder()
                            .namespace(namespace)
                            .creator(creator)
                            .isofficial(isofficial)
                            .limit(limit)
                            .name(name)
                            .offset(offset)
                            .orderby(orderby)
                            .sortby(sortby)
                            .subtype(subtype)
                            .tags(tags)
                            .type(type)
                            .userId(userId)
                            .build();
            ModelsPaginatedContentDownloadResponse response =
                    wrapper.publicSearchContent(operation);
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