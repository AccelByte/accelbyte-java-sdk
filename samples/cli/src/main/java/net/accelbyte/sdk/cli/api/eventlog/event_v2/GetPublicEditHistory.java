/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.eventlog.event_v2;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.eventlog.models.*;
import net.accelbyte.sdk.api.eventlog.wrappers.EventV2;
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

@Command(name = "getPublicEditHistory", mixinStandardHelpOptions = true)
public class GetPublicEditHistory implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(GetPublicEditHistory.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--pageSize"}, description = "pageSize")
    Integer pageSize;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;

    @Option(names = {"--type"}, description = "type")
    String type;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new GetPublicEditHistory()).execute(args);
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
            EventV2 wrapper = new EventV2(sdk);
            net.accelbyte.sdk.api.eventlog.operations.event_v2.GetPublicEditHistory operation =
                    net.accelbyte.sdk.api.eventlog.operations.event_v2.GetPublicEditHistory.builder()
                            .namespace(namespace)
                            .userId(userId)
                            .endDate(endDate)
                            .offset(offset)
                            .pageSize(pageSize)
                            .startDate(startDate)
                            .type(type)
                            .build();
            ModelsEventResponseV2 response =
                    wrapper.getPublicEditHistory(operation);
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