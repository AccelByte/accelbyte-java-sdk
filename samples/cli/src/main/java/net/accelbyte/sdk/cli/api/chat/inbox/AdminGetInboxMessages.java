/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.chat.inbox;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.chat.models.*;
import net.accelbyte.sdk.api.chat.wrappers.Inbox;
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

@Command(name = "adminGetInboxMessages", mixinStandardHelpOptions = true)
public class AdminGetInboxMessages implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(AdminGetInboxMessages.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--activeOnly"}, description = "activeOnly")
    Boolean activeOnly;

    @Option(names = {"--endCreatedAt"}, description = "endCreatedAt")
    Integer endCreatedAt;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--messageId"}, description = "messageId")
    List<String> messageId;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--order"}, description = "order")
    String order;

    @Option(names = {"--scope"}, description = "scope")
    String scope;

    @Option(names = {"--startCreatedAt"}, description = "startCreatedAt")
    Integer startCreatedAt;

    @Option(names = {"--status"}, description = "status")
    String status;

    @Option(names = {"--transient_"}, description = "transient_")
    Boolean transient_;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new AdminGetInboxMessages()).execute(args);
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
            final Inbox wrapper = new Inbox(sdk);
            final net.accelbyte.sdk.api.chat.operations.inbox.AdminGetInboxMessages operation =
                    net.accelbyte.sdk.api.chat.operations.inbox.AdminGetInboxMessages.builder()
                            .namespace(namespace)
                            .activeOnly(activeOnly)
                            .endCreatedAt(endCreatedAt)
                            .limit(limit)
                            .messageId(messageId)
                            .offset(offset)
                            .order(order)
                            .scope(scope)
                            .startCreatedAt(startCreatedAt)
                            .status(status)
                            .transient_(transient_)
                            .build();
            final ModelsGetInboxMessagesResponse response =
                    wrapper.adminGetInboxMessages(operation);
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