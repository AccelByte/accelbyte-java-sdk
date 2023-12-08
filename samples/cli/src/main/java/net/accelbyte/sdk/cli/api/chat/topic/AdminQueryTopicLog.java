/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.chat.topic;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.wrappers.Topic;
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

@Command(name = "adminQueryTopicLog", mixinStandardHelpOptions = true)
public class AdminQueryTopicLog implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(AdminQueryTopicLog.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--endCreatedAt"}, description = "endCreatedAt")
    Integer endCreatedAt;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--senderUserId"}, description = "senderUserId")
    String senderUserId;

    @Option(names = {"--startCreatedAt"}, description = "startCreatedAt")
    Integer startCreatedAt;

    @Option(names = {"--topicId"}, description = "topicId")
    String topicId;

    @Option(names = {"--topicIds"}, description = "topicIds")
    List<String> topicIds;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new AdminQueryTopicLog()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() {
        try {
            final OkhttpClient httpClient = new OkhttpClient();
            if (logging) {
                httpClient.setLogger(new OkhttpLogger());
            }
            final AccelByteSDK sdk = new AccelByteSDK(httpClient, CLITokenRepositoryImpl.getInstance(), new DefaultConfigRepository());
            final Topic wrapper = new Topic(sdk);
            final net.accelbyte.sdk.api.chat.operations.topic.AdminQueryTopicLog operation =
                    net.accelbyte.sdk.api.chat.operations.topic.AdminQueryTopicLog.builder()
                            .namespace(namespace)
                            .endCreatedAt(endCreatedAt)
                            .limit(limit)
                            .offset(offset)
                            .senderUserId(senderUserId)
                            .startCreatedAt(startCreatedAt)
                            .topicId(topicId)
                            .topicIds(topicIds)
                            .userId(userId)
                            .build();
            final ModelsTopicLogWithPaginationResponse response =
                    wrapper.adminQueryTopicLog(operation);
            final String responseString = new ObjectMapper().writerWithDefaultPrettyPrinter().writeValueAsString(response);
            log.info("Operation successful\n{}", responseString);
            return 0;
        } catch (HttpResponseException e) {
            log.error(String.format("Operation failed with HTTP response %s\n{}", e.getHttpCode()), e);
        } catch (Exception e) {
            log.error("An exception was thrown", e);
        }
        return 1;
    }
}