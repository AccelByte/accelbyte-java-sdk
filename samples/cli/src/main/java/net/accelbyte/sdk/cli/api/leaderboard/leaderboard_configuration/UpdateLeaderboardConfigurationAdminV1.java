/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.cli.api.leaderboard.leaderboard_configuration;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import net.accelbyte.sdk.api.leaderboard.models.*;
import net.accelbyte.sdk.api.leaderboard.wrappers.LeaderboardConfiguration;
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

@Command(name = "updateLeaderboardConfigurationAdminV1", mixinStandardHelpOptions = true)
public class UpdateLeaderboardConfigurationAdminV1 implements Callable<Integer> {

    private static final Logger log = LogManager.getLogger(UpdateLeaderboardConfigurationAdminV1.class);

    @Option(names = {"--leaderboardCode"}, description = "leaderboardCode")
    String leaderboardCode;

    @Option(names = {"--namespace"}, description = "namespace")
    String namespace;

    @Option(names = {"--body"}, description = "body")
    String body;


    public static void main(String[] args) {
            int exitCode = new CommandLine(new UpdateLeaderboardConfigurationAdminV1()).execute(args);
            System.exit(exitCode);
        }

    @Override
    public Integer call() {
        try {
            ModelsGetLeaderboardConfigResp response =
            new LeaderboardConfiguration(new AccelByteSDK(
                            new OkhttpClient(),
                            CLITokenRepositoryImpl.getInstance(),
                            new DefaultConfigRepository()
                    ))

            .updateLeaderboardConfigurationAdminV1(
                new net.accelbyte.sdk.api.leaderboard.operations.leaderboard_configuration.UpdateLeaderboardConfigurationAdminV1(
                    leaderboardCode,
                    namespace,
                    new ObjectMapper().readValue(body, ModelsUpdateLeaderboardConfigReq.class)  
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