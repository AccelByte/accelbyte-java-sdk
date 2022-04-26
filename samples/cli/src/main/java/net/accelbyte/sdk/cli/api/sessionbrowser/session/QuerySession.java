/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.api.sessionbrowser.session;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.sessionbrowser.models.*;
import net.accelbyte.sdk.api.sessionbrowser.wrappers.Session;
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

@Command(name = "querySession", mixinStandardHelpOptions = true)
public class QuerySession implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(QuerySession.class);

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--gameMode"}, description = "gameMode")
    String gameMode;

    @Option(names = {"--gameVersion"}, description = "gameVersion")
    String gameVersion;

    @Option(names = {"--joinable"}, description = "joinable")
    String joinable;

    @Option(names = {"--limit"}, description = "limit")
    Integer limit;

    @Option(names = {"--matchExist"}, description = "matchExist")
    String matchExist;

    @Option(names = {"--matchId"}, description = "matchId")
    String matchId;

    @Option(names = {"--offset"}, description = "offset")
    Integer offset;

    @Option(names = {"--serverStatus"}, description = "serverStatus")
    String serverStatus;

    @Option(names = {"--userId"}, description = "userId")
    String userId;

    @Option(names = {"--sessionType"}, description = "sessionType")
    String sessionType;


    @Option(names = {"--logging"}, description = "logger")
    boolean logging;

    public static void main(String[] args) {
        int exitCode = new CommandLine(new QuerySession()).execute(args);
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
            
            ModelsSessionQueryResponse response =
            new Session(sdk)
            .querySession(
                new net.accelbyte.sdk.api.sessionbrowser.operations.session.QuerySession(
                    namespace,
                    gameMode,
                    gameVersion,
                    joinable,
                    limit,
                    matchExist,
                    matchId,
                    offset,
                    serverStatus,
                    userId,
                    sessionType
                )
            );
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