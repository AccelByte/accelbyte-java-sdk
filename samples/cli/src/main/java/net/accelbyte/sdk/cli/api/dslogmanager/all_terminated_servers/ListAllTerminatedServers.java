/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.dslogmanager.all_terminated_servers;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.dslogmanager.models.*;
import net.accelbyte.sdk.api.dslogmanager.wrappers.AllTerminatedServers;
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

@Command(name = "listAllTerminatedServers", mixinStandardHelpOptions = true)
public class ListAllTerminatedServers implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(ListAllTerminatedServers.class);

    @Option(names = {"--deployment"}, description = "deployment")
    String deployment;

    @Option(names = {"--endDate"}, description = "endDate")
    String endDate;

    @Option(names = {"--gameMode"}, description = "gameMode")
    String gameMode;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--next"}, description = "next")
    String next;

    @Option(names = {"--partyId"}, description = "partyId")
    String partyId;

    @Option(names = {"--podName"}, description = "podName")
    String podName;

    @Option(names = {"--previous"}, description = "previous")
    String previous;

    @Option(names = {"--provider"}, description = "provider")
    String provider;

    @Option(names = {"--region"}, description = "region")
    String region;

    @Option(names = {"--sessionId"}, description = "sessionId")
    String sessionId;

    @Option(names = {"--startDate"}, description = "startDate")
    String startDate;

    @Option(names = {"--userId"}, description = "userId")
    String userId;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new ListAllTerminatedServers()).execute(args);
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
            AllTerminatedServers wrapper = new AllTerminatedServers(sdk);
            net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers.ListAllTerminatedServers operation =
                    net.accelbyte.sdk.api.dslogmanager.operations.all_terminated_servers.ListAllTerminatedServers.builder()
                            .deployment(deployment)
                            .endDate(endDate)
                            .gameMode(gameMode)
                            .limit(limit)
                            .namespace(namespace)
                            .next(next)
                            .partyId(partyId)
                            .podName(podName)
                            .previous(previous)
                            .provider(provider)
                            .region(region)
                            .sessionId(sessionId)
                            .startDate(startDate)
                            .userId(userId)
                            .build();
            ModelsListTerminatedServersResponse response =
                    wrapper.listAllTerminatedServers(operation);
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